//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Enemy Projectile Emissive" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
_EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
_BlackBullet ("Black Bulletness", Float) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 16957
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _BlackBullet;
uniform 	float _LowQualityMode;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
bool u_xlatb9;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1 = u_xlat1.x>=0.899999976;
    u_xlat4.xyz = vec3(_BlackBullet) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vec3(3.0, 0.0, 0.0);
    u_xlatb10 = 0.5<_BlackBullet;
    u_xlat0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlatb9 = u_xlat0.x==0.0;
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower));
    u_xlat1.xyz = vec3(_BlackBullet) * (-u_xlat1.xyz) + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower));
    u_xlat2.xyz = vec3(_BlackBullet) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vec3(vec3(_LowQualityMode, _LowQualityMode, _LowQualityMode)) * (-u_xlat1.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 113
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %94 %100 %101 %103 %105 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate %94 Location 94 
                                              OpDecorate %100 RelaxedPrecision 
                                              OpDecorate %100 Location 100 
                                              OpDecorate %101 Location 101 
                                              OpDecorate %103 Location 103 
                                              OpDecorate %105 Location 105 
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
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
                                      %83 = OpTypeVector %6 3 
                                  f32 %86 = OpConstant 3.67402E-40 
                                  f32 %87 = OpConstant 3.67402E-40 
                                f32_3 %88 = OpConstantComposite %86 %86 %87 
                                      %92 = OpTypeVector %6 2 
                                      %93 = OpTypePointer Output %92 
                        Output f32_2* %94 = OpVariable Output 
                       Output f32_4* %100 = OpVariable Output 
                        Input f32_4* %101 = OpVariable Input 
                       Output f32_2* %103 = OpVariable Output 
                                     %104 = OpTypePointer Input %92 
                        Input f32_2* %105 = OpVariable Input 
                                     %107 = OpTypePointer Output %6 
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
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %84 = OpLoad %9 
                                f32_3 %85 = OpVectorShuffle %84 %84 0 3 1 
                                f32_3 %89 = OpFMul %85 %88 
                                f32_4 %90 = OpLoad %9 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 6 3 
                                              OpStore %9 %91 
                                f32_4 %95 = OpLoad %9 
                                f32_2 %96 = OpVectorShuffle %95 %95 1 1 
                                f32_4 %97 = OpLoad %9 
                                f32_2 %98 = OpVectorShuffle %97 %97 0 2 
                                f32_2 %99 = OpFAdd %96 %98 
                                              OpStore %94 %99 
                               f32_4 %102 = OpLoad %101 
                                              OpStore %100 %102 
                               f32_2 %106 = OpLoad %105 
                                              OpStore %103 %106 
                         Output f32* %108 = OpAccessChain %79 %22 %75 
                                 f32 %109 = OpLoad %108 
                                 f32 %110 = OpFNegate %109 
                         Output f32* %111 = OpAccessChain %79 %22 %75 
                                              OpStore %111 %110 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 210
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %29 %207 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpMemberDecorate %73 0 Offset 73 
                                                    OpMemberDecorate %73 1 Offset 73 
                                                    OpMemberDecorate %73 2 Offset 73 
                                                    OpMemberDecorate %73 3 Offset 73 
                                                    OpDecorate %73 Block 
                                                    OpDecorate %75 DescriptorSet 75 
                                                    OpDecorate %75 Binding 75 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %112 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %124 RelaxedPrecision 
                                                    OpDecorate %125 RelaxedPrecision 
                                                    OpDecorate %126 RelaxedPrecision 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %128 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %201 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %207 Location 207 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %11 = OpTypeSampledImage %10 
                                            %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                            %15 = OpTypeVector %6 2 
                                            %16 = OpTypePointer Input %15 
                               Input f32_2* %17 = OpVariable Input 
                                            %20 = OpTypeVector %6 3 
                                            %21 = OpTypePointer Private %20 
                             Private f32_3* %22 = OpVariable Private 
                                            %23 = OpTypeInt 32 0 
                                        u32 %24 = OpConstant 3 
                                            %25 = OpTypePointer Private %6 
                                            %28 = OpTypePointer Input %7 
                               Input f32_4* %29 = OpVariable Input 
                                            %30 = OpTypePointer Input %6 
                                        f32 %34 = OpConstant 3.67402E-40 
                                        u32 %36 = OpConstant 0 
                             Private f32_4* %38 = OpVariable Private 
                                            %42 = OpTypeBool 
                                            %43 = OpTypePointer Private %42 
                              Private bool* %44 = OpVariable Private 
                                        f32 %47 = OpConstant 3.67402E-40 
                                            %50 = OpTypeInt 32 1 
                                        i32 %51 = OpConstant 0 
                                        i32 %52 = OpConstant 1 
                                        i32 %54 = OpConstant -1 
                                        f32 %62 = OpConstant 3.67402E-40 
                                        f32 %63 = OpConstant 3.67402E-40 
                                        f32 %64 = OpConstant 3.67402E-40 
                                      f32_3 %65 = OpConstantComposite %62 %63 %64 
                                        f32 %70 = OpConstant 3.67402E-40 
                             Private f32_3* %72 = OpVariable Private 
                                            %73 = OpTypeStruct %6 %6 %6 %6 
                                            %74 = OpTypePointer Uniform %73 
      Uniform struct {f32; f32; f32; f32;}* %75 = OpVariable Uniform 
                                        i32 %76 = OpConstant 2 
                                            %77 = OpTypePointer Uniform %6 
                                            %88 = OpTypePointer Function %20 
                                        f32 %95 = OpConstant 3.67402E-40 
                                      f32_3 %96 = OpConstantComposite %95 %47 %47 
                                        f32 %98 = OpConstant 3.67402E-40 
                            Private f32_3* %114 = OpVariable Private 
                            Private f32_3* %153 = OpVariable Private 
                            Private f32_3* %175 = OpVariable Private 
                                       i32 %184 = OpConstant 3 
                                           %206 = OpTypePointer Output %7 
                             Output f32_4* %207 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %89 = OpVariable Function 
                           Function f32_3* %102 = OpVariable Function 
                           Function f32_3* %176 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                                 Input f32* %31 = OpAccessChain %29 %24 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %27 %32 
                                        f32 %35 = OpFAdd %33 %34 
                               Private f32* %37 = OpAccessChain %22 %36 
                                                    OpStore %37 %35 
                                      f32_4 %39 = OpLoad %9 
                                      f32_4 %40 = OpLoad %29 
                                      f32_4 %41 = OpFMul %39 %40 
                                                    OpStore %38 %41 
                               Private f32* %45 = OpAccessChain %22 %36 
                                        f32 %46 = OpLoad %45 
                                       bool %48 = OpFOrdLessThan %46 %47 
                                                    OpStore %44 %48 
                                       bool %49 = OpLoad %44 
                                        i32 %53 = OpSelect %49 %52 %51 
                                        i32 %55 = OpIMul %53 %54 
                                       bool %56 = OpINotEqual %55 %51 
                                                    OpSelectionMerge %58 None 
                                                    OpBranchConditional %56 %57 %58 
                                            %57 = OpLabel 
                                                    OpKill
                                            %58 = OpLabel 
                                      f32_4 %60 = OpLoad %38 
                                      f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32 %66 = OpDot %61 %65 
                               Private f32* %67 = OpAccessChain %22 %36 
                                                    OpStore %67 %66 
                               Private f32* %68 = OpAccessChain %22 %36 
                                        f32 %69 = OpLoad %68 
                                       bool %71 = OpFOrdGreaterThanEqual %69 %70 
                                                    OpStore %44 %71 
                               Uniform f32* %78 = OpAccessChain %75 %76 
                                        f32 %79 = OpLoad %78 
                                      f32_3 %80 = OpCompositeConstruct %79 %79 %79 
                                      f32_4 %81 = OpLoad %38 
                                      f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                      f32_3 %83 = OpFNegate %82 
                                      f32_3 %84 = OpFMul %80 %83 
                                      f32_4 %85 = OpLoad %38 
                                      f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                      f32_3 %87 = OpFAdd %84 %86 
                                                    OpStore %72 %87 
                                       bool %90 = OpLoad %44 
                                                    OpSelectionMerge %92 None 
                                                    OpBranchConditional %90 %91 %94 
                                            %91 = OpLabel 
                                      f32_3 %93 = OpLoad %72 
                                                    OpStore %89 %93 
                                                    OpBranch %92 
                                            %94 = OpLabel 
                                                    OpStore %89 %96 
                                                    OpBranch %92 
                                            %92 = OpLabel 
                                      f32_3 %97 = OpLoad %89 
                                                    OpStore %22 %97 
                               Uniform f32* %99 = OpAccessChain %75 %76 
                                       f32 %100 = OpLoad %99 
                                      bool %101 = OpFOrdLessThan %98 %100 
                                                    OpStore %44 %101 
                                      bool %103 = OpLoad %44 
                                                    OpSelectionMerge %105 None 
                                                    OpBranchConditional %103 %104 %107 
                                           %104 = OpLabel 
                                     f32_3 %106 = OpLoad %22 
                                                    OpStore %102 %106 
                                                    OpBranch %105 
                                           %107 = OpLabel 
                                     f32_4 %108 = OpLoad %38 
                                     f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                                    OpStore %102 %109 
                                                    OpBranch %105 
                                           %105 = OpLabel 
                                     f32_3 %110 = OpLoad %102 
                                                    OpStore %22 %110 
                              Private f32* %111 = OpAccessChain %22 %36 
                                       f32 %112 = OpLoad %111 
                                      bool %113 = OpFOrdEqual %112 %47 
                                                    OpStore %44 %113 
                                     f32_3 %115 = OpLoad %22 
                                     f32_3 %116 = OpExtInst %1 30 %115 
                                                    OpStore %114 %116 
                                     f32_3 %117 = OpLoad %114 
                              Uniform f32* %118 = OpAccessChain %75 %52 
                                       f32 %119 = OpLoad %118 
                              Uniform f32* %120 = OpAccessChain %75 %52 
                                       f32 %121 = OpLoad %120 
                              Uniform f32* %122 = OpAccessChain %75 %52 
                                       f32 %123 = OpLoad %122 
                                     f32_3 %124 = OpCompositeConstruct %119 %121 %123 
                                       f32 %125 = OpCompositeExtract %124 0 
                                       f32 %126 = OpCompositeExtract %124 1 
                                       f32 %127 = OpCompositeExtract %124 2 
                                     f32_3 %128 = OpCompositeConstruct %125 %126 %127 
                                     f32_3 %129 = OpFMul %117 %128 
                                                    OpStore %72 %129 
                                     f32_3 %130 = OpLoad %72 
                                     f32_3 %131 = OpExtInst %1 29 %130 
                                                    OpStore %72 %131 
                                     f32_3 %132 = OpLoad %72 
                              Uniform f32* %133 = OpAccessChain %75 %51 
                                       f32 %134 = OpLoad %133 
                              Uniform f32* %135 = OpAccessChain %75 %51 
                                       f32 %136 = OpLoad %135 
                              Uniform f32* %137 = OpAccessChain %75 %51 
                                       f32 %138 = OpLoad %137 
                                     f32_3 %139 = OpCompositeConstruct %134 %136 %138 
                                       f32 %140 = OpCompositeExtract %139 0 
                                       f32 %141 = OpCompositeExtract %139 1 
                                       f32 %142 = OpCompositeExtract %139 2 
                                     f32_3 %143 = OpCompositeConstruct %140 %141 %142 
                                     f32_3 %144 = OpFMul %132 %143 
                                                    OpStore %72 %144 
                              Uniform f32* %145 = OpAccessChain %75 %76 
                                       f32 %146 = OpLoad %145 
                                     f32_3 %147 = OpCompositeConstruct %146 %146 %146 
                                     f32_3 %148 = OpLoad %72 
                                     f32_3 %149 = OpFNegate %148 
                                     f32_3 %150 = OpFMul %147 %149 
                                     f32_3 %151 = OpLoad %72 
                                     f32_3 %152 = OpFAdd %150 %151 
                                                    OpStore %72 %152 
                                     f32_3 %154 = OpLoad %72 
                                     f32_3 %155 = OpFNegate %154 
                              Uniform f32* %156 = OpAccessChain %75 %51 
                                       f32 %157 = OpLoad %156 
                              Uniform f32* %158 = OpAccessChain %75 %51 
                                       f32 %159 = OpLoad %158 
                              Uniform f32* %160 = OpAccessChain %75 %51 
                                       f32 %161 = OpLoad %160 
                                     f32_3 %162 = OpCompositeConstruct %157 %159 %161 
                                       f32 %163 = OpCompositeExtract %162 0 
                                       f32 %164 = OpCompositeExtract %162 1 
                                       f32 %165 = OpCompositeExtract %162 2 
                                     f32_3 %166 = OpCompositeConstruct %163 %164 %165 
                                     f32_3 %167 = OpFAdd %155 %166 
                                                    OpStore %153 %167 
                              Uniform f32* %168 = OpAccessChain %75 %76 
                                       f32 %169 = OpLoad %168 
                                     f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                     f32_3 %171 = OpLoad %153 
                                     f32_3 %172 = OpFMul %170 %171 
                                     f32_3 %173 = OpLoad %72 
                                     f32_3 %174 = OpFAdd %172 %173 
                                                    OpStore %153 %174 
                                      bool %177 = OpLoad %44 
                                                    OpSelectionMerge %179 None 
                                                    OpBranchConditional %177 %178 %181 
                                           %178 = OpLabel 
                                     f32_3 %180 = OpLoad %153 
                                                    OpStore %176 %180 
                                                    OpBranch %179 
                                           %181 = OpLabel 
                                     f32_3 %182 = OpLoad %72 
                                                    OpStore %176 %182 
                                                    OpBranch %179 
                                           %179 = OpLabel 
                                     f32_3 %183 = OpLoad %176 
                                                    OpStore %175 %183 
                              Uniform f32* %185 = OpAccessChain %75 %184 
                                       f32 %186 = OpLoad %185 
                              Uniform f32* %187 = OpAccessChain %75 %184 
                                       f32 %188 = OpLoad %187 
                              Uniform f32* %189 = OpAccessChain %75 %184 
                                       f32 %190 = OpLoad %189 
                                     f32_3 %191 = OpCompositeConstruct %186 %188 %190 
                                       f32 %192 = OpCompositeExtract %191 0 
                                       f32 %193 = OpCompositeExtract %191 1 
                                       f32 %194 = OpCompositeExtract %191 2 
                                     f32_3 %195 = OpCompositeConstruct %192 %193 %194 
                                     f32_3 %196 = OpLoad %175 
                                     f32_3 %197 = OpFNegate %196 
                                     f32_3 %198 = OpFMul %195 %197 
                                     f32_3 %199 = OpLoad %175 
                                     f32_3 %200 = OpFAdd %198 %199 
                                                    OpStore %175 %200 
                                     f32_3 %201 = OpLoad %22 
                                     f32_3 %202 = OpLoad %175 
                                     f32_3 %203 = OpFAdd %201 %202 
                                     f32_4 %204 = OpLoad %38 
                                     f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
                                                    OpStore %38 %205 
                                     f32_4 %208 = OpLoad %38 
                                                    OpStore %207 %208 
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
Fallback "VertexLit"
}