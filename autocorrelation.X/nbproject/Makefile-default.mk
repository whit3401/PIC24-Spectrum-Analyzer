#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=autocorrelation_library.c spectrum_analyzer_main.c oledDisplay_API_library.c ADC_microphone_in.c button_control_library.c asmLib_v001.s

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/autocorrelation_library.o ${OBJECTDIR}/spectrum_analyzer_main.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/ADC_microphone_in.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/asmLib_v001.o
POSSIBLE_DEPFILES=${OBJECTDIR}/autocorrelation_library.o.d ${OBJECTDIR}/spectrum_analyzer_main.o.d ${OBJECTDIR}/oledDisplay_API_library.o.d ${OBJECTDIR}/ADC_microphone_in.o.d ${OBJECTDIR}/button_control_library.o.d ${OBJECTDIR}/asmLib_v001.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/autocorrelation_library.o ${OBJECTDIR}/spectrum_analyzer_main.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/ADC_microphone_in.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/asmLib_v001.o

# Source Files
SOURCEFILES=autocorrelation_library.c spectrum_analyzer_main.c oledDisplay_API_library.c ADC_microphone_in.c button_control_library.c asmLib_v001.s



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/autocorrelation_library.o: autocorrelation_library.c  .generated_files/flags/default/64ab66020d3eb536cc21bffcacdcad51ac01af16 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o.d 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autocorrelation_library.c  -o ${OBJECTDIR}/autocorrelation_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autocorrelation_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main.o: spectrum_analyzer_main.c  .generated_files/flags/default/fdf5cc7d7db1dfcbc08b7cbe3d29fba0e3805807 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main.c  -o ${OBJECTDIR}/spectrum_analyzer_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/a35f53da89f2a25e076f521f4fbe47d02148cc51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_microphone_in.o: ADC_microphone_in.c  .generated_files/flags/default/dc37fc59636d71d83702759583540db15857940f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_in.c  -o ${OBJECTDIR}/ADC_microphone_in.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_in.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/152f60d305bfa77d3ce2200f020f1c96c8706501 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/autocorrelation_library.o: autocorrelation_library.c  .generated_files/flags/default/b9f15c02e99cdf10d7e2850db72569aafe85c9d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o.d 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autocorrelation_library.c  -o ${OBJECTDIR}/autocorrelation_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autocorrelation_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main.o: spectrum_analyzer_main.c  .generated_files/flags/default/a36c6e3387b45239aaa08cc837dcfbe55664d791 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main.c  -o ${OBJECTDIR}/spectrum_analyzer_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/17ce3e258cd551a44b3e8c8844249210f717b75b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_microphone_in.o: ADC_microphone_in.c  .generated_files/flags/default/c691ff1e83b90560aef6970021ec69d2490aab7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_in.c  -o ${OBJECTDIR}/ADC_microphone_in.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_in.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/8abec96f70a0ff96c2efaf1a2bf17fa66849b1d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/538542089f0cdfea960adbfffe0447c524057d40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmLib_v001.s  -o ${OBJECTDIR}/asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/f7cbbe49ed91b0606551402c3fa821ed9405c5a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmLib_v001.s  -o ${OBJECTDIR}/asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
