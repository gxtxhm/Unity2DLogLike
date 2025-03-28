//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GlitterPassAdditive" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ZWrite Off
  Cull Off
  GpuProgramID 44883
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _MainTex_TexelSize;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat10_0.w + -0.100000001;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD1.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.x = _Time.z * 4.0;
    u_xlat1.y = floor(u_xlat3.x);
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(4.31699991, 4.31699991);
    u_xlat1.x = 0.0;
    u_xlat0.xy = u_xlat3.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy / _MainTex_TexelSize.xy;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat6.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
    u_xlat6.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 43758.5469;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = log2(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 35.0;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat1.xy = u_xlat0.xy * _MainTex_TexelSize.xy + vec2(25.0, 25.0);
    u_xlat2 = u_xlat0.xyxy * _MainTex_TexelSize.xyxy + vec4(15.0, 15.0, 20.0, 20.0);
    u_xlat0.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat1.z = fract(u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.y = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat1.y = fract(u_xlat0.y);
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = u_xlat0.x + 0.300000012;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat3.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %51 %84 %94 %95 %99 %101 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %51 Location 51 
                                                     OpMemberDecorate %82 0 BuiltIn 82 
                                                     OpMemberDecorate %82 1 BuiltIn 82 
                                                     OpMemberDecorate %82 2 BuiltIn 82 
                                                     OpDecorate %82 Block 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %95 RelaxedPrecision 
                                                     OpDecorate %95 Location 95 
                                                     OpDecorate %96 RelaxedPrecision 
                                                     OpDecorate %99 Location 99 
                                                     OpDecorate %101 Location 101 
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
                              Private f32_4* %43 = OpVariable Private 
                                         i32 %45 = OpConstant 3 
                                             %49 = OpTypeVector %6 3 
                                             %50 = OpTypePointer Output %49 
                               Output f32_3* %51 = OpVariable Output 
                                         u32 %80 = OpConstant 1 
                                             %81 = OpTypeArray %6 %80 
                                             %82 = OpTypeStruct %7 %6 %81 
                                             %83 = OpTypePointer Output %82 
        Output struct {f32_4; f32; f32[1];}* %84 = OpVariable Output 
                                             %92 = OpTypePointer Output %7 
                               Output f32_4* %94 = OpVariable Output 
                                Input f32_4* %95 = OpVariable Input 
                                             %97 = OpTypeVector %6 2 
                                             %98 = OpTypePointer Output %97 
                               Output f32_2* %99 = OpVariable Output 
                                            %100 = OpTypePointer Input %97 
                               Input f32_2* %101 = OpVariable Input 
                                            %111 = OpTypePointer Output %6 
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
                                       f32_4 %44 = OpLoad %9 
                              Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                       f32_4 %47 = OpLoad %46 
                                       f32_4 %48 = OpFAdd %44 %47 
                                                     OpStore %43 %48 
                              Uniform f32_4* %52 = OpAccessChain %20 %22 %45 
                                       f32_4 %53 = OpLoad %52 
                                       f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                       f32_4 %55 = OpLoad %11 
                                       f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                       f32_3 %57 = OpFMul %54 %56 
                                       f32_4 %58 = OpLoad %9 
                                       f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                       f32_3 %60 = OpFAdd %57 %59 
                                                     OpStore %51 %60 
                                       f32_4 %61 = OpLoad %43 
                                       f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                              Uniform f32_4* %63 = OpAccessChain %20 %23 %23 
                                       f32_4 %64 = OpLoad %63 
                                       f32_4 %65 = OpFMul %62 %64 
                                                     OpStore %9 %65 
                              Uniform f32_4* %66 = OpAccessChain %20 %23 %22 
                                       f32_4 %67 = OpLoad %66 
                                       f32_4 %68 = OpLoad %43 
                                       f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                       f32_4 %70 = OpFMul %67 %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpFAdd %70 %71 
                                                     OpStore %9 %72 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %35 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %43 
                                       f32_4 %76 = OpVectorShuffle %75 %75 2 2 2 2 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %9 
                                       f32_4 %79 = OpFAdd %77 %78 
                                                     OpStore %9 %79 
                              Uniform f32_4* %85 = OpAccessChain %20 %23 %45 
                                       f32_4 %86 = OpLoad %85 
                                       f32_4 %87 = OpLoad %43 
                                       f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                       f32_4 %89 = OpFMul %86 %88 
                                       f32_4 %90 = OpLoad %9 
                                       f32_4 %91 = OpFAdd %89 %90 
                               Output f32_4* %93 = OpAccessChain %84 %22 
                                                     OpStore %93 %91 
                                       f32_4 %96 = OpLoad %95 
                                                     OpStore %94 %96 
                                      f32_2 %102 = OpLoad %101 
                             Uniform f32_4* %103 = OpAccessChain %20 %35 
                                      f32_4 %104 = OpLoad %103 
                                      f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                      f32_2 %106 = OpFMul %102 %105 
                             Uniform f32_4* %107 = OpAccessChain %20 %35 
                                      f32_4 %108 = OpLoad %107 
                                      f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                      f32_2 %110 = OpFAdd %106 %109 
                                                     OpStore %99 %110 
                                Output f32* %112 = OpAccessChain %84 %22 %80 
                                        f32 %113 = OpLoad %112 
                                        f32 %114 = OpFNegate %113 
                                Output f32* %115 = OpAccessChain %84 %22 %80 
                                                     OpStore %115 %114 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 263
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %48 %255 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %48 Location 48 
                                                    OpMemberDecorate %72 0 Offset 72 
                                                    OpMemberDecorate %72 1 Offset 72 
                                                    OpDecorate %72 Block 
                                                    OpDecorate %74 DescriptorSet 74 
                                                    OpDecorate %74 Binding 74 
                                                    OpDecorate %224 RelaxedPrecision 
                                                    OpDecorate %231 RelaxedPrecision 
                                                    OpDecorate %232 RelaxedPrecision 
                                                    OpDecorate %234 RelaxedPrecision 
                                                    OpDecorate %235 RelaxedPrecision 
                                                    OpDecorate %236 RelaxedPrecision 
                                                    OpDecorate %237 RelaxedPrecision 
                                                    OpDecorate %238 RelaxedPrecision 
                                                    OpDecorate %239 RelaxedPrecision 
                                                    OpDecorate %240 RelaxedPrecision 
                                                    OpDecorate %241 RelaxedPrecision 
                                                    OpDecorate %242 RelaxedPrecision 
                                                    OpDecorate %243 RelaxedPrecision 
                                                    OpDecorate %244 RelaxedPrecision 
                                                    OpDecorate %247 RelaxedPrecision 
                                                    OpDecorate %255 RelaxedPrecision 
                                                    OpDecorate %255 Location 255 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                               Private f32* %23 = OpVariable Private 
                                        f32 %25 = OpConstant 3.67402E-40 
                                            %27 = OpTypeBool 
                                            %28 = OpTypePointer Private %27 
                              Private bool* %29 = OpVariable Private 
                                        f32 %31 = OpConstant 3.67402E-40 
                                            %34 = OpTypeInt 32 1 
                                        i32 %35 = OpConstant 0 
                                        i32 %36 = OpConstant 1 
                                        i32 %38 = OpConstant -1 
                                            %44 = OpTypeVector %6 3 
                                            %45 = OpTypePointer Private %44 
                             Private f32_3* %46 = OpVariable Private 
                                            %47 = OpTypePointer Input %44 
                               Input f32_3* %48 = OpVariable Input 
                                        f32 %51 = OpConstant 3.67402E-40 
                                        f32 %52 = OpConstant 3.67402E-40 
                                      f32_2 %53 = OpConstantComposite %51 %52 
                                        u32 %55 = OpConstant 0 
                                        f32 %63 = OpConstant 3.67402E-40 
                                            %70 = OpTypePointer Private %14 
                             Private f32_2* %71 = OpVariable Private 
                                            %72 = OpTypeStruct %18 %18 
                                            %73 = OpTypePointer Uniform %72 
            Uniform struct {f32_4; f32_4;}* %74 = OpVariable Uniform 
                                        u32 %75 = OpConstant 2 
                                            %76 = OpTypePointer Uniform %6 
                                        f32 %79 = OpConstant 3.67402E-40 
                             Private f32_3* %82 = OpVariable Private 
                                        u32 %86 = OpConstant 1 
                                        f32 %90 = OpConstant 3.67402E-40 
                                      f32_2 %91 = OpConstantComposite %90 %90 
                                           %105 = OpTypePointer Uniform %18 
                            Private f32_2* %117 = OpVariable Private 
                                       f32 %145 = OpConstant 3.67402E-40 
                                       f32 %158 = OpConstant 3.67402E-40 
                                     f32_2 %159 = OpConstantComposite %158 %158 
                                           %163 = OpTypePointer Private %18 
                            Private f32_4* %164 = OpVariable Private 
                                       f32 %171 = OpConstant 3.67402E-40 
                                       f32 %172 = OpConstant 3.67402E-40 
                                     f32_4 %173 = OpConstantComposite %171 %171 %172 %172 
                                     f32_2 %206 = OpConstantComposite %63 %63 
                              Private f32* %224 = OpVariable Private 
                                       f32 %226 = OpConstant 3.67402E-40 
                                       f32 %227 = OpConstant 3.67402E-40 
                                       f32 %228 = OpConstant 3.67402E-40 
                                     f32_3 %229 = OpConstantComposite %226 %227 %228 
                              Private f32* %231 = OpVariable Private 
                                       f32 %233 = OpConstant 3.67402E-40 
                              Private f32* %238 = OpVariable Private 
                                           %254 = OpTypePointer Output %18 
                             Output f32_4* %255 = OpVariable Output 
                                       f32 %259 = OpConstant 3.67402E-40 
                                           %260 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                                        f32 %26 = OpFAdd %24 %25 
                                                    OpStore %23 %26 
                                        f32 %30 = OpLoad %23 
                                       bool %32 = OpFOrdLessThan %30 %31 
                                                    OpStore %29 %32 
                                       bool %33 = OpLoad %29 
                                        i32 %37 = OpSelect %33 %36 %35 
                                        i32 %39 = OpIMul %37 %38 
                                       bool %40 = OpINotEqual %39 %35 
                                                    OpSelectionMerge %42 None 
                                                    OpBranchConditional %40 %41 %42 
                                            %41 = OpLabel 
                                                    OpKill
                                            %42 = OpLabel 
                                      f32_3 %49 = OpLoad %48 
                                      f32_2 %50 = OpVectorShuffle %49 %49 0 1 
                                        f32 %54 = OpDot %50 %53 
                               Private f32* %56 = OpAccessChain %46 %55 
                                                    OpStore %56 %54 
                               Private f32* %57 = OpAccessChain %46 %55 
                                        f32 %58 = OpLoad %57 
                                        f32 %59 = OpExtInst %1 13 %58 
                               Private f32* %60 = OpAccessChain %46 %55 
                                                    OpStore %60 %59 
                               Private f32* %61 = OpAccessChain %46 %55 
                                        f32 %62 = OpLoad %61 
                                        f32 %64 = OpFMul %62 %63 
                               Private f32* %65 = OpAccessChain %46 %55 
                                                    OpStore %65 %64 
                               Private f32* %66 = OpAccessChain %46 %55 
                                        f32 %67 = OpLoad %66 
                                        f32 %68 = OpExtInst %1 10 %67 
                               Private f32* %69 = OpAccessChain %46 %55 
                                                    OpStore %69 %68 
                               Uniform f32* %77 = OpAccessChain %74 %35 %75 
                                        f32 %78 = OpLoad %77 
                                        f32 %80 = OpFMul %78 %79 
                               Private f32* %81 = OpAccessChain %71 %55 
                                                    OpStore %81 %80 
                               Private f32* %83 = OpAccessChain %71 %55 
                                        f32 %84 = OpLoad %83 
                                        f32 %85 = OpExtInst %1 8 %84 
                               Private f32* %87 = OpAccessChain %82 %86 
                                                    OpStore %87 %85 
                                      f32_3 %88 = OpLoad %48 
                                      f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                      f32_2 %92 = OpFMul %89 %91 
                                                    OpStore %71 %92 
                               Private f32* %93 = OpAccessChain %82 %55 
                                                    OpStore %93 %31 
                                      f32_2 %94 = OpLoad %71 
                                      f32_3 %95 = OpLoad %46 
                                      f32_2 %96 = OpVectorShuffle %95 %95 0 0 
                                      f32_2 %97 = OpFMul %94 %96 
                                      f32_3 %98 = OpLoad %82 
                                      f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                     f32_2 %100 = OpFAdd %97 %99 
                                     f32_3 %101 = OpLoad %46 
                                     f32_3 %102 = OpVectorShuffle %101 %100 3 4 2 
                                                    OpStore %46 %102 
                                     f32_3 %103 = OpLoad %46 
                                     f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                            Uniform f32_4* %106 = OpAccessChain %74 %36 
                                     f32_4 %107 = OpLoad %106 
                                     f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                     f32_2 %109 = OpFDiv %104 %108 
                                     f32_3 %110 = OpLoad %46 
                                     f32_3 %111 = OpVectorShuffle %110 %109 3 4 2 
                                                    OpStore %46 %111 
                                     f32_3 %112 = OpLoad %46 
                                     f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                     f32_2 %114 = OpExtInst %1 8 %113 
                                     f32_3 %115 = OpLoad %46 
                                     f32_3 %116 = OpVectorShuffle %115 %114 3 4 2 
                                                    OpStore %46 %116 
                                     f32_3 %118 = OpLoad %46 
                                     f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                            Uniform f32_4* %120 = OpAccessChain %74 %36 
                                     f32_4 %121 = OpLoad %120 
                                     f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                     f32_2 %123 = OpFMul %119 %122 
                                                    OpStore %117 %123 
                                     f32_2 %124 = OpLoad %117 
                                       f32 %125 = OpDot %124 %53 
                              Private f32* %126 = OpAccessChain %117 %55 
                                                    OpStore %126 %125 
                              Private f32* %127 = OpAccessChain %117 %55 
                                       f32 %128 = OpLoad %127 
                                       f32 %129 = OpExtInst %1 13 %128 
                              Private f32* %130 = OpAccessChain %117 %55 
                                                    OpStore %130 %129 
                              Private f32* %131 = OpAccessChain %117 %55 
                                       f32 %132 = OpLoad %131 
                                       f32 %133 = OpFMul %132 %63 
                              Private f32* %134 = OpAccessChain %117 %55 
                                                    OpStore %134 %133 
                              Private f32* %135 = OpAccessChain %117 %55 
                                       f32 %136 = OpLoad %135 
                                       f32 %137 = OpExtInst %1 10 %136 
                              Private f32* %138 = OpAccessChain %117 %55 
                                                    OpStore %138 %137 
                              Private f32* %139 = OpAccessChain %117 %55 
                                       f32 %140 = OpLoad %139 
                                       f32 %141 = OpExtInst %1 30 %140 
                              Private f32* %142 = OpAccessChain %117 %55 
                                                    OpStore %142 %141 
                              Private f32* %143 = OpAccessChain %117 %55 
                                       f32 %144 = OpLoad %143 
                                       f32 %146 = OpFMul %144 %145 
                              Private f32* %147 = OpAccessChain %117 %55 
                                                    OpStore %147 %146 
                              Private f32* %148 = OpAccessChain %117 %55 
                                       f32 %149 = OpLoad %148 
                                       f32 %150 = OpExtInst %1 29 %149 
                              Private f32* %151 = OpAccessChain %117 %55 
                                                    OpStore %151 %150 
                                     f32_3 %152 = OpLoad %46 
                                     f32_2 %153 = OpVectorShuffle %152 %152 0 1 
                            Uniform f32_4* %154 = OpAccessChain %74 %36 
                                     f32_4 %155 = OpLoad %154 
                                     f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                                     f32_2 %157 = OpFMul %153 %156 
                                     f32_2 %160 = OpFAdd %157 %159 
                                     f32_3 %161 = OpLoad %82 
                                     f32_3 %162 = OpVectorShuffle %161 %160 3 4 2 
                                                    OpStore %82 %162 
                                     f32_3 %165 = OpLoad %46 
                                     f32_4 %166 = OpVectorShuffle %165 %165 0 1 0 1 
                            Uniform f32_4* %167 = OpAccessChain %74 %36 
                                     f32_4 %168 = OpLoad %167 
                                     f32_4 %169 = OpVectorShuffle %168 %168 0 1 0 1 
                                     f32_4 %170 = OpFMul %166 %169 
                                     f32_4 %174 = OpFAdd %170 %173 
                                                    OpStore %164 %174 
                                     f32_3 %175 = OpLoad %82 
                                     f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32 %177 = OpDot %176 %53 
                              Private f32* %178 = OpAccessChain %46 %55 
                                                    OpStore %178 %177 
                              Private f32* %179 = OpAccessChain %46 %55 
                                       f32 %180 = OpLoad %179 
                                       f32 %181 = OpExtInst %1 13 %180 
                              Private f32* %182 = OpAccessChain %46 %55 
                                                    OpStore %182 %181 
                              Private f32* %183 = OpAccessChain %46 %55 
                                       f32 %184 = OpLoad %183 
                                       f32 %185 = OpFMul %184 %63 
                              Private f32* %186 = OpAccessChain %46 %55 
                                                    OpStore %186 %185 
                              Private f32* %187 = OpAccessChain %46 %55 
                                       f32 %188 = OpLoad %187 
                                       f32 %189 = OpExtInst %1 10 %188 
                              Private f32* %190 = OpAccessChain %82 %75 
                                                    OpStore %190 %189 
                                     f32_4 %191 = OpLoad %164 
                                     f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32 %193 = OpDot %192 %53 
                              Private f32* %194 = OpAccessChain %46 %55 
                                                    OpStore %194 %193 
                                     f32_4 %195 = OpLoad %164 
                                     f32_2 %196 = OpVectorShuffle %195 %195 2 3 
                                       f32 %197 = OpDot %196 %53 
                              Private f32* %198 = OpAccessChain %46 %86 
                                                    OpStore %198 %197 
                                     f32_3 %199 = OpLoad %46 
                                     f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                     f32_2 %201 = OpExtInst %1 13 %200 
                                     f32_3 %202 = OpLoad %46 
                                     f32_3 %203 = OpVectorShuffle %202 %201 3 4 2 
                                                    OpStore %46 %203 
                                     f32_3 %204 = OpLoad %46 
                                     f32_2 %205 = OpVectorShuffle %204 %204 0 1 
                                     f32_2 %207 = OpFMul %205 %206 
                                     f32_3 %208 = OpLoad %46 
                                     f32_3 %209 = OpVectorShuffle %208 %207 3 4 2 
                                                    OpStore %46 %209 
                              Private f32* %210 = OpAccessChain %46 %86 
                                       f32 %211 = OpLoad %210 
                                       f32 %212 = OpExtInst %1 10 %211 
                              Private f32* %213 = OpAccessChain %82 %86 
                                                    OpStore %213 %212 
                              Private f32* %214 = OpAccessChain %46 %55 
                                       f32 %215 = OpLoad %214 
                                       f32 %216 = OpExtInst %1 10 %215 
                              Private f32* %217 = OpAccessChain %46 %55 
                                                    OpStore %217 %216 
                              Private f32* %218 = OpAccessChain %46 %55 
                                       f32 %219 = OpLoad %218 
                              Private f32* %220 = OpAccessChain %46 %55 
                                       f32 %221 = OpLoad %220 
                                       f32 %222 = OpFAdd %219 %221 
                              Private f32* %223 = OpAccessChain %82 %55 
                                                    OpStore %223 %222 
                                     f32_3 %225 = OpLoad %82 
                                       f32 %230 = OpDot %225 %229 
                                                    OpStore %224 %230 
                                       f32 %232 = OpLoad %224 
                                       f32 %234 = OpFAdd %232 %233 
                                                    OpStore %231 %234 
                                       f32 %235 = OpLoad %231 
                                       f32 %236 = OpLoad %231 
                                       f32 %237 = OpFMul %235 %236 
                                                    OpStore %231 %237 
                                       f32 %239 = OpLoad %231 
                                       f32 %240 = OpLoad %231 
                                       f32 %241 = OpFMul %239 %240 
                                                    OpStore %238 %241 
                                       f32 %242 = OpLoad %238 
                                       f32 %243 = OpLoad %231 
                                       f32 %244 = OpFMul %242 %243 
                                                    OpStore %231 %244 
                              Private f32* %245 = OpAccessChain %117 %55 
                                       f32 %246 = OpLoad %245 
                                       f32 %247 = OpLoad %231 
                                       f32 %248 = OpFMul %246 %247 
                              Private f32* %249 = OpAccessChain %46 %55 
                                                    OpStore %249 %248 
                                     f32_3 %250 = OpLoad %46 
                                     f32_3 %251 = OpVectorShuffle %250 %250 0 0 0 
                                     f32_3 %252 = OpLoad %82 
                                     f32_3 %253 = OpFMul %251 %252 
                                                    OpStore %46 %253 
                                     f32_3 %256 = OpLoad %46 
                                     f32_4 %257 = OpLoad %255 
                                     f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                    OpStore %255 %258 
                               Output f32* %261 = OpAccessChain %255 %21 
                                                    OpStore %261 %259 
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