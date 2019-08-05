\name{Examplesummary}
\alias{Examplesummary}
\docType{data}
\title{
Summary level dataset 
}
\description{
A simulated summary level dataset for PMR
}
\usage{data("Examplesummary")}
\format{
  A list contains the following objects:
  \describe{
    \item{betax}{the cis-SNP effect size vector for one specific gene in eQTL data.}
    \item{betay}{the cis-SNP effect size vector for one specific gene in GWAS data.}
    \item{Sigma1}{the LD matrix in eQTL data.}
    \item{Sigma2}{the LD matrix in GWAS data.}
    \item{n1}{the sample size of eQTL data.}
    \item{n2}{the sample size of GWAS data.}
  }
}

\examples{
data(Examplesummary.rda)
attach(Examplesummary.rda)
fmH1=PMR_summary(betaxin=betax,betayin=betay,Sigma1sin=Sigma1,Sigma2sin=Sigma2,samplen1=n1,samplen2=n2,gammain=0,alphain=0,max_iterin =1000, epsin=1e-5)
fmH0alpha=PMR_summary(betaxin=betax,betayin=betay,Sigma1sin=Sigma1,Sigma2sin=Sigma2,samplen1=n1,samplen2=n2,gammain=0,alphain=1,max_iterin =1000, epsin=1e-5)
fmH0gamma=PMR_summary(betaxin=betax,betayin=betay,Sigma1sin=Sigma1,Sigma2sin=Sigma2,samplen1=n1,samplen2=n2,gammain=1,alphain=0,max_iterin =1000, epsin=1e-5)
loglikH1=max(fmH1$loglik,na.rm=T)
loglikH0alpha=max(fmH0alpha$loglik,na.rm=T)
loglikH0gamma=max(fmH0gamma$loglik,na.rm=T)
stat_alpha = 2 * (loglikH1 - loglikH0alpha)
pvalue_alpha = pchisq(stat_alpha,1,lower.tail=F)
stat_gamma = 2 * (loglikH1 - loglikH0gamma)
pvalue_gamma = pchisq(stat_gamma,1,lower.tail=F)
}
\keyword{datasets}
