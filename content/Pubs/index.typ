#import "../index.typ": template, tufted
#show: template.with(title: "Pinzhong Zheng | Publications")
#import "@preview/citegeist:0.2.0": load-bibliography




= Publications

== Preprints

#tufted.full-width[
  #{
    let bib = load-bibliography(read("arxivs_zpz.bib"))
    let items = bib.values()
    let items-by-year = (:)
    for item in items [
      #let data = item.fields
      #let year = str(data.year)
      let current-list = if items-by-year.has(year) [
      items-by-year.at(year)
      ] else [
      ()
      ]
      items-by-year.insert(year, current-list + (item,))
    ]
    let years = items-by-year.keys()
    let sorted-years = ()
    for year in years [
      let year-int = int(year)
      if sorted-years.len() == 0 [
      sorted-years = (year,)
      ] else [
      let inserted = false
      let new-list = ()
      for sy in sorted-years [
      if not inserted and year-int > int(sy) [
      new-list = new-list + (year,) + (sy,)
      inserted = true
      ] else [
      new-list = new-list + (sy,)
      ]
      ]
      if not inserted [
      new-list = new-list + (year,)
      ]
      sorted-years = new-list
      ]
    ]
    for year in sorted-years [
      == #year
      #let year-items = items-by-year.at(year)
      #let num = 1
      for item in year-items [
      #let data = item.fields
      #num. #data.author, "#data.title," #emph(data.archiveprefix):#data.eprint, #data.year. #link(data.url)[arXiv:#data.eprint]
      #num = num + 1
      ]
    ]
  }
]

== Journal Papers

#tufted.full-width[
  #{
    let bib = load-bibliography(read("papers_zpz.bib"))
    let items = bib.values()
    let items-by-year = (:)
    for item in items [
      #let data = item.fields
      #let year = str(data.year)
      let current-list = if items-by-year.has(year) [
      items-by-year.at(year)
      ] else [
      ()
      ]
      items-by-year.insert(year, current-list + (item,))
    ]
    let years = items-by-year.keys()
    let sorted-years = ()
    for year in years [
      let year-int = int(year)
      if sorted-years.len() == 0 [
      sorted-years = (year,)
      ] else [
      let inserted = false
      let new-list = ()
      for sy in sorted-years [
      if not inserted and year-int > int(sy) [
      new-list = new-list + (year,) + (sy,)
      inserted = true
      ] else [
      new-list = new-list + (sy,)
      ]
      ]
      if not inserted [
      new-list = new-list + (year,)
      ]
      sorted-years = new-list
      ]
    ]
    for year in sorted-years [
      == #year
      #let year-items = items-by-year.at(year)
      #let num = 1
      for item in year-items [
      #let data = item.fields
      #num. #data.author, "#data.title," #emph(data.journal), #data.year. DOI: #link(data.url)[#data.doi]
      #num = num + 1
      ]
    ]
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
