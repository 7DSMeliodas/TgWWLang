module c_libxml.globals;

import c_libxml.encoding;
import c_libxml.parser;
import c_libxml.SAX2;
import c_libxml.threads;
import c_libxml.tree;
import c_libxml.xmlerror;
import c_libxml.xmlIO;
import c_libxml.xmlmemory;
import c_libxml.xmlversion;

static if (!is(_xmlOutputBuffer))
    struct _xmlOutputBuffer;

/*
 * Summary: interface for all global variables of the library
 * Description: all the global variables and thread handling for
 *              those variables is handled by this module.
 *
 * The bottom of this file is automatically generated by build_glob.py
 * based on the description file global.data
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Gary Pennington <Gary.Pennington@uk.sun.com>, Daniel Veillard
 */

extern (C) nothrow @system:

void xmlInitGlobals();
void xmlCleanupGlobals();

/**
 * xmlParserInputBufferCreateFilenameFunc:
 * @URI: the URI to read from
 * @enc: the requested source encoding
 *
 * Signature for the function doing the lookup for a suitable input method
 * corresponding to an URI.
 *
 * Returns the new xmlParserInputBufferPtr in case of success or NULL if no
 *         method was found.
 */
alias xmlParserInputBufferCreateFilenameFunc = _xmlParserInputBuffer* function(
    const(char)* URI,
    xmlCharEncoding enc);

/**
 * xmlOutputBufferCreateFilenameFunc:
 * @URI: the URI to write to
 * @enc: the requested target encoding
 *
 * Signature for the function doing the lookup for a suitable output method
 * corresponding to an URI.
 *
 * Returns the new xmlOutputBufferPtr in case of success or NULL if no
 *         method was found.
 */
alias xmlOutputBufferCreateFilenameFunc = _xmlOutputBuffer* function(
    const(char)* URI,
    xmlCharEncodingHandlerPtr encoder,
    int compression);

xmlParserInputBufferCreateFilenameFunc xmlParserInputBufferCreateFilenameDefault(
    xmlParserInputBufferCreateFilenameFunc func);
xmlOutputBufferCreateFilenameFunc xmlOutputBufferCreateFilenameDefault(
    xmlOutputBufferCreateFilenameFunc func);

/*
 * Externally global symbols which need to be protected for backwards
 * compatibility support.
 */

/**
 * xmlRegisterNodeFunc:
 * @node: the current node
 *
 * Signature for the registration callback of a created node
 */
alias xmlRegisterNodeFunc = void function(xmlNodePtr node);
/**
 * xmlDeregisterNodeFunc:
 * @node: the current node
 *
 * Signature for the deregistration callback of a discarded node
 */
alias xmlDeregisterNodeFunc = void function(xmlNodePtr node);

alias xmlGlobalState = _xmlGlobalState;
alias xmlGlobalStatePtr = _xmlGlobalState*;

struct _xmlGlobalState
{
    const(char)* xmlParserVersion;

    xmlSAXLocator xmlDefaultSAXLocator;
    xmlSAXHandlerV1 xmlDefaultSAXHandler;
    xmlSAXHandlerV1 docbDefaultSAXHandler;
    xmlSAXHandlerV1 htmlDefaultSAXHandler;

    xmlFreeFunc xmlFree;
    xmlMallocFunc xmlMalloc;
    xmlStrdupFunc xmlMemStrdup;
    xmlReallocFunc xmlRealloc;

    xmlGenericErrorFunc xmlGenericError;
    xmlStructuredErrorFunc xmlStructuredError;
    void* xmlGenericErrorContext;

    int oldXMLWDcompatibility;

    xmlBufferAllocationScheme xmlBufferAllocScheme;
    int xmlDefaultBufferSize;

    int xmlSubstituteEntitiesDefaultValue;
    int xmlDoValidityCheckingDefaultValue;
    int xmlGetWarningsDefaultValue;
    int xmlKeepBlanksDefaultValue;
    int xmlLineNumbersDefaultValue;
    int xmlLoadExtDtdDefaultValue;
    int xmlParserDebugEntities;
    int xmlPedanticParserDefaultValue;

    int xmlSaveNoEmptyTags;
    int xmlIndentTreeOutput;
    const(char)* xmlTreeIndentString;

    xmlRegisterNodeFunc xmlRegisterNodeDefaultValue;
    xmlDeregisterNodeFunc xmlDeregisterNodeDefaultValue;

    xmlMallocFunc xmlMallocAtomic;
    xmlError xmlLastError;

    xmlParserInputBufferCreateFilenameFunc xmlParserInputBufferCreateFilenameValue;
    xmlOutputBufferCreateFilenameFunc xmlOutputBufferCreateFilenameValue;

