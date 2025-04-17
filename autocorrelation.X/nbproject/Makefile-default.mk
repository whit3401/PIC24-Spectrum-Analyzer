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
${OBJECTDIR}/autocorrelation_library.o: autocorrelation_library.c  .generated_files/flags/default/1e21d07fbd6822dd48ddaaca95324dd468352766 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o.d 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autocorrelation_library.c  -o ${OBJECTDIR}/autocorrelation_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autocorrelation_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main.o: spectrum_analyzer_main.c  .generated_files/flags/default/fa4fc5b045a55331b01b2eb03586a7a775c8d844 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main.c  -o ${OBJECTDIR}/spectrum_analyzer_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/39fbc4e1b1b75a6e23989a4811fecbdc8a635b33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_microphone_in.o: ADC_microphone_in.c  .generated_files/flags/default/599529b64d93a79407f70dad5dd818c1d9cc30a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_in.c  -o ${OBJECTDIR}/ADC_microphone_in.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_in.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/7e907f9f8fe4ab8a43a453c42f6693ca08144a40 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/autocorrelation_library.o: autocorrelation_library.c  .generated_files/flags/default/bd343275c851bf462af42c1ee886dd439b8f3da3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o.d 
	@${RM} ${OBJECTDIR}/autocorrelation_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autocorrelation_library.c  -o ${OBJECTDIR}/autocorrelation_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autocorrelation_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main.o: spectrum_analyzer_main.c  .generated_files/flags/default/cd24ed20131964807900e06f2f1bbc4750fa09be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main.c  -o ${OBJECTDIR}/spectrum_analyzer_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/efb7ea1621b76381a1bbb2e158cc6d94248719fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_microphone_in.o: ADC_microphone_in.c  .generated_files/flags/default/1f147a6aef0c3aca57944ce0c037a973a42052b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_in.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_in.c  -o ${OBJECTDIR}/ADC_microphone_in.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_in.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/9df5d35126e7227014c3c771ae2a2a9c82877769 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/1846f58ca913e32c1a06ec054a10606e5160e46d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmLib_v001.s  -o ${OBJECTDIR}/asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/5689754c41c0375fec4f3f46ef866fbf2711c8e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
