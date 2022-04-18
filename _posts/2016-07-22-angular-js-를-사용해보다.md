---
layout: post
title: "AngularJS를 사용해보다"
date: 2016-07-22 01:56:00 +0900
categories: blog
tags: 프로그래밍
---

프론트엔드들이 지향하는 지향점이 있을것이다. 그리고 생각보다 그 지향점은 공통점들이 있을것이다. 이런 생각으로 요새 웹 프론트엔드들을 관심있게 살펴보고 있다.

삽질을 하다보니까 어느정도 공부하면 좋을것 같은 윤곽이 잡혔는데,

 * CSS 기본
 * Foundation
 * AngularJS

그래서 파일관리자 유틸 웹앱에 AngularJS를 적용해보고 있다.

### Scope

자바스크립트를 살펴보면서 가장 어려웠던 점은, 호스트 환경에 대한 다양함이었다. 어떤 호스트환경은 전역객체로 요상한것을 제공해주고 다른 어떤것은 제공안해주고, 내가만든 모듈이 어디까지 퍼지는지 모르겠고 등등..

AngularJS에서는 그러한 어려움을 DI해주는 Scope으로 깔끔하게 해주는것 같다. 그래서 자바스크립트 초보자인 나에게 매우 좋았다.

### Controller와 ng-model

Scope을 정하는 많은 Best practices 가 있겠지만, 나는 기본적으로 Controller 단위나 Directive 단위로 Scope을 정한다.

Controller 단위로 Scope을 정하는것은 간단한데, Scope을 만들 div에서 ng-controller로 Controller 이름을 정하고 angular module에서 더하는 controller에 해당 scope을 연결해서 사용하면 된다.

<pre>panel-hide-start</pre>

