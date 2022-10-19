/*
This dofile is to be executed from tables.do.
It creates a latex file with instructions for the training.
*/


* Initialize the latex file
texdoc init "$tables/regs_estout.tex", replace

* If you want to add a statistic in, say, a footnote, you can do so in a reproducible manner.
texdoc stlog, nolog

	texdoc local totObs = _N

texdoc stlog close

/*** 
	\begin{table}[H]
		\centering
		\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}
		\caption{Correlation between Work, Race, Education, and Region}
		\arrayrulecolor{black}
		\adjustbox{max width=\textwidth}{
		\begin{tabular}{lcc}
		\toprule
		& (1)  & (2)  \\
		& Wage & Work Hours \\
		\arrayrulecolor{black}\hline \\
		\textit{Panel A: Race and Education} & \multicolumn{1}{l}{} & \multicolumn{1}{l}{} \\
		\input{../../output/tables/regs_estout_panelA.tex} \\
		\textit{Panel B: Race and Region} & \multicolumn{1}{l}{} & \multicolumn{1}{l}{}  \\
		\input{../../output/tables/regs_estout_panelB.tex} \\
		\multicolumn{3}{p{.8\textwidth}}{\footnotesize
		\underline{Notes:} Robust standard errors
		in brackets.
		\sym{*} \(p<0.10\), \sym{**} \(p<0.05\), \sym{***} \(p<0.01\) \textit{Wage}
		is log-transformed and real, and \textit{work hours} indicates the number of hours
		usually worked. All data are from Stata's example data set \textit{nlswork.dta}. 
		The sample size of this data set is `totObs'.}
		\end{tabular}
		}
	\end{table}
***/