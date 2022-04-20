---
layout: post
title: "Android Theme와 Style"
date: 2016-06-28 16:23:00 +0900
author: poksion
categories: blog
tags: 하드보일드  프로그래밍  안드로이드
---

[Android custom-attr](/blog/2015/07/01/android-custom-attr.html)이라는 글을 거의 1년전쯤에 썼는데, 아직도 custom attr로 고통받고 있다. (충격적이게도 저 글들을 이해하는데도 시간이 꽤 걸렸다. -_-) 고통의 시작은, Theme와 Style에 대한 이해부족 때문.

사건의 발달
---------

그러니까, support v7의 toolbar를 쓰려고하는데, styling을 하려고 한다.

```xml
<android.support.v7.widget.Toolbar
        android:id="@+id/my_toolbar"
        android:layout_height="wrap_content"
        android:layout_width="match_parent"
        app:theme="@style/MyToolbarTheme" />
```

<br/>

```xml
<style name="MyToolbarTheme" parent="Theme.AppCompat.Light.NoActionBar">
    <!-- title color -->
    <item name="android:textColorPrimary">#000000</item>
    <!-- menu text color -->
    <item name="actionMenuTextColor">#000000</item>
    <!-- menu button color -->
    <item name="android:textColorSecondary">#000000</item>
    <item name="android:background">#ffffff</item>
</style>
```

<br/>

저렇게 설정한 근거는 무려 [구글 블로그](http://googledevkr.blogspot.kr/2014/10/appcompat-v21-material-design-for-pre.html)의 스타일링.

> 스타일링
> 
> Toolbar 는 액션바와 달리 뷰에 직접 원하는 스타일을 적용할 수 있습니다. 예를 들어 Toolbar 를 액션바처럼 사용하고자 한다면 다음과 같이 정의할 수 있습니다.
> 
> ```xml
> <android.support.v7.widget.Toolbar  
>    android:layout_height="wrap_content"
>    android:layout_width="match_parent"
>    android:minHeight="?attr/actionBarSize"
>    app:theme="@style/ThemeOverlay.AppCompat.ActionBar" />
> ```

저렇게 하면 background가 toolbar뿐만 아니라 엄한곳까지 적용된다 (심지어는, toast text의 background까지 적용된다)

테마와 스타일은 미묘하게 다르다
------------------------

스타일을 (custom) [attribute들의 값 집합](/blog/2015/07/01/android-custom-attr.html) 이라고 바라본 내 견해는 꽤 괜찮은것 같다. 다만 style과 theme를 완전 동일하게 (혹은 theme에 대해서는 완전 무지하게) 생각한것이 잘못된 생각이었다.

[Chris Banes의 블로그](https://chris.banes.me/2014/11/12/theme-vs-style/)에서 둘의 차이를 꽤 잘 설명해놨다. 뿐만 아니라 관련 [stackoverflow 쓰레드](http://stackoverflow.com/questions/26490126/appcompat-style-background-propagated-to-the-image-within-the-toolbar)에는 요약까지 잘되어 있다.

결론적으로 Ashok Varma가 요약한대로,

> Points To Note
>
> With the new Toolbar you can apply a style and a theme. They are different! The style is local to the Toolbar view, for example the background color. The app:theme is instead global to all ui elements inflated in the Toolbar, for example the color of the title and icons.

즉, Toolbar의 style과 theme attribute는 사용의 다르다! 적용의 범위 뿐만 아니라, theme는 appcompat에 종속적이라 namespace로 존재하는 반면(app:theme) style은 기본 namespace를 사용한다.
(아마 구글 블로그는 view만의 styling이 아니라 전체적인 styling의 적용을 원했을 것이고 그래서 theme attribute를 수정했을 것이다)

