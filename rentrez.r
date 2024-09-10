
> library(rentrez)
> entrez_dbs()

> entrez_search(db="pubmed", term = "Emre Yörük")
> ey = entrez_search(db="pubmed", term="yoruk, emre[AUTH] AND 2012:2022[PDAT]")
> ey
> str(ey)
> entrez_search(db="pubmed",term="Fusarium graminearum[ORGN]",retmax=10)$ids
> entrez_search(db="pubmed",term="Fusarium graminearum[ORGN] AND 2018:2022[PDAT]",retmax=10)$ids


> search_year <- function(year, term){
     query <- paste(term, "AND (", year, "[PDAT])")
     entrez_search(db="pubmed", term=query, retmax=0)$count
 }

> year <- 2018:2022
> papers <- sapply(year, search_year, term="Fusarium graminearum", USE.NAMES=FALSE)
> papers
> plot(papers)
> plot(year, papers)
> plot(year, papers, type = "h", col= c("red", 'blue', 'yellow', 'orange','cyan'))

                                            another sample with function
library(rentrez)
> search_year <- function(year, term){
+     query <- paste(term, "AND (", year, "[PDAT])")
+     entrez_search(db="pubmed", term=query, retmax=0)$count
+ }
> year <- 2013:2022
> papers <- sapply(year, search_year, term="Fusarium graminearum", USE.NAMES=FALSE)
> plot(year, papers, type = "h", col= c("red", 'blue', 'yellow', 'orange','cyan','black','pink','green','brown','gray'))

                                            nucleotide sample
> library(rentrez)
> search_year <- function(year, term){
+     query <- paste(term, "AND (", year, "[PDAT])")
+     entrez_search(db="nucleotide", term=query, retmax=0)$count
+ }
> year <- 2013:2022
> nuco <- sapply(year, search_year, term="Fusarium graminearum", USE.NAMES=FALSE)
> plot(year, nuco, type = "o", col= c("red", 'blue', 'yellow', 'orange','cyan','black','pink','green','brown','gray'))

what type of plot should be drawn. Possible types are
"p" for points,
"l" for lines,
"b" for both,
"c" for the lines part alone of "b",
"o" for both “overplotted”,
"h" for “histogram” like (or “high-density”) vertical lines,
"s" for stair steps,
"S" for other steps, see Details below,
"n" for no plotting.