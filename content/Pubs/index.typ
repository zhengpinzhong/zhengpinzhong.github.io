#import "../index.typ": template, tufted
#show: template.with(
  title: "Pinzhong Zheng | Publications",
  description: "Publications of Pinzhong Zheng",
  lang: "en",
)
#import "@preview/citegeist:0.2.0": load-bibliography


// 格式化作者姓名为简写格式
#let format-authors(item) = {
  let authors = item.parsed_names.at("author", default: none)
  if authors == none {
    return item.fields.author
  }
  let formatted = ()
  for author in authors {
    let given = author.given
    let family = author.family
    // 提取首字母（处理多个名字的情况，如 "Emily M." -> "E. M."）
    let parts = given.split(" ")
    let initials = ()
    for part in parts {
      if part.len() > 0 {
        initials.push(part.slice(0, 1) + ".")
      }
    }
    let formatted-name = initials.join(" ") + " " + family
    formatted.push(formatted-name)
  }
  formatted.join(", ")
}



= Publications

== Preprints

#tufted.full-width[
  #{
    let bib = load-bibliography(read("arxivs_zpz.bib"))
    let items = array(bib.values())
    let sorted = items.sorted(key: it => int(it.fields.year)).rev()

    // 获取所有唯一的年份（降序）
    let years = ()
    for item in sorted {
      let year = item.fields.year
      if not years.contains(year) {
        years.push(year)
      }
    }
    years = years.sorted(key: it => int(it)).rev()

    // 按年份分组显示
    for year in years {
      heading(level: 3, numbering: none)[#year]
      let enum_items = ()
      for item in sorted {
        if item.fields.year == year {
          let data = item.fields
          let authors = format-authors(item)
          enum_items.push(
            [#authors, "#data.title," #emph(data.archiveprefix):#data.eprint, #data.year. #link(data.url)[arXiv:#data.eprint]],
          )
        }
      }
      enum(..enum_items)
    }
  }
]

== Journal Papers

#tufted.full-width[
  #{
    let bib = load-bibliography(read("papers_zpz.bib"))
    let items = array(bib.values())
    let sorted = items.sorted(key: it => int(it.fields.year)).rev()

    // 获取所有唯一的年份（降序）
    let years = ()
    for item in sorted {
      let year = item.fields.year
      if not years.contains(year) {
        years.push(year)
      }
    }
    years = years.sorted(key: it => int(it)).rev()

    // 按年份分组显示
    for year in years {
      heading(level: 3, numbering: none)[#year]
      let enum_items = ()
      for item in sorted {
        if item.fields.year == year {
          let data = item.fields
          let authors = format-authors(item)
          enum_items.push(
            [#authors, "#data.title," #emph(data.journal), #data.year. DOI: #link(data.url)[#data.doi]],
          )
        }
      }
      enum(..enum_items)
    }
  }
]




/*
- C. Quan, PZ and Z. Zhou. #link("https://arxiv.org/abs/2504.09874")[Maximum bound preservation of exponential integrators for Allen--Cahn equations.] *arXiv*:2504.09874v1 (2025).

- C. Quan, X. Wang, PZ and Z. Zhou. #link("https://doi.org/10.1093/imanum/draf069")[Maximum bound principle and original energy dissipation of arbitrarily high-order rescaled exponential time differencing Runge--Kutta schemes for Allen--Cahn equations.] *IMA Journal of Numerical Analysis* (2025) 00, 1-34.
*/

/*
== 2025

- #link("2025-10-30-normal-distribution/")[Normal Distribution]
- #link("2025-04-16-monkeys-apes/")[Monkeys vs Apes]

== 2024

- #link("2024-10-04-iterators-generators/")[Iterators vs Generators in Python]
*/
