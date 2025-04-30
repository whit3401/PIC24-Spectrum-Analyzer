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
FINAL_IMAGE=${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=ADC_microphone_library.c asmLib_v001.s FFT_library.c button_control_library.c oledDisplay_API_library.c spectrum_analyzer_main_v002.c buzzer_library.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ADC_microphone_library.o ${OBJECTDIR}/asmLib_v001.o ${OBJECTDIR}/FFT_library.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/spectrum_analyzer_main_v002.o ${OBJECTDIR}/buzzer_library.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ADC_microphone_library.o.d ${OBJECTDIR}/asmLib_v001.o.d ${OBJECTDIR}/FFT_library.o.d ${OBJECTDIR}/button_control_library.o.d ${OBJECTDIR}/oledDisplay_API_library.o.d ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d ${OBJECTDIR}/buzzer_library.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ADC_microphone_library.o ${OBJECTDIR}/asmLib_v001.o ${OBJECTDIR}/FFT_library.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/spectrum_analyzer_main_v002.o ${OBJECTDIR}/buzzer_library.o

# Source Files
SOURCEFILES=ADC_microphone_library.c asmLib_v001.s FFT_library.c button_control_library.c oledDisplay_API_library.c spectrum_analyzer_main_v002.c buzzer_library.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ADC_microphone_library.o: ADC_microphone_library.c  .generated_files/flags/default/8c7b5f871e837f73ff4a02edbc3cec115c72f7dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_library.c  -o ${OBJECTDIR}/ADC_microphone_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_library.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FFT_library.o: FFT_library.c  .generated_files/flags/default/4d7fe3dfb23eef3c40596f53ad8bca3d157baf58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FFT_library.o.d 
	@${RM} ${OBJECTDIR}/FFT_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FFT_library.c  -o ${OBJECTDIR}/FFT_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FFT_library.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/53b66c458270e8dbb91d669416f4035086b032b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/e380a6a56ff62cb33adbcf09829c5d2429ad80af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main_v002.o: spectrum_analyzer_main_v002.c  .generated_files/flags/default/eb2c1894f4f80eaccd8c8ac74c1aff37cc25074a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main_v002.c  -o ${OBJECTDIR}/spectrum_analyzer_main_v002.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main_v002.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/buzzer_library.o: buzzer_library.c  .generated_files/flags/default/3f9b9ff5d9ee1576241f27cc78aaf695eb2a309c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/buzzer_library.o.d 
	@${RM} ${OBJECTDIR}/buzzer_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  buzzer_library.c  -o ${OBJECTDIR}/buzzer_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/buzzer_library.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/ADC_microphone_library.o: ADC_microphone_library.c  .generated_files/flags/default/a44b5e2c7ff37b23a85026db6c100663ed5806b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_library.c  -o ${OBJECTDIR}/ADC_microphone_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FFT_library.o: FFT_library.c  .generated_files/flags/default/b052ac199c65b353db43e5dcf13f5aa2d9fe666 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FFT_library.o.d 
	@${RM} ${OBJECTDIR}/FFT_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FFT_library.c  -o ${OBJECTDIR}/FFT_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FFT_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/296050770125582340342d90a0e4df371453ae88 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/30d06d47bcb984066f60b3d9a81c251e895a560f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main_v002.o: spectrum_analyzer_main_v002.c  .generated_files/flags/default/500f1f38c396ee05ba91420e27a8048244383de4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main_v002.c  -o ${OBJECTDIR}/spectrum_analyzer_main_v002.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main_v002.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/buzzer_library.o: buzzer_library.c  .generated_files/flags/default/d5ef30bd6304039da03ac6a03e1a0e4e0e5670bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/buzzer_library.o.d 
	@${RM} ${OBJECTDIR}/buzzer_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  buzzer_library.c  -o ${OBJECTDIR}/buzzer_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/buzzer_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/ef5ab91d4cfffc62ff860b8c9a4dd3d7da100e17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmLib_v001.s  -o ${OBJECTDIR}/asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/9dc3b3d1f767bc29d6328f19137ba055976013c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
