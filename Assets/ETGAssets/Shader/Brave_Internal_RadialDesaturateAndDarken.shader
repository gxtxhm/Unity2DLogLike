//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/RadialDesaturateAndDarken" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_WaveCenter ("Wave Center", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  GpuProgramID 60682
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WaveCenter;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_WaveCenter.xy);
    u_xlat0.zw = u_xlat0.xx * vec2(1.77777779, 1.77777779);
    u_xlat0.x = dot(u_xlat0.yz, u_xlat0.yw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _WaveCenter.z;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * (-_WaveCenter.w) + _WaveCenter.w;
    u_xlat3.x = u_xlat0.x * -0.5 + 1.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat3.xxx * u_xlat10_1.xyz;
    u_xlat6 = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat3.xyz = (-u_xlat10_1.xyz) * u_xlat3.xxx + vec3(u_xlat6);
    SV_Target0.w = u_xlat10_1.w;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %117 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 Location 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpMemberDecorate %14 0 Offset 14 
                                                    OpDecorate %14 Block 
                                                    OpDecorate %16 DescriptorSet 16 
                                                    OpDecorate %16 Binding 16 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %90 DescriptorSet 90 
                                                    OpDecorate %90 Binding 90 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %117 Location 117 
                                                    OpDecorate %119 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                               Input f32_2* %12 = OpVariable Input 
                                            %14 = OpTypeStruct %7 
                                            %15 = OpTypePointer Uniform %14 
                   Uniform struct {f32_4;}* %16 = OpVariable Uniform 
                                            %17 = OpTypeInt 32 1 
                                        i32 %18 = OpConstant 0 
                                            %19 = OpTypePointer Uniform %7 
                                        f32 %29 = OpConstant 3.67402E-40 
                                      f32_2 %30 = OpConstantComposite %29 %29 
                                            %39 = OpTypeInt 32 0 
                                        u32 %40 = OpConstant 0 
                                            %41 = OpTypePointer Private %6 
                                        u32 %50 = OpConstant 2 
                                            %51 = OpTypePointer Uniform %6 
                                        f32 %58 = OpConstant 3.67402E-40 
                                        f32 %63 = OpConstant 3.67402E-40 
                                        u32 %68 = OpConstant 3 
                                            %77 = OpTypeVector %6 3 
                                            %78 = OpTypePointer Private %77 
                             Private f32_3* %79 = OpVariable Private 
                                        f32 %82 = OpConstant 3.67402E-40 
                             Private f32_4* %86 = OpVariable Private 
                                            %87 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %88 = OpTypeSampledImage %87 
                                            %89 = OpTypePointer UniformConstant %88 
UniformConstant read_only Texture2DSampled* %90 = OpVariable UniformConstant 
                             Private f32_3* %94 = OpVariable Private 
                              Private f32* %100 = OpVariable Private 
                                       f32 %102 = OpConstant 3.67402E-40 
                                       f32 %103 = OpConstant 3.67402E-40 
                                       f32 %104 = OpConstant 3.67402E-40 
                                     f32_3 %105 = OpConstantComposite %102 %103 %104 
                                           %116 = OpTypePointer Output %7 
                             Output f32_4* %117 = OpVariable Output 
                                           %120 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad %12 
                             Uniform f32_4* %20 = OpAccessChain %16 %18 
                                      f32_4 %21 = OpLoad %20 
                                      f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                      f32_2 %23 = OpFNegate %22 
                                      f32_2 %24 = OpFAdd %13 %23 
                                      f32_4 %25 = OpLoad %9 
                                      f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                                    OpStore %9 %26 
                                      f32_4 %27 = OpLoad %9 
                                      f32_2 %28 = OpVectorShuffle %27 %27 0 0 
                                      f32_2 %31 = OpFMul %28 %30 
                                      f32_4 %32 = OpLoad %9 
                                      f32_4 %33 = OpVectorShuffle %32 %31 0 1 4 5 
                                                    OpStore %9 %33 
                                      f32_4 %34 = OpLoad %9 
                                      f32_2 %35 = OpVectorShuffle %34 %34 1 2 
                                      f32_4 %36 = OpLoad %9 
                                      f32_2 %37 = OpVectorShuffle %36 %36 1 3 
                                        f32 %38 = OpDot %35 %37 
                               Private f32* %42 = OpAccessChain %9 %40 
                                                    OpStore %42 %38 
                               Private f32* %43 = OpAccessChain %9 %40 
                                        f32 %44 = OpLoad %43 
                                        f32 %45 = OpExtInst %1 31 %44 
                               Private f32* %46 = OpAccessChain %9 %40 
                                                    OpStore %46 %45 
                               Private f32* %47 = OpAccessChain %9 %40 
                                        f32 %48 = OpLoad %47 
                                        f32 %49 = OpFNegate %48 
                               Uniform f32* %52 = OpAccessChain %16 %18 %50 
                                        f32 %53 = OpLoad %52 
                                        f32 %54 = OpFAdd %49 %53 
                               Private f32* %55 = OpAccessChain %9 %40 
                                                    OpStore %55 %54 
                               Private f32* %56 = OpAccessChain %9 %40 
                                        f32 %57 = OpLoad %56 
                                        f32 %59 = OpFMul %57 %58 
                               Private f32* %60 = OpAccessChain %9 %40 
                                                    OpStore %60 %59 
                               Private f32* %61 = OpAccessChain %9 %40 
                                        f32 %62 = OpLoad %61 
                                        f32 %64 = OpExtInst %1 37 %62 %63 
                               Private f32* %65 = OpAccessChain %9 %40 
                                                    OpStore %65 %64 
                               Private f32* %66 = OpAccessChain %9 %40 
                                        f32 %67 = OpLoad %66 
                               Uniform f32* %69 = OpAccessChain %16 %18 %68 
                                        f32 %70 = OpLoad %69 
                                        f32 %71 = OpFNegate %70 
                                        f32 %72 = OpFMul %67 %71 
                               Uniform f32* %73 = OpAccessChain %16 %18 %68 
                                        f32 %74 = OpLoad %73 
                                        f32 %75 = OpFAdd %72 %74 
                               Private f32* %76 = OpAccessChain %9 %40 
                                                    OpStore %76 %75 
                               Private f32* %80 = OpAccessChain %9 %40 
                                        f32 %81 = OpLoad %80 
                                        f32 %83 = OpFMul %81 %82 
                                        f32 %84 = OpFAdd %83 %63 
                               Private f32* %85 = OpAccessChain %79 %40 
                                                    OpStore %85 %84 
                 read_only Texture2DSampled %91 = OpLoad %90 
                                      f32_2 %92 = OpLoad %12 
                                      f32_4 %93 = OpImageSampleImplicitLod %91 %92 
                                                    OpStore %86 %93 
                                      f32_3 %95 = OpLoad %79 
                                      f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                      f32_4 %97 = OpLoad %86 
                                      f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                      f32_3 %99 = OpFMul %96 %98 
                                                    OpStore %94 %99 
                                     f32_3 %101 = OpLoad %94 
                                       f32 %106 = OpDot %101 %105 
                                                    OpStore %100 %106 
                                     f32_4 %107 = OpLoad %86 
                                     f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                     f32_3 %109 = OpFNegate %108 
                                     f32_3 %110 = OpLoad %79 
                                     f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                     f32_3 %112 = OpFMul %109 %111 
                                       f32 %113 = OpLoad %100 
                                     f32_3 %114 = OpCompositeConstruct %113 %113 %113 
                                     f32_3 %115 = OpFAdd %112 %114 
                                                    OpStore %79 %115 
                              Private f32* %118 = OpAccessChain %86 %68 
                                       f32 %119 = OpLoad %118 
                               Output f32* %121 = OpAccessChain %117 %68 
                                                    OpStore %121 %119 
                                     f32_4 %122 = OpLoad %9 
                                     f32_3 %123 = OpVectorShuffle %122 %122 0 0 0 
                                     f32_3 %124 = OpLoad %79 
                                     f32_3 %125 = OpFMul %123 %124 
                                     f32_3 %126 = OpLoad %94 
                                     f32_3 %127 = OpFAdd %125 %126 
                                     f32_4 %128 = OpLoad %117 
                                     f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                    OpStore %117 %129 
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