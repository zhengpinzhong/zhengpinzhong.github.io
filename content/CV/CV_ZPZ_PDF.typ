#import "@preview/citegeist:0.2.0": load-bibliography
#set page(height: auto)
#show link: it => underline(it)

= Pinzhong Zheng: #text(weight: "regular", size: 0.9em)[Applied Mathematics Ph.D. Student at PolyU]

Website: #link("https://zhengpinzhong.github.io/")[zhengpinzhong.github.io]

Email: #link("mailto:pinzhong.zheng@connect.polyu.hk", "pinzhong.zheng@connect.polyu.hk")

Address: M303, The Hong Kong Polytechnic University, Hung Hom, Kowloon, Hong Kong

== Education

- *09/2024--Present*: Ph.D. Student in Applied Mathematics, The Hong Kong Polytechnic University (PolyU).
- *09/2022--06/2024*: M.Sc. in Mathematics, Southern University of Science and Technology (SUSTech).
- *09/2018--07/2022*: B.Sc. in Mathematics, Wuhan University.

== Papers

#{
  let bib = load-bibliography(read("../Pubs/papers_zpz.bib"))
  for item in bib.values().rev() [
    #let data = item.fields
    - #data.author, "#data.title," #emph(data.journal), #data.year. DOI: #link(data.url)[#data.doi]
  ]
}


/*
== Experience

- *1983--Present*: Founder & Publisher, Graphics Press. Independent publishing house specializing in information design and data visualization.
- *1977--1999*: Professor Emeritus, Yale University. Departments of Political Science, Statistics, and Computer Science.
- *1967--1977*: Instructor, Princeton University. Woodrow Wilson School of Public and International Affairs.

== Artworks

#figure(
  caption: [A homage to Edward R. Tufte's large stainless steel sculpture titled _Escaping Flatland_],
  numbering: none,
)[
  #image("escaping-flatland.webp", height: 150pt)
]

Founder of Hogpen Hill Farms, a 234-acre sculpture park in Woodbury, Connecticut. Creator of large-scale works including _Larkin’s Twig_ and the _Escaping Flatland_ series, exhibited at the Aldrich Contemporary Art Museum.

== Research Contributions

Development of sparklines, a method for embedding high-resolution data graphics within text, and formulation of the data-ink ratio as a quantitative measure of graphical efficiency.

== Books

#{
  let bib = load-bibliography(read("books.bib"))
  for item in bib.values().rev() [
    #let data = item.fields
    - #strong(data.year): #emph(data.title)
  ]
}

== Papers

#{
  let bib = load-bibliography(read("papers.bib"))
  for item in bib.values().rev() [
    #let data = item.fields
    - #data.author, "#data.title," #emph(data.journal), #data.year. DOI: #link(data.url)[#data.doi]
  ]
}
*/

