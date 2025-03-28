//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-CombineDepthNormals" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 249
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
uniform 	vec4 _CameraNormalsTexture_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _CameraNormalsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat10_0 = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat1.x = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlatb3 = u_xlat1.x<0.999984622;
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    SV_Target0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore %84 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 163
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %160 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %35 ArrayStride 35 
                                                    OpMemberDecorate %36 0 Offset 36 
                                                    OpMemberDecorate %36 1 Offset 36 
                                                    OpDecorate %36 Block 
                                                    OpDecorate %38 DescriptorSet 38 
                                                    OpDecorate %38 Binding 38 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %96 DescriptorSet 96 
                                                    OpDecorate %96 Binding 96 
                                                    OpDecorate %160 RelaxedPrecision 
                                                    OpDecorate %160 Location 160 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 3 
                                             %8 = OpTypePointer Private %7 
                              Private f32_3* %9 = OpVariable Private 
                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %11 = OpTypeSampledImage %10 
                                            %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                            %15 = OpTypeVector %6 2 
                                            %16 = OpTypePointer Input %15 
                               Input f32_2* %17 = OpVariable Input 
                                            %19 = OpTypeVector %6 4 
                             Private f32_3* %22 = OpVariable Private 
                                        f32 %24 = OpConstant 3.67402E-40 
                                      f32_3 %25 = OpConstantComposite %24 %24 %24 
                                        f32 %27 = OpConstant 3.67402E-40 
                                      f32_3 %28 = OpConstantComposite %27 %27 %27 
                             Private f32_3* %30 = OpVariable Private 
                                            %33 = OpTypeInt 32 0 
                                        u32 %34 = OpConstant 4 
                                            %35 = OpTypeArray %19 %34 
                                            %36 = OpTypeStruct %19 %35 
                                            %37 = OpTypePointer Uniform %36 
         Uniform struct {f32_4; f32_4[4];}* %38 = OpVariable Uniform 
                                            %39 = OpTypeInt 32 1 
                                        i32 %40 = OpConstant 1 
                                            %41 = OpTypePointer Uniform %19 
                                            %46 = OpTypePointer Private %19 
                             Private f32_4* %47 = OpVariable Private 
                                        i32 %48 = OpConstant 0 
                                        i32 %59 = OpConstant 2 
                                            %71 = OpTypePointer Private %6 
                               Private f32* %72 = OpVariable Private 
                                        u32 %73 = OpConstant 2 
                                        f32 %77 = OpConstant 3.67402E-40 
                                        f32 %88 = OpConstant 3.67402E-40 
                                      f32_2 %89 = OpConstantComposite %88 %88 
                                        f32 %91 = OpConstant 3.67402E-40 
                                      f32_2 %92 = OpConstantComposite %91 %91 
