#import "../style.typ": *
#import themes.university: *

#let theme-setting(
  title: [タイトル],
  subtitle: [サブタイトル],
  author: [名前],
  date: nowdate_slash,
  institution: [所属],
  logo: "",
  summary: [所属],
  handout: false,
  body) = {
  show: university-theme.with(
    aspect-ratio: "16-9",
    config-colors(
      primary: rgb("#04364A"),
      secondary: rgb("#176B87"),
      tertiary: rgb("#448C95"),
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: rgb("#000000"),
    ),
    header-right: "",
    footer-columns: (45%, 1fr, 10%),
    footer-a: self => {
      sym.section
      utils.display-current-heading(level: 1)
    },
    footer-b: self => {
      h(1fr)
      self.info.summary
      h(1fr)
      self.info.date
      h(1fr)
    },
    footer-c: context utils.slide-counter.display() + " / " + utils.last-slide-number,
    config-info(
      title: title,
      subtitle: subtitle,
      author: author,
      date: date,  // nowdate_slash: 2024/10/2  nowdate_jp: 2024年10月2日
      institution: institution,  // [TUS, UC3M, MIT],
      logo: logo,  // emoji.school,
      summary: summary
    ),
    // Do not show 'new section' slide
    config-common(new-section-slide-fn: none),
    // Handout slide
    config-common(handout: handout)
  )
  body
}

// ========================================

// スライドの右上に補足説明を表示
#let description(it) = place(
  top + right,
  dx: 20pt,
  dy: -35pt,
  align(center, it),
)
