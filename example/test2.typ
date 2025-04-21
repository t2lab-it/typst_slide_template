#import "../lib.typ": *
#show: set-init.with(font: ((name: "Noto Sans CJK JP", covers: regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]")), "Cabin"))
#show: bib-init

// --------------------------------------------------
// テーマの設定
// --------------------------------------------------

#import university: *
#show: theme-setting.with(
  title: [Presentation title\ ...continued to the second line],
  subtitle: [Subtitle],
  author: [
    *Presenter name*: Institution\
    Co-author name: Institution
  ],
  date: nowdate_slash,
  institution: [], // Now written in `author` field
  logo: "", // emoji.school,
  summary: [presenter$at$subtitle],
  handout: false,// false: 通常スライド true: 資料スライド
)

// ===========================================
// Set font family
// ===========================================
// Serif fonts: Amiri, Noto Music
// Sans serif fonts: Inter Display, Nimbus Sans, TeX Gyre Heros
#show math.equation: set text(font: "Latin Modern Math")

// --------------------------------------------------

#let pinit-highlight-equation-from = pinit-highlight-equation-from.with(dy-line: -2.45pt)

#title-slide()

// ==================================================
= Chapter title
// ==================================================

==  // without this, subsection will not be printed. Related with `config-common(new-section-slide-fn: none)`?
== Simple slide

Slide contents.

== Slide with `#slide` block and animation
#slide[
  $
    f &= m a \
    pause &= m dv(v, t)
  $
]

== 日本語と数式
#slide[
  運動方程式$f=m a$は質量$m$の物体に力$f$が作用したとき物体に働く加速度$a$を記述する．
]

== Annotation for equation using `pinit`
#slide[
  #v(50pt)
  #pinit-highlight-equation-from(1, 2, height: 60pt, dx: -4pt, dy: 19pt, pos: bottom, fill: red, arrow-length: 20pt)[
    Time derivative
  ]
  #pinit-highlight-equation-from(3, 4, height: 30pt, dx: 27pt, dy: 4pt, pos: top, fill: blue, arrow-length: 30pt)[
    Advect
  ]
  #pinit-highlight-equation-from(5, 6, height: 60pt, dx: 7pt, dy: 17pt, pos: bottom, fill: green, arrow-length: 20pt)[
    Pressure gradient
  ]
  #pinit-highlight-equation-from(7, 8, height: 30pt, dx: 13pt, dy: 4pt, pos: top, fill: orange, arrow-length: 30pt)[
    Viscous
  ]
  #pinit-highlight-equation-from(9, 10, height: 30pt, dx: 0pt, dy: 4pt, pos: right, fill: aqua, arrow-length: 20pt)[
    Force
  ]
  $
    // pdv(vb(u), t) + (vb(u) dprod grad) vb(u) = - 1 / rho grad p + nu laplacian vb(u) + vb(f)
    #pin(1);(partial vb(u)) / (partial t)#pin(2)
    + #pin(3);(vb(u) dprod grad) vb(u)#pin(4)
    = - #pin(5);1/rho grad p#pin(6)
    + #pin(7)nu laplacian vb(u)#pin(8)
    + #pin(9)vb(f)#pin(10)
  $
]

== Two-column slide

#slide[
  First column
][
  Second column
]

== Partially two-column slide
#slide[
  #box(
    columns(2, gutter: 10pt)[
      === Description
      - test test test
      - test test test
      - test test test
      #colbreak()
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          // figure
          // content((0, 0), image("fig/figure.png", width: 10cm))
          // Overwrite x label
          rect(fill: gray, stroke: white, (-2.0, -4.7), (2.0, -5.3))
          content(
            (0, -5),
            [#text(16pt)[x label]],
          )
          // Overwrite y label
          rect(fill: gray, stroke: white, (-5.3, -2.0), (-4.7, 2.0))
          content(
            (-5, 0),
            angle: 90deg,
            [#text(16pt)[y label]],
          )
        })
      ]
    ],
  )
  #v(1fr)
  #showybox(
    frame: showybox_focus,
    [Important text],
  )
]

// Freeze last-slide-number
#show: appendix

== References
#slide[
  #set text(size: 20pt)
  #bibliography-list(
    ..bib-file(read("refs.bib")), lang: none)
]

// ==================================================
= Appendix
// ==================================================

== To Do list
#slide[
  ==
  - Add template contents
  - Add animation example
]
