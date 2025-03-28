//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Kvant/Tunnel/Line" {
Properties {
_PositionBuffer ("-", 2D) = "black" { }
_Color ("-", Color) = (1,1,1,0.5)
}
SubShader {
 Tags { "QUEUE" = "Geometry+1" }
 Pass {
  Tags { "QUEUE" = "Geometry+1" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 25812
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 _BufferOffset;
uniform  sampler2D _PositionBuffer;
in  vec4 in_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy + _BufferOffset.xy;
    u_xlat0 = textureLod(_PositionBuffer, u_xlat0.xy, 0.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Color;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = _Color;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 110
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %94 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpDecorate %18 ArrayStride 18 
                                                     OpMemberDecorate %19 0 Offset 19 
                                                     OpMemberDecorate %19 1 Offset 19 
                                                     OpMemberDecorate %19 2 Offset 19 
                                                     OpDecorate %19 Block 
                                                     OpDecorate %21 DescriptorSet 21 
                                                     OpDecorate %21 Binding 21 
                                                     OpDecorate %33 RelaxedPrecision 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %34 RelaxedPrecision 
                                                     OpDecorate %40 RelaxedPrecision 
                                                     OpMemberDecorate %92 0 BuiltIn 92 
                                                     OpMemberDecorate %92 1 BuiltIn 92 
                                                     OpMemberDecorate %92 2 BuiltIn 92 
                                                     OpDecorate %92 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %12 = OpTypeVector %6 2 
                                             %15 = OpTypeInt 32 0 
                                         u32 %16 = OpConstant 4 
                                             %17 = OpTypeArray %7 %16 
                                             %18 = OpTypeArray %7 %16 
                                             %19 = OpTypeStruct %17 %18 %12 
                                             %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %21 = OpVariable Uniform 
                                             %22 = OpTypeInt 32 1 
                                         i32 %23 = OpConstant 2 
                                             %24 = OpTypePointer Uniform %12 
                                             %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %31 = OpTypeSampledImage %30 
                                             %32 = OpTypePointer UniformConstant %31 
 UniformConstant read_only Texture2DSampled* %33 = OpVariable UniformConstant 
                                         f32 %37 = OpConstant 3.67402E-40 
                                             %39 = OpTypeVector %6 3 
                              Private f32_4* %43 = OpVariable Private 
                                         i32 %46 = OpConstant 0 
                                         i32 %47 = OpConstant 1 
                                             %48 = OpTypePointer Uniform %7 
                                         i32 %67 = OpConstant 3 
                                         u32 %90 = OpConstant 1 
                                             %91 = OpTypeArray %6 %90 
                                             %92 = OpTypeStruct %7 %6 %91 
                                             %93 = OpTypePointer Output %92 
        Output struct {f32_4; f32; f32[1];}* %94 = OpVariable Output 
                                            %102 = OpTypePointer Output %7 
                                            %104 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %13 = OpLoad %11 
                                       f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                              Uniform f32_2* %25 = OpAccessChain %21 %23 
                                       f32_2 %26 = OpLoad %25 
                                       f32_2 %27 = OpFAdd %14 %26 
                                       f32_4 %28 = OpLoad %9 
                                       f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                     OpStore %9 %29 
                  read_only Texture2DSampled %34 = OpLoad %33 
                                       f32_4 %35 = OpLoad %9 
                                       f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                       f32_4 %38 = OpImageSampleExplicitLod %34 %36 Lod %7 
                                       f32_3 %40 = OpVectorShuffle %38 %38 0 1 2 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                     OpStore %9 %42 
                                       f32_4 %44 = OpLoad %9 
                                       f32_4 %45 = OpVectorShuffle %44 %44 1 1 1 1 
                              Uniform f32_4* %49 = OpAccessChain %21 %46 %47 
                                       f32_4 %50 = OpLoad %49 
                                       f32_4 %51 = OpFMul %45 %50 
                                                     OpStore %43 %51 
                              Uniform f32_4* %52 = OpAccessChain %21 %46 %46 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpLoad %9 
                                       f32_4 %55 = OpVectorShuffle %54 %54 0 0 0 0 
                                       f32_4 %56 = OpFMul %53 %55 
                                       f32_4 %57 = OpLoad %43 
                                       f32_4 %58 = OpFAdd %56 %57 
                                                     OpStore %43 %58 
                              Uniform f32_4* %59 = OpAccessChain %21 %46 %23 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpLoad %9 
                                       f32_4 %62 = OpVectorShuffle %61 %61 2 2 2 2 
                                       f32_4 %63 = OpFMul %60 %62 
                                       f32_4 %64 = OpLoad %43 
                                       f32_4 %65 = OpFAdd %63 %64 
                                                     OpStore %9 %65 
                                       f32_4 %66 = OpLoad %9 
                              Uniform f32_4* %68 = OpAccessChain %21 %46 %67 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpFAdd %66 %69 
                                                     OpStore %9 %70 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 1 1 1 1 
                              Uniform f32_4* %73 = OpAccessChain %21 %47 %47 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpFMul %72 %74 
                                                     OpStore %43 %75 
                              Uniform f32_4* %76 = OpAccessChain %21 %47 %46 
                                       f32_4 %77 = OpLoad %76 
                                       f32_4 %78 = OpLoad %9 
                                       f32_4 %79 = OpVectorShuffle %78 %78 0 0 0 0 
                                       f32_4 %80 = OpFMul %77 %79 
                                       f32_4 %81 = OpLoad %43 
                                       f32_4 %82 = OpFAdd %80 %81 
                                                     OpStore %43 %82 
                              Uniform f32_4* %83 = OpAccessChain %21 %47 %23 
                                       f32_4 %84 = OpLoad %83 
                                       f32_4 %85 = OpLoad %9 
                                       f32_4 %86 = OpVectorShuffle %85 %85 2 2 2 2 
                                       f32_4 %87 = OpFMul %84 %86 
                                       f32_4 %88 = OpLoad %43 
                                       f32_4 %89 = OpFAdd %87 %88 
                                                     OpStore %43 %89 
                              Uniform f32_4* %95 = OpAccessChain %21 %47 %67 
                                       f32_4 %96 = OpLoad %95 
                                       f32_4 %97 = OpLoad %9 
                                       f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                       f32_4 %99 = OpFMul %96 %98 
                                      f32_4 %100 = OpLoad %43 
                                      f32_4 %101 = OpFAdd %99 %100 
                              Output f32_4* %103 = OpAccessChain %94 %46 
                                                     OpStore %103 %101 
                                Output f32* %105 = OpAccessChain %94 %46 %90 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpFNegate %106 
                                Output f32* %108 = OpAccessChain %94 %46 %90 
                                                     OpStore %108 %107 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 19
; Schema: 0
                                 OpCapability Shader 
                          %1 = OpExtInstImport "GLSL.std.450" 
                                 OpMemoryModel Logical GLSL450 
                                 OpEntryPoint Fragment %4 "main" %9 
                                 OpExecutionMode %4 OriginUpperLeft 
                                 OpDecorate %9 RelaxedPrecision 
                                 OpDecorate %9 Location 9 
                                 OpMemberDecorate %10 0 RelaxedPrecision 
                                 OpMemberDecorate %10 0 Offset 10 
                                 OpDecorate %10 Block 
                                 OpDecorate %12 DescriptorSet 12 
                                 OpDecorate %12 Binding 12 
                                 OpDecorate %17 RelaxedPrecision 
                          %2 = OpTypeVoid 
                          %3 = OpTypeFunction %2 
                          %6 = OpTypeFloat 32 
                          %7 = OpTypeVector %6 4 
                          %8 = OpTypePointer Output %7 
            Output f32_4* %9 = OpVariable Output 
                         %10 = OpTypeStruct %7 
                         %11 = OpTypePointer Uniform %10 
Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                         %13 = OpTypeInt 32 1 
                     i32 %14 = OpConstant 0 
                         %15 = OpTypePointer Uniform %7 
                     void %4 = OpFunction None %3 
                          %5 = OpLabel 
          Uniform f32_4* %16 = OpAccessChain %12 %14 
                   f32_4 %17 = OpLoad %16 
                                 OpStore %9 %17 
                                 OpReturn
                                 OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}