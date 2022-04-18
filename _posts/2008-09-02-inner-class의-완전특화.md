---
layout: post
title: "Inner Class의 완전(명시적) 특화"
date: 2008-09-02 20:36:00 +0900
categories: blog
tags: 프로그래밍
---

C++ 템플릿 특화중에 특이한 사실중에 하나는, Inner Class의 완전특화가 C++표준이 아니라는것이다. 그래서 Inner Class를 완전특화에서 사용하면 gcc에서는 컴파일이 안된다.

회사에서 매주 월요일 점심시간 짜투리에 [CodeDojo](http://blog.maiet.net/xe/?mid=blog&search_target=tag&search_keyword=%EC%BD%94%EB%94%A9+%EB%8F%84%EC%9E%A5&document_srl=1386) 라는 이름으로 Programming Challenges 책의 문제를 푼다.(하긴, 이것도 월요일날 학교를 가게되어서 앞으로는 하지 못할것 같다.) 문제들은 전형적인 ACM 문제유형으로 인풋이 주어지면 문제를 해결한 적절한 아웃풋을 만들어내야하는 식이다.

참여횟수가 늘어나면 인풋을 적절히 일반화를 해보고자 하여 템플릿을 사용하게 되었는데, 이를테면 인풋의 값을 string 형태로 보관한다거나 혹은 int 형태로 보관할수 있게 만들고자했다. 여기에 보통 '0 0'를 입력하면 입력을 종료한다는 조건이 붙는데 stirng형이면 zero가 char형의 '0'가 될 것이고 int 형이면 zero가 int형의 0이 되도록 하기 위해 템플릿 완전(명시적) 특화를 사용하려 하였다.

그런데 VS에서 멀쩡히 컴파일되던 녀석이 테스트 봇 - gcc를 사용한다 - 에서 컴파일이 안되어서 여기저기 알아보니 클래스 내의 Inner Class는 템플릿의 명시적 특화가 '확장이 아닌 표준을 따르면' 지원되지 않는덴다. 그래서 꼼수로 생각한게 부분특화를 사용하고 템플릿 인자에 기본인자를 사용하였더니 gcc나 VS에서 문제없이 컴파일이 되었다.

아래는 이렇게 작성된 부분특화용 Inner Class.

```cpp

//////////////////////////////////////////////////////////////////////
//
// Input Processor Interface
//
//////////////////////////////////////////////////////////////////////

class InputProcessor
{
public:

    //  break type
    enum BREAK_CONDITION
    {
        BREAK_EOF = 0,
        BREAK_ENTER,
        BREAK_ZERO,

        BREAK_TOTAL
    };

    // 생성자 / 소멸자
    InputProcessor(BREAK_CONDITION _eBreak) { eBreakCondition_ = _eBreak; }
    virtual ~InputProcessor(){}

    // 인터페이스
    virtual void  process()              = 0;
    virtual int   getDataIndexCount()    = 0;
    virtual const std::vector<int>* getDigits(int _nIndex)   = 0;
    virtual const std::vector<std::string>* getChars(int _nIndex)   = 0;

    // Test를 위한 함수
    virtual void addTestInput(const char* pSzTestData) = 0;

protected:

    // break condition
    BREAK_CONDITION  eBreakCondition_;

    // data manipulator
    // 로컬 템플릿 클래스는 명시적 특화가 허용되지 않고 부분특화만 허용됨. 그에 대한 꽁수
    // cf. 비주얼스튜디오 확장으로 로컬클래스의 명시적 특화가 허용된다.
    template< typename T, typename PartialSpecialization = bool >
    struct SDataManipulator{};
    template< typename PartialSpecialization >
    struct SDataManipulator< int, PartialSpecialization >
    {
        static int convertData(char* _pSzData){ return atoi( _pSzData ); }
        static const int getZero(){return 0;}
        static const std::vector<int>* getDigits(
                std::vector< std::vector<int>* >& _refVecData,
                int _nIndex)
        {
            return _refVecData[ _nIndex ];
        }
        static const std::vector<std::string>*  getChars(
                std::vector< std::vector<int>* >& _refVecData,
                int _nIndex)
        {
            return 0;
        }
    };
    template< typename PartialSpecialization >
    struct SDataManipulator< std::string, PartialSpecialization >
    {
        static char* convertData(char* _pSzData){ return _pSzData; }
        static const char* getZero(){ return "0";}
        static const std::vector<int>* getDigits(
                std::vector< std::vector<std::string>* >& _refVecData,
                int _nIndex)
        {
            return 0;
        }
        static const std::vector<std::string>*  getChars(
                std::vector< std::vector<std::string>* >& _refVecData,
                int _nIndex)
        {
            return _refVecData[ _nIndex ];
        }
    };

    // multiline data
    template< typename T >
    struct SInputData
    {
        // data container
        std::vector< std::vector<T>* > aVecVecData;

        // get data
        void processData(BREAK_CONDITION _eBreak, const char* _pSzManualData )
        {
            char buf[512];
            bool bLoop = true;
            while( bLoop )
            {
                if( _pSzManualData == 0 )
                {
                    // 라인으로 입력받기
                    if( gets( buf ) == 0 )
                        return;
                }
                else
                {
                    strcpy(buf, _pSzManualData);
                    bLoop = false;
                }

                std::vector<T>*  pVector = new std::vector<T>;
                char* pSzEach = strtok(buf, " ");
                while (pSzEach!= 0)
                {
                    pVector->push_back(
                                SDataManipulator<T>::convertData( pSzEach )
                    );
                    pSzEach = strtok(0, " ");
                }

                // Zero Break
                if( _eBreak == BREAK_ZERO && pVector->size() == 2 )
                {
                    if( (*pVector)[0] == SDataManipulator<T>::getZero() &&
                        (*pVector)[1] == SDataManipulator<T>::getZero() )
                    {
                        delete pVector;
                        return;
                    }
                }

                aVecVecData.push_back( pVector );

                // Enter Break
                if( _eBreak == BREAK_ENTER )
                    return;
            }
        }

        // clear data
        void clearData()
        {
            int nSize = (int)aVecVecData.size();
            for( int i = 0; i < nSize; ++i)
            {
                delete aVecVecData[i];
            }
            aVecVecData.clear();
        }
    };

};


//////////////////////////////////////////////////////////////////////
//
// Input Processor Implimentation
//
//////////////////////////////////////////////////////////////////////

template< typename T >
class InputProcessorImpl : public InputProcessor
{
public:
    InputProcessorImpl(BREAK_CONDITION _eBreak) : InputProcessor(_eBreak) {}
    virtual ~InputProcessorImpl(){ aData_.clearData(); }

    virtual void process()
    {
        if( aData_.aVecVecData.empty() == false )
                aData_.clearData();
        aData_.processData( eBreakCondition_, 0);
    }

    virtual const std::vector<int>* getDigits(int _nIndex)
    {
        if( _nIndex < 0 ||
            aData_.aVecVecData.empty() ||
            _nIndex >= getDataIndexCount() )
            return 0;

        return InputProcessor::SDataManipulator<T>::getDigits(aData_.aVecVecData, _nIndex);
    }

    virtual const std::vector<std::string>* getChars(int _nIndex)
    {
        if( _nIndex < 0 ||
             aData_.aVecVecData.empty() ||
              _nIndex >= getDataIndexCount() )
            return 0;

        return InputProcessor::SDataManipulator<T>::getChars(aData_.aVecVecData, _nIndex);
    }

    virtual int getDataIndexCount()
    {
        return (int)aData_.aVecVecData.size();
    }

    virtual void addTestInput(const char* pSzTestData)
    {
        aData_.processData(InputProcessor::BREAK_EOF, pSzTestData );
    }

private:
    InputProcessor::SInputData< T > aData_;
};

```

아래는 보너스로, 위의 인풋프로세스를 이용하여 푼 LCD문제. (물론 봇테스트도 통과, 최적화는 되어있지 않다)
http://www.programming-challenges.com/pg.php?page=viewsubmission&subid=211071

아래는 위의 일반화된 인풋이전에 인풋을 나누어 사용했을때 풀었던 문제 MineSweeper.
http://www.programming-challenges.com/pg.php?page=viewsubmission&subid=200889

