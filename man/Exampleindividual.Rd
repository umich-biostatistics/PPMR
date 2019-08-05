\name{Exampleindividual}
\alias{Exampleindividual}
\docType{data}
\title{
Individual level dataset 
}
\description{
A simulated individual level dataset for PMR
}
\usage{data("Exampleindividual")}
\format{
  A list contains the following objects:
  \describe{
    \item{zx}{the standardized genotype matrix for 465 individuals and 50 cis-SNPs in eQTL data.}
    \item{zy}{the standardized genotype matrix for 2000 individuals and 50 cis-SNPs in GWAS data.}
    \item{x}{the standarized gene expression vector for 465 individuals in eQL data.}
    \item{y}{the standarized complex trait vector for 2000 individuals in GWAS data.}
  }
}

\examples{
data(Exampleindividual.rda)
attach(Exampleindividual.rda)
fmH1 = PMR_individual(yin=x, zin=y, x1in=zx, x2in=zy,gammain=0,alphain = 0,max_iterin =1000,epsin=1e-5)
alpha<-fmH1$alpha
gamma<-fmH1$gamma
fmH0gamma = PMR_individual(yin=x,zin= y, x1in=zx, x2in=zy,gammain=1, alphain = 0,max_iterin =1000,epsin=1e-5)
fmH0alpha = PMR_individual(yin=x, zin=y, x1in=zx, x2in=zy,gammain=0,alphain = 1,max_iterin =1000, epsin=1e-5)
loglikH1=max(fmH1$loglik,na.rm=T)
loglikH0gamma=max(fmH0gamma$loglik,na.rm=T)
loglikH0alpha=max(fmH0alpha$loglik,na.rm=T)
stat_alpha = 2 * (loglikH1 - loglikH0alpha)
pvalue_alpha = pchisq(stat_alpha,1,lower.tail=F)
stat_gamma = 2 * (loglikH1 - loglikH0gamma)
pvalue_gamma = pchisq(stat_gamma,1,lower.tail=F)
}
\keyword{datasets}
