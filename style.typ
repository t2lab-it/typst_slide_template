#let nowdate_jp = {
  [#datetime.today().year()年#datetime.today().month()月#datetime.today().day()日]
}
#let nowdate_slash = {
  [#datetime.today().year()/#datetime.today().month()/#datetime.today().day()]
}


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
