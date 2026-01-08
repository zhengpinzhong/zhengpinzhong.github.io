#import "../index.typ": template, tufted
#show: template.with(title: "Pinzhong Zheng | Publications")
#import "@preview/citegeist:0.2.0": load-bibliography



= Publications

== Preprints

#tufted.full-width[
  #{
    let bib = load-bibliography(read("arxivs_zpz.bib"))
    let items = array(bib.values())
    let sorted = items.sort((a, b) => {
      let year_a = int(a.fields.year)
      let year_b = int(b.fields.year)
      if year_a > year_b { -1 } else if year_a < year_b { 1 } else { 0 }
    })
    for item in sorted [
      #let data = item.fields
      - #data.author, "#data.title," #emph(data.archiveprefix):#data.eprint, #data.year. #link(data.url)[arXiv:#data.eprint]
    ]
  }
]

== Journal Papers

#tufted.full-width[
  #{
    let bib = load-bibliography(read("papers_zpz.bib"))
    let items = array(bib.values())
    let sorted = items.sort((a, b) => {
      let year_a = int(a.fields.year)
      let year_b = int(b.fields.year)
      if year_a > year_b { -1 } else if year_a < year_b { 1 } else { 0 }
    })
    for item in sorted [
      #let data = item.fields
      - #data.author, "#data.title," #emph(data.journal), #data.year. DOI: #link(data.url)[#data.doi]
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
