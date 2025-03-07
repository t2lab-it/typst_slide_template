#import "../lib.typ": *
#show: set-init
#show: bib_init


// --------------------------------------------------
// テーマの設定
// --------------------------------------------------

#import metropolis: *
#show: theme-setting.with(
  title: [タイトル],
  subtitle: [サブタイトル],
  author: [名前],
  date: nowdate_slash,// nowdate_slash: 2024/10/2  nowdate_jp: 2024年10月2日
  institution: [所属],
  handout: false,// false: 通常スライド true: 資料スライド
)
// ==================================================

#title-slide()

== #text(fill: black)[最初のスライド]
#slide[
  スライドタイトルは，
  ```typst
  == 最初のスライド
  ```
  のように記述することで，設定することができます．#v(0.5cm)\
  スライドの中身は
   ```typst
  #slide[
    スライドの中身
  ]
  ```
  のように記述します．
]

== #text(fill: black)[数式]
#slide[
  数式も，普通の文章と同様に
  ```typst
  $ integral sin x d x = - cos x + C $
  ```
  $ integral sin x d x = - cos x + C $
  と表示されます．
  より強調するには，`box`関数を利用して，
  ```typst
  $ y = #box(fill: rgb(100, 200, 200), outset:(x: 3pt, y: 5pt), radius: 4pt)[$a x^2$] + b x + c $
  ```
  とすれば，
  $ y = #box(fill: rgb(100, 200, 200), outset:(x: 3pt, y: 5pt), radius: 4pt)[$a x^2$] + b x + c $
  のようになります．
]

== #text(fill: black)[CeTZによる図の挿入]
#slide[
  図を挿入するには，CeTZを利用します．例えば，
  ```typst
  #cetz.canvas({
        import cetz.draw: *
        line((-1,0),(11,0), mark: (end: "stealth"), fill: black)
        line((0,-1),(0,5), mark: (end: "stealth"), fill: black)
        bezier((0,0), (5,3), (3,0), (4,3))
        bezier((5,3), (10,0), (6,3), (7,0))
        content((11.5,0), $x$)
        content((0.5,4.75), $y$)
  })
  ```
  のように記述すれば，次のスライドのように表示されます．
]
#slide[
  #cetz.canvas({
        import cetz.draw: *
        line((-1,0),(11,0), mark: (end: "stealth"), fill: black)
        line((0,-1),(0,5), mark: (end: "stealth"), fill: black)
        bezier((0,0), (5,3), (3,0), (4,3))
        bezier((5,3), (10,0), (6,3), (7,0))
        content((11.5,0), $x$)
        content((0.5,4.75), $y$)
  })
  表示を中央揃えにするには，`align`関数を利用します．
  ```typst
  #align(center)[
    〈CeTZの中身〉
  ]
  ```
  これによって，次のスライドのように中央揃えになります．
]
#slide[
  #align(center)[
    #cetz.canvas({
        import cetz.draw: *
        line((-1,0),(11,0), mark: (end: "stealth"), fill: black)
        line((0,-1),(0,5), mark: (end: "stealth"), fill: black)
        bezier((0,0), (5,3), (3,0), (4,3))
        bezier((5,3), (10,0), (6,3), (7,0))
        content((11.5,0), $x$)
        content((0.5,4.75), $y$)
  })
  ]
  図中に画像を挿入するには，`content`を利用して，`image`関数を挿入します．
  ```typst
  content((0,0), image("figure/water.jpg", width: 10cm))
  ```
  このとき，`width`に`%`を指定することはできません．
]

#slide[
  このようにすることで，以下のように表示できます．
  #align(center)[
    #cetz.canvas({
        import cetz.draw: *
        content((0,0), image("figure/water.jpg", width: 10cm))
        line((-1,0),(11,0), mark: (end: "stealth"), fill: black)
        line((0,-1),(0,5), mark: (end: "stealth"), fill: black)
        bezier((0,0), (5,3), (3,0), (4,3))
        bezier((5,3), (10,0), (6,3), (7,0))
        content((11.5,0), $x$)
        content((0.5,4.75), $y$)
  })
  ]
]

== #text(fill: black)[表示の分割]
#slide[
  単純に2分割以上をするには，`columns`関数を利用します．
  ```typst
  #columns(2)[
    1行目のテキスト
    #colbreak()
    2行目のテキスト
  ]
  ```
  これによって，次のように記述されます．
  #columns(2)[
      1行目のテキスト
      #colbreak()
      2行目のテキスト
  ]
  `columns`は領域を半分ずつ分割します．
]

#slide[
  左右非対称の場合，例えば70％，30％の割合にしたい場合，`grid`関数が利用できます．
  ```typst
  #grid(
    columns: (70%, 30%),
    [1行目のテキスト],
    [2行目のテキスト]
  )
  ```
  #grid(
    columns: (70%, 30%),
    [1行目のテキスト],
    [2行目のテキスト]
  )
]

#show: appendix

== #text(fill: black)[Appendixと参考文献の書き方]
#slide[
  ```typst
  #show: appendix
  ```
  をスライド間に記述すれば，スライド番号のカウントがそこまでになります．\
  参考文献は，`@tsukahara2023` とすれば，@tsukahara2023 のように表示され，参考文献が表示されます．
]

== #text(fill: black)[参考文献]
#slide[
  #bibliography-list(
    ..bib-file(read("refs.bib")), lang: none)
]
