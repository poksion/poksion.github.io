---
layout: post
title: "log-me refactoring 회고"
date: 2016-06-14 18:16:00 +0900
categories: blog
tags: 프로그래밍
---

(혼자)진행중인 프로젝트 중에 [log-me](https://github.com/poksion/log-me)라는 프로젝트가 있다. 이 프로젝트는 생활의 여러가지 정보를 기록(log)하여 나를 포함한 여러 상황에 대해 좀더 정확히 알고 원하는 방향으로의 나아감에 도움이 되자는데 목적을 두고 있다.

최근 컴퓨터도 재정비하고 여러일들을 겪으면서, 이 프로젝트가 여러 컴퓨터에 공통적으로 적용되기 어렵다는것을 깨닫고 리팩토링에 들어갔다. ``초점은`` checkout 받으면 최대한 조금의 설정으로 바로 그 플랫폼에서 로그를 시작하기.

관련 컴포넌트
----------

log-me와 은근 연관된 프로젝트들이 여기저기 널리 퍼져 있어서 이것을 하나로 묶는것이 중요한 과제였다. dn(digital-nomad, 여러 플랫폼에서 손쉽게 내 자료들을 찾는것이 목표였던 프로젝트) 프로젝트와 poksion-net 프로젝트 아래 있던 metadata-generator를 log-me에 포함시켰고 common 라이브러리로 공통 요소들은 뽑았다. ``초점`` 처럼, 컴퓨터를 세팅하고 자료들의 기록과 검색이 용이하도록 하는, 관련된 프로젝트들은 log-me에 합쳤다.

<div align="center"><img src="/assets/img/post/log-me-component.png" /></div>

<br/>

config.yml
-----------

플랫폼마다 어쩔수 없이 달라야하는 설정들이 있다. 이 설정들을 source에서 걷어내 config 파일로 만드는것도 중요한 변경사항중 하나였다.

루비는 정말 yml을 잘 지원한다. yaml 패키지를 통해 매우 쉽게 원하는 바에 도달했으며, 실제 구현해보니 플랫폼마다 대체로 사용하는 디렉토리가 일치하여 플랫폼 마다의 큰 차이점은 없었다.

```ruby
class ConfigLoader

  def initialize
    @parent_dir = File.dirname(File.dirname(__FILE__))

    config_file_path = File.join(File.expand_path(@parent_dir), 'config.yml')
    contents = YAML.load_file(config_file_path)

    @computer_name = contents['computer_name']
      
    paths = contents['paths']
    @git_cmd = paths['git']
    @log_dir_fullpath = File.expand_path(paths['log_dir'])
    @log_file_fullpath = File.expand_path(paths['log_file'])
    @blog_dir_fullpath = File.expand_path(paths['blog_dir'])
    @notes_dir_fullpath = File.expand_path(paths['notes_dir'])
    @box_working_dir_fullpath = File.expand_path(paths['box_working_dir'])
  end
  
  #...

end
```
<br/>

bash와 루비
----------

난.. bash에 대해 잘 모르고 많이 좋아하지도 않는다. 그럼에도 내가 쓰는 환경이 bash환경이므로 소스를 작성할 필요가 왕왕 있다. 몇가지 팁들을 정리하면,

```bash
# 배시 소스 파일을 중심으로 디렉토리를 설정할때
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
CONFIG_LOADER=$DIR"/common/config-loader.rb"

# 루비 호출 결과를 CMD변수에 담을때. = 띄어쓰면 안됨
CMD=$(ruby $CONFIG_LOADER "blog-metadata")

# 여러 변수를 받아 들일때. 루비와 연동하기에 편함
read NOTES_DIR PUBLIC_DIR BOX_DIR <<<$(ruby $CONFIG_LOADER "notes-public-box-dir")
```
<br/>

루비와 win32
-----------

루비는 각각의 플랫폼들과 정말 잘 어울린다. win32와도 잘 어울리며 win32 api를 루비 스크립트 파일에서 직접 호출할 수도 있다.

```ruby
  def get_active_window_handle
    getForegroundWindow = Win32API.new('user32', 'GetForegroundWindow', [], 'N')
    getForegroundWindow.Call
  end

  def get_title(window_handle)
    getWindowTextLength =  Win32API.new('user32', 'GetWindowTextLength', ['L'], 'I')
    buf_len = getWindowTextLength.Call(window_handle)
    title_buf = ' ' * (buf_len+1)
    getWindowText = Win32API.new('user32', 'GetWindowText', ['L', 'P', 'I'], 'I')
    getWindowText.Call(window_handle, title_buf, title_buf.length)
    
    title_buf
  end

  def get_proc_name(window_handle)
    getWindowThreadProcessId = Win32API.new('user32', 'GetWindowThreadProcessId', ['L', 'P'], 'L')
    pid = [0].pack('L')
    getWindowThreadProcessId.Call(window_handle, pid)
    pid = pid.unpack('L')[0]
    
    get_proc_name_from_pid(pid)
  end

  def get_proc_name_from_pid(pid)
    procs = WIN32OLE.connect("winmgmts:\\\\.")
    procs.InstancesOf("win32_process").each do |p|
      if pid == p.processId
        return p.name
      end
    end
    return "-"
  end
```

<br/>

앞으로 할일들...
-------------

fyac(find your associate contents) 프로젝트 또한 log-me에 포함되는것이 적절할것 같다. 더불어 4월 이후로 중단된 searchlog 수집기도 재가동 시켜야 한다.

consuming-pattern 프로젝트는, 신용카드 내용을 수집하는 방법이 복잡해서 현재는 거의 죽은 프로젝트가 되었다. 리팩토링 하면서 소비 내용을 좀더 편리하게 수집할 수 있도록 변경이 필요하다.

궁극적으로 수집한 로그를 편리하게 볼 수 있는 뷰어가 있어야할것이다. 다만 "비주얼"화 하는 방법을 잘 알지못해 현 수준은 수집 수준이다. 얼렁 뷰어에 대한 고민도 해야겠다.