```html
<body ng-app="nasFileManager" ng-controller="FileController" ng-init="initList(2)">

  <div class="row">
    <div class="small-10 small-centered columns">
       <div class="row">
         <div class="small-1 columns file-list-header" style="background-color: gold;"><input type="checkbox" ng-model="fileAll" ng-click="checkAllFiles()" style="margin:0;"></div>
         
         ...
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/efe6547863e42fdec9db952d7450c827.js"></script>

위 예제는 전체 body에 controller가 하나만 있는 상황인데, module에 추가한 "FileController"에서 해당 Scope 아래에 있는 ng-model="fileAll"이라든가, ng-click="checkAllFiles()"등을 다룰수 있다. (ng-init="initList(2)"는 서버사이드에서 클라이언트 사이드 웹앱에게, "2"라는 상수 변수를 전달하기 위해 있는 메소드인데, 해당 Scope이 시작될때 처음으로 시작되는 init 함수이다)

<pre>panel-hide-start</pre>

```javascript
angular.
  module('nasFileManager', ['ab-base64']).
  controller('FileController', ['$scope','$window', 'base64', function($scope, $window, base64) {
    
    $scope.initList = function(cnt) {
      $scope.cnt = cnt;
      $scope.file = [];
      $scope.fileNames = [];
      for (var i = 0; i < $scope.cnt; ++i) {
        $scope.file.push(false);
        $scope.fileNames.push("");
      }
    };

    $scope.checkAllFiles = function() {
      for (var i = 0; i < $scope.cnt; ++i) {
        $scope.file[i] = $scope.fileAll;
      }
    };
    
    ...
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/8808c4e44b38f25a7e3a2706a1e3f2e3.js"></script>

Controller의 등록 및 구현은 위의 내용처럼 되어있다.

외부 모듈로 ab-base64를 사용하고 있고, AngularJS가 제공해주는 $scope, $window와 새로 추가한 base64모듈을 해당 controller안에서 사용하기 때문에, 위와 같은 모양으로 DI를 해주었다.

Scope안에서 사용했던 checkAllFiles()는 Controller안에서 저렇게 정의 및 구현해주면 된다.

### Factory

ab-base64는 외부에서 구현한 서비스 객체인데, 이러한 서비스등을 Factory를 통해 구현할 수 있다.

<pre>panel-hide-start</pre>

```javascript
angular.
  module('fileTaggerShell', ['ab-base64']).
  factory('dispatcher', ['$rootScope', function($rootScope) {
    var dispatcher = {};
    
    dispatcher.dispatch = function(dataType, data) {
      $rootScope.$emit(dataType, data);
    };
    
    dispatcher.register = function(dataType, handler) {
      $rootScope.$on(dataType, function(event, data) {
        handler(data);
      });
    };
    
    return dispatcher;
  }]).
  
  ...
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/cd02a27eb37c2555767c6d3d8d3783ec.js"></script>

위와 같이 dispatcher라는 서비스를 factory로 구현했다면, base64를 DI하여 사용했듯이 dispatcher도 DI하여 사용할 수 있다.

<pre>panel-hide-start</pre>

```javascript
  // resultActionCreator에서 dispatcher 서비스를 사용
  factory('resultActionCreators', ['ResultAction', 'dispatcher', function(ResultAction, dispatcher) {
    var resultActionCreators = {};
    
    resultActionCreators.loadResult = function(resultFile) {
      dispatcher.dispatch(ResultAction.LOAD_RESULT, resultFile);
    };
    
    return resultActionCreators;
  }]).
  ...
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/4629d0abce0edb0573ac62bea50a34fc.js"></script>

<br/>

### Directive

하나 혹은 몇개의 적은 controller를 사용하는데에는 html에서 scope을 정하여 사용하는것도 편리하기는 하지만, 만일 응집도가 전혀 다른 많은 모듈을 사용한다면, 하나의 html에 다 나타내는것은 한번에 봐야하는 정보량이 너무 많아 개발하고 관리하기 힘들것이다.

AngularJS는 directive라는 기능으로 이러한 모듈들을 Component화 할 수 있게 해준다.

<pre>panel-hide-start</pre>

```html
  <div class="row">
    <div class="small-8 small-centered columns">
      <result-loader></result-loader>
    </div>
  </div>
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/64265249b4ca76c6917e17f4893977b1.js"></script>

result-loader 컴포넌트를 사용한 경우에 html에서는 위와 같이 깔끔하게 모듈화가 된다.

<pre>panel-hide-start</pre>

```javascript
angular.
  module('fileTaggerShell').
  directive('resultLoader', ['resultActionCreators', function(resultActionCreators) {
    var resultLoader = {};
    
    resultLoader.controller = function($scope) {
      $scope.loadResultClick = function() {
        if ($scope.resultFile) {
          resultActionCreators.loadResult($scope.resultFile);
        }
      }
    };
    
    resultLoader.template =
      '<h4>Load Result file</h4>' +
      '<div class="row collapse">' +
        '<div class="small-10 columns"><input type="text" placeholder="결과파일 입력하기" ng-model="resultFile" /></div>' +
        '<div class="small-2 columns"><a href="#" class="button postfix" ng-click="loadResultClick()">load</a></div>' +
      '</div>';
    
    return resultLoader;
  }]);
```

<pre>panel-hide-end</pre>

<script src="https://gist.github.com/poksion/f404c2fed9d9ea5890acdc5166067c76.js"></script>

result-loader directive의 모습인데, template를 통해 UI를 결정할 수 있고 내부적으로 Controller가 있어서 위의 Controller와 동일하게 사용 가능하다. 모듈간의 통신은 서비스로 만든 resultActionCreators를 통해서 하는데, 데이터의 단방향 흐름 기법인 Flux를 차용했다.

### AngularJS와 Flux

Clean Architecture는 매우 훌륭하게 여러 아키텍쳐들을 잘 정리한것 같다. 간단한 앱에서의 Flux 패턴 사용도 꽤 편리하다.(flux에 대해서는 예전에 [간단히 적은글](/blog/2016/07/05/presenter와-flux.html)이 있다.) 관련된 자료를 사내 모임에서 간단하게 발표한것이 있다.

<div style="text-align: center;">

<iframe src="//www.slideshare.net/slideshow/embed_code/key/xg71gxEXoSQomu" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/PhilwooKim/clean-architecture-and-flux" title="Clean architecture and flux" target="_blank">Clean architecture and flux</a> </strong> from <strong><a href="//www.slideshare.net/PhilwooKim" target="_blank">pok</a></strong> </div>

</div>

