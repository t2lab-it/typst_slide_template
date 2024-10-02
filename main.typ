#import "style.typ": *
#show: set-init.with()

// --------------------------------------------------
// metropolis theme
// --------------------------------------------------
///*
#import themes.metropolis: *
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
      date: nowdate_slash,// nowdate_slash: 2024/10/2  nowdate_jp: 2024年10月2日
      institution: [所属],
    ),
    // Do not show 'new section' slide
    config-common(new-section-slide-fn: none),
    // Handout slide
    // config-common(handout: true),
    footer: self => utils.display-current-heading(level: 1),
  )
//*/
// --------------------------------------------------
// university theme
// --------------------------------------------------
/*
#import themes.university: *
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-colors(
    //primary: rgb("#04364A"),
    //secondary: rgb("#176B87"),
    //tertiary: rgb("#448C95"),
    //neutral-lightest: rgb("#ffffff"),
    //neutral-darkest: rgb("#000000"),
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
  footer-c: utils.slide-counter.display() + " / " + utils.last-slide-number,
  config-info(
    title: [タイトル],
    subtitle: [サブタイトル],
    author: [名前],
    date: nowdate_jp,  // nowdate_slash: 2024/10/2  nowdate_jp: 2024年10月2日
    institution: [],  // [TUS, UC3M, MIT],
    logo: "",  // emoji.school,
    summary: [所属]
  ),
  // Do not show 'new section' slide
  config-common(new-section-slide-fn: none),
  // Handout slide
  // config-common(handout: true)
)
*/

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
