# 블로그 쓰는법

## Jekyll 기반 Github Page 블로그

### Git 설정

post 파일이 한글 이름일 가능성이 매우 높다. 윈도우 git은 한글파일이 깨지기 때문에 아래의 설정이 필요

```
git config --global core.quotepath false
```

### Gemfile.lock

어느 컴퓨터에서 쓸수 있도록 Gemfile.lock 파일을 커밋하지 말것

 * 깔리는 라이브러리는 중요하지 않다. 어차피 호스팅될때 library는 Github에서 제공하는것 사용
 * Gempfile.lock을 쓰면 정확히 해당 라이브러리 버전을 local에서 다운받으려하다.
 * local에서는 내가 쓴 글이 잘 보이는지만 테스트 하는 용도이기 때문에 정확한 라이브러리 버전이 필요없다.

### WEBrick

루비 3버전은 WEBrick이 설치되어 있지 않으므로 WEBrick을 따로 설치해줘야 하다.

### bundle install 및 서버 실행

* bundle install

```
bundle install
```

* 서버 실행

```
bundle exec jekyll server
```