UniformConstant read_only Texture2DSampled* %96 = OpVariable UniformConstant 
                                       u32 %100 = OpConstant 0 
                                           %103 = OpTypePointer Uniform %6 
                                       u32 %109 = OpConstant 1 
                                           %118 = OpTypeBool 
                                           %119 = OpTypePointer Private %118 
                             Private bool* %120 = OpVariable Private 
                                       f32 %123 = OpConstant 3.67402E-40 
                                       f32 %127 = OpConstant 3.67402E-40 
                                     f32_2 %128 = OpConstantComposite %77 %127 
                                       f32 %140 = OpConstant 3.67402E-40 
                                       u32 %148 = OpConstant 3 
                                           %150 = OpTypePointer Function %19 
                                     f32_4 %157 = OpConstantComposite %91 %91 %77 %77 
                                           %159 = OpTypePointer Output %19 
                             Output f32_4* %160 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                           Function f32_4* %151 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %23 = OpLoad %9 
                                      f32_3 %26 = OpFMul %23 %25 
                                      f32_3 %29 = OpFAdd %26 %28 
                                                    OpStore %22 %29 
                                      f32_3 %31 = OpLoad %22 
                                      f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                             Uniform f32_4* %42 = OpAccessChain %38 %40 %40 
                                      f32_4 %43 = OpLoad %42 
                                      f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                      f32_3 %45 = OpFMul %32 %44 
                                                    OpStore %30 %45 
                             Uniform f32_4* %49 = OpAccessChain %38 %40 %48 
                                      f32_4 %50 = OpLoad %49 
                                      f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                      f32_3 %52 = OpLoad %22 
                                      f32_3 %53 = OpVectorShuffle %52 %52 0 0 0 
                                      f32_3 %54 = OpFMul %51 %53 
                                      f32_3 %55 = OpLoad %30 
                                      f32_3 %56 = OpFAdd %54 %55 
                                      f32_4 %57 = OpLoad %47 
                                      f32_4 %58 = OpVectorShuffle %57 %56 4 5 2 6 
                                                    OpStore %47 %58 
                             Uniform f32_4* %60 = OpAccessChain %38 %40 %59 
                                      f32_4 %61 = OpLoad %60 
                                      f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                      f32_3 %63 = OpLoad %22 
                                      f32_3 %64 = OpVectorShuffle %63 %63 2 2 2 
                                      f32_3 %65 = OpFMul %62 %64 
                                      f32_4 %66 = OpLoad %47 
                                      f32_3 %67 = OpVectorShuffle %66 %66 0 1 3 
                                      f32_3 %68 = OpFAdd %65 %67 
                                      f32_4 %69 = OpLoad %47 
                                      f32_4 %70 = OpVectorShuffle %69 %68 4 5 6 3 
                                                    OpStore %47 %70 
                               Private f32* %74 = OpAccessChain %47 %73 
                                        f32 %75 = OpLoad %74 
                                        f32 %76 = OpFNegate %75 
                                        f32 %78 = OpFAdd %76 %77 
                                                    OpStore %72 %78 
                                      f32_4 %79 = OpLoad %47 
                                      f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32 %81 = OpLoad %72 
                                      f32_2 %82 = OpCompositeConstruct %81 %81 
                                      f32_2 %83 = OpFDiv %80 %82 
                                      f32_4 %84 = OpLoad %47 
                                      f32_4 %85 = OpVectorShuffle %84 %83 4 5 2 3 
                                                    OpStore %47 %85 
                                      f32_4 %86 = OpLoad %47 
                                      f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                      f32_2 %90 = OpFMul %87 %89 
                                      f32_2 %93 = OpFAdd %90 %92 
                                      f32_4 %94 = OpLoad %47 
                                      f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                    OpStore %47 %95 
                 read_only Texture2DSampled %97 = OpLoad %96 
                                      f32_2 %98 = OpLoad %17 
                                      f32_4 %99 = OpImageSampleImplicitLod %97 %98 
                                       f32 %101 = OpCompositeExtract %99 0 
                              Private f32* %102 = OpAccessChain %30 %100 
                                                    OpStore %102 %101 
                              Uniform f32* %104 = OpAccessChain %38 %48 %100 
                                       f32 %105 = OpLoad %104 
                              Private f32* %106 = OpAccessChain %30 %100 
                                       f32 %107 = OpLoad %106 
                                       f32 %108 = OpFMul %105 %107 
                              Uniform f32* %110 = OpAccessChain %38 %48 %109 
                                       f32 %111 = OpLoad %110 
                                       f32 %112 = OpFAdd %108 %111 
                              Private f32* %113 = OpAccessChain %30 %100 
                                                    OpStore %113 %112 
                              Private f32* %114 = OpAccessChain %30 %100 
                                       f32 %115 = OpLoad %114 
                                       f32 %116 = OpFDiv %77 %115 
                              Private f32* %117 = OpAccessChain %30 %100 
                                                    OpStore %117 %116 
                              Private f32* %121 = OpAccessChain %30 %100 
                                       f32 %122 = OpLoad %121 
                                      bool %124 = OpFOrdLessThan %122 %123 
                                                    OpStore %120 %124 
                                     f32_3 %125 = OpLoad %30 
                                     f32_2 %126 = OpVectorShuffle %125 %125 0 0 
                                     f32_2 %129 = OpFMul %126 %128 
                                     f32_3 %130 = OpLoad %30 
                                     f32_3 %131 = OpVectorShuffle %130 %129 3 1 4 
                                                    OpStore %30 %131 
                                     f32_3 %132 = OpLoad %30 
                                     f32_2 %133 = OpVectorShuffle %132 %132 0 2 
                                     f32_2 %134 = OpExtInst %1 10 %133 
                                     f32_3 %135 = OpLoad %30 
                                     f32_3 %136 = OpVectorShuffle %135 %134 3 1 4 
                                                    OpStore %30 %136 
                              Private f32* %137 = OpAccessChain %30 %73 
                                       f32 %138 = OpLoad %137 
                                       f32 %139 = OpFNegate %138 
                                       f32 %141 = OpFMul %139 %140 
                              Private f32* %142 = OpAccessChain %30 %100 
                                       f32 %143 = OpLoad %142 
                                       f32 %144 = OpFAdd %141 %143 
                              Private f32* %145 = OpAccessChain %47 %73 
                                                    OpStore %145 %144 
                              Private f32* %146 = OpAccessChain %30 %73 
                                       f32 %147 = OpLoad %146 
                              Private f32* %149 = OpAccessChain %47 %148 
                                                    OpStore %149 %147 
                                      bool %152 = OpLoad %120 
                                                    OpSelectionMerge %154 None 
                                                    OpBranchConditional %152 %153 %156 
                                           %153 = OpLabel 
                                     f32_4 %155 = OpLoad %47 
                                                    OpStore %151 %155 
                                                    OpBranch %154 
                                           %156 = OpLabel 
                                                    OpStore %151 %157 
                                                    OpBranch %154 
                                           %154 = OpLabel 
                                     f32_4 %158 = OpLoad %151 
                                                    OpStore %47 %158 
                                     f32_4 %161 = OpLoad %47 
                                                    OpStore %160 %161 
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