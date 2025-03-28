//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/FinalGunRoom_BG_01" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  GpuProgramID 4671
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

uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bvec3 u_xlatb1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xz = _SinTime.yy * vec2(0.333333343, 0.333333343) + vs_TEXCOORD0.xx;
    u_xlat1.x = _SinTime.y * 0.333333343 + u_xlat0.z;
    u_xlat0.y = _CosTime.y * 0.200000003 + vs_TEXCOORD0.y;
    u_xlat1.y = _CosTime.y * 0.200000003 + u_xlat0.y;
    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.xyz = u_xlat10_1.xyx * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(10.0, 10.0, 10.0);
    u_xlat0.xyz = cos(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = sin(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.0, 5.0, 5.0);
    u_xlatb1.xyz = greaterThanEqual(u_xlat0.zyzz, (-u_xlat0.zyzz)).xyz;
    u_xlat1.x = (u_xlatb1.x) ? float(1.0) : float(-1.0);
    u_xlat1.y = (u_xlatb1.y) ? float(1.0) : float(-1.0);
    u_xlat1.z = (u_xlatb1.z) ? float(1.0) : float(-1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xzw = u_xlat1.xyz * u_xlat0.xyz + _Time.zyw;
    u_xlat2 = u_xlat1.y * u_xlat0.y + u_xlat0.w;
    u_xlat2 = cos(u_xlat2);
    u_xlat2 = u_xlat2 + 1.0;
    u_xlat1.z = u_xlat2 * 0.5;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = cos(u_xlat0.z);
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat4 = u_xlat0.x * 0.5 + (-u_xlat1.z);
    u_xlat1.x = u_xlat0.x * 0.5;
    SV_Target0.xz = u_xlat1.xz;
    SV_Target0.y = u_xlat0.y * 0.5 + (-u_xlat4);
    SV_Target0.w = 0.0;
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
; Bound: 219
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %24 %203 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %10 0 Offset 10 
                                                    OpMemberDecorate %10 1 Offset 10 
                                                    OpMemberDecorate %10 2 Offset 10 
                                                    OpDecorate %10 Block 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %24 Location 24 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %68 DescriptorSet 68 
                                                    OpDecorate %68 Binding 68 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
                                                    OpDecorate %112 RelaxedPrecision 
                                                    OpDecorate %143 RelaxedPrecision 
                                                    OpDecorate %203 Location 203 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeStruct %7 %7 %7 
                                            %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 1 
                                            %15 = OpTypeVector %6 2 
                                            %16 = OpTypePointer Uniform %7 
                                        f32 %20 = OpConstant 3.67402E-40 
                                      f32_2 %21 = OpConstantComposite %20 %20 
                                            %23 = OpTypePointer Input %15 
                               Input f32_2* %24 = OpVariable Input 
                                            %30 = OpTypeVector %6 3 
                                            %31 = OpTypePointer Private %30 
                             Private f32_3* %32 = OpVariable Private 
                                            %33 = OpTypeInt 32 0 
                                        u32 %34 = OpConstant 1 
                                            %35 = OpTypePointer Uniform %6 
                                        u32 %39 = OpConstant 2 
                                            %40 = OpTypePointer Private %6 
                                        u32 %44 = OpConstant 0 
                                        i32 %46 = OpConstant 2 
                                        f32 %49 = OpConstant 3.67402E-40 
                                            %51 = OpTypePointer Input %6 
                                            %63 = OpTypePointer Private %15 
                             Private f32_2* %64 = OpVariable Private 
                                            %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %66 = OpTypeSampledImage %65 
                                            %67 = OpTypePointer UniformConstant %66 
UniformConstant read_only Texture2DSampled* %68 = OpVariable UniformConstant 
                                        f32 %76 = OpConstant 3.67402E-40 
                                      f32_3 %77 = OpConstantComposite %76 %76 %76 
                             Private f32_3* %84 = OpVariable Private 
                                        f32 %87 = OpConstant 3.67402E-40 
                                      f32_3 %88 = OpConstantComposite %87 %87 %87 
                                        f32 %93 = OpConstant 3.67402E-40 
                                      f32_3 %94 = OpConstantComposite %93 %93 %93 
                                        f32 %99 = OpConstant 3.67402E-40 
                                     f32_3 %100 = OpConstantComposite %99 %99 %99 
                                           %102 = OpTypeBool 
                                           %103 = OpTypeVector %102 3 
                                           %104 = OpTypePointer Private %103 
                           Private bool_3* %105 = OpVariable Private 
                                           %111 = OpTypeVector %102 4 
                                           %114 = OpTypePointer Function %6 
                                       f32 %120 = OpConstant 3.67402E-40 
                                       f32 %122 = OpConstant 3.67402E-40 
                                       i32 %151 = OpConstant 0 
                              Private f32* %158 = OpVariable Private 
                                       u32 %164 = OpConstant 3 
                                       f32 %173 = OpConstant 3.67402E-40 
                                     f32_2 %186 = OpConstantComposite %120 %120 
                              Private f32* %190 = OpVariable Private 
                                           %202 = OpTypePointer Output %7 
                             Output f32_4* %203 = OpVariable Output 
                                           %214 = OpTypePointer Output %6 
                                       f32 %216 = OpConstant 3.67402E-40 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                             Function f32* %115 = OpVariable Function 
                             Function f32* %125 = OpVariable Function 
                             Function f32* %133 = OpVariable Function 
                             Uniform f32_4* %17 = OpAccessChain %12 %14 
                                      f32_4 %18 = OpLoad %17 
                                      f32_2 %19 = OpVectorShuffle %18 %18 1 1 
                                      f32_2 %22 = OpFMul %19 %21 
                                      f32_2 %25 = OpLoad %24 
                                      f32_2 %26 = OpVectorShuffle %25 %25 0 0 
                                      f32_2 %27 = OpFAdd %22 %26 
                                      f32_4 %28 = OpLoad %9 
                                      f32_4 %29 = OpVectorShuffle %28 %27 4 1 5 3 
                                                    OpStore %9 %29 
                               Uniform f32* %36 = OpAccessChain %12 %14 %34 
                                        f32 %37 = OpLoad %36 
                                        f32 %38 = OpFMul %37 %20 
                               Private f32* %41 = OpAccessChain %9 %39 
                                        f32 %42 = OpLoad %41 
                                        f32 %43 = OpFAdd %38 %42 
                               Private f32* %45 = OpAccessChain %32 %44 
                                                    OpStore %45 %43 
                               Uniform f32* %47 = OpAccessChain %12 %46 %34 
                                        f32 %48 = OpLoad %47 
                                        f32 %50 = OpFMul %48 %49 
                                 Input f32* %52 = OpAccessChain %24 %34 
                                        f32 %53 = OpLoad %52 
                                        f32 %54 = OpFAdd %50 %53 
                               Private f32* %55 = OpAccessChain %9 %34 
                                                    OpStore %55 %54 
                               Uniform f32* %56 = OpAccessChain %12 %46 %34 
                                        f32 %57 = OpLoad %56 
                                        f32 %58 = OpFMul %57 %49 
                               Private f32* %59 = OpAccessChain %9 %34 
                                        f32 %60 = OpLoad %59 
                                        f32 %61 = OpFAdd %58 %60 
                               Private f32* %62 = OpAccessChain %32 %34 
                                                    OpStore %62 %61 
                 read_only Texture2DSampled %69 = OpLoad %68 
                                      f32_3 %70 = OpLoad %32 
                                      f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                      f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                      f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                                    OpStore %64 %73 
                                      f32_2 %74 = OpLoad %64 
                                      f32_3 %75 = OpVectorShuffle %74 %74 0 1 0 
                                      f32_3 %78 = OpFMul %75 %77 
                                      f32_4 %79 = OpLoad %9 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                      f32_3 %81 = OpFAdd %78 %80 
                                      f32_4 %82 = OpLoad %9 
                                      f32_4 %83 = OpVectorShuffle %82 %81 4 5 6 3 
                                                    OpStore %9 %83 
                                      f32_4 %85 = OpLoad %9 
                                      f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                      f32_3 %89 = OpFMul %86 %88 
                                                    OpStore %84 %89 
                                      f32_3 %90 = OpLoad %84 
                                      f32_3 %91 = OpExtInst %1 14 %90 
                                                    OpStore %84 %91 
                                      f32_3 %92 = OpLoad %84 
                                      f32_3 %95 = OpFMul %92 %94 
                                                    OpStore %84 %95 
                                      f32_3 %96 = OpLoad %84 
                                      f32_3 %97 = OpExtInst %1 13 %96 
                                                    OpStore %84 %97 
                                      f32_3 %98 = OpLoad %84 
                                     f32_3 %101 = OpFMul %98 %100 
                                                    OpStore %84 %101 
                                     f32_3 %106 = OpLoad %84 
                                     f32_4 %107 = OpVectorShuffle %106 %106 2 1 2 2 
                                     f32_3 %108 = OpLoad %84 
                                     f32_4 %109 = OpVectorShuffle %108 %108 2 1 2 2 
                                     f32_4 %110 = OpFNegate %109 
                                    bool_4 %112 = OpFOrdGreaterThanEqual %107 %110 
                                    bool_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                                    OpStore %105 %113 
                                    bool_3 %116 = OpLoad %105 
                                      bool %117 = OpCompositeExtract %116 0 
                                                    OpSelectionMerge %119 None 
                                                    OpBranchConditional %117 %118 %121 
                                           %118 = OpLabel 
                                                    OpStore %115 %120 
                                                    OpBranch %119 
                                           %121 = OpLabel 
                                                    OpStore %115 %122 
                                                    OpBranch %119 
                                           %119 = OpLabel 
                                       f32 %123 = OpLoad %115 
                              Private f32* %124 = OpAccessChain %9 %44 
                                                    OpStore %124 %123 
                                    bool_3 %126 = OpLoad %105 
                                      bool %127 = OpCompositeExtract %126 1 
                                                    OpSelectionMerge %129 None 
                                                    OpBranchConditional %127 %128 %130 
                                           %128 = OpLabel 
                                                    OpStore %125 %120 
                                                    OpBranch %129 
                                           %130 = OpLabel 
                                                    OpStore %125 %122 
                                                    OpBranch %129 
                                           %129 = OpLabel 
                                       f32 %131 = OpLoad %125 
                              Private f32* %132 = OpAccessChain %9 %34 
                                                    OpStore %132 %131 
                                    bool_3 %134 = OpLoad %105 
                                      bool %135 = OpCompositeExtract %134 2 
                                                    OpSelectionMerge %137 None 
                                                    OpBranchConditional %135 %136 %138 
                                           %136 = OpLabel 
                                                    OpStore %133 %120 
                                                    OpBranch %137 
                                           %138 = OpLabel 
                                                    OpStore %133 %122 
                                                    OpBranch %137 
                                           %137 = OpLabel 
                                       f32 %139 = OpLoad %133 
                              Private f32* %140 = OpAccessChain %9 %39 
                                                    OpStore %140 %139 
                                     f32_4 %141 = OpLoad %9 
                                     f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                     f32_3 %143 = OpLoad %84 
                                     f32_3 %144 = OpFMul %142 %143 
                                                    OpStore %32 %144 
                                     f32_3 %145 = OpLoad %32 
                                     f32_3 %146 = OpExtInst %1 10 %145 
                                                    OpStore %32 %146 
                                     f32_4 %147 = OpLoad %9 
                                     f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                     f32_3 %149 = OpLoad %32 
                                     f32_3 %150 = OpFMul %148 %149 
                            Uniform f32_4* %152 = OpAccessChain %12 %151 
                                     f32_4 %153 = OpLoad %152 
                                     f32_3 %154 = OpVectorShuffle %153 %153 2 1 3 
                                     f32_3 %155 = OpFAdd %150 %154 
                                     f32_4 %156 = OpLoad %9 
                                     f32_4 %157 = OpVectorShuffle %156 %155 4 1 5 6 
                                                    OpStore %9 %157 
                              Private f32* %159 = OpAccessChain %9 %34 
                                       f32 %160 = OpLoad %159 
                              Private f32* %161 = OpAccessChain %32 %34 
                                       f32 %162 = OpLoad %161 
                                       f32 %163 = OpFMul %160 %162 
                              Private f32* %165 = OpAccessChain %9 %164 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpFAdd %163 %166 
                                                    OpStore %158 %167 
                                       f32 %168 = OpLoad %158 
                                       f32 %169 = OpExtInst %1 14 %168 
                                                    OpStore %158 %169 
                                       f32 %170 = OpLoad %158 
                                       f32 %171 = OpFAdd %170 %120 
                                                    OpStore %158 %171 
                                       f32 %172 = OpLoad %158 
                                       f32 %174 = OpFMul %172 %173 
                              Private f32* %175 = OpAccessChain %32 %39 
                                                    OpStore %175 %174 
                              Private f32* %176 = OpAccessChain %9 %44 
                                       f32 %177 = OpLoad %176 
                                       f32 %178 = OpExtInst %1 13 %177 
                              Private f32* %179 = OpAccessChain %9 %44 
                                                    OpStore %179 %178 
                              Private f32* %180 = OpAccessChain %9 %39 
                                       f32 %181 = OpLoad %180 
                                       f32 %182 = OpExtInst %1 14 %181 
                              Private f32* %183 = OpAccessChain %9 %34 
                                                    OpStore %183 %182 
                                     f32_4 %184 = OpLoad %9 
                                     f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                                     f32_2 %187 = OpFAdd %185 %186 
                                     f32_4 %188 = OpLoad %9 
                                     f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
                                                    OpStore %9 %189 
                              Private f32* %191 = OpAccessChain %9 %44 
                                       f32 %192 = OpLoad %191 
                                       f32 %193 = OpFMul %192 %173 
                              Private f32* %194 = OpAccessChain %32 %39 
                                       f32 %195 = OpLoad %194 
                                       f32 %196 = OpFNegate %195 
                                       f32 %197 = OpFAdd %193 %196 
                                                    OpStore %190 %197 
                              Private f32* %198 = OpAccessChain %9 %44 
                                       f32 %199 = OpLoad %198 
                                       f32 %200 = OpFMul %199 %173 
                              Private f32* %201 = OpAccessChain %32 %44 
                                                    OpStore %201 %200 
                                     f32_3 %204 = OpLoad %32 
                                     f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                     f32_4 %206 = OpLoad %203 
                                     f32_4 %207 = OpVectorShuffle %206 %205 4 1 5 3 
                                                    OpStore %203 %207 
                              Private f32* %208 = OpAccessChain %9 %34 
                                       f32 %209 = OpLoad %208 
                                       f32 %210 = OpFMul %209 %173 
                                       f32 %211 = OpLoad %190 
                                       f32 %212 = OpFNegate %211 
                                       f32 %213 = OpFAdd %210 %212 
                               Output f32* %215 = OpAccessChain %203 %34 
                                                    OpStore %215 %213 
                               Output f32* %217 = OpAccessChain %203 %164 
                                                    OpStore %217 %216 
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