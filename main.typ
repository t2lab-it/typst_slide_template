#import "style.typ": *

#import "@preview/touying:0.5.2": *
#import "@preview/cetz:0.2.2"
#import "@preview/cetz-venn:0.1.1"
#import themes.metropolis: *

//言語の設定
#let gothic = ("MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
#let mincho = ("MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
#let english = ("Times New Roman", "New Computer Modern")

#set text(font: gothic)
#set text(lang: "ja")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
    config-colors(
    //primary: rgb("#eb811b"),
    //primary-light: rgb("#d6c6b7"),
    //secondary: rgb("#d1edf9"),
    //neutral-lightest: rgb("#fafafa"),
    //neutral-dark: rgb("#23373b"),
    //neutral-darkest: rgb("#23373b")
  ),
  config-info(
    title: [タイトル],
    subtitle: [サブタイトル],
    author: [名前],
    date: nowdate_slash,
    institution: [所属],
  ),
)

#show raw.where(block: true): it =>{
      grid(
    columns: 2,
    gutter: 0pt,
    num_content_block(it.text),
    code_content_block(it),
  )
  }
#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// ==================================================

#title-slide()

== スライドタイトル
#slide[
  スライドテキスト
]




// ==================================================
#slide[
  #bibliography(
    style: "annual-reviews-author-date",
    "refs.bib",
  )
]


// ==================================================
#show: appendix
