/*
 * This file is part of Bit Slicer.
 *
 * Bit Slicer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 
 * Bit Slicer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 
 * You should have received a copy of the GNU General Public License
 * along with Bit Slicer.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * Created by Mayur Pawashe on 8/18/10.
 * Copyright 2010 zgcoder. All rights reserved.
 */

#import "ZGVariable.h"
#import "ZGVirtualMemory.h"

@class ZGSearchData;

typedef enum
{
	// Regular comparisons
	ZGEquals = 0,
	ZGNotEquals,
	ZGGreaterThan,
	ZGLessThan,
	// Stored comparisons
	ZGEqualsStored,
	ZGNotEqualsStored,
	ZGGreaterThanStored,
	ZGLessThanStored,
	// Special Stored comparisons
	ZGEqualsStoredPlus,
	ZGNotEqualsStoredPlus,
} ZGFunctionType;

extern inline BOOL lessThanFunction(ZGSearchData * __unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
extern inline BOOL greaterThanFunction(ZGSearchData * __unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
extern inline BOOL equalFunction(ZGSearchData *__unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
extern inline BOOL notEqualFunction(ZGSearchData *__unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
extern inline BOOL equalPlusFunction(ZGSearchData *__unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
extern inline BOOL notEqualPlusFunction(ZGSearchData *__unsafe_unretained searchData, const void *variableValue, const void *compareValue, ZGVariableType type, ZGMemorySize size);