    void* xmlStructuredErrorContext;
}

void xmlInitializeGlobalState(xmlGlobalStatePtr gs);

void xmlThrDefSetGenericErrorFunc(void* ctx, xmlGenericErrorFunc handler);

void xmlThrDefSetStructuredErrorFunc(void* ctx, xmlStructuredErrorFunc handler);

xmlRegisterNodeFunc xmlRegisterNodeDefault(xmlRegisterNodeFunc func);
xmlRegisterNodeFunc xmlThrDefRegisterNodeDefault(xmlRegisterNodeFunc func);
xmlDeregisterNodeFunc xmlDeregisterNodeDefault(xmlDeregisterNodeFunc func);
xmlDeregisterNodeFunc xmlThrDefDeregisterNodeDefault(xmlDeregisterNodeFunc func);

xmlOutputBufferCreateFilenameFunc xmlThrDefOutputBufferCreateFilenameDefault(
    xmlOutputBufferCreateFilenameFunc func);
xmlParserInputBufferCreateFilenameFunc xmlThrDefParserInputBufferCreateFilenameDefault(
    xmlParserInputBufferCreateFilenameFunc func);

/** DOC_DISABLE */
/*
 * In general the memory allocation entry points are not kept
 * thread specific but this can be overridden by LIBXML_THREAD_ALLOC_ENABLED
 *    - xmlMalloc
 *    - xmlMallocAtomic
 *    - xmlRealloc
 *    - xmlMemStrdup
 *    - xmlFree
 */

/* !LIBXML_THREAD_ALLOC_ENABLED */
extern __gshared xmlMallocFunc xmlMalloc;
extern __gshared xmlMallocFunc xmlMallocAtomic;
extern __gshared xmlReallocFunc xmlRealloc;
extern __gshared xmlFreeFunc xmlFree;
extern __gshared xmlStrdupFunc xmlMemStrdup;
/* LIBXML_THREAD_ALLOC_ENABLED */

xmlError* __xmlLastError();

/*
 * Everything starting from the line below is
 * Automatically generated by build_glob.py.
 * Do not modify the previous line.
 */

int* __oldXMLWDcompatibility();

xmlBufferAllocationScheme* __xmlBufferAllocScheme();

xmlBufferAllocationScheme xmlThrDefBufferAllocScheme(
    xmlBufferAllocationScheme v);

int* __xmlDefaultBufferSize();

int xmlThrDefDefaultBufferSize(int v);

xmlSAXHandlerV1* __xmlDefaultSAXHandler();

xmlSAXLocator* __xmlDefaultSAXLocator();

int* __xmlDoValidityCheckingDefaultValue();

int xmlThrDefDoValidityCheckingDefaultValue(int v);

xmlGenericErrorFunc* __xmlGenericError();

xmlStructuredErrorFunc* __xmlStructuredError();

void** __xmlGenericErrorContext();

void** __xmlStructuredErrorContext();

int* __xmlGetWarningsDefaultValue();

int xmlThrDefGetWarningsDefaultValue(int v);

int* __xmlIndentTreeOutput();

int xmlThrDefIndentTreeOutput(int v);

const(char*)* __xmlTreeIndentString();

const(char)* xmlThrDefTreeIndentString(const(char)* v);

int* __xmlKeepBlanksDefaultValue();

int xmlThrDefKeepBlanksDefaultValue(int v);

int* __xmlLineNumbersDefaultValue();

int xmlThrDefLineNumbersDefaultValue(int v);

int* __xmlLoadExtDtdDefaultValue();

int xmlThrDefLoadExtDtdDefaultValue(int v);

int* __xmlParserDebugEntities();

int xmlThrDefParserDebugEntities(int v);

const(char*)* __xmlParserVersion();

int* __xmlPedanticParserDefaultValue();

int xmlThrDefPedanticParserDefaultValue(int v);

int* __xmlSaveNoEmptyTags();

int xmlThrDefSaveNoEmptyTags(int v);

int* __xmlSubstituteEntitiesDefaultValue();

int xmlThrDefSubstituteEntitiesDefaultValue(int v);

xmlRegisterNodeFunc* __xmlRegisterNodeDefaultValue();

xmlDeregisterNodeFunc* __xmlDeregisterNodeDefaultValue();

xmlParserInputBufferCreateFilenameFunc* __xmlParserInputBufferCreateFilenameValue();

xmlOutputBufferCreateFilenameFunc* __xmlOutputBufferCreateFilenameValue();

/* __XML_GLOBALS_H */
