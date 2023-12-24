JULIA=/opt/julia/v1.8.5/bin/julia
PROJECT=/opt/julia/v1.8.5/environments/v1.8

all: l0301_randomVariable l0302_discreteContinuous l0303_meanIntegration l0304_varianceTransformation l0305_cdfFromPdf l0306_inverseCDF l0307_mgf l0308_weightVector l0309_triangularDist l0310_distributionDescriptors l0311_basicDistRand l0312_triangularDistInv l0313_discreteDists l0314_uniformDiscreteDice l0315_binomialCoinFlip l0316_geometric l0317_negativeBinomial l0318_hypergeometric l0319_poisson l0320_continuousDists l0321_continuousUniform l0322_expGeom l0323_gammaDist l0324_betaDist l0325_gammafunctionIntegration l0326_weibullHazard l0327_normalCalculus l0328_rayleigh l0329_normalDistribution l0330_cauchyCMA l0331_jointPDF l0332_multiRVgeneration l0333_multiDimensionalIntegration l0334_bivariateNormal

clean:
	find . -type f -name "*.png" -exec rm {} \;

environment:
	${JULIA} --project=${PROJECT} setup.jl

l0301_random_variable_bar.png:
	${JULIA} --project=${PROJECT} l0301_randomVariable.jl
l0302_discreteContinuous:
	${JULIA} --project=${PROJECT} l0302_discreteContinuous.jl
l0303_meanIntegration:
	${JULIA} --project=${PROJECT} l0303_meanIntegration.jl
l0304_varianceTransformation:
	${JULIA} --project=${PROJECT} l0304_varianceTransformation.jl
l0305_cdfFromPdf:
	${JULIA} --project=${PROJECT} l0305_cdfFromPdf.jl
l0306_inverseCDF:
	${JULIA} --project=${PROJECT} l0306_inverseCDF.jl
l0307_mgf:
	${JULIA} --project=${PROJECT} l0307_mgf.jl
l0308_weightVector:
	${JULIA} --project=${PROJECT} l0308_weightVector.jl
l0309_triangularDist:
	${JULIA} --project=${PROJECT} l0309_triangularDist.jl
l0310_distributionDescriptors:
	${JULIA} --project=${PROJECT} l0310_distributionDescriptors.jl
l0311_basicDistRand:
	${JULIA} --project=${PROJECT} l0311_basicDistRand.jl
l0312_triangularDistInv:
	${JULIA} --project=${PROJECT} l0312_triangularDistInv.jl
l0313_discreteDists:
	${JULIA} --project=${PROJECT} l0313_discreteDists.jl
l0314_uniformDiscreteDice:
	${JULIA} --project=${PROJECT} l0314_uniformDiscreteDice.jl
l0315_binomialCoinFlip:
	${JULIA} --project=${PROJECT} l0315_binomialCoinFlip.jl
l0316_geometric:
	${JULIA} --project=${PROJECT} l0316_geometric.jl
l0317_negativeBinomial:
	${JULIA} --project=${PROJECT} l0317_negativeBinomial.jl
l0318_hypergeometric:
	${JULIA} --project=${PROJECT} l0318_hypergeometric.jl
l0319_poisson:
	${JULIA} --project=${PROJECT} l0319_poisson.jl
l0320_continuousDists:
	${JULIA} --project=${PROJECT} l0320_continuousDists.jl
l0321_continuousUniform:
	${JULIA} --project=${PROJECT} l0321_continuousUniform.jl
l0322_expGeom:
	${JULIA} --project=${PROJECT} l0322_expGeom.jl
l0323_gammaDist:
	${JULIA} --project=${PROJECT} l0323_gammaDist.jl
l0324_betaDist:
	${JULIA} --project=${PROJECT} l0324_betaDist.jl
l0325_gammafunctionIntegration:
	${JULIA} --project=${PROJECT} l0325_gammafunctionIntegration.jl
l0326_weibullHazard:
	${JULIA} --project=${PROJECT} l0326_weibullHazard.jl
l0327_normalCalculus:
	${JULIA} --project=${PROJECT} l0327_normalCalculus.jl
l0328_rayleigh:
	${JULIA} --project=${PROJECT} l0328_rayleigh.jl
l0329_normalDistribution:
	${JULIA} --project=${PROJECT} l0329_normalDistribution.jl
l0330_cauchyCMA:
	${JULIA} --project=${PROJECT} l0330_cauchyCMA.jl
l0331_jointPDF:
	${JULIA} --project=${PROJECT} l0331_jointPDF.jl
l0332_multiRVgeneration:
	${JULIA} --project=${PROJECT} l0332_multiRVgeneration.jl
l0333_multiDimensionalIntegration:
	${JULIA} --project=${PROJECT} l0333_multiDimensionalIntegration.jl
l0334_bivariateNormal:
	${JULIA} --project=${PROJECT} l0334_bivariateNormal.jl