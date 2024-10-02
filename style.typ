#import "@preview/touying:0.5.2": *
#import "@preview/showybox:2.0.1": showybox // Colorful and customizable boxes
#import "@preview/physica:0.9.3": * // Math constructs for science and engineering
#import "@preview/cetz:0.2.2" // Draw figures
#import "@preview/cetz-venn:0.1.1" // Draw venn diagram

#let nowdate_jp = {
  [#datetime.today().year()年#datetime.today().month()月#datetime.today().day()日]
}
#let nowdate_slash = {
  [#datetime.today().year()/#datetime.today().month()/#datetime.today().day()]
}

//言語の設定
#let gothic = ("MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
#let mincho = ("MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
#let english = ("Times New Roman", "New Computer Modern")


// ソースコードを表示するための関数 -----
//https://zenn.dev/higumachan/scraps/1619ad8dc0e776

#let pad_int(i, N: 2) = {
  // pad an integer with leading zeros
  let s = str(i)
  let n_pads = N - s.len() - 1
  for _ in range(n_pads) {
    s = "0" + s
  }
  [#s]
}

#let get_line_num((i, body)) = {
  pad_int(i)
}

#let number_content(text_input) = {
  text_input.split("\n").enumerate(start: 1).map(get_line_num).join("\n")
}

#let code_content_block(it) = block(
  fill: luma(230),
  inset: 8pt,
  width: 100%,
  text(fill: black, it),
  radius: (
    right: 4pt
  )
)

#let num_content_block(it) = block(
  fill: luma(210),
  inset: 8pt,
  text(fill: luma(120), number_content(it)),
  radius: (
    left: 4pt
  )
)

// ========================================

#let set-init(
  theme: "metropolis",
  body
) = {
  set text(font: gothic)
  set text(lang: "ja")
  show raw.where(block: true): it =>{
    grid(
      columns: 2,
      gutter: 0pt,
      num_content_block(it.text),
      code_content_block(it),
  )}
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  if theme == "metropolis"{
  }else if theme == "university"{

  }
  body
}
