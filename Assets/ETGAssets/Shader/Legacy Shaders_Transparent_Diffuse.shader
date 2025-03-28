//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Transparent/Diffuse" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 8151
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 202
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %61 %177 %190 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %26 0 RelaxedPrecision 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 RelaxedPrecision 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 RelaxedPrecision 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpMemberDecorate %26 7 RelaxedPrecision 
                                                      OpMemberDecorate %26 7 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %51 SpecId 51 
                                                      OpDecorate %61 Location 61 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 7 
                                              %31 = OpTypePointer Uniform %7 
                                              %35 = OpTypeBool 
                                              %36 = OpTypePointer Private %35 
                                Private bool* %37 = OpVariable Private 
                                          i32 %38 = OpConstant 2 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                         bool %45 = OpConstantFalse 
                                         bool %51 = OpSpecConstantFalse 
                                          u32 %54 = OpConstant 1 
                                              %58 = OpTypePointer Private %25 
                               Private f32_3* %59 = OpVariable Private 
                                              %60 = OpTypePointer Input %25 
                                 Input f32_3* %61 = OpVariable Input 
                                          i32 %64 = OpConstant 3 
                                          i32 %65 = OpConstant 1 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %25 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %25 
                                         i32 %116 = OpConstant 4 
                                             %122 = OpTypePointer Private %6 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %127 = OpConstant 3.67402E-40 
                                Private f32* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 2 
                                         f32 %134 = OpConstant 3.67402E-40 
                                             %142 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %143 = OpTypeSampledImage %142 
                                             %144 = OpTypePointer UniformConstant %143 
 UniformConstant read_only Texture3DSampled* %145 = OpVariable UniformConstant 
                              Private f32_4* %150 = OpVariable Private 
                                         u32 %156 = OpConstant 3 
                              Private f32_3* %158 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         i32 %171 = OpConstant 6 
                                Private f32* %176 = OpVariable Private 
                                Input f32_3* %177 = OpVariable Input 
                                             %189 = OpTypePointer Output %7 
                               Output f32_4* %190 = OpVariable Output 
                                             %199 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %94 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %21 %33 
                                                      OpStore %20 %34 
                                 Uniform f32* %41 = OpAccessChain %28 %38 %39 
                                          f32 %42 = OpLoad %41 
                                         bool %44 = OpFOrdEqual %42 %43 
                                                      OpStore %37 %44 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %47 
                                              %46 = OpLabel 
                                         bool %48 = OpLoad %37 
                                                      OpSelectionMerge %50 None 
                                                      OpBranchConditional %48 %49 %50 
                                              %49 = OpLabel 
                                                      OpBranch %50 
                                              %50 = OpLabel 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %51 %52 %152 
                                              %52 = OpLabel 
                                 Uniform f32* %55 = OpAccessChain %28 %38 %54 
                                          f32 %56 = OpLoad %55 
                                         bool %57 = OpFOrdEqual %56 %43 
                                                      OpStore %37 %57 
                                        f32_3 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %28 %64 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %63 %68 
                                                      OpStore %59 %69 
                               Uniform f32_4* %71 = OpAccessChain %28 %64 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %61 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %59 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %79 = OpAccessChain %28 %64 %38 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %61 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %59 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %59 %86 
                                        f32_3 %87 = OpLoad %59 
                               Uniform f32_4* %88 = OpAccessChain %28 %64 %64 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %59 %91 
                                         bool %95 = OpLoad %37 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %59 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %61 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %28 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %28 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %54 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %59 %39 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %28 %38 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %59 %39 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %39 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %53 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %39 
                                                      OpStore %153 %43 
                                Private f32* %154 = OpAccessChain %150 %54 
                                                      OpStore %154 %43 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %43 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %43 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %28 %65 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %39 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %39 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %43 
                                Private f32* %168 = OpAccessChain %158 %39 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %28 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %28 %70 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                         f32 %182 = OpDot %178 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %184 = OpExtInst %1 40 %183 %166 
                                                      OpStore %176 %184 
                                       f32_4 %185 = OpLoad %20 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpLoad %158 
                                       f32_3 %188 = OpFMul %186 %187 
                                                      OpStore %158 %188 
                                         f32 %191 = OpLoad %176 
                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
                                       f32_3 %193 = OpLoad %158 
                                       f32_3 %194 = OpFMul %192 %193 
                                       f32_4 %195 = OpLoad %190 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %190 %196 
                                Private f32* %197 = OpAccessChain %20 %156 
                                         f32 %198 = OpLoad %197 
                                 Output f32* %200 = OpAccessChain %190 %156 
                                                      OpStore %200 %198 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 270
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %87 %99 %100 %113 %151 %261 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpMemberDecorate %85 0 BuiltIn 85 
                                                      OpMemberDecorate %85 1 BuiltIn 85 
                                                      OpMemberDecorate %85 2 BuiltIn 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Output %51 
                                Output f32_3* %53 = OpVariable Output 
                                          i32 %65 = OpConstant 9 
                                          u32 %83 = OpConstant 1 
                                              %84 = OpTypeArray %6 %83 
                                              %85 = OpTypeStruct %7 %6 %84 
                                              %86 = OpTypePointer Output %85 
         Output struct {f32_4; f32; f32[1];}* %87 = OpVariable Output 
                                              %95 = OpTypePointer Output %7 
                                              %97 = OpTypeVector %6 2 
                                              %98 = OpTypePointer Output %97 
                                Output f32_2* %99 = OpVariable Output 
                                Input f32_4* %100 = OpVariable Input 
                                         i32 %103 = OpConstant 10 
                                             %112 = OpTypePointer Input %51 
                                Input f32_3* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 8 
                                         u32 %120 = OpConstant 0 
                                             %121 = OpTypePointer Private %6 
                                         u32 %134 = OpConstant 2 
                                Private f32* %136 = OpVariable Private 
                               Output f32_3* %151 = OpVariable Output 
                                             %154 = OpTypePointer Private %51 
                              Private f32_3* %155 = OpVariable Private 
                              Private f32_4* %172 = OpVariable Private 
                              Private f32_3* %178 = OpVariable Private 
                                         i32 %184 = OpConstant 4 
                                         i32 %190 = OpConstant 5 
                                         i32 %196 = OpConstant 6 
                                         f32 %205 = OpConstant 3.67402E-40 
                                         u32 %206 = OpConstant 3 
                                         f32 %227 = OpConstant 3.67402E-40 
                                       f32_3 %228 = OpConstantComposite %227 %227 %227 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_3 %249 = OpConstantComposite %248 %248 %248 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                               Output f32_3* %261 = OpVariable Output 
                                             %264 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %30 = OpAccessChain %21 %23 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %45 %50 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                                      OpStore %53 %62 
                                        f32_4 %63 = OpLoad %45 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %21 %65 %24 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %65 %29 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %45 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %76 = OpAccessChain %21 %65 %37 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpLoad %45 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %9 %82 
                               Uniform f32_4* %88 = OpAccessChain %21 %65 %47 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %45 
                                        f32_4 %91 = OpVectorShuffle %90 %90 3 3 3 3 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpFAdd %92 %93 
                                Output f32_4* %96 = OpAccessChain %87 %29 
                                                      OpStore %96 %94 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                              Uniform f32_4* %104 = OpAccessChain %21 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFMul %102 %106 
                              Uniform f32_4* %108 = OpAccessChain %21 %103 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 2 3 
                                       f32_2 %111 = OpFAdd %107 %110 
                                                      OpStore %99 %111 
                                       f32_3 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %21 %115 %29 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %114 %118 
                                Private f32* %122 = OpAccessChain %9 %120 
                                                      OpStore %122 %119 
                                       f32_3 %123 = OpLoad %113 
                              Uniform f32_4* %124 = OpAccessChain %21 %115 %24 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %123 %126 
                                Private f32* %128 = OpAccessChain %9 %83 
                                                      OpStore %128 %127 
                                       f32_3 %129 = OpLoad %113 
                              Uniform f32_4* %130 = OpAccessChain %21 %115 %37 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                         f32 %133 = OpDot %129 %132 
                                Private f32* %135 = OpAccessChain %9 %134 
                                                      OpStore %135 %133 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                         f32 %141 = OpDot %138 %140 
                                                      OpStore %136 %141 
                                         f32 %142 = OpLoad %136 
                                         f32 %143 = OpExtInst %1 32 %142 
                                                      OpStore %136 %143 
                                         f32 %144 = OpLoad %136 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %9 %150 
                                       f32_4 %152 = OpLoad %9 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                Private f32* %156 = OpAccessChain %9 %83 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %9 %83 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFMul %157 %159 
                                Private f32* %161 = OpAccessChain %155 %120 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %9 %120 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %9 %120 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %163 %165 
                                Private f32* %167 = OpAccessChain %155 %120 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFNegate %168 
                                         f32 %170 = OpFAdd %166 %169 
                                Private f32* %171 = OpAccessChain %155 %120 
                                                      OpStore %171 %170 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 2 2 0 
                                       f32_4 %175 = OpLoad %9 
                                       f32_4 %176 = OpVectorShuffle %175 %175 0 1 2 2 
                                       f32_4 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                              Uniform f32_4* %179 = OpAccessChain %21 %47 
                                       f32_4 %180 = OpLoad %179 
                                       f32_4 %181 = OpLoad %172 
                                         f32 %182 = OpDot %180 %181 
                                Private f32* %183 = OpAccessChain %178 %120 
                                                      OpStore %183 %182 
                              Uniform f32_4* %185 = OpAccessChain %21 %184 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %172 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %178 %83 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %21 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %172 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %178 %134 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %21 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_3 %200 = OpLoad %155 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 0 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_3 %203 = OpLoad %178 
                                       f32_3 %204 = OpFAdd %202 %203 
                                                      OpStore %155 %204 
                                Private f32* %207 = OpAccessChain %9 %206 
                                                      OpStore %207 %205 
                              Uniform f32_4* %208 = OpAccessChain %21 %29 
                                       f32_4 %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %9 
                                         f32 %211 = OpDot %209 %210 
                                Private f32* %212 = OpAccessChain %178 %120 
                                                      OpStore %212 %211 
                              Uniform f32_4* %213 = OpAccessChain %21 %24 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %9 
                                         f32 %216 = OpDot %214 %215 
                                Private f32* %217 = OpAccessChain %178 %83 
                                                      OpStore %217 %216 
                              Uniform f32_4* %218 = OpAccessChain %21 %37 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %9 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %178 %134 
                                                      OpStore %222 %221 
                                       f32_3 %223 = OpLoad %155 
                                       f32_3 %224 = OpLoad %178 
                                       f32_3 %225 = OpFAdd %223 %224 
                                                      OpStore %155 %225 
                                       f32_3 %226 = OpLoad %155 
                                       f32_3 %229 = OpExtInst %1 40 %226 %228 
                                                      OpStore %155 %229 
                                       f32_3 %230 = OpLoad %155 
                                       f32_3 %231 = OpExtInst %1 30 %230 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %9 %233 
                                       f32_4 %234 = OpLoad %9 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %238 = OpFMul %235 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %9 %240 
                                       f32_4 %241 = OpLoad %9 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpExtInst %1 29 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %9 %245 
                                       f32_4 %246 = OpLoad %9 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                       f32_3 %253 = OpFAdd %250 %252 
                                       f32_4 %254 = OpLoad %9 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %9 %255 
                                       f32_4 %256 = OpLoad %9 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpExtInst %1 40 %257 %228 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore %9 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                                      OpStore %261 %263 
                                 Output f32* %265 = OpAccessChain %87 %29 %83 
                                         f32 %266 = OpLoad %265 
                                         f32 %267 = OpFNegate %266 
                                 Output f32* %268 = OpAccessChain %87 %29 %83 
                                                      OpStore %268 %267 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %61 %177 %192 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %26 0 RelaxedPrecision 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 RelaxedPrecision 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 RelaxedPrecision 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpMemberDecorate %26 7 RelaxedPrecision 
                                                      OpMemberDecorate %26 7 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %51 SpecId 51 
                                                      OpDecorate %61 Location 61 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 7 
                                              %31 = OpTypePointer Uniform %7 
                                              %35 = OpTypeBool 
                                              %36 = OpTypePointer Private %35 
                                Private bool* %37 = OpVariable Private 
                                          i32 %38 = OpConstant 2 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                         bool %45 = OpConstantFalse 
                                         bool %51 = OpSpecConstantFalse 
                                          u32 %54 = OpConstant 1 
                                              %58 = OpTypePointer Private %25 
                               Private f32_3* %59 = OpVariable Private 
                                              %60 = OpTypePointer Input %25 
                                 Input f32_3* %61 = OpVariable Input 
                                          i32 %64 = OpConstant 3 
                                          i32 %65 = OpConstant 1 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %25 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %25 
                                         i32 %116 = OpConstant 4 
                                             %122 = OpTypePointer Private %6 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %127 = OpConstant 3.67402E-40 
                                Private f32* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 2 
                                         f32 %134 = OpConstant 3.67402E-40 
                                             %142 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %143 = OpTypeSampledImage %142 
                                             %144 = OpTypePointer UniformConstant %143 
 UniformConstant read_only Texture3DSampled* %145 = OpVariable UniformConstant 
                              Private f32_4* %150 = OpVariable Private 
                                         u32 %156 = OpConstant 3 
                              Private f32_3* %158 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         i32 %171 = OpConstant 6 
                                Private f32* %176 = OpVariable Private 
                                Input f32_3* %177 = OpVariable Input 
                              Private f32_3* %189 = OpVariable Private 
                                Input f32_3* %192 = OpVariable Input 
                                             %195 = OpTypePointer Output %7 
                               Output f32_4* %196 = OpVariable Output 
                                             %207 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %94 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %21 %33 
                                                      OpStore %20 %34 
                                 Uniform f32* %41 = OpAccessChain %28 %38 %39 
                                          f32 %42 = OpLoad %41 
                                         bool %44 = OpFOrdEqual %42 %43 
                                                      OpStore %37 %44 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %47 
                                              %46 = OpLabel 
                                         bool %48 = OpLoad %37 
                                                      OpSelectionMerge %50 None 
                                                      OpBranchConditional %48 %49 %50 
                                              %49 = OpLabel 
                                                      OpBranch %50 
                                              %50 = OpLabel 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %51 %52 %152 
                                              %52 = OpLabel 
                                 Uniform f32* %55 = OpAccessChain %28 %38 %54 
                                          f32 %56 = OpLoad %55 
                                         bool %57 = OpFOrdEqual %56 %43 
                                                      OpStore %37 %57 
                                        f32_3 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %28 %64 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %63 %68 
                                                      OpStore %59 %69 
                               Uniform f32_4* %71 = OpAccessChain %28 %64 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %61 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %59 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %79 = OpAccessChain %28 %64 %38 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %61 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %59 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %59 %86 
                                        f32_3 %87 = OpLoad %59 
                               Uniform f32_4* %88 = OpAccessChain %28 %64 %64 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %59 %91 
                                         bool %95 = OpLoad %37 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %59 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %61 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %28 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %28 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %54 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %59 %39 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %28 %38 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %59 %39 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %39 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %53 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %39 
                                                      OpStore %153 %43 
                                Private f32* %154 = OpAccessChain %150 %54 
                                                      OpStore %154 %43 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %43 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %43 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %28 %65 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %39 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %39 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %43 
                                Private f32* %168 = OpAccessChain %158 %39 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %28 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %28 %70 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                         f32 %182 = OpDot %178 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %184 = OpExtInst %1 40 %183 %166 
                                                      OpStore %176 %184 
                                       f32_4 %185 = OpLoad %20 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpLoad %158 
                                       f32_3 %188 = OpFMul %186 %187 
                                                      OpStore %158 %188 
                                       f32_4 %190 = OpLoad %20 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                                      OpStore %189 %194 
                                       f32_3 %197 = OpLoad %158 
                                         f32 %198 = OpLoad %176 
                                       f32_3 %199 = OpCompositeConstruct %198 %198 %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %189 
                                       f32_3 %202 = OpFAdd %200 %201 
                                       f32_4 %203 = OpLoad %196 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                                      OpStore %196 %204 
                                Private f32* %205 = OpAccessChain %20 %156 
                                         f32 %206 = OpLoad %205 
                                 Output f32* %208 = OpAccessChain %196 %156 
                                                      OpStore %208 %206 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 398
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %116 %155 %158 %386 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 RelaxedPrecision 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 RelaxedPrecision 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 RelaxedPrecision 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 RelaxedPrecision 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 RelaxedPrecision 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpMemberDecorate %21 10 RelaxedPrecision 
                                                      OpMemberDecorate %21 10 Offset 21 
                                                      OpMemberDecorate %21 11 RelaxedPrecision 
                                                      OpMemberDecorate %21 11 Offset 21 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %88 0 BuiltIn 88 
                                                      OpMemberDecorate %88 1 BuiltIn 88 
                                                      OpMemberDecorate %88 2 BuiltIn 88 
                                                      OpDecorate %88 Block 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %386 Location 386 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 12 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 14 
                                          u32 %86 = OpConstant 1 
                                              %87 = OpTypeArray %6 %86 
                                              %88 = OpTypeStruct %7 %6 %87 
                                              %89 = OpTypePointer Output %88 
         Output struct {f32_4; f32; f32[1];}* %90 = OpVariable Output 
                                              %98 = OpTypePointer Output %7 
                                             %100 = OpTypeVector %6 2 
                                             %101 = OpTypePointer Output %100 
                               Output f32_2* %102 = OpVariable Output 
                                Input f32_4* %103 = OpVariable Input 
                                         i32 %106 = OpConstant 15 
                                             %115 = OpTypePointer Input %53 
                                Input f32_3* %116 = OpVariable Input 
                                         i32 %118 = OpConstant 13 
                                         u32 %123 = OpConstant 0 
                                             %124 = OpTypePointer Private %6 
                                         u32 %137 = OpConstant 2 
                                Private f32* %139 = OpVariable Private 
                                             %154 = OpTypePointer Output %53 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_3* %158 = OpVariable Output 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %180 = OpVariable Private 
                                         f32 %211 = OpConstant 3.67402E-40 
                                       f32_4 %212 = OpConstantComposite %211 %211 %211 %211 
                                         f32 %220 = OpConstant 3.67402E-40 
                                       f32_4 %221 = OpConstantComposite %220 %220 %220 %220 
                                         f32 %229 = OpConstant 3.67402E-40 
                                       f32_4 %230 = OpConstantComposite %229 %229 %229 %229 
                                         i32 %237 = OpConstant 4 
                                             %277 = OpTypePointer Private %53 
                              Private f32_3* %278 = OpVariable Private 
                              Private f32_4* %295 = OpVariable Private 
                              Private f32_3* %301 = OpVariable Private 
                                         i32 %302 = OpConstant 8 
                                         i32 %308 = OpConstant 9 
                                         i32 %314 = OpConstant 10 
                                         i32 %320 = OpConstant 11 
                                         u32 %329 = OpConstant 3 
                                         i32 %331 = OpConstant 5 
                                         i32 %337 = OpConstant 6 
                                         i32 %343 = OpConstant 7 
                                       f32_3 %353 = OpConstantComposite %229 %229 %229 
                                         f32 %361 = OpConstant 3.67402E-40 
                                       f32_3 %362 = OpConstantComposite %361 %361 %361 
                                         f32 %373 = OpConstant 3.67402E-40 
                                       f32_3 %374 = OpConstantComposite %373 %373 %373 
                                         f32 %376 = OpConstant 3.67402E-40 
                                       f32_3 %377 = OpConstantComposite %376 %376 %376 
                               Output f32_3* %386 = OpVariable Output 
                                             %392 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %54 = OpAccessChain %23 %25 %49 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %9 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %23 %68 %26 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %67 %70 
                                                      OpStore %65 %71 
                               Uniform f32_4* %72 = OpAccessChain %23 %68 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %47 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %65 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %65 %78 
                               Uniform f32_4* %79 = OpAccessChain %23 %68 %39 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %47 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %65 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %65 %85 
                               Uniform f32_4* %91 = OpAccessChain %23 %68 %49 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpLoad %47 
                                        f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                        f32_4 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %65 
                                        f32_4 %97 = OpFAdd %95 %96 
                                Output f32_4* %99 = OpAccessChain %90 %31 
                                                      OpStore %99 %97 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                              Uniform f32_4* %107 = OpAccessChain %23 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %105 %109 
                              Uniform f32_4* %111 = OpAccessChain %23 %106 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %102 %114 
                                       f32_3 %117 = OpLoad %116 
                              Uniform f32_4* %119 = OpAccessChain %23 %118 %31 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                         f32 %122 = OpDot %117 %121 
                                Private f32* %125 = OpAccessChain %47 %123 
                                                      OpStore %125 %122 
                                       f32_3 %126 = OpLoad %116 
                              Uniform f32_4* %127 = OpAccessChain %23 %118 %26 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %126 %129 
                                Private f32* %131 = OpAccessChain %47 %86 
                                                      OpStore %131 %130 
                                       f32_3 %132 = OpLoad %116 
                              Uniform f32_4* %133 = OpAccessChain %23 %118 %39 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %136 = OpDot %132 %135 
                                Private f32* %138 = OpAccessChain %47 %137 
                                                      OpStore %138 %136 
                                       f32_4 %140 = OpLoad %47 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_4 %142 = OpLoad %47 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                         f32 %144 = OpDot %141 %143 
                                                      OpStore %139 %144 
                                         f32 %145 = OpLoad %139 
                                         f32 %146 = OpExtInst %1 32 %145 
                                                      OpStore %139 %146 
                                         f32 %147 = OpLoad %139 
                                       f32_3 %148 = OpCompositeConstruct %147 %147 %147 
                                       f32_4 %149 = OpLoad %47 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %47 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
                                                      OpStore %47 %153 
                                       f32_4 %156 = OpLoad %47 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %155 %157 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                                      OpStore %158 %160 
                                       f32_4 %161 = OpLoad %9 
                                       f32_4 %162 = OpVectorShuffle %161 %161 0 0 0 0 
                                       f32_4 %163 = OpFNegate %162 
                              Uniform f32_4* %164 = OpAccessChain %23 %31 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFAdd %163 %165 
                                                      OpStore %65 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %168 1 1 1 1 
                                       f32_4 %170 = OpFNegate %169 
                              Uniform f32_4* %171 = OpAccessChain %23 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpFAdd %170 %172 
                                                      OpStore %167 %173 
                                       f32_4 %174 = OpLoad %9 
                                       f32_4 %175 = OpVectorShuffle %174 %174 2 2 2 2 
                                       f32_4 %176 = OpFNegate %175 
                              Uniform f32_4* %177 = OpAccessChain %23 %39 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFAdd %176 %178 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %47 
                                       f32_4 %182 = OpVectorShuffle %181 %181 1 1 1 1 
                                       f32_4 %183 = OpLoad %167 
                                       f32_4 %184 = OpFMul %182 %183 
                                                      OpStore %180 %184 
                                       f32_4 %185 = OpLoad %167 
                                       f32_4 %186 = OpLoad %167 
                                       f32_4 %187 = OpFMul %185 %186 
                                                      OpStore %167 %187 
                                       f32_4 %188 = OpLoad %65 
                                       f32_4 %189 = OpLoad %65 
                                       f32_4 %190 = OpFMul %188 %189 
                                       f32_4 %191 = OpLoad %167 
                                       f32_4 %192 = OpFAdd %190 %191 
                                                      OpStore %167 %192 
                                       f32_4 %193 = OpLoad %65 
                                       f32_4 %194 = OpLoad %47 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %180 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %65 %198 
                                       f32_4 %199 = OpLoad %9 
                                       f32_4 %200 = OpLoad %47 
                                       f32_4 %201 = OpVectorShuffle %200 %200 2 2 2 2 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %65 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %65 %204 
                                       f32_4 %205 = OpLoad %9 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpFMul %205 %206 
                                       f32_4 %208 = OpLoad %167 
                                       f32_4 %209 = OpFAdd %207 %208 
                                                      OpStore %9 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 40 %210 %212 
                                                      OpStore %9 %213 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpExtInst %1 32 %214 
                                                      OpStore %167 %215 
                                       f32_4 %216 = OpLoad %9 
                              Uniform f32_4* %217 = OpAccessChain %23 %49 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpFMul %216 %218 
                                       f32_4 %222 = OpFAdd %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %9 
                                       f32_4 %224 = OpFDiv %221 %223 
                                                      OpStore %9 %224 
                                       f32_4 %225 = OpLoad %65 
                                       f32_4 %226 = OpLoad %167 
                                       f32_4 %227 = OpFMul %225 %226 
                                                      OpStore %65 %227 
                                       f32_4 %228 = OpLoad %65 
                                       f32_4 %231 = OpExtInst %1 40 %228 %230 
                                                      OpStore %65 %231 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %65 
                                       f32_4 %234 = OpFMul %232 %233 
                                                      OpStore %9 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 1 1 1 
                              Uniform f32_4* %238 = OpAccessChain %23 %237 %26 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpFMul %236 %240 
                                       f32_4 %242 = OpLoad %65 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %65 %243 
                              Uniform f32_4* %244 = OpAccessChain %23 %237 %31 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                       f32_4 %247 = OpLoad %9 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                                       f32_3 %249 = OpFMul %246 %248 
                                       f32_4 %250 = OpLoad %65 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpFAdd %249 %251 
                                       f32_4 %253 = OpLoad %65 
                                       f32_4 %254 = OpVectorShuffle %253 %252 4 5 6 3 
                                                      OpStore %65 %254 
                              Uniform f32_4* %255 = OpAccessChain %23 %237 %39 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %9 
                                       f32_3 %259 = OpVectorShuffle %258 %258 2 2 2 
                                       f32_3 %260 = OpFMul %257 %259 
                                       f32_4 %261 = OpLoad %65 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFAdd %260 %262 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %9 %265 
                              Uniform f32_4* %266 = OpAccessChain %23 %237 %49 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_4 %269 = OpLoad %9 
                                       f32_3 %270 = OpVectorShuffle %269 %269 3 3 3 
                                       f32_3 %271 = OpFMul %268 %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFAdd %271 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %9 %276 
                                Private f32* %279 = OpAccessChain %47 %86 
                                         f32 %280 = OpLoad %279 
                                Private f32* %281 = OpAccessChain %47 %86 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFMul %280 %282 
                                Private f32* %284 = OpAccessChain %278 %123 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %47 %123 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %47 %123 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFMul %286 %288 
                                Private f32* %290 = OpAccessChain %278 %123 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFNegate %291 
                                         f32 %293 = OpFAdd %289 %292 
                                Private f32* %294 = OpAccessChain %278 %123 
                                                      OpStore %294 %293 
                                       f32_4 %296 = OpLoad %47 
                                       f32_4 %297 = OpVectorShuffle %296 %296 1 2 2 0 
                                       f32_4 %298 = OpLoad %47 
                                       f32_4 %299 = OpVectorShuffle %298 %298 0 1 2 2 
                                       f32_4 %300 = OpFMul %297 %299 
                                                      OpStore %295 %300 
                              Uniform f32_4* %303 = OpAccessChain %23 %302 
                                       f32_4 %304 = OpLoad %303 
                                       f32_4 %305 = OpLoad %295 
                                         f32 %306 = OpDot %304 %305 
                                Private f32* %307 = OpAccessChain %301 %123 
                                                      OpStore %307 %306 
                              Uniform f32_4* %309 = OpAccessChain %23 %308 
                                       f32_4 %310 = OpLoad %309 
                                       f32_4 %311 = OpLoad %295 
                                         f32 %312 = OpDot %310 %311 
                                Private f32* %313 = OpAccessChain %301 %86 
                                                      OpStore %313 %312 
                              Uniform f32_4* %315 = OpAccessChain %23 %314 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpLoad %295 
                                         f32 %318 = OpDot %316 %317 
                                Private f32* %319 = OpAccessChain %301 %137 
                                                      OpStore %319 %318 
                              Uniform f32_4* %321 = OpAccessChain %23 %320 
                                       f32_4 %322 = OpLoad %321 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                       f32_3 %324 = OpLoad %278 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 0 0 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_3 %327 = OpLoad %301 
                                       f32_3 %328 = OpFAdd %326 %327 
                                                      OpStore %278 %328 
                                Private f32* %330 = OpAccessChain %47 %329 
                                                      OpStore %330 %220 
                              Uniform f32_4* %332 = OpAccessChain %23 %331 
                                       f32_4 %333 = OpLoad %332 
                                       f32_4 %334 = OpLoad %47 
                                         f32 %335 = OpDot %333 %334 
                                Private f32* %336 = OpAccessChain %301 %123 
                                                      OpStore %336 %335 
                              Uniform f32_4* %338 = OpAccessChain %23 %337 
                                       f32_4 %339 = OpLoad %338 
                                       f32_4 %340 = OpLoad %47 
                                         f32 %341 = OpDot %339 %340 
                                Private f32* %342 = OpAccessChain %301 %86 
                                                      OpStore %342 %341 
                              Uniform f32_4* %344 = OpAccessChain %23 %343 
                                       f32_4 %345 = OpLoad %344 
                                       f32_4 %346 = OpLoad %47 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %348 = OpAccessChain %301 %137 
                                                      OpStore %348 %347 
                                       f32_3 %349 = OpLoad %278 
                                       f32_3 %350 = OpLoad %301 
                                       f32_3 %351 = OpFAdd %349 %350 
                                                      OpStore %278 %351 
                                       f32_3 %352 = OpLoad %278 
                                       f32_3 %354 = OpExtInst %1 40 %352 %353 
                                                      OpStore %278 %354 
                                       f32_3 %355 = OpLoad %278 
                                       f32_3 %356 = OpExtInst %1 30 %355 
                                       f32_4 %357 = OpLoad %47 
                                       f32_4 %358 = OpVectorShuffle %357 %356 4 5 6 3 
                                                      OpStore %47 %358 
                                       f32_4 %359 = OpLoad %47 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %47 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %47 %365 
                                       f32_4 %366 = OpLoad %47 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpExtInst %1 29 %367 
                                       f32_4 %369 = OpLoad %47 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %47 %370 
                                       f32_4 %371 = OpLoad %47 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                       f32_3 %375 = OpFMul %372 %374 
                                       f32_3 %378 = OpFAdd %375 %377 
                                       f32_4 %379 = OpLoad %47 
                                       f32_4 %380 = OpVectorShuffle %379 %378 4 5 6 3 
                                                      OpStore %47 %380 
                                       f32_4 %381 = OpLoad %47 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_3 %383 = OpExtInst %1 40 %382 %353 
                                       f32_4 %384 = OpLoad %47 
                                       f32_4 %385 = OpVectorShuffle %384 %383 4 5 6 3 
                                                      OpStore %47 %385 
                                       f32_4 %387 = OpLoad %9 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_4 %389 = OpLoad %47 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFAdd %388 %390 
                                                      OpStore %386 %391 
                                 Output f32* %393 = OpAccessChain %90 %31 %86 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFNegate %394 
                                 Output f32* %396 = OpAccessChain %90 %31 %86 
                                                      OpStore %396 %395 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %61 %177 %192 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %26 0 RelaxedPrecision 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 RelaxedPrecision 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 RelaxedPrecision 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpMemberDecorate %26 7 RelaxedPrecision 
                                                      OpMemberDecorate %26 7 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %51 SpecId 51 
                                                      OpDecorate %61 Location 61 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 7 
                                              %31 = OpTypePointer Uniform %7 
                                              %35 = OpTypeBool 
                                              %36 = OpTypePointer Private %35 
                                Private bool* %37 = OpVariable Private 
                                          i32 %38 = OpConstant 2 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                         bool %45 = OpConstantFalse 
                                         bool %51 = OpSpecConstantFalse 
                                          u32 %54 = OpConstant 1 
                                              %58 = OpTypePointer Private %25 
                               Private f32_3* %59 = OpVariable Private 
                                              %60 = OpTypePointer Input %25 
                                 Input f32_3* %61 = OpVariable Input 
                                          i32 %64 = OpConstant 3 
                                          i32 %65 = OpConstant 1 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %25 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %25 
                                         i32 %116 = OpConstant 4 
                                             %122 = OpTypePointer Private %6 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %127 = OpConstant 3.67402E-40 
                                Private f32* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 2 
                                         f32 %134 = OpConstant 3.67402E-40 
                                             %142 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %143 = OpTypeSampledImage %142 
                                             %144 = OpTypePointer UniformConstant %143 
 UniformConstant read_only Texture3DSampled* %145 = OpVariable UniformConstant 
                              Private f32_4* %150 = OpVariable Private 
                                         u32 %156 = OpConstant 3 
                              Private f32_3* %158 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         i32 %171 = OpConstant 6 
                                Private f32* %176 = OpVariable Private 
                                Input f32_3* %177 = OpVariable Input 
                              Private f32_3* %189 = OpVariable Private 
                                Input f32_3* %192 = OpVariable Input 
                                             %195 = OpTypePointer Output %7 
                               Output f32_4* %196 = OpVariable Output 
                                             %207 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %94 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %21 %33 
                                                      OpStore %20 %34 
                                 Uniform f32* %41 = OpAccessChain %28 %38 %39 
                                          f32 %42 = OpLoad %41 
                                         bool %44 = OpFOrdEqual %42 %43 
                                                      OpStore %37 %44 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %47 
                                              %46 = OpLabel 
                                         bool %48 = OpLoad %37 
                                                      OpSelectionMerge %50 None 
                                                      OpBranchConditional %48 %49 %50 
                                              %49 = OpLabel 
                                                      OpBranch %50 
                                              %50 = OpLabel 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %51 %52 %152 
                                              %52 = OpLabel 
                                 Uniform f32* %55 = OpAccessChain %28 %38 %54 
                                          f32 %56 = OpLoad %55 
                                         bool %57 = OpFOrdEqual %56 %43 
                                                      OpStore %37 %57 
                                        f32_3 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %28 %64 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %63 %68 
                                                      OpStore %59 %69 
                               Uniform f32_4* %71 = OpAccessChain %28 %64 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %61 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %59 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %79 = OpAccessChain %28 %64 %38 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %61 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %59 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %59 %86 
                                        f32_3 %87 = OpLoad %59 
                               Uniform f32_4* %88 = OpAccessChain %28 %64 %64 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %59 %91 
                                         bool %95 = OpLoad %37 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %59 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %61 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %28 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %28 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %54 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %59 %39 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %28 %38 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %59 %39 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %39 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %53 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %39 
                                                      OpStore %153 %43 
                                Private f32* %154 = OpAccessChain %150 %54 
                                                      OpStore %154 %43 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %43 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %43 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %28 %65 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %39 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %39 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %43 
                                Private f32* %168 = OpAccessChain %158 %39 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %28 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %28 %70 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                         f32 %182 = OpDot %178 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %184 = OpExtInst %1 40 %183 %166 
                                                      OpStore %176 %184 
                                       f32_4 %185 = OpLoad %20 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpLoad %158 
                                       f32_3 %188 = OpFMul %186 %187 
                                                      OpStore %158 %188 
                                       f32_4 %190 = OpLoad %20 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                                      OpStore %189 %194 
                                       f32_3 %197 = OpLoad %158 
                                         f32 %198 = OpLoad %176 
                                       f32_3 %199 = OpCompositeConstruct %198 %198 %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %189 
                                       f32_3 %202 = OpFAdd %200 %201 
                                       f32_4 %203 = OpLoad %196 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                                      OpStore %196 %204 
                                Private f32* %205 = OpAccessChain %20 %156 
                                         f32 %206 = OpLoad %205 
                                 Output f32* %208 = OpAccessChain %196 %156 
                                                      OpStore %208 %206 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 65905
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat12 = u_xlat12 * u_xlat10_2.w;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 269
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %246 %257 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %105 SpecId 105 
                                                      OpDecorate %201 DescriptorSet 201 
                                                      OpDecorate %201 Binding 201 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %228 DescriptorSet 228 
                                                      OpDecorate %228 Binding 228 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 Location 246 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %257 Location 257 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %14 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %54 = OpConstant 8 
                               Private f32_3* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 7 
                                          i32 %62 = OpConstant 1 
                                          i32 %75 = OpConstant 2 
                                          i32 %85 = OpConstant 3 
                                              %90 = OpTypeBool 
                                              %91 = OpTypePointer Private %90 
                                Private bool* %92 = OpVariable Private 
                                          u32 %93 = OpConstant 0 
                                              %94 = OpTypePointer Uniform %6 
                                          f32 %97 = OpConstant 3.67402E-40 
                                         bool %99 = OpConstantFalse 
                                        bool %105 = OpSpecConstantFalse 
                                         u32 %108 = OpConstant 1 
                              Private f32_4* %112 = OpVariable Private 
                                             %151 = OpTypePointer Function %7 
                                         i32 %165 = OpConstant 5 
                                             %166 = OpTypePointer Uniform %7 
                                         i32 %175 = OpConstant 4 
                                         f32 %183 = OpConstant 3.67402E-40 
                                         f32 %185 = OpConstant 3.67402E-40 
                                Private f32* %187 = OpVariable Private 
                                         u32 %188 = OpConstant 2 
                                         f32 %191 = OpConstant 3.67402E-40 
                                             %198 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %199 = OpTypeSampledImage %198 
                                             %200 = OpTypePointer UniformConstant %199 
 UniformConstant read_only Texture3DSampled* %201 = OpVariable UniformConstant 
                              Private f32_4* %206 = OpVariable Private 
                                         u32 %212 = OpConstant 3 
                              Private f32_3* %214 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %228 = OpVariable UniformConstant 
                                         i32 %240 = OpConstant 6 
                                Private f32* %245 = OpVariable Private 
                                Input f32_3* %246 = OpVariable Input 
                                             %256 = OpTypePointer Output %14 
                               Output f32_4* %257 = OpVariable Output 
                                             %266 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %152 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                        f32_4 %53 = OpLoad %41 
                               Uniform f32_4* %55 = OpAccessChain %21 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFMul %53 %56 
                                                      OpStore %52 %57 
                                        f32_3 %59 = OpLoad %11 
                                        f32_3 %60 = OpVectorShuffle %59 %59 1 1 1 
                               Uniform f32_4* %63 = OpAccessChain %21 %61 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFMul %60 %65 
                                                      OpStore %58 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %61 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpLoad %11 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 0 0 
                                        f32_3 %72 = OpFMul %69 %71 
                                        f32_3 %73 = OpLoad %58 
                                        f32_3 %74 = OpFAdd %72 %73 
                                                      OpStore %58 %74 
                               Uniform f32_4* %76 = OpAccessChain %21 %61 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpLoad %11 
                                        f32_3 %80 = OpVectorShuffle %79 %79 2 2 2 
                                        f32_3 %81 = OpFMul %78 %80 
                                        f32_3 %82 = OpLoad %58 
                                        f32_3 %83 = OpFAdd %81 %82 
                                                      OpStore %58 %83 
                                        f32_3 %84 = OpLoad %58 
                               Uniform f32_4* %86 = OpAccessChain %21 %61 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpFAdd %84 %88 
                                                      OpStore %58 %89 
                                 Uniform f32* %95 = OpAccessChain %21 %75 %93 
                                          f32 %96 = OpLoad %95 
                                         bool %98 = OpFOrdEqual %96 %97 
                                                      OpStore %92 %98 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                        bool %102 = OpLoad %92 
                                                      OpSelectionMerge %104 None 
                                                      OpBranchConditional %102 %103 %104 
                                             %103 = OpLabel 
                                                      OpBranch %104 
                                             %104 = OpLabel 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %208 
                                             %106 = OpLabel 
                                Uniform f32* %109 = OpAccessChain %21 %75 %108 
                                         f32 %110 = OpLoad %109 
                                        bool %111 = OpFOrdEqual %110 %97 
                                                      OpStore %92 %111 
                                       f32_3 %113 = OpLoad %11 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %21 %85 %62 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %112 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %112 %120 
                              Uniform f32_4* %121 = OpAccessChain %21 %85 %23 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpLoad %11 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %112 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %112 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %112 %131 
                              Uniform f32_4* %132 = OpAccessChain %21 %85 %75 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpLoad %11 
                                       f32_3 %136 = OpVectorShuffle %135 %135 2 2 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %112 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %112 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %112 %142 
                                       f32_4 %143 = OpLoad %112 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %21 %85 %85 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %144 %147 
                                       f32_4 %149 = OpLoad %112 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %112 %150 
                                        bool %153 = OpLoad %92 
                                                      OpSelectionMerge %155 None 
                                                      OpBranchConditional %153 %154 %158 
                                             %154 = OpLabel 
                                       f32_4 %156 = OpLoad %112 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %152 %157 
                                                      OpBranch %155 
                                             %158 = OpLabel 
                                       f32_3 %159 = OpLoad %11 
                                                      OpStore %152 %159 
                                                      OpBranch %155 
                                             %155 = OpLabel 
                                       f32_3 %160 = OpLoad %152 
                                       f32_4 %161 = OpLoad %112 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %112 %162 
                                       f32_4 %163 = OpLoad %112 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_3* %167 = OpAccessChain %21 %165 
                                       f32_3 %168 = OpLoad %167 
                                       f32_3 %169 = OpFNegate %168 
                                       f32_3 %170 = OpFAdd %164 %169 
                                       f32_4 %171 = OpLoad %112 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %112 %172 
                                       f32_4 %173 = OpLoad %112 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %21 %175 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFMul %174 %177 
                                       f32_4 %179 = OpLoad %112 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 4 5 6 
                                                      OpStore %112 %180 
                                Private f32* %181 = OpAccessChain %112 %108 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                         f32 %186 = OpFAdd %184 %185 
                                                      OpStore %30 %186 
                                Uniform f32* %189 = OpAccessChain %21 %75 %188 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %193 = OpFAdd %192 %185 
                                                      OpStore %187 %193 
                                         f32 %194 = OpLoad %30 
                                         f32 %195 = OpLoad %187 
                                         f32 %196 = OpExtInst %1 40 %194 %195 
                                Private f32* %197 = OpAccessChain %112 %93 
                                                      OpStore %197 %196 
                  read_only Texture3DSampled %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %112 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
                                       f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                      OpStore %112 %205 
                                       f32_4 %207 = OpLoad %112 
                                                      OpStore %206 %207 
                                                      OpBranch %107 
                                             %208 = OpLabel 
                                Private f32* %209 = OpAccessChain %206 %93 
                                                      OpStore %209 %97 
                                Private f32* %210 = OpAccessChain %206 %108 
                                                      OpStore %210 %97 
                                Private f32* %211 = OpAccessChain %206 %188 
                                                      OpStore %211 %97 
                                Private f32* %213 = OpAccessChain %206 %212 
                                                      OpStore %213 %97 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_4 %215 = OpLoad %206 
                              Uniform f32_4* %216 = OpAccessChain %21 %62 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                Private f32* %219 = OpAccessChain %214 %93 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %214 %93 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpExtInst %1 43 %221 %222 %97 
                                Private f32* %224 = OpAccessChain %214 %93 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %58 
                                       f32_3 %226 = OpLoad %58 
                                         f32 %227 = OpDot %225 %226 
                                                      OpStore %30 %227 
                  read_only Texture2DSampled %229 = OpLoad %228 
                                         f32 %230 = OpLoad %30 
                                       f32_2 %231 = OpCompositeConstruct %230 %230 
                                       f32_4 %232 = OpImageSampleImplicitLod %229 %231 
                                         f32 %233 = OpCompositeExtract %232 3 
                                                      OpStore %30 %233 
                                Private f32* %234 = OpAccessChain %214 %93 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpLoad %30 
                                         f32 %237 = OpFMul %235 %236 
                                                      OpStore %30 %237 
                                         f32 %238 = OpLoad %30 
                                       f32_3 %239 = OpCompositeConstruct %238 %238 %238 
                              Uniform f32_4* %241 = OpAccessChain %21 %240 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFMul %239 %243 
                                                      OpStore %214 %244 
                                       f32_3 %247 = OpLoad %246 
                                       f32_3 %248 = OpLoad %9 
                                         f32 %249 = OpDot %247 %248 
                                                      OpStore %245 %249 
                                         f32 %250 = OpLoad %245 
                                         f32 %251 = OpExtInst %1 40 %250 %222 
                                                      OpStore %245 %251 
                                       f32_4 %252 = OpLoad %52 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpLoad %214 
                                       f32_3 %255 = OpFMul %253 %254 
                                                      OpStore %214 %255 
                                         f32 %258 = OpLoad %245 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpLoad %214 
                                       f32_3 %261 = OpFMul %259 %260 
                                       f32_4 %262 = OpLoad %257 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %257 %263 
                                Private f32* %264 = OpAccessChain %52 %212 
                                         f32 %265 = OpLoad %264 
                                 Output f32* %267 = OpAccessChain %257 %212 
                                                      OpStore %267 %265 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 202
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %61 %177 %190 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %26 0 RelaxedPrecision 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 RelaxedPrecision 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 RelaxedPrecision 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpMemberDecorate %26 7 RelaxedPrecision 
                                                      OpMemberDecorate %26 7 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %51 SpecId 51 
                                                      OpDecorate %61 Location 61 
                                                      OpDecorate %145 DescriptorSet 145 
                                                      OpDecorate %145 Binding 145 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %7 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 7 
                                              %31 = OpTypePointer Uniform %7 
                                              %35 = OpTypeBool 
                                              %36 = OpTypePointer Private %35 
                                Private bool* %37 = OpVariable Private 
                                          i32 %38 = OpConstant 2 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Uniform %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                         bool %45 = OpConstantFalse 
                                         bool %51 = OpSpecConstantFalse 
                                          u32 %54 = OpConstant 1 
                                              %58 = OpTypePointer Private %25 
                               Private f32_3* %59 = OpVariable Private 
                                              %60 = OpTypePointer Input %25 
                                 Input f32_3* %61 = OpVariable Input 
                                          i32 %64 = OpConstant 3 
                                          i32 %65 = OpConstant 1 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %25 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %25 
                                         i32 %116 = OpConstant 4 
                                             %122 = OpTypePointer Private %6 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %127 = OpConstant 3.67402E-40 
                                Private f32* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 2 
                                         f32 %134 = OpConstant 3.67402E-40 
                                             %142 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %143 = OpTypeSampledImage %142 
                                             %144 = OpTypePointer UniformConstant %143 
 UniformConstant read_only Texture3DSampled* %145 = OpVariable UniformConstant 
                              Private f32_4* %150 = OpVariable Private 
                                         u32 %156 = OpConstant 3 
                              Private f32_3* %158 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         i32 %171 = OpConstant 6 
                                Private f32* %176 = OpVariable Private 
                                Input f32_3* %177 = OpVariable Input 
                                             %189 = OpTypePointer Output %7 
                               Output f32_4* %190 = OpVariable Output 
                                             %199 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %94 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %21 %33 
                                                      OpStore %20 %34 
                                 Uniform f32* %41 = OpAccessChain %28 %38 %39 
                                          f32 %42 = OpLoad %41 
                                         bool %44 = OpFOrdEqual %42 %43 
                                                      OpStore %37 %44 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %47 
                                              %46 = OpLabel 
                                         bool %48 = OpLoad %37 
                                                      OpSelectionMerge %50 None 
                                                      OpBranchConditional %48 %49 %50 
                                              %49 = OpLabel 
                                                      OpBranch %50 
                                              %50 = OpLabel 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                                      OpSelectionMerge %53 None 
                                                      OpBranchConditional %51 %52 %152 
                                              %52 = OpLabel 
                                 Uniform f32* %55 = OpAccessChain %28 %38 %54 
                                          f32 %56 = OpLoad %55 
                                         bool %57 = OpFOrdEqual %56 %43 
                                                      OpStore %37 %57 
                                        f32_3 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %28 %64 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %63 %68 
                                                      OpStore %59 %69 
                               Uniform f32_4* %71 = OpAccessChain %28 %64 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %61 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %59 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %79 = OpAccessChain %28 %64 %38 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %61 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %59 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %59 %86 
                                        f32_3 %87 = OpLoad %59 
                               Uniform f32_4* %88 = OpAccessChain %28 %64 %64 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %59 %91 
                                         bool %95 = OpLoad %37 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %59 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %61 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %28 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %28 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %54 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %59 %39 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %28 %38 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %59 %39 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %39 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %53 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %39 
                                                      OpStore %153 %43 
                                Private f32* %154 = OpAccessChain %150 %54 
                                                      OpStore %154 %43 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %43 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %43 
                                                      OpBranch %53 
                                              %53 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %28 %65 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %39 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %39 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %43 
                                Private f32* %168 = OpAccessChain %158 %39 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %28 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %28 %70 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                         f32 %182 = OpDot %178 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %184 = OpExtInst %1 40 %183 %166 
                                                      OpStore %176 %184 
                                       f32_4 %185 = OpLoad %20 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpLoad %158 
                                       f32_3 %188 = OpFMul %186 %187 
                                                      OpStore %158 %188 
                                         f32 %191 = OpLoad %176 
                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
                                       f32_3 %193 = OpLoad %158 
                                       f32_3 %194 = OpFMul %192 %193 
                                       f32_4 %195 = OpLoad %190 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %190 %196 
                                Private f32* %197 = OpAccessChain %20 %156 
                                         f32 %198 = OpLoad %197 
                                 Output f32* %200 = OpAccessChain %190 %156 
                                                      OpStore %200 %198 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec2 u_xlat8;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat8.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlatb3 = 0.0<u_xlat2.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat10_4 = texture(_LightTexture0, u_xlat8.xy);
    u_xlat17 = u_xlat3.x * u_xlat10_4.w;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat2.x = u_xlat17 * u_xlat10_3.w;
    u_xlat15 = u_xlat15 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 300
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %277 %288 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %101 SpecId 101 
                                                      OpDecorate %197 DescriptorSet 197 
                                                      OpDecorate %197 Binding 197 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 Location 277 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 Location 288 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %14 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %54 = OpConstant 8 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 7 
                                          i32 %62 = OpConstant 1 
                                          i32 %73 = OpConstant 2 
                                          i32 %82 = OpConstant 3 
                                              %86 = OpTypeBool 
                                              %87 = OpTypePointer Private %86 
                                Private bool* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 0 
                                              %90 = OpTypePointer Uniform %6 
                                          f32 %93 = OpConstant 3.67402E-40 
                                         bool %95 = OpConstantFalse 
                                        bool %101 = OpSpecConstantFalse 
                                         u32 %104 = OpConstant 1 
                              Private f32_4* %108 = OpVariable Private 
                                             %147 = OpTypePointer Function %7 
                                         i32 %161 = OpConstant 5 
                                             %162 = OpTypePointer Uniform %7 
                                         i32 %171 = OpConstant 4 
                                         f32 %179 = OpConstant 3.67402E-40 
                                         f32 %181 = OpConstant 3.67402E-40 
                                Private f32* %183 = OpVariable Private 
                                         u32 %184 = OpConstant 2 
                                         f32 %187 = OpConstant 3.67402E-40 
                                             %194 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %195 = OpTypeSampledImage %194 
                                             %196 = OpTypePointer UniformConstant %195 
 UniformConstant read_only Texture3DSampled* %197 = OpVariable UniformConstant 
                              Private f32_4* %202 = OpVariable Private 
                                         u32 %208 = OpConstant 3 
                              Private f32_3* %210 = OpVariable Private 
                                         f32 %218 = OpConstant 3.67402E-40 
                                Private f32* %224 = OpVariable Private 
                                             %225 = OpTypePointer Function %6 
                                             %232 = OpTypePointer Private %47 
                              Private f32_2* %233 = OpVariable Private 
                                       f32_2 %240 = OpConstantComposite %187 %187 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %255 = OpVariable UniformConstant 
                                         i32 %271 = OpConstant 6 
                                Private f32* %276 = OpVariable Private 
                                Input f32_3* %277 = OpVariable Input 
                                             %287 = OpTypePointer Output %14 
                               Output f32_4* %288 = OpVariable Output 
                                             %297 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %148 = OpVariable Function 
                               Function f32* %226 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                        f32_4 %53 = OpLoad %41 
                               Uniform f32_4* %55 = OpAccessChain %21 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFMul %53 %56 
                                                      OpStore %52 %57 
                                        f32_3 %59 = OpLoad %11 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %63 = OpAccessChain %21 %61 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %60 %64 
                                                      OpStore %58 %65 
                               Uniform f32_4* %66 = OpAccessChain %21 %61 %23 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpLoad %11 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %58 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %58 %72 
                               Uniform f32_4* %74 = OpAccessChain %21 %61 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpLoad %11 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %58 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %58 %80 
                                        f32_4 %81 = OpLoad %58 
                               Uniform f32_4* %83 = OpAccessChain %21 %61 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %81 %84 
                                                      OpStore %58 %85 
                                 Uniform f32* %91 = OpAccessChain %21 %73 %89 
                                          f32 %92 = OpLoad %91 
                                         bool %94 = OpFOrdEqual %92 %93 
                                                      OpStore %88 %94 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %97 
                                              %96 = OpLabel 
                                         bool %98 = OpLoad %88 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %100 
                                              %99 = OpLabel 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %204 
                                             %102 = OpLabel 
                                Uniform f32* %105 = OpAccessChain %21 %73 %104 
                                         f32 %106 = OpLoad %105 
                                        bool %107 = OpFOrdEqual %106 %93 
                                                      OpStore %88 %107 
                                       f32_3 %109 = OpLoad %11 
                                       f32_3 %110 = OpVectorShuffle %109 %109 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %82 %62 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %110 %113 
                                       f32_4 %115 = OpLoad %108 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %108 %116 
                              Uniform f32_4* %117 = OpAccessChain %21 %82 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpLoad %11 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 0 0 
                                       f32_3 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %108 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %122 %124 
                                       f32_4 %126 = OpLoad %108 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %108 %127 
                              Uniform f32_4* %128 = OpAccessChain %21 %82 %73 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpLoad %11 
                                       f32_3 %132 = OpVectorShuffle %131 %131 2 2 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %108 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFAdd %133 %135 
                                       f32_4 %137 = OpLoad %108 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %108 %138 
                                       f32_4 %139 = OpLoad %108 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_4* %141 = OpAccessChain %21 %82 %82 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFAdd %140 %143 
                                       f32_4 %145 = OpLoad %108 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 6 3 
                                                      OpStore %108 %146 
                                        bool %149 = OpLoad %88 
                                                      OpSelectionMerge %151 None 
                                                      OpBranchConditional %149 %150 %154 
                                             %150 = OpLabel 
                                       f32_4 %152 = OpLoad %108 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %148 %153 
                                                      OpBranch %151 
                                             %154 = OpLabel 
                                       f32_3 %155 = OpLoad %11 
                                                      OpStore %148 %155 
                                                      OpBranch %151 
                                             %151 = OpLabel 
                                       f32_3 %156 = OpLoad %148 
                                       f32_4 %157 = OpLoad %108 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %108 %158 
                                       f32_4 %159 = OpLoad %108 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                              Uniform f32_3* %163 = OpAccessChain %21 %161 
                                       f32_3 %164 = OpLoad %163 
                                       f32_3 %165 = OpFNegate %164 
                                       f32_3 %166 = OpFAdd %160 %165 
                                       f32_4 %167 = OpLoad %108 
                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 6 3 
                                                      OpStore %108 %168 
                                       f32_4 %169 = OpLoad %108 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_3* %172 = OpAccessChain %21 %171 
                                       f32_3 %173 = OpLoad %172 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_4 %175 = OpLoad %108 
                                       f32_4 %176 = OpVectorShuffle %175 %174 0 4 5 6 
                                                      OpStore %108 %176 
                                Private f32* %177 = OpAccessChain %108 %104 
                                         f32 %178 = OpLoad %177 
                                         f32 %180 = OpFMul %178 %179 
                                         f32 %182 = OpFAdd %180 %181 
                                                      OpStore %30 %182 
                                Uniform f32* %185 = OpAccessChain %21 %73 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %188 = OpFMul %186 %187 
                                         f32 %189 = OpFAdd %188 %181 
                                                      OpStore %183 %189 
                                         f32 %190 = OpLoad %30 
                                         f32 %191 = OpLoad %183 
                                         f32 %192 = OpExtInst %1 40 %190 %191 
                                Private f32* %193 = OpAccessChain %108 %89 
                                                      OpStore %193 %192 
                  read_only Texture3DSampled %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %108 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 2 3 
                                       f32_4 %201 = OpImageSampleImplicitLod %198 %200 
                                                      OpStore %108 %201 
                                       f32_4 %203 = OpLoad %108 
                                                      OpStore %202 %203 
                                                      OpBranch %103 
                                             %204 = OpLabel 
                                Private f32* %205 = OpAccessChain %202 %89 
                                                      OpStore %205 %93 
                                Private f32* %206 = OpAccessChain %202 %104 
                                                      OpStore %206 %93 
                                Private f32* %207 = OpAccessChain %202 %184 
                                                      OpStore %207 %93 
                                Private f32* %209 = OpAccessChain %202 %208 
                                                      OpStore %209 %93 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %211 = OpLoad %202 
                              Uniform f32_4* %212 = OpAccessChain %21 %62 
                                       f32_4 %213 = OpLoad %212 
                                         f32 %214 = OpDot %211 %213 
                                Private f32* %215 = OpAccessChain %210 %89 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %210 %89 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpExtInst %1 43 %217 %218 %93 
                                Private f32* %220 = OpAccessChain %210 %89 
                                                      OpStore %220 %219 
                                Private f32* %221 = OpAccessChain %58 %184 
                                         f32 %222 = OpLoad %221 
                                        bool %223 = OpFOrdLessThan %218 %222 
                                                      OpStore %88 %223 
                                        bool %227 = OpLoad %88 
                                                      OpSelectionMerge %229 None 
                                                      OpBranchConditional %227 %228 %230 
                                             %228 = OpLabel 
                                                      OpStore %226 %93 
                                                      OpBranch %229 
                                             %230 = OpLabel 
                                                      OpStore %226 %218 
                                                      OpBranch %229 
                                             %229 = OpLabel 
                                         f32 %231 = OpLoad %226 
                                                      OpStore %224 %231 
                                       f32_4 %234 = OpLoad %58 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                       f32_4 %236 = OpLoad %58 
                                       f32_2 %237 = OpVectorShuffle %236 %236 3 3 
                                       f32_2 %238 = OpFDiv %235 %237 
                                                      OpStore %233 %238 
                                       f32_2 %239 = OpLoad %233 
                                       f32_2 %241 = OpFAdd %239 %240 
                                                      OpStore %233 %241 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_2 %244 = OpLoad %233 
                                       f32_4 %245 = OpImageSampleImplicitLod %243 %244 
                                         f32 %246 = OpCompositeExtract %245 3 
                                                      OpStore %30 %246 
                                         f32 %247 = OpLoad %30 
                                         f32 %248 = OpLoad %224 
                                         f32 %249 = OpFMul %247 %248 
                                                      OpStore %224 %249 
                                       f32_4 %250 = OpLoad %58 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_4 %252 = OpLoad %58 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                         f32 %254 = OpDot %251 %253 
                                                      OpStore %30 %254 
                  read_only Texture2DSampled %256 = OpLoad %255 
                                         f32 %257 = OpLoad %30 
                                       f32_2 %258 = OpCompositeConstruct %257 %257 
                                       f32_4 %259 = OpImageSampleImplicitLod %256 %258 
                                         f32 %260 = OpCompositeExtract %259 3 
                                                      OpStore %30 %260 
                                         f32 %261 = OpLoad %30 
                                         f32 %262 = OpLoad %224 
                                         f32 %263 = OpFMul %261 %262 
                                                      OpStore %224 %263 
                                Private f32* %264 = OpAccessChain %210 %89 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpLoad %224 
                                         f32 %267 = OpFMul %265 %266 
                                Private f32* %268 = OpAccessChain %210 %89 
                                                      OpStore %268 %267 
                                       f32_3 %269 = OpLoad %210 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 0 0 
                              Uniform f32_4* %272 = OpAccessChain %21 %271 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFMul %270 %274 
                                                      OpStore %210 %275 
                                       f32_3 %278 = OpLoad %277 
                                       f32_3 %279 = OpLoad %9 
                                         f32 %280 = OpDot %278 %279 
                                                      OpStore %276 %280 
                                         f32 %281 = OpLoad %276 
                                         f32 %282 = OpExtInst %1 40 %281 %218 
                                                      OpStore %276 %282 
                                       f32_4 %283 = OpLoad %52 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                       f32_3 %285 = OpLoad %210 
                                       f32_3 %286 = OpFMul %284 %285 
                                                      OpStore %210 %286 
                                         f32 %289 = OpLoad %276 
                                       f32_3 %290 = OpCompositeConstruct %289 %289 %289 
                                       f32_3 %291 = OpLoad %210 
                                       f32_3 %292 = OpFMul %290 %291 
                                       f32_4 %293 = OpLoad %288 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %288 %294 
                                Private f32* %295 = OpAccessChain %52 %208 
                                         f32 %296 = OpLoad %295 
                                 Output f32* %298 = OpAccessChain %288 %208 
                                                      OpStore %298 %296 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat14));
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat12 = u_xlat12 * u_xlat16_2;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 282
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %259 %270 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %105 SpecId 105 
                                                      OpDecorate %201 DescriptorSet 201 
                                                      OpDecorate %201 Binding 201 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %228 DescriptorSet 228 
                                                      OpDecorate %228 Binding 228 
                                                      OpDecorate %237 DescriptorSet 237 
                                                      OpDecorate %237 Binding 237 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %270 Location 270 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %14 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %54 = OpConstant 8 
                               Private f32_3* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 7 
                                          i32 %62 = OpConstant 1 
                                          i32 %75 = OpConstant 2 
                                          i32 %85 = OpConstant 3 
                                              %90 = OpTypeBool 
                                              %91 = OpTypePointer Private %90 
                                Private bool* %92 = OpVariable Private 
                                          u32 %93 = OpConstant 0 
                                              %94 = OpTypePointer Uniform %6 
                                          f32 %97 = OpConstant 3.67402E-40 
                                         bool %99 = OpConstantFalse 
                                        bool %105 = OpSpecConstantFalse 
                                         u32 %108 = OpConstant 1 
                              Private f32_4* %112 = OpVariable Private 
                                             %151 = OpTypePointer Function %7 
                                         i32 %165 = OpConstant 5 
                                             %166 = OpTypePointer Uniform %7 
                                         i32 %175 = OpConstant 4 
                                         f32 %183 = OpConstant 3.67402E-40 
                                         f32 %185 = OpConstant 3.67402E-40 
                                Private f32* %187 = OpVariable Private 
                                         u32 %188 = OpConstant 2 
                                         f32 %191 = OpConstant 3.67402E-40 
                                             %198 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %199 = OpTypeSampledImage %198 
                                             %200 = OpTypePointer UniformConstant %199 
 UniformConstant read_only Texture3DSampled* %201 = OpVariable UniformConstant 
                              Private f32_4* %206 = OpVariable Private 
                                         u32 %212 = OpConstant 3 
                              Private f32_3* %214 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %228 = OpVariable UniformConstant 
                                             %234 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %235 = OpTypeSampledImage %234 
                                             %236 = OpTypePointer UniformConstant %235 
