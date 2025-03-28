//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/PartialDesaturationEffect" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_WorldCenter ("World Center", Vector) = (0,0,0,0)
_Radius ("Radius", Float) = 5
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 14082
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy * vec2(1.0, -1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * unity_OrthoParams.xy;
    vs_TEXCOORD1.z = 0.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldCenter;
uniform 	float _Radius;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb2;
float u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + _WorldSpaceCameraPos.xy;
    u_xlat0.xy = u_xlat0.xy + (-_WorldCenter.xy);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb2 = u_xlat0.x<_Radius;
    u_xlat4 = _Radius + 0.125;
    u_xlatb0 = u_xlat0.x<u_xlat4;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(1.0, 1.0, 1.0) : u_xlat10_1.xyz;
    u_xlat1 = dot(u_xlat10_1.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
    SV_Target0.w = u_xlat10_1.w;
    SV_Target0.xyz = (bool(u_xlatb2)) ? vec3(u_xlat1) : u_xlat0.xzw;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 117
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %99 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate %99 Location 99 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                                Output f32_2* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypePointer Private %13 
                              Private f32_4* %15 = OpVariable Private 
                                             %16 = OpTypePointer Input %13 
                                Input f32_4* %17 = OpVariable Input 
                                             %20 = OpTypeInt 32 0 
                                         u32 %21 = OpConstant 4 
                                             %22 = OpTypeArray %13 %21 
                                             %23 = OpTypeArray %13 %21 
                                             %24 = OpTypeStruct %13 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %13 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %13 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %13 
                                         f32 %91 = OpConstant 3.67402E-40 
                                         f32 %92 = OpConstant 3.67402E-40 
                                       f32_2 %93 = OpConstantComposite %91 %92 
                                             %97 = OpTypeVector %6 3 
                                             %98 = OpTypePointer Output %97 
                               Output f32_3* %99 = OpVariable Output 
                                        f32 %108 = OpConstant 3.67402E-40 
                                        u32 %109 = OpConstant 2 
                                            %110 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpLoad %17 
                                       f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                       f32_4 %38 = OpFMul %35 %37 
                                       f32_4 %39 = OpLoad %15 
                                       f32_4 %40 = OpFAdd %38 %39 
                                                     OpStore %15 %40 
                              Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                       f32_4 %43 = OpLoad %42 
                                       f32_4 %44 = OpLoad %17 
                                       f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                       f32_4 %46 = OpFMul %43 %45 
                                       f32_4 %47 = OpLoad %15 
                                       f32_4 %48 = OpFAdd %46 %47 
                                                     OpStore %15 %48 
                                       f32_4 %49 = OpLoad %15 
                              Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFAdd %49 %52 
                                                     OpStore %15 %53 
                                       f32_4 %55 = OpLoad %15 
                                       f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                       f32_4 %89 = OpLoad %15 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                                       f32_4 %95 = OpLoad %15 
                                       f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
                                                     OpStore %15 %96 
                                      f32_4 %100 = OpLoad %15 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                             Uniform f32_4* %102 = OpAccessChain %26 %33 
                                      f32_4 %103 = OpLoad %102 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_2 %105 = OpFMul %101 %104 
                                      f32_3 %106 = OpLoad %99 
                                      f32_3 %107 = OpVectorShuffle %106 %105 3 4 2 
                                                     OpStore %99 %107 
                                Output f32* %111 = OpAccessChain %99 %109 
                                                     OpStore %111 %108 
                                Output f32* %112 = OpAccessChain %85 %33 %81 
                                        f32 %113 = OpLoad %112 
                                        f32 %114 = OpFNegate %113 
                                Output f32* %115 = OpAccessChain %85 %33 %81 
                                                     OpStore %115 %114 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 117
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %73 %98 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 Location 12 
                                                    OpMemberDecorate %16 0 Offset 16 
                                                    OpMemberDecorate %16 1 Offset 16 
                                                    OpMemberDecorate %16 2 Offset 16 
                                                    OpDecorate %16 Block 
                                                    OpDecorate %18 DescriptorSet 18 
                                                    OpDecorate %18 Binding 18 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %70 DescriptorSet 70 
                                                    OpDecorate %70 Binding 70 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 Location 73 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %98 Location 98 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 3 
                                            %11 = OpTypePointer Input %10 
                               Input f32_3* %12 = OpVariable Input 
                                            %15 = OpTypeVector %6 4 
                                            %16 = OpTypeStruct %10 %15 %6 
                                            %17 = OpTypePointer Uniform %16 
       Uniform struct {f32_3; f32_4; f32;}* %18 = OpVariable Uniform 
                                            %19 = OpTypeInt 32 1 
                                        i32 %20 = OpConstant 0 
                                            %21 = OpTypePointer Uniform %10 
                                        i32 %27 = OpConstant 1 
                                            %28 = OpTypePointer Uniform %15 
                                            %37 = OpTypeInt 32 0 
                                        u32 %38 = OpConstant 0 
                                            %39 = OpTypePointer Private %6 
                                            %45 = OpTypeBool 
                                            %46 = OpTypePointer Private %45 
                              Private bool* %47 = OpVariable Private 
                                        i32 %50 = OpConstant 2 
                                            %51 = OpTypePointer Uniform %6 
                               Private f32* %55 = OpVariable Private 
                                        f32 %58 = OpConstant 3.67402E-40 
                              Private bool* %60 = OpVariable Private 
                                            %65 = OpTypePointer Private %15 
                             Private f32_4* %66 = OpVariable Private 
                                            %67 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %68 = OpTypeSampledImage %67 
                                            %69 = OpTypePointer UniformConstant %68 
UniformConstant read_only Texture2DSampled* %70 = OpVariable UniformConstant 
                                            %72 = OpTypePointer Input %7 
                               Input f32_2* %73 = OpVariable Input 
                                            %76 = OpTypePointer Private %10 
                             Private f32_3* %77 = OpVariable Private 
                                            %78 = OpTypePointer Function %10 
                                        f32 %83 = OpConstant 3.67402E-40 
                                      f32_3 %84 = OpConstantComposite %83 %83 %83 
                                        f32 %91 = OpConstant 3.67402E-40 
                                        f32 %92 = OpConstant 3.67402E-40 
                                        f32 %93 = OpConstant 3.67402E-40 
                                      f32_3 %94 = OpConstantComposite %91 %92 %93 
                                            %97 = OpTypePointer Output %15 
                              Output f32_4* %98 = OpVariable Output 
                                        u32 %99 = OpConstant 3 
                                           %102 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %79 = OpVariable Function 
                           Function f32_3* %104 = OpVariable Function 
                                      f32_3 %13 = OpLoad %12 
                                      f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                             Uniform f32_3* %22 = OpAccessChain %18 %20 
                                      f32_3 %23 = OpLoad %22 
                                      f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                                      f32_2 %25 = OpFAdd %14 %24 
                                                    OpStore %9 %25 
                                      f32_2 %26 = OpLoad %9 
                             Uniform f32_4* %29 = OpAccessChain %18 %27 
                                      f32_4 %30 = OpLoad %29 
                                      f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                      f32_2 %32 = OpFNegate %31 
                                      f32_2 %33 = OpFAdd %26 %32 
                                                    OpStore %9 %33 
                                      f32_2 %34 = OpLoad %9 
                                      f32_2 %35 = OpLoad %9 
                                        f32 %36 = OpDot %34 %35 
                               Private f32* %40 = OpAccessChain %9 %38 
                                                    OpStore %40 %36 
                               Private f32* %41 = OpAccessChain %9 %38 
                                        f32 %42 = OpLoad %41 
                                        f32 %43 = OpExtInst %1 31 %42 
                               Private f32* %44 = OpAccessChain %9 %38 
                                                    OpStore %44 %43 
                               Private f32* %48 = OpAccessChain %9 %38 
                                        f32 %49 = OpLoad %48 
                               Uniform f32* %52 = OpAccessChain %18 %50 
                                        f32 %53 = OpLoad %52 
                                       bool %54 = OpFOrdLessThan %49 %53 
                                                    OpStore %47 %54 
                               Uniform f32* %56 = OpAccessChain %18 %50 
                                        f32 %57 = OpLoad %56 
                                        f32 %59 = OpFAdd %57 %58 
                                                    OpStore %55 %59 
                               Private f32* %61 = OpAccessChain %9 %38 
                                        f32 %62 = OpLoad %61 
                                        f32 %63 = OpLoad %55 
                                       bool %64 = OpFOrdLessThan %62 %63 
                                                    OpStore %60 %64 
                 read_only Texture2DSampled %71 = OpLoad %70 
                                      f32_2 %74 = OpLoad %73 
                                      f32_4 %75 = OpImageSampleImplicitLod %71 %74 
                                                    OpStore %66 %75 
                                       bool %80 = OpLoad %60 
                                                    OpSelectionMerge %82 None 
                                                    OpBranchConditional %80 %81 %85 
                                            %81 = OpLabel 
                                                    OpStore %79 %84 
                                                    OpBranch %82 
                                            %85 = OpLabel 
                                      f32_4 %86 = OpLoad %66 
                                      f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                                    OpStore %79 %87 
                                                    OpBranch %82 
                                            %82 = OpLabel 
                                      f32_3 %88 = OpLoad %79 
                                                    OpStore %77 %88 
                                      f32_4 %89 = OpLoad %66 
                                      f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32 %95 = OpDot %90 %94 
                               Private f32* %96 = OpAccessChain %9 %38 
                                                    OpStore %96 %95 
                              Private f32* %100 = OpAccessChain %66 %99 
                                       f32 %101 = OpLoad %100 
                               Output f32* %103 = OpAccessChain %98 %99 
                                                    OpStore %103 %101 
                                      bool %105 = OpLoad %47 
                                                    OpSelectionMerge %107 None 
                                                    OpBranchConditional %105 %106 %110 
                                           %106 = OpLabel 
                                     f32_2 %108 = OpLoad %9 
                                     f32_3 %109 = OpVectorShuffle %108 %108 0 0 0 
                                                    OpStore %104 %109 
                                                    OpBranch %107 
                                           %110 = OpLabel 
                                     f32_3 %111 = OpLoad %77 
                                                    OpStore %104 %111 
                                                    OpBranch %107 
                                           %107 = OpLabel 
                                     f32_3 %112 = OpLoad %104 
                                                    OpStore %77 %112 
                                     f32_3 %113 = OpLoad %77 
                                     f32_4 %114 = OpLoad %98 
                                     f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                    OpStore %98 %115 
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