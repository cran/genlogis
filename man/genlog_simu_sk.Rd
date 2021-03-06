% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genlog_simu.R
\name{genlog_simu_sk}
\alias{genlog_simu_sk}
\title{Simulating the Generalized logistic distribution with skewness}
\usage{
genlog_simu_sk(real.par, init.par, sample.size = 100,
            k = 1000, seed = 555, threads = 1, progress.bar = T)
}
\arguments{
\item{real.par}{the real parameters value of the distribution wich the random sample will be taken. It has to be a vector of length 5,
the parameters are the values of \code{c(a, b, p, mu)} as listed in \code{rgenlog}, 
\code{mu} can be omitted and will be set to 0. There are no default values.}

\item{init.par}{Initial values for the parameters to be optimized over in the following order \code{c(a, b, p, mu, skew)}.
Can be an object returned by \code{genlog_slider}. There are no default values.}

\item{sample.size}{the sample size to be taken in each \code{k} simulation.}

\item{k}{the number of simulations.}

\item{seed}{seed to be given to \code{set.seed()} function during the sampling process}

\item{threads}{the numbers of CPU threads to be used for parallel computing. If the threads 
number is higher than the available the maximum allowed will be used.}

\item{progress.bar}{show progress bar for each thread during simulations, default value \code{TRUE}.}
}
\value{
It returns a data.frame with \code{k} rows (each simulation) and 7 columns with the following information:
\cr
\code{a, b,  p} and \code{mu} are estimations using maximum likelihood estimation, for more info \code{help(genlogis_mle)}  
\cr
\code{sample.size} The sample size used for each \code{k} simulation.
\cr
\code{convergence} The estimation's convergence status.
\cr
}
\description{
Creating a simulation of the generalized logistic distribution with skewness maximum likelihood estimation of the parameters 
with parallelized processing code using the \code{foreach} package.
}
\details{
The used distribution for this package is given by: \deqn{f(x) = 2*((a + b*(1+p)*(abs(x-mu)^p))*exp(-(x-mu)*(a+b*(abs(x-mu)^p))))/ 
   ((exp(-(x-mu)*(a + b* (abs(x-mu)^p)))+1)^2) *
   ((exp(-(skew*(x-mu))*(a+b*(abs(skew*(x-mu))^p)))+1)^(-1)) }
}
\examples{
genlog_simu_sk(real.par = c(0.3, 0.9, 1.5, 0.0, .9), init.par = c(0.9, 0.3, 0.2, 0.0, .9), 
            sample.size = 100, k = 50, threads = 2, seed = 200) 

}
\references{
Rathie, P. N. and Swamee, P. K (2006) \emph{On a new invertible generalized logistic distribution
approximation to normal distribution}, Technical Research Report in Statistics, 07/2006,
Dept. of Statistics, Univ. of Brasilia, Brasilia, Brazil. 

Azzalini, A. (1985) \emph{A class of distributions which includes the normal ones}. Scandinavian Journal of Statistics.
}
\keyword{genlogis}