UniformConstant read_only TextureCubeSampled* %237 = OpVariable UniformConstant 
                                         i32 %253 = OpConstant 6 
                                Private f32* %258 = OpVariable Private 
                                Input f32_3* %259 = OpVariable Input 
                                             %269 = OpTypePointer Output %14 
                               Output f32_4* %270 = OpVariable Output 
                                             %279 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %152 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                        f32_4 %53 = OpLoad %41 
                               Uniform f32_4* %55 = OpAccessChain %21 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFMul %53 %56 
                                                      OpStore %52 %57 
                                        f32_3 %59 = OpLoad %11 
                                        f32_3 %60 = OpVectorShuffle %59 %59 1 1 1 
                               Uniform f32_4* %63 = OpAccessChain %21 %61 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_3 %66 = OpFMul %60 %65 
                                                      OpStore %58 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %61 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpLoad %11 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 0 0 
                                        f32_3 %72 = OpFMul %69 %71 
                                        f32_3 %73 = OpLoad %58 
                                        f32_3 %74 = OpFAdd %72 %73 
                                                      OpStore %58 %74 
                               Uniform f32_4* %76 = OpAccessChain %21 %61 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpLoad %11 
                                        f32_3 %80 = OpVectorShuffle %79 %79 2 2 2 
                                        f32_3 %81 = OpFMul %78 %80 
                                        f32_3 %82 = OpLoad %58 
                                        f32_3 %83 = OpFAdd %81 %82 
                                                      OpStore %58 %83 
                                        f32_3 %84 = OpLoad %58 
                               Uniform f32_4* %86 = OpAccessChain %21 %61 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpFAdd %84 %88 
                                                      OpStore %58 %89 
                                 Uniform f32* %95 = OpAccessChain %21 %75 %93 
                                          f32 %96 = OpLoad %95 
                                         bool %98 = OpFOrdEqual %96 %97 
                                                      OpStore %92 %98 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                        bool %102 = OpLoad %92 
                                                      OpSelectionMerge %104 None 
                                                      OpBranchConditional %102 %103 %104 
                                             %103 = OpLabel 
                                                      OpBranch %104 
                                             %104 = OpLabel 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %208 
                                             %106 = OpLabel 
                                Uniform f32* %109 = OpAccessChain %21 %75 %108 
                                         f32 %110 = OpLoad %109 
                                        bool %111 = OpFOrdEqual %110 %97 
                                                      OpStore %92 %111 
                                       f32_3 %113 = OpLoad %11 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %21 %85 %62 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %112 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %112 %120 
                              Uniform f32_4* %121 = OpAccessChain %21 %85 %23 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpLoad %11 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %112 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %112 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %112 %131 
                              Uniform f32_4* %132 = OpAccessChain %21 %85 %75 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpLoad %11 
                                       f32_3 %136 = OpVectorShuffle %135 %135 2 2 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %112 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %112 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %112 %142 
                                       f32_4 %143 = OpLoad %112 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %21 %85 %85 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %144 %147 
                                       f32_4 %149 = OpLoad %112 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %112 %150 
                                        bool %153 = OpLoad %92 
                                                      OpSelectionMerge %155 None 
                                                      OpBranchConditional %153 %154 %158 
                                             %154 = OpLabel 
                                       f32_4 %156 = OpLoad %112 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %152 %157 
                                                      OpBranch %155 
                                             %158 = OpLabel 
                                       f32_3 %159 = OpLoad %11 
                                                      OpStore %152 %159 
                                                      OpBranch %155 
                                             %155 = OpLabel 
                                       f32_3 %160 = OpLoad %152 
                                       f32_4 %161 = OpLoad %112 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %112 %162 
                                       f32_4 %163 = OpLoad %112 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_3* %167 = OpAccessChain %21 %165 
                                       f32_3 %168 = OpLoad %167 
                                       f32_3 %169 = OpFNegate %168 
                                       f32_3 %170 = OpFAdd %164 %169 
                                       f32_4 %171 = OpLoad %112 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
                                                      OpStore %112 %172 
                                       f32_4 %173 = OpLoad %112 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %21 %175 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFMul %174 %177 
                                       f32_4 %179 = OpLoad %112 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 4 5 6 
                                                      OpStore %112 %180 
                                Private f32* %181 = OpAccessChain %112 %108 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                         f32 %186 = OpFAdd %184 %185 
                                                      OpStore %30 %186 
                                Uniform f32* %189 = OpAccessChain %21 %75 %188 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %193 = OpFAdd %192 %185 
                                                      OpStore %187 %193 
                                         f32 %194 = OpLoad %30 
                                         f32 %195 = OpLoad %187 
                                         f32 %196 = OpExtInst %1 40 %194 %195 
                                Private f32* %197 = OpAccessChain %112 %93 
                                                      OpStore %197 %196 
                  read_only Texture3DSampled %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %112 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
                                       f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                      OpStore %112 %205 
                                       f32_4 %207 = OpLoad %112 
                                                      OpStore %206 %207 
                                                      OpBranch %107 
                                             %208 = OpLabel 
                                Private f32* %209 = OpAccessChain %206 %93 
                                                      OpStore %209 %97 
                                Private f32* %210 = OpAccessChain %206 %108 
                                                      OpStore %210 %97 
                                Private f32* %211 = OpAccessChain %206 %188 
                                                      OpStore %211 %97 
                                Private f32* %213 = OpAccessChain %206 %212 
                                                      OpStore %213 %97 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_4 %215 = OpLoad %206 
                              Uniform f32_4* %216 = OpAccessChain %21 %62 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                Private f32* %219 = OpAccessChain %214 %93 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %214 %93 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpExtInst %1 43 %221 %222 %97 
                                Private f32* %224 = OpAccessChain %214 %93 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %58 
                                       f32_3 %226 = OpLoad %58 
                                         f32 %227 = OpDot %225 %226 
                                                      OpStore %30 %227 
                  read_only Texture2DSampled %229 = OpLoad %228 
                                         f32 %230 = OpLoad %30 
                                       f32_2 %231 = OpCompositeConstruct %230 %230 
                                       f32_4 %232 = OpImageSampleImplicitLod %229 %231 
                                         f32 %233 = OpCompositeExtract %232 3 
                                                      OpStore %30 %233 
                read_only TextureCubeSampled %238 = OpLoad %237 
                                       f32_3 %239 = OpLoad %58 
                                       f32_4 %240 = OpImageSampleImplicitLod %238 %239 
                                         f32 %241 = OpCompositeExtract %240 3 
                                Private f32* %242 = OpAccessChain %58 %93 
                                                      OpStore %242 %241 
                                         f32 %243 = OpLoad %30 
                                Private f32* %244 = OpAccessChain %58 %93 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFMul %243 %245 
                                                      OpStore %30 %246 
                                Private f32* %247 = OpAccessChain %214 %93 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpLoad %30 
                                         f32 %250 = OpFMul %248 %249 
                                                      OpStore %30 %250 
                                         f32 %251 = OpLoad %30 
                                       f32_3 %252 = OpCompositeConstruct %251 %251 %251 
                              Uniform f32_4* %254 = OpAccessChain %21 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFMul %252 %256 
                                                      OpStore %214 %257 
                                       f32_3 %260 = OpLoad %259 
                                       f32_3 %261 = OpLoad %9 
                                         f32 %262 = OpDot %260 %261 
                                                      OpStore %258 %262 
                                         f32 %263 = OpLoad %258 
                                         f32 %264 = OpExtInst %1 40 %263 %222 
                                                      OpStore %258 %264 
                                       f32_4 %265 = OpLoad %52 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpLoad %214 
                                       f32_3 %268 = OpFMul %266 %267 
                                                      OpStore %214 %268 
                                         f32 %271 = OpLoad %258 
                                       f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                       f32_3 %273 = OpLoad %214 
                                       f32_3 %274 = OpFMul %272 %273 
                                       f32_4 %275 = OpLoad %270 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %270 %276 
                                Private f32* %277 = OpAccessChain %52 %212 
                                         f32 %278 = OpLoad %277 
                                 Output f32* %280 = OpAccessChain %270 %212 
                                                      OpStore %280 %278 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _Color;
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb7 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb7){
        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb7)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat7 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat1.x = u_xlat7 * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %140 Location 140 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                             %109 = OpTypePointer Input %50 
                                Input f32_3* %110 = OpVariable Input 
                                         u32 %116 = OpConstant 0 
                                             %117 = OpTypePointer Private %6 
                                         u32 %130 = OpConstant 2 
                                Private f32* %132 = OpVariable Private 
                               Output f32_3* %140 = OpVariable Output 
                                             %146 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %112 = OpAccessChain %21 %24 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                         f32 %115 = OpDot %111 %114 
                                Private f32* %118 = OpAccessChain %9 %116 
                                                      OpStore %118 %115 
                                       f32_3 %119 = OpLoad %110 
                              Uniform f32_4* %120 = OpAccessChain %21 %24 %24 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %119 %122 
                                Private f32* %124 = OpAccessChain %9 %81 
                                                      OpStore %124 %123 
                                       f32_3 %125 = OpLoad %110 
                              Uniform f32_4* %126 = OpAccessChain %21 %24 %36 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                         f32 %129 = OpDot %125 %128 
                                Private f32* %131 = OpAccessChain %9 %130 
                                                      OpStore %131 %129 
                                       f32_4 %133 = OpLoad %9 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %141 = OpLoad %132 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                 Output f32* %147 = OpAccessChain %85 %23 %81 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 255
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %39 %230 %243 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 RelaxedPrecision 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 RelaxedPrecision 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpMemberDecorate %27 7 Offset 27 
                                                      OpMemberDecorate %27 8 RelaxedPrecision 
                                                      OpMemberDecorate %27 8 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 Location 39 
                                                      OpDecorate %87 SpecId 87 
                                                      OpDecorate %185 DescriptorSet 185 
                                                      OpDecorate %185 Binding 185 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 Location 230 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 8 
                                              %32 = OpTypePointer Uniform %7 
                                              %36 = OpTypePointer Private %15 
                               Private f32_2* %37 = OpVariable Private 
                                              %38 = OpTypePointer Input %25 
                                 Input f32_3* %39 = OpVariable Input 
                                          i32 %42 = OpConstant 7 
                                          i32 %43 = OpConstant 1 
                                          i32 %48 = OpConstant 0 
                                          i32 %57 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                                              %72 = OpTypeBool 
                                              %73 = OpTypePointer Private %72 
                                Private bool* %74 = OpVariable Private 
                                          u32 %75 = OpConstant 0 
                                              %76 = OpTypePointer Uniform %6 
                                          f32 %79 = OpConstant 3.67402E-40 
                                         bool %81 = OpConstantFalse 
                                         bool %87 = OpSpecConstantFalse 
                                          u32 %90 = OpConstant 1 
                               Private f32_4* %94 = OpVariable Private 
                                             %133 = OpTypePointer Function %25 
                                         i32 %147 = OpConstant 5 
                                             %148 = OpTypePointer Uniform %25 
                                         i32 %157 = OpConstant 4 
                                             %163 = OpTypePointer Private %6 
                                Private f32* %164 = OpVariable Private 
                                         f32 %167 = OpConstant 3.67402E-40 
                                         f32 %169 = OpConstant 3.67402E-40 
                                Private f32* %171 = OpVariable Private 
                                         u32 %172 = OpConstant 2 
                                         f32 %175 = OpConstant 3.67402E-40 
                                             %182 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %183 = OpTypeSampledImage %182 
                                             %184 = OpTypePointer UniformConstant %183 
 UniformConstant read_only Texture3DSampled* %185 = OpVariable UniformConstant 
                              Private f32_4* %190 = OpVariable Private 
                                         u32 %196 = OpConstant 3 
                                             %198 = OpTypePointer Private %25 
                              Private f32_3* %199 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %210 = OpVariable UniformConstant 
                                         i32 %224 = OpConstant 6 
                                Private f32* %229 = OpVariable Private 
                                Input f32_3* %230 = OpVariable Input 
                                             %242 = OpTypePointer Output %7 
                               Output f32_4* %243 = OpVariable Output 
                                             %252 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %134 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_4 %35 = OpFMul %21 %34 
                                                      OpStore %20 %35 
                                        f32_3 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 1 1 
                               Uniform f32_4* %44 = OpAccessChain %29 %42 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFMul %41 %46 
                                                      OpStore %37 %47 
                               Uniform f32_4* %49 = OpAccessChain %29 %42 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_3 %52 = OpLoad %39 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                                        f32_2 %54 = OpFMul %51 %53 
                                        f32_2 %55 = OpLoad %37 
                                        f32_2 %56 = OpFAdd %54 %55 
                                                      OpStore %37 %56 
                               Uniform f32_4* %58 = OpAccessChain %29 %42 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_3 %61 = OpLoad %39 
                                        f32_2 %62 = OpVectorShuffle %61 %61 2 2 
                                        f32_2 %63 = OpFMul %60 %62 
                                        f32_2 %64 = OpLoad %37 
                                        f32_2 %65 = OpFAdd %63 %64 
                                                      OpStore %37 %65 
                                        f32_2 %66 = OpLoad %37 
                               Uniform f32_4* %68 = OpAccessChain %29 %42 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_2 %71 = OpFAdd %66 %70 
                                                      OpStore %37 %71 
                                 Uniform f32* %77 = OpAccessChain %29 %57 %75 
                                          f32 %78 = OpLoad %77 
                                         bool %80 = OpFOrdEqual %78 %79 
                                                      OpStore %74 %80 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                         bool %84 = OpLoad %74 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %84 %85 %86 
                                              %85 = OpLabel 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                                      OpSelectionMerge %89 None 
                                                      OpBranchConditional %87 %88 %192 
                                              %88 = OpLabel 
                                 Uniform f32* %91 = OpAccessChain %29 %57 %90 
                                          f32 %92 = OpLoad %91 
                                         bool %93 = OpFOrdEqual %92 %79 
                                                      OpStore %74 %93 
                                        f32_3 %95 = OpLoad %39 
                                        f32_3 %96 = OpVectorShuffle %95 %95 1 1 1 
                               Uniform f32_4* %97 = OpAccessChain %29 %67 %43 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpFMul %96 %99 
                                       f32_4 %101 = OpLoad %94 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %94 %102 
                              Uniform f32_4* %103 = OpAccessChain %29 %67 %48 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %39 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 0 0 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %94 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %94 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %94 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %67 %57 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpLoad %39 
                                       f32_3 %118 = OpVectorShuffle %117 %117 2 2 2 
                                       f32_3 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %94 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFAdd %119 %121 
                                       f32_4 %123 = OpLoad %94 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                                      OpStore %94 %124 
                                       f32_4 %125 = OpLoad %94 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %29 %67 %67 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFAdd %126 %129 
                                       f32_4 %131 = OpLoad %94 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %94 %132 
                                        bool %135 = OpLoad %74 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %140 
                                             %136 = OpLabel 
                                       f32_4 %138 = OpLoad %94 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                                      OpStore %134 %139 
                                                      OpBranch %137 
                                             %140 = OpLabel 
                                       f32_3 %141 = OpLoad %39 
                                                      OpStore %134 %141 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                       f32_3 %142 = OpLoad %134 
                                       f32_4 %143 = OpLoad %94 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %94 %144 
                                       f32_4 %145 = OpLoad %94 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_3* %149 = OpAccessChain %29 %147 
                                       f32_3 %150 = OpLoad %149 
                                       f32_3 %151 = OpFNegate %150 
                                       f32_3 %152 = OpFAdd %146 %151 
                                       f32_4 %153 = OpLoad %94 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %94 %154 
                                       f32_4 %155 = OpLoad %94 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_3* %158 = OpAccessChain %29 %157 
                                       f32_3 %159 = OpLoad %158 
                                       f32_3 %160 = OpFMul %156 %159 
                                       f32_4 %161 = OpLoad %94 
                                       f32_4 %162 = OpVectorShuffle %161 %160 0 4 5 6 
                                                      OpStore %94 %162 
                                Private f32* %165 = OpAccessChain %94 %90 
                                         f32 %166 = OpLoad %165 
                                         f32 %168 = OpFMul %166 %167 
                                         f32 %170 = OpFAdd %168 %169 
                                                      OpStore %164 %170 
                                Uniform f32* %173 = OpAccessChain %29 %57 %172 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %177 = OpFAdd %176 %169 
                                                      OpStore %171 %177 
                                         f32 %178 = OpLoad %171 
                                         f32 %179 = OpLoad %164 
                                         f32 %180 = OpExtInst %1 40 %178 %179 
                                Private f32* %181 = OpAccessChain %94 %75 
                                                      OpStore %181 %180 
                  read_only Texture3DSampled %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %94 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 2 3 
                                       f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                                      OpStore %94 %189 
                                       f32_4 %191 = OpLoad %94 
                                                      OpStore %190 %191 
                                                      OpBranch %89 
                                             %192 = OpLabel 
                                Private f32* %193 = OpAccessChain %190 %75 
                                                      OpStore %193 %79 
                                Private f32* %194 = OpAccessChain %190 %90 
                                                      OpStore %194 %79 
                                Private f32* %195 = OpAccessChain %190 %172 
                                                      OpStore %195 %79 
                                Private f32* %197 = OpAccessChain %190 %196 
                                                      OpStore %197 %79 
                                                      OpBranch %89 
                                              %89 = OpLabel 
                                       f32_4 %200 = OpLoad %190 
                              Uniform f32_4* %201 = OpAccessChain %29 %43 
                                       f32_4 %202 = OpLoad %201 
                                         f32 %203 = OpDot %200 %202 
                                Private f32* %204 = OpAccessChain %199 %75 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %199 %75 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpExtInst %1 43 %206 %207 %79 
                                Private f32* %209 = OpAccessChain %199 %75 
                                                      OpStore %209 %208 
                  read_only Texture2DSampled %211 = OpLoad %210 
                                       f32_2 %212 = OpLoad %37 
                                       f32_4 %213 = OpImageSampleImplicitLod %211 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                Private f32* %215 = OpAccessChain %37 %75 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %199 %75 
                                         f32 %217 = OpLoad %216 
                                Private f32* %218 = OpAccessChain %37 %75 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                Private f32* %221 = OpAccessChain %37 %75 
                                                      OpStore %221 %220 
                                       f32_2 %222 = OpLoad %37 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 0 0 
                              Uniform f32_4* %225 = OpAccessChain %29 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_3 %228 = OpFMul %223 %227 
                                                      OpStore %199 %228 
                                       f32_3 %231 = OpLoad %230 
                              Uniform f32_4* %232 = OpAccessChain %29 %48 
                                       f32_4 %233 = OpLoad %232 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                         f32 %235 = OpDot %231 %234 
                                                      OpStore %229 %235 
                                         f32 %236 = OpLoad %229 
                                         f32 %237 = OpExtInst %1 40 %236 %207 
                                                      OpStore %229 %237 
                                       f32_4 %238 = OpLoad %20 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpLoad %199 
                                       f32_3 %241 = OpFMul %239 %240 
                                                      OpStore %199 %241 
                                         f32 %244 = OpLoad %229 
                                       f32_3 %245 = OpCompositeConstruct %244 %244 %244 
                                       f32_3 %246 = OpLoad %199 
                                       f32_3 %247 = OpFMul %245 %246 
                                       f32_4 %248 = OpLoad %243 
                                       f32_4 %249 = OpVectorShuffle %248 %247 4 5 6 3 
                                                      OpStore %243 %249 
                                Private f32* %250 = OpAccessChain %20 %196 
                                         f32 %251 = OpLoad %250 
                                 Output f32* %253 = OpAccessChain %243 %196 
                                                      OpStore %253 %251 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
}
 Pass {
  Name "META"
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 149388
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Color;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat3 = unity_OneOverOutputBoost;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 237
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %221 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %164 0 BuiltIn 164 
                                                      OpMemberDecorate %164 1 BuiltIn 164 
                                                      OpMemberDecorate %164 2 BuiltIn 164 
                                                      OpDecorate %164 Block 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %221 Location 221 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %37 %38 %11 %11 %39 %11 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 2 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 4 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                         i32 %120 = OpConstant 0 
                                         i32 %121 = OpConstant 1 
                                         u32 %162 = OpConstant 1 
                                             %163 = OpTypeArray %9 %162 
                                             %164 = OpTypeStruct %11 %9 %163 
                                             %165 = OpTypePointer Output %164 
        Output struct {f32_4; f32; f32[1];}* %166 = OpVariable Output 
                                             %174 = OpTypePointer Output %11 
                                             %176 = OpTypePointer Output %33 
                               Output f32_2* %177 = OpVariable Output 
                                Input f32_4* %178 = OpVariable Input 
                                         i32 %181 = OpConstant 5 
                                             %220 = OpTypePointer Output %56 
                               Output f32_3* %221 = OpVariable Output 
                                             %231 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %122 = OpAccessChain %42 %120 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpFMul %119 %123 
                                                      OpStore %81 %124 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %120 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %132 = OpAccessChain %42 %120 %44 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpLoad %21 
                                       f32_4 %135 = OpVectorShuffle %134 %134 2 2 2 2 
                                       f32_4 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %81 
                                       f32_4 %138 = OpFAdd %136 %137 
                                                      OpStore %21 %138 
                                       f32_4 %139 = OpLoad %21 
                              Uniform f32_4* %140 = OpAccessChain %42 %120 %92 
                                       f32_4 %141 = OpLoad %140 
                                       f32_4 %142 = OpFAdd %139 %141 
                                                      OpStore %21 %142 
                                       f32_4 %143 = OpLoad %21 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %42 %121 %121 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %81 %147 
                              Uniform f32_4* %148 = OpAccessChain %42 %121 %120 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %21 
                                       f32_4 %151 = OpVectorShuffle %150 %150 0 0 0 0 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %81 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %81 %154 
                              Uniform f32_4* %155 = OpAccessChain %42 %121 %44 
                                       f32_4 %156 = OpLoad %155 
                                       f32_4 %157 = OpLoad %21 
                                       f32_4 %158 = OpVectorShuffle %157 %157 2 2 2 2 
                                       f32_4 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %81 
                                       f32_4 %161 = OpFAdd %159 %160 
                                                      OpStore %81 %161 
                              Uniform f32_4* %167 = OpAccessChain %42 %121 %92 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %21 
                                       f32_4 %170 = OpVectorShuffle %169 %169 3 3 3 3 
                                       f32_4 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %81 
                                       f32_4 %173 = OpFAdd %171 %172 
                               Output f32_4* %175 = OpAccessChain %166 %120 
                                                      OpStore %175 %173 
                                       f32_4 %179 = OpLoad %178 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                              Uniform f32_4* %182 = OpAccessChain %42 %181 
                                       f32_4 %183 = OpLoad %182 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                       f32_2 %185 = OpFMul %180 %184 
                              Uniform f32_4* %186 = OpAccessChain %42 %181 
                                       f32_4 %187 = OpLoad %186 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 3 
                                       f32_2 %189 = OpFAdd %185 %188 
                                                      OpStore %177 %189 
                                       f32_4 %190 = OpLoad %13 
                                       f32_3 %191 = OpVectorShuffle %190 %190 1 1 1 
                              Uniform f32_4* %192 = OpAccessChain %42 %120 %121 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %21 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %21 %197 
                              Uniform f32_4* %198 = OpAccessChain %42 %120 %120 
                                       f32_4 %199 = OpLoad %198 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_4 %201 = OpLoad %13 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 0 0 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %21 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %203 %205 
                                       f32_4 %207 = OpLoad %21 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %21 %208 
                              Uniform f32_4* %209 = OpAccessChain %42 %120 %44 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_4 %212 = OpLoad %13 
                                       f32_3 %213 = OpVectorShuffle %212 %212 2 2 2 
                                       f32_3 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %21 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                                       f32_3 %217 = OpFAdd %214 %216 
                                       f32_4 %218 = OpLoad %21 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
                                                      OpStore %21 %219 
                              Uniform f32_4* %222 = OpAccessChain %42 %120 %92 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_4 %225 = OpLoad %13 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_4 %228 = OpLoad %21 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFAdd %227 %229 
                                                      OpStore %221 %230 
                                 Output f32* %232 = OpAccessChain %166 %120 %162 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpFNegate %233 
                                 Output f32* %235 = OpAccessChain %166 %120 %162 
                                                      OpStore %235 %234 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 122
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %108 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpMemberDecorate %27 0 RelaxedPrecision 
                                                    OpMemberDecorate %27 0 Offset 27 
                                                    OpMemberDecorate %27 1 Offset 27 
                                                    OpMemberDecorate %27 2 Offset 27 
                                                    OpMemberDecorate %27 3 Offset 27 
                                                    OpDecorate %27 Block 
                                                    OpDecorate %29 DescriptorSet 29 
                                                    OpDecorate %29 Binding 29 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %108 Location 108 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
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
                                            %22 = OpTypePointer Private %19 
                             Private f32_4* %23 = OpVariable Private 
                                            %25 = OpTypeInt 32 0 
                                            %26 = OpTypeVector %25 4 
                                            %27 = OpTypeStruct %19 %26 %6 %6 
                                            %28 = OpTypePointer Uniform %27 
  Uniform struct {f32_4; u32_4; f32; f32;}* %29 = OpVariable Uniform 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                            %32 = OpTypePointer Uniform %19 
                                            %44 = OpTypePointer Private %6 
                               Private f32* %45 = OpVariable Private 
                                        i32 %46 = OpConstant 2 
                                            %47 = OpTypePointer Uniform %6 
                                        f32 %51 = OpConstant 3.67402E-40 
                                        f32 %52 = OpConstant 3.67402E-40 
                             Private f32_3* %54 = OpVariable Private 
                                        i32 %63 = OpConstant 3 
                                            %76 = OpTypePointer Function %7 
                                        i32 %78 = OpConstant 1 
                                            %79 = OpTypeBool 
                                            %80 = OpTypeVector %79 4 
                                            %81 = OpTypePointer Uniform %26 
                                        u32 %85 = OpConstant 0 
                                      f32_3 %91 = OpConstantComposite %51 %51 %51 
                                            %95 = OpTypePointer Function %6 
                                       u32 %105 = OpConstant 3 
                                           %107 = OpTypePointer Output %19 
                             Output f32_4* %108 = OpVariable Output 
                                           %109 = OpTypePointer Function %19 
                                     f32_4 %117 = OpConstantComposite %51 %51 %51 %52 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %77 = OpVariable Function 
                              Function f32* %96 = OpVariable Function 
                           Function f32_4* %110 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                             Uniform f32_4* %33 = OpAccessChain %29 %31 
                                      f32_4 %34 = OpLoad %33 
                                      f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                      f32_3 %36 = OpFMul %24 %35 
                                      f32_4 %37 = OpLoad %23 
                                      f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                    OpStore %23 %38 
                                      f32_4 %39 = OpLoad %23 
                                      f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                      f32_3 %41 = OpExtInst %1 30 %40 
                                      f32_4 %42 = OpLoad %23 
                                      f32_4 %43 = OpVectorShuffle %42 %41 4 5 6 3 
                                                    OpStore %23 %43 
                               Uniform f32* %48 = OpAccessChain %29 %46 
                                        f32 %49 = OpLoad %48 
                                                    OpStore %45 %49 
                                        f32 %50 = OpLoad %45 
                                        f32 %53 = OpExtInst %1 43 %50 %51 %52 
                                                    OpStore %45 %53 
                                      f32_4 %55 = OpLoad %23 
                                      f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32 %57 = OpLoad %45 
                                      f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                      f32_3 %59 = OpFMul %56 %58 
                                                    OpStore %54 %59 
                                      f32_3 %60 = OpLoad %54 
                                      f32_3 %61 = OpExtInst %1 29 %60 
                                                    OpStore %54 %61 
                                      f32_3 %62 = OpLoad %54 
                               Uniform f32* %64 = OpAccessChain %29 %63 
                                        f32 %65 = OpLoad %64 
                               Uniform f32* %66 = OpAccessChain %29 %63 
                                        f32 %67 = OpLoad %66 
                               Uniform f32* %68 = OpAccessChain %29 %63 
                                        f32 %69 = OpLoad %68 
                                      f32_3 %70 = OpCompositeConstruct %65 %67 %69 
                                        f32 %71 = OpCompositeExtract %70 0 
                                        f32 %72 = OpCompositeExtract %70 1 
                                        f32 %73 = OpCompositeExtract %70 2 
                                      f32_3 %74 = OpCompositeConstruct %71 %72 %73 
                                      f32_3 %75 = OpExtInst %1 37 %62 %74 
                                                    OpStore %54 %75 
                             Uniform u32_4* %82 = OpAccessChain %29 %78 
                                      u32_4 %83 = OpLoad %82 
                                        u32 %84 = OpCompositeExtract %83 0 
                                       bool %86 = OpINotEqual %84 %85 
                                                    OpSelectionMerge %88 None 
                                                    OpBranchConditional %86 %87 %90 
                                            %87 = OpLabel 
                                      f32_3 %89 = OpLoad %54 
                                                    OpStore %77 %89 
                                                    OpBranch %88 
                                            %90 = OpLabel 
                                                    OpStore %77 %91 
                                                    OpBranch %88 
                                            %88 = OpLabel 
                                      f32_3 %92 = OpLoad %77 
                                      f32_4 %93 = OpLoad %23 
                                      f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                                    OpStore %23 %94 
                             Uniform u32_4* %97 = OpAccessChain %29 %78 
                                      u32_4 %98 = OpLoad %97 
                                        u32 %99 = OpCompositeExtract %98 0 
                                      bool %100 = OpINotEqual %99 %85 
                                                    OpSelectionMerge %102 None 
                                                    OpBranchConditional %100 %101 %103 
                                           %101 = OpLabel 
                                                    OpStore %96 %52 
                                                    OpBranch %102 
                                           %103 = OpLabel 
                                                    OpStore %96 %51 
                                                    OpBranch %102 
                                           %102 = OpLabel 
                                       f32 %104 = OpLoad %96 
                              Private f32* %106 = OpAccessChain %23 %105 
                                                    OpStore %106 %104 
                            Uniform u32_4* %111 = OpAccessChain %29 %78 
                                     u32_4 %112 = OpLoad %111 
                                       u32 %113 = OpCompositeExtract %112 1 
                                      bool %114 = OpINotEqual %113 %85 
                                                    OpSelectionMerge %116 None 
                                                    OpBranchConditional %114 %115 %118 
                                           %115 = OpLabel 
                                                    OpStore %110 %117 
                                                    OpBranch %116 
                                           %118 = OpLabel 
                                     f32_4 %119 = OpLoad %23 
                                                    OpStore %110 %119 
                                                    OpBranch %116 
                                           %116 = OpLabel 
                                     f32_4 %120 = OpLoad %110 
                                                    OpStore %108 %120 
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
Fallback "Legacy Shaders/Transparent/VertexLit"
}