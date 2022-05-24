package Gamma{
	package Definitions{
		
		package PartDefinitions{
			import ActionDefinitions::*;
			
			part gammaLogic : 'Gamma Statechart Composition Framework';
			
			part def 'Gamma Statechart Composition Framework'{
				part validation : 'Model Validation functionality';
				part modelIntegration : 'Model Integration functionality';
				part generation : 'Code generation functionality';
				part _verification : 'Verification functionality';
			}
			
			part def 'Model Integration functionality'{
				
			}
			
			part def 'Model Validation functionality'{
				
			}
			
			part def 'Code generation functionality'{
				perform action GenerateCode;
			}
			
			part def 'Verification functionality';
		}
		
		package ItemDefinitions{
			item def Designer;
			item def EngineeringModel;
		}
		
		package UseCaseDefinitions {
			import PartDefinitions::*;
			import ItemDefinitions::*;
			
			use case def 'Edit model'{
				subject gamma : 'Gamma Statechart Composition Framework';
				actor designer : Designer;
				
				objective {
					doc /* Create and modify the gamma models */
				}
			}
			
			use case def 'Edit via graphical editor';
			
			use case def 'Validate model';
			
			use case def 'Verify behaviour';
			
			use case def 'Verify with formal methods';
			
			use case def 'Generate source code'{
				actor designer : Designer;
			}
		}
		
		package ActionDefinitions{
			action def GenerateCode {
				first start;
				then action GenerateScSource;
				then action GenerateInterfaces;
				
				then done;
			}
		}
		
		package AttributeDefinitions{
			
		}
		
		package SignalDefinitions{
			
		}
		
		package StateDefinitions{
			
		}
		
		package PortDefinitions{
			
		}
		
		package InterfaceDefinitions{
			
		}
		
		package RequirementDefinitions{
			requirement def <'1'> 'High-level support'{
				doc /* The Gamma framework shall supports system design by the integration of high-level engineering modeling languages */
			}
		}
	}
	
	package GammaConfigurations{
		package GammaV2{
			import Definitions::PartDefinitions::*;
			
			part gamma{
				part yakinduIntegraion{
					part YakinduGammatransformation{
						satisfy Requirements::ModelIntegraionReq;
					} 
					part YakinduStatechartGen;
				}
				
				part UPPAALIntegration{
					part GammaUPPALtransformation;
					part UPPAALverification;
				}
				part GammaLanguage{
					part GammaPackage;
					
					part GammaConstraintLanguage;
					
					part GammaInterfaceLanguage;
					
					part GammaStatechartLanguage;
					
					part GammaCompositionLanguage;
					
					part GammaTestLanguage;
				}
				part codeGeneration {
					part GammaGeneration;
				}
				
				allocate gammaLogic to gamma{
					allocate gammaLogic.modelIntegration to gamma.yakinduIntegraion;
				}
			}
			
			package Requirements{
				import Definitions::RequirementDefinitions::*;
				
				requirement <'1.1'> ModelIntegraionReq : 'High-level support'{
					doc /* Integration of engineering models shall use model transformations, which maphigh-level behavioral models to the statechart language of Gamma. */
				}
			}
			
			package UseCases{
				import Definitions::UseCaseDefinitions::*;
				
				use case 'generate code': 'Generate source code'{
					subject gamma;
					first start;
					then include use case 'generate communication interface';
					then include use case 'generate statechart source';
				}
			}
		}
	}
}