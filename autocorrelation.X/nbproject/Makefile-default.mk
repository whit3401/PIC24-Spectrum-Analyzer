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
DEBUGGABLE_SUFFIX=null
FINAL_IMAGE=${DISTDIR}/autocorrelation.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=null
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

MP_PROCESSOR_OPTION=
MP_LINKER_FILE_OPTION=,--script=

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
