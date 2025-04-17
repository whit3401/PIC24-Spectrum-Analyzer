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
SOURCEFILES_QUOTED_IF_SPACED=ADC_microphone_library.c asmLib_v001.s FFT_library.c button_control_library.c oledDisplay_API_library.c spectrum_analyzer_main_v002.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ADC_microphone_library.o ${OBJECTDIR}/asmLib_v001.o ${OBJECTDIR}/FFT_library.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/spectrum_analyzer_main_v002.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ADC_microphone_library.o.d ${OBJECTDIR}/asmLib_v001.o.d ${OBJECTDIR}/FFT_library.o.d ${OBJECTDIR}/button_control_library.o.d ${OBJECTDIR}/oledDisplay_API_library.o.d ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ADC_microphone_library.o ${OBJECTDIR}/asmLib_v001.o ${OBJECTDIR}/FFT_library.o ${OBJECTDIR}/button_control_library.o ${OBJECTDIR}/oledDisplay_API_library.o ${OBJECTDIR}/spectrum_analyzer_main_v002.o

# Source Files
SOURCEFILES=ADC_microphone_library.c asmLib_v001.s FFT_library.c button_control_library.c oledDisplay_API_library.c spectrum_analyzer_main_v002.c



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
${OBJECTDIR}/ADC_microphone_library.o: ADC_microphone_library.c  .generated_files/flags/default/a94c20dcef269888b2eda2dbcf9b7b65264f5cf3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_library.c  -o ${OBJECTDIR}/ADC_microphone_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FFT_library.o: FFT_library.c  .generated_files/flags/default/989f2ea4aaa93083eed7732af137b77aaf45ac4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FFT_library.o.d 
	@${RM} ${OBJECTDIR}/FFT_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FFT_library.c  -o ${OBJECTDIR}/FFT_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FFT_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/e48401ec3ea042f579a86779be57fb17617b9fd6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/46535b8e431b39d0f0be2241df24a7fde037447d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main_v002.o: spectrum_analyzer_main_v002.c  .generated_files/flags/default/22dd78df94be5d984a4ab62e818d68b58b21c463 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main_v002.c  -o ${OBJECTDIR}/spectrum_analyzer_main_v002.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main_v002.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/ADC_microphone_library.o: ADC_microphone_library.c  .generated_files/flags/default/321a89e05597255dbccdfebb988be34d2e0e6b59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o.d 
	@${RM} ${OBJECTDIR}/ADC_microphone_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC_microphone_library.c  -o ${OBJECTDIR}/ADC_microphone_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_microphone_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FFT_library.o: FFT_library.c  .generated_files/flags/default/672ba49675bc64a4ad0f6ba3452dbcfa325a0b5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FFT_library.o.d 
	@${RM} ${OBJECTDIR}/FFT_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FFT_library.c  -o ${OBJECTDIR}/FFT_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FFT_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/button_control_library.o: button_control_library.c  .generated_files/flags/default/9d662e7f467b286a3dbba4e9474c2964d9f678a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/button_control_library.o.d 
	@${RM} ${OBJECTDIR}/button_control_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  button_control_library.c  -o ${OBJECTDIR}/button_control_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/button_control_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDisplay_API_library.o: oledDisplay_API_library.c  .generated_files/flags/default/f209e767de8db3fbb9c5b94057921b6de70317a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o.d 
	@${RM} ${OBJECTDIR}/oledDisplay_API_library.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDisplay_API_library.c  -o ${OBJECTDIR}/oledDisplay_API_library.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDisplay_API_library.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spectrum_analyzer_main_v002.o: spectrum_analyzer_main_v002.c  .generated_files/flags/default/cff31bac279e1541ec941b3c91526b13127c9ab3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o.d 
	@${RM} ${OBJECTDIR}/spectrum_analyzer_main_v002.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spectrum_analyzer_main_v002.c  -o ${OBJECTDIR}/spectrum_analyzer_main_v002.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spectrum_analyzer_main_v002.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/9fed3d89b0d206ac873bfc48ec80de7e444b40f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmLib_v001.o.d 
	@${RM} ${OBJECTDIR}/asmLib_v001.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmLib_v001.s  -o ${OBJECTDIR}/asmLib_v001.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/asmLib_v001.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/asmLib_v001.o: asmLib_v001.s  .generated_files/flags/default/f68c9f0fae54ea72cfbc246756a5d8da43fdf436 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/spectrum_analyzer_v002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
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
