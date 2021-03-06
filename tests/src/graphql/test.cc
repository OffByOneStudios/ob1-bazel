#include "Ast.h"
#include "GraphQLParser.h"
#include "AstVisitor.h"
#include "JsonVisitor.h"
#include <string.h>
#include <iostream>
//#include "spdlog/spdlog.h"


const char* schema = R"GQL(
# Copyright (c) 2015, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

schema {
  query: QueryType
  mutation: MutationType
}

type Foo implements Bar {
  one: Type
  two(argument: InputType!): Type
  three(argument: InputType, other: String): Int
  four(argument: String = "string"): String
  five(argument: [String] = ["string", "string"]): String
  six(argument: InputType = {key: "value"}): Type
  seven(argument: Int = null): Type
}

type AnnotatedObject @onObject(arg: "value") {
  annotatedField(arg: Type = "default" @onArg): Type @onField
}

interface Bar {
  one: Type
  four(argument: String = "string"): String
}

interface AnnotatedInterface @onInterface {
  annotatedField(arg: Type @onArg): Type @onField
}

union Feed = Story | Article | Advert

union AnnotatedUnion @onUnion = A | B

scalar CustomScalar

scalar AnnotatedScalar @onScalar

enum Site {
  DESKTOP
  MOBILE
}

enum AnnotatedEnum @onEnum {
  ANNOTATED_VALUE @onEnumValue
  OTHER_VALUE
}

input InputType {
  key: String!
  answer: Int = 42
}

input AnnotatedInput @onInputObjectType {
  annotatedField: Type @onField
}

extend type Foo {
  seven(argument: [String]): Type
}

# NOTE: out-of-spec test cases commented out until the spec is clarified; see
# https://github.com/graphql/graphql-js/issues/650 .
# extend type Foo @onType {}

#type NoFields {}

directive @skip(if: Boolean!) on FIELD | FRAGMENT_SPREAD | INLINE_FRAGMENT

directive @include(if: Boolean!)
  on FIELD
   | FRAGMENT_SPREAD
   | INLINE_FRAGMENT


)GQL";

const char* badSchema = R"GQL(
typfe Schema {
    Foo
}

)GQL";

int main(int argc, char** argv)
{	
    const char* errorString = 0;
    auto node = facebook::graphql::parseStringWithExperimentalSchemaSupport(schema, &errorString);
    
    facebook::graphql::ast::visitor::JsonVisitor v;

    node->accept(&v);

    //std::cout << v.getResult();

    errorString = 0;
    auto badNode = facebook::graphql::parseStringWithExperimentalSchemaSupport(badSchema, &errorString);
    if(!errorString) {
        std::cout << "Failed to Detect Bad Parse";
        return -1;
    }
    else {
        std::cout << errorString;
    }
    

    
    return 0;
}