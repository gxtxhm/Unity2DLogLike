//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/LitBlendVertexColor" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 10294
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %60 %177 %190 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %33 0 RelaxedPrecision 
                                                      OpMemberDecorate %33 0 Offset 33 
                                                      OpMemberDecorate %33 1 RelaxedPrecision 
                                                      OpMemberDecorate %33 1 Offset 33 
                                                      OpMemberDecorate %33 2 Offset 33 
                                                      OpMemberDecorate %33 3 Offset 33 
                                                      OpMemberDecorate %33 4 Offset 33 
                                                      OpMemberDecorate %33 5 Offset 33 
                                                      OpMemberDecorate %33 6 RelaxedPrecision 
                                                      OpMemberDecorate %33 6 Offset 33 
                                                      OpDecorate %33 Block 
                                                      OpDecorate %35 DescriptorSet 35 
                                                      OpDecorate %35 Binding 35 
                                                      OpDecorate %50 SpecId 50 
                                                      OpDecorate %60 Location 60 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypeBool 
                                              %27 = OpTypePointer Private %26 
                                Private bool* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypeStruct %7 %7 %7 %31 %32 %32 %7 
                                              %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %35 = OpVariable Uniform 
                                              %36 = OpTypeInt 32 1 
                                          i32 %37 = OpConstant 2 
                                          u32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Uniform %6 
                                          f32 %42 = OpConstant 3.67402E-40 
                                         bool %44 = OpConstantFalse 
                                         bool %50 = OpSpecConstantFalse 
                                          u32 %53 = OpConstant 1 
                                              %57 = OpTypePointer Private %32 
                               Private f32_3* %58 = OpVariable Private 
                                              %59 = OpTypePointer Input %32 
                                 Input f32_3* %60 = OpVariable Input 
                                          i32 %63 = OpConstant 3 
                                          i32 %64 = OpConstant 1 
                                              %65 = OpTypePointer Uniform %7 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %32 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %32 
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
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                 Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                          f32 %41 = OpLoad %40 
                                         bool %43 = OpFOrdEqual %41 %42 
                                                      OpStore %28 %43 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                         bool %47 = OpLoad %28 
                                                      OpSelectionMerge %49 None 
                                                      OpBranchConditional %47 %48 %49 
                                              %48 = OpLabel 
                                                      OpBranch %49 
                                              %49 = OpLabel 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                                      OpSelectionMerge %52 None 
                                                      OpBranchConditional %50 %51 %152 
                                              %51 = OpLabel 
                                 Uniform f32* %54 = OpAccessChain %35 %37 %53 
                                          f32 %55 = OpLoad %54 
                                         bool %56 = OpFOrdEqual %55 %42 
                                                      OpStore %28 %56 
                                        f32_3 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %35 %63 %64 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %62 %68 
                                                      OpStore %58 %69 
                               Uniform f32_4* %71 = OpAccessChain %35 %63 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %60 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %58 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %35 %63 %37 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %60 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %58 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %58 %86 
                                        f32_3 %87 = OpLoad %58 
                               Uniform f32_4* %88 = OpAccessChain %35 %63 %63 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %58 %91 
                                         bool %95 = OpLoad %28 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %58 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %60 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %35 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %35 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %53 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %58 %38 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %35 %37 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %58 %38 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %38 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %52 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %38 
                                                      OpStore %153 %42 
                                Private f32* %154 = OpAccessChain %150 %53 
                                                      OpStore %154 %42 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %42 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %42 
                                                      OpBranch %52 
                                              %52 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %35 %64 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %38 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %38 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %42 
                                Private f32* %168 = OpAccessChain %158 %38 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %35 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %35 %70 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
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
; Bound: 273
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %87 %99 %100 %113 %151 %154 %155 %264 
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
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
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
                               Output f32_4* %154 = OpVariable Output 
                                Input f32_4* %155 = OpVariable Input 
                                             %157 = OpTypePointer Private %51 
                              Private f32_3* %158 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                              Private f32_3* %181 = OpVariable Private 
                                         i32 %187 = OpConstant 4 
                                         i32 %193 = OpConstant 5 
                                         i32 %199 = OpConstant 6 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         u32 %209 = OpConstant 3 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_3 %231 = OpConstantComposite %230 %230 %230 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                               Output f32_3* %264 = OpVariable Output 
                                             %267 = OpTypePointer Output %6 
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
                                       f32_4 %156 = OpLoad %155 
                                                      OpStore %154 %156 
                                Private f32* %159 = OpAccessChain %9 %83 
                                         f32 %160 = OpLoad %159 
                                Private f32* %161 = OpAccessChain %9 %83 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFMul %160 %162 
                                Private f32* %164 = OpAccessChain %158 %120 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %9 %120 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %9 %120 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %158 %120 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFNegate %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %158 %120 
                                                      OpStore %174 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_4 %177 = OpVectorShuffle %176 %176 1 2 2 0 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 1 2 2 
                                       f32_4 %180 = OpFMul %177 %179 
                                                      OpStore %175 %180 
                              Uniform f32_4* %182 = OpAccessChain %21 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %175 
                                         f32 %185 = OpDot %183 %184 
                                Private f32* %186 = OpAccessChain %181 %120 
                                                      OpStore %186 %185 
                              Uniform f32_4* %188 = OpAccessChain %21 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %175 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %181 %83 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %21 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %175 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %181 %134 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %21 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpLoad %158 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_3 %206 = OpLoad %181 
                                       f32_3 %207 = OpFAdd %205 %206 
                                                      OpStore %158 %207 
                                Private f32* %210 = OpAccessChain %9 %209 
                                                      OpStore %210 %208 
                              Uniform f32_4* %211 = OpAccessChain %21 %29 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %9 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %181 %120 
                                                      OpStore %215 %214 
                              Uniform f32_4* %216 = OpAccessChain %21 %24 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %9 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %181 %83 
                                                      OpStore %220 %219 
                              Uniform f32_4* %221 = OpAccessChain %21 %37 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %9 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %181 %134 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %158 
                                       f32_3 %227 = OpLoad %181 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %158 %228 
                                       f32_3 %229 = OpLoad %158 
                                       f32_3 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %158 %232 
                                       f32_3 %233 = OpLoad %158 
                                       f32_3 %234 = OpExtInst %1 30 %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %9 %236 
                                       f32_4 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %9 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %9 %243 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpExtInst %1 29 %245 
                                       f32_4 %247 = OpLoad %9 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %9 %248 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %9 %258 
                                       f32_4 %259 = OpLoad %9 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpExtInst %1 40 %260 %231 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %9 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %264 %266 
                                 Output f32* %268 = OpAccessChain %87 %29 %83 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFNegate %269 
                                 Output f32* %271 = OpAccessChain %87 %29 %83 
                                                      OpStore %271 %270 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %60 %177 %192 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %33 0 RelaxedPrecision 
                                                      OpMemberDecorate %33 0 Offset 33 
                                                      OpMemberDecorate %33 1 RelaxedPrecision 
                                                      OpMemberDecorate %33 1 Offset 33 
                                                      OpMemberDecorate %33 2 Offset 33 
                                                      OpMemberDecorate %33 3 Offset 33 
                                                      OpMemberDecorate %33 4 Offset 33 
                                                      OpMemberDecorate %33 5 Offset 33 
                                                      OpMemberDecorate %33 6 RelaxedPrecision 
                                                      OpMemberDecorate %33 6 Offset 33 
                                                      OpDecorate %33 Block 
                                                      OpDecorate %35 DescriptorSet 35 
                                                      OpDecorate %35 Binding 35 
                                                      OpDecorate %50 SpecId 50 
                                                      OpDecorate %60 Location 60 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypeBool 
                                              %27 = OpTypePointer Private %26 
                                Private bool* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypeStruct %7 %7 %7 %31 %32 %32 %7 
                                              %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %35 = OpVariable Uniform 
                                              %36 = OpTypeInt 32 1 
                                          i32 %37 = OpConstant 2 
                                          u32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Uniform %6 
                                          f32 %42 = OpConstant 3.67402E-40 
                                         bool %44 = OpConstantFalse 
                                         bool %50 = OpSpecConstantFalse 
                                          u32 %53 = OpConstant 1 
                                              %57 = OpTypePointer Private %32 
                               Private f32_3* %58 = OpVariable Private 
                                              %59 = OpTypePointer Input %32 
                                 Input f32_3* %60 = OpVariable Input 
                                          i32 %63 = OpConstant 3 
                                          i32 %64 = OpConstant 1 
                                              %65 = OpTypePointer Uniform %7 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %32 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %32 
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
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                 Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                          f32 %41 = OpLoad %40 
                                         bool %43 = OpFOrdEqual %41 %42 
                                                      OpStore %28 %43 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                         bool %47 = OpLoad %28 
                                                      OpSelectionMerge %49 None 
                                                      OpBranchConditional %47 %48 %49 
                                              %48 = OpLabel 
                                                      OpBranch %49 
                                              %49 = OpLabel 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                                      OpSelectionMerge %52 None 
                                                      OpBranchConditional %50 %51 %152 
                                              %51 = OpLabel 
                                 Uniform f32* %54 = OpAccessChain %35 %37 %53 
                                          f32 %55 = OpLoad %54 
                                         bool %56 = OpFOrdEqual %55 %42 
                                                      OpStore %28 %56 
                                        f32_3 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %35 %63 %64 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %62 %68 
                                                      OpStore %58 %69 
                               Uniform f32_4* %71 = OpAccessChain %35 %63 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %60 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %58 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %35 %63 %37 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %60 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %58 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %58 %86 
                                        f32_3 %87 = OpLoad %58 
                               Uniform f32_4* %88 = OpAccessChain %35 %63 %63 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %58 %91 
                                         bool %95 = OpLoad %28 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %58 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %60 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %35 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %35 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %53 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %58 %38 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %35 %37 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %58 %38 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %38 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %52 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %38 
                                                      OpStore %153 %42 
                                Private f32* %154 = OpAccessChain %150 %53 
                                                      OpStore %154 %42 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %42 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %42 
                                                      OpBranch %52 
                                              %52 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %35 %64 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %38 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %38 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %42 
                                Private f32* %168 = OpAccessChain %158 %38 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %35 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %35 %70 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
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
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %116 %155 %158 %161 %162 %389 
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
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %389 Location 389 
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
                               Output f32_4* %161 = OpVariable Output 
                                Input f32_4* %162 = OpVariable Input 
                              Private f32_4* %170 = OpVariable Private 
                              Private f32_4* %183 = OpVariable Private 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_4 %215 = OpConstantComposite %214 %214 %214 %214 
                                         f32 %223 = OpConstant 3.67402E-40 
                                       f32_4 %224 = OpConstantComposite %223 %223 %223 %223 
                                         f32 %232 = OpConstant 3.67402E-40 
                                       f32_4 %233 = OpConstantComposite %232 %232 %232 %232 
                                         i32 %240 = OpConstant 4 
                                             %280 = OpTypePointer Private %53 
                              Private f32_3* %281 = OpVariable Private 
                              Private f32_4* %298 = OpVariable Private 
                              Private f32_3* %304 = OpVariable Private 
                                         i32 %305 = OpConstant 8 
                                         i32 %311 = OpConstant 9 
                                         i32 %317 = OpConstant 10 
                                         i32 %323 = OpConstant 11 
                                         u32 %332 = OpConstant 3 
                                         i32 %334 = OpConstant 5 
                                         i32 %340 = OpConstant 6 
                                         i32 %346 = OpConstant 7 
                                       f32_3 %356 = OpConstantComposite %232 %232 %232 
                                         f32 %364 = OpConstant 3.67402E-40 
                                       f32_3 %365 = OpConstantComposite %364 %364 %364 
                                         f32 %376 = OpConstant 3.67402E-40 
                                       f32_3 %377 = OpConstantComposite %376 %376 %376 
                                         f32 %379 = OpConstant 3.67402E-40 
                                       f32_3 %380 = OpConstantComposite %379 %379 %379 
                               Output f32_3* %389 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
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
                                       f32_4 %163 = OpLoad %162 
                                                      OpStore %161 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 0 0 0 0 
                                       f32_4 %166 = OpFNegate %165 
                              Uniform f32_4* %167 = OpAccessChain %23 %31 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFAdd %166 %168 
                                                      OpStore %65 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %171 1 1 1 1 
                                       f32_4 %173 = OpFNegate %172 
                              Uniform f32_4* %174 = OpAccessChain %23 %26 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpFAdd %173 %175 
                                                      OpStore %170 %176 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFNegate %178 
                              Uniform f32_4* %180 = OpAccessChain %23 %39 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpFAdd %179 %181 
                                                      OpStore %9 %182 
                                       f32_4 %184 = OpLoad %47 
                                       f32_4 %185 = OpVectorShuffle %184 %184 1 1 1 1 
                                       f32_4 %186 = OpLoad %170 
                                       f32_4 %187 = OpFMul %185 %186 
                                                      OpStore %183 %187 
                                       f32_4 %188 = OpLoad %170 
                                       f32_4 %189 = OpLoad %170 
                                       f32_4 %190 = OpFMul %188 %189 
                                                      OpStore %170 %190 
                                       f32_4 %191 = OpLoad %65 
                                       f32_4 %192 = OpLoad %65 
                                       f32_4 %193 = OpFMul %191 %192 
                                       f32_4 %194 = OpLoad %170 
                                       f32_4 %195 = OpFAdd %193 %194 
                                                      OpStore %170 %195 
                                       f32_4 %196 = OpLoad %65 
                                       f32_4 %197 = OpLoad %47 
                                       f32_4 %198 = OpVectorShuffle %197 %197 0 0 0 0 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %183 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %65 %201 
                                       f32_4 %202 = OpLoad %9 
                                       f32_4 %203 = OpLoad %47 
                                       f32_4 %204 = OpVectorShuffle %203 %203 2 2 2 2 
                                       f32_4 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %65 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %65 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpFMul %208 %209 
                                       f32_4 %211 = OpLoad %170 
                                       f32_4 %212 = OpFAdd %210 %211 
                                                      OpStore %9 %212 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %216 = OpExtInst %1 40 %213 %215 
                                                      OpStore %9 %216 
                                       f32_4 %217 = OpLoad %9 
                                       f32_4 %218 = OpExtInst %1 32 %217 
                                                      OpStore %170 %218 
                                       f32_4 %219 = OpLoad %9 
                              Uniform f32_4* %220 = OpAccessChain %23 %49 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpFMul %219 %221 
                                       f32_4 %225 = OpFAdd %222 %224 
                                                      OpStore %9 %225 
                                       f32_4 %226 = OpLoad %9 
                                       f32_4 %227 = OpFDiv %224 %226 
                                                      OpStore %9 %227 
                                       f32_4 %228 = OpLoad %65 
                                       f32_4 %229 = OpLoad %170 
                                       f32_4 %230 = OpFMul %228 %229 
                                                      OpStore %65 %230 
                                       f32_4 %231 = OpLoad %65 
                                       f32_4 %234 = OpExtInst %1 40 %231 %233 
                                                      OpStore %65 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_4 %236 = OpLoad %65 
                                       f32_4 %237 = OpFMul %235 %236 
                                                      OpStore %9 %237 
                                       f32_4 %238 = OpLoad %9 
                                       f32_3 %239 = OpVectorShuffle %238 %238 1 1 1 
                              Uniform f32_4* %241 = OpAccessChain %23 %240 %26 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFMul %239 %243 
                                       f32_4 %245 = OpLoad %65 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %65 %246 
                              Uniform f32_4* %247 = OpAccessChain %23 %240 %31 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_4 %250 = OpLoad %9 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 0 0 
                                       f32_3 %252 = OpFMul %249 %251 
                                       f32_4 %253 = OpLoad %65 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_3 %255 = OpFAdd %252 %254 
                                       f32_4 %256 = OpLoad %65 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %65 %257 
                              Uniform f32_4* %258 = OpAccessChain %23 %240 %39 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_4 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %261 2 2 2 
                                       f32_3 %263 = OpFMul %260 %262 
                                       f32_4 %264 = OpLoad %65 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFAdd %263 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %9 %268 
                              Uniform f32_4* %269 = OpAccessChain %23 %240 %49 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_4 %272 = OpLoad %9 
                                       f32_3 %273 = OpVectorShuffle %272 %272 3 3 3 
                                       f32_3 %274 = OpFMul %271 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %9 %279 
                                Private f32* %282 = OpAccessChain %47 %86 
                                         f32 %283 = OpLoad %282 
                                Private f32* %284 = OpAccessChain %47 %86 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFMul %283 %285 
                                Private f32* %287 = OpAccessChain %281 %123 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %47 %123 
                                         f32 %289 = OpLoad %288 
                                Private f32* %290 = OpAccessChain %47 %123 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFMul %289 %291 
                                Private f32* %293 = OpAccessChain %281 %123 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFNegate %294 
                                         f32 %296 = OpFAdd %292 %295 
                                Private f32* %297 = OpAccessChain %281 %123 
                                                      OpStore %297 %296 
                                       f32_4 %299 = OpLoad %47 
                                       f32_4 %300 = OpVectorShuffle %299 %299 1 2 2 0 
                                       f32_4 %301 = OpLoad %47 
                                       f32_4 %302 = OpVectorShuffle %301 %301 0 1 2 2 
                                       f32_4 %303 = OpFMul %300 %302 
                                                      OpStore %298 %303 
                              Uniform f32_4* %306 = OpAccessChain %23 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_4 %308 = OpLoad %298 
                                         f32 %309 = OpDot %307 %308 
                                Private f32* %310 = OpAccessChain %304 %123 
                                                      OpStore %310 %309 
                              Uniform f32_4* %312 = OpAccessChain %23 %311 
                                       f32_4 %313 = OpLoad %312 
                                       f32_4 %314 = OpLoad %298 
                                         f32 %315 = OpDot %313 %314 
                                Private f32* %316 = OpAccessChain %304 %86 
                                                      OpStore %316 %315 
                              Uniform f32_4* %318 = OpAccessChain %23 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_4 %320 = OpLoad %298 
                                         f32 %321 = OpDot %319 %320 
                                Private f32* %322 = OpAccessChain %304 %137 
                                                      OpStore %322 %321 
                              Uniform f32_4* %324 = OpAccessChain %23 %323 
                                       f32_4 %325 = OpLoad %324 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpLoad %281 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 0 0 
                                       f32_3 %329 = OpFMul %326 %328 
                                       f32_3 %330 = OpLoad %304 
                                       f32_3 %331 = OpFAdd %329 %330 
                                                      OpStore %281 %331 
                                Private f32* %333 = OpAccessChain %47 %332 
                                                      OpStore %333 %223 
                              Uniform f32_4* %335 = OpAccessChain %23 %334 
                                       f32_4 %336 = OpLoad %335 
                                       f32_4 %337 = OpLoad %47 
                                         f32 %338 = OpDot %336 %337 
                                Private f32* %339 = OpAccessChain %304 %123 
                                                      OpStore %339 %338 
                              Uniform f32_4* %341 = OpAccessChain %23 %340 
                                       f32_4 %342 = OpLoad %341 
                                       f32_4 %343 = OpLoad %47 
                                         f32 %344 = OpDot %342 %343 
                                Private f32* %345 = OpAccessChain %304 %86 
                                                      OpStore %345 %344 
                              Uniform f32_4* %347 = OpAccessChain %23 %346 
                                       f32_4 %348 = OpLoad %347 
                                       f32_4 %349 = OpLoad %47 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %351 = OpAccessChain %304 %137 
                                                      OpStore %351 %350 
                                       f32_3 %352 = OpLoad %281 
                                       f32_3 %353 = OpLoad %304 
                                       f32_3 %354 = OpFAdd %352 %353 
                                                      OpStore %281 %354 
                                       f32_3 %355 = OpLoad %281 
                                       f32_3 %357 = OpExtInst %1 40 %355 %356 
                                                      OpStore %281 %357 
                                       f32_3 %358 = OpLoad %281 
                                       f32_3 %359 = OpExtInst %1 30 %358 
                                       f32_4 %360 = OpLoad %47 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 6 3 
                                                      OpStore %47 %361 
                                       f32_4 %362 = OpLoad %47 
                                       f32_3 %363 = OpVectorShuffle %362 %362 0 1 2 
                                       f32_3 %366 = OpFMul %363 %365 
                                       f32_4 %367 = OpLoad %47 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %47 %368 
                                       f32_4 %369 = OpLoad %47 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpExtInst %1 29 %370 
                                       f32_4 %372 = OpLoad %47 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %47 %373 
                                       f32_4 %374 = OpLoad %47 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
                                       f32_3 %378 = OpFMul %375 %377 
                                       f32_3 %381 = OpFAdd %378 %380 
                                       f32_4 %382 = OpLoad %47 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %47 %383 
                                       f32_4 %384 = OpLoad %47 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpExtInst %1 40 %385 %356 
                                       f32_4 %387 = OpLoad %47 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %47 %388 
                                       f32_4 %390 = OpLoad %9 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
                                       f32_4 %392 = OpLoad %47 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                       f32_3 %394 = OpFAdd %391 %393 
                                                      OpStore %389 %394 
                                 Output f32* %396 = OpAccessChain %90 %31 %86 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %90 %31 %86 
                                                      OpStore %399 %398 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %60 %177 %192 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %33 0 RelaxedPrecision 
                                                      OpMemberDecorate %33 0 Offset 33 
                                                      OpMemberDecorate %33 1 RelaxedPrecision 
                                                      OpMemberDecorate %33 1 Offset 33 
                                                      OpMemberDecorate %33 2 Offset 33 
                                                      OpMemberDecorate %33 3 Offset 33 
                                                      OpMemberDecorate %33 4 Offset 33 
                                                      OpMemberDecorate %33 5 Offset 33 
                                                      OpMemberDecorate %33 6 RelaxedPrecision 
                                                      OpMemberDecorate %33 6 Offset 33 
                                                      OpDecorate %33 Block 
                                                      OpDecorate %35 DescriptorSet 35 
                                                      OpDecorate %35 Binding 35 
                                                      OpDecorate %50 SpecId 50 
                                                      OpDecorate %60 Location 60 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypeBool 
                                              %27 = OpTypePointer Private %26 
                                Private bool* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypeStruct %7 %7 %7 %31 %32 %32 %7 
                                              %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %35 = OpVariable Uniform 
                                              %36 = OpTypeInt 32 1 
                                          i32 %37 = OpConstant 2 
                                          u32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Uniform %6 
                                          f32 %42 = OpConstant 3.67402E-40 
                                         bool %44 = OpConstantFalse 
                                         bool %50 = OpSpecConstantFalse 
                                          u32 %53 = OpConstant 1 
                                              %57 = OpTypePointer Private %32 
                               Private f32_3* %58 = OpVariable Private 
                                              %59 = OpTypePointer Input %32 
                                 Input f32_3* %60 = OpVariable Input 
                                          i32 %63 = OpConstant 3 
                                          i32 %64 = OpConstant 1 
                                              %65 = OpTypePointer Uniform %7 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %32 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %32 
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
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                 Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                          f32 %41 = OpLoad %40 
                                         bool %43 = OpFOrdEqual %41 %42 
                                                      OpStore %28 %43 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                         bool %47 = OpLoad %28 
                                                      OpSelectionMerge %49 None 
                                                      OpBranchConditional %47 %48 %49 
                                              %48 = OpLabel 
                                                      OpBranch %49 
                                              %49 = OpLabel 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                                      OpSelectionMerge %52 None 
                                                      OpBranchConditional %50 %51 %152 
                                              %51 = OpLabel 
                                 Uniform f32* %54 = OpAccessChain %35 %37 %53 
                                          f32 %55 = OpLoad %54 
                                         bool %56 = OpFOrdEqual %55 %42 
                                                      OpStore %28 %56 
                                        f32_3 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %35 %63 %64 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %62 %68 
                                                      OpStore %58 %69 
                               Uniform f32_4* %71 = OpAccessChain %35 %63 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %60 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %58 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %35 %63 %37 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %60 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %58 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %58 %86 
                                        f32_3 %87 = OpLoad %58 
                               Uniform f32_4* %88 = OpAccessChain %35 %63 %63 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %58 %91 
                                         bool %95 = OpLoad %28 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %58 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %60 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %35 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %35 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %53 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %58 %38 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %35 %37 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %58 %38 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %38 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %52 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %38 
                                                      OpStore %153 %42 
                                Private f32* %154 = OpAccessChain %150 %53 
                                                      OpStore %154 %42 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %42 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %42 
                                                      OpBranch %52 
                                              %52 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %35 %64 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %38 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %38 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %42 
                                Private f32* %168 = OpAccessChain %158 %38 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %35 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %35 %70 
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
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 77354
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %55 %246 %257 
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
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %55 Location 55 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %21 = OpVariable Uniform 
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
                                              %54 = OpTypePointer Input %14 
                                 Input f32_4* %55 = OpVariable Input 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %60 %177 %190 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %33 0 RelaxedPrecision 
                                                      OpMemberDecorate %33 0 Offset 33 
                                                      OpMemberDecorate %33 1 RelaxedPrecision 
                                                      OpMemberDecorate %33 1 Offset 33 
                                                      OpMemberDecorate %33 2 Offset 33 
                                                      OpMemberDecorate %33 3 Offset 33 
                                                      OpMemberDecorate %33 4 Offset 33 
                                                      OpMemberDecorate %33 5 Offset 33 
                                                      OpMemberDecorate %33 6 RelaxedPrecision 
                                                      OpMemberDecorate %33 6 Offset 33 
                                                      OpDecorate %33 Block 
                                                      OpDecorate %35 DescriptorSet 35 
                                                      OpDecorate %35 Binding 35 
                                                      OpDecorate %50 SpecId 50 
                                                      OpDecorate %60 Location 60 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypeBool 
                                              %27 = OpTypePointer Private %26 
                                Private bool* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypeStruct %7 %7 %7 %31 %32 %32 %7 
                                              %34 = OpTypePointer Uniform %33 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %35 = OpVariable Uniform 
                                              %36 = OpTypeInt 32 1 
                                          i32 %37 = OpConstant 2 
                                          u32 %38 = OpConstant 0 
                                              %39 = OpTypePointer Uniform %6 
                                          f32 %42 = OpConstant 3.67402E-40 
                                         bool %44 = OpConstantFalse 
                                         bool %50 = OpSpecConstantFalse 
                                          u32 %53 = OpConstant 1 
                                              %57 = OpTypePointer Private %32 
                               Private f32_3* %58 = OpVariable Private 
                                              %59 = OpTypePointer Input %32 
                                 Input f32_3* %60 = OpVariable Input 
                                          i32 %63 = OpConstant 3 
                                          i32 %64 = OpConstant 1 
                                              %65 = OpTypePointer Uniform %7 
                                          i32 %70 = OpConstant 0 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Function %32 
                                         i32 %106 = OpConstant 5 
                                             %107 = OpTypePointer Uniform %32 
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
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                 Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                          f32 %41 = OpLoad %40 
                                         bool %43 = OpFOrdEqual %41 %42 
                                                      OpStore %28 %43 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                         bool %47 = OpLoad %28 
                                                      OpSelectionMerge %49 None 
                                                      OpBranchConditional %47 %48 %49 
                                              %48 = OpLabel 
                                                      OpBranch %49 
                                              %49 = OpLabel 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                                      OpSelectionMerge %52 None 
                                                      OpBranchConditional %50 %51 %152 
                                              %51 = OpLabel 
                                 Uniform f32* %54 = OpAccessChain %35 %37 %53 
                                          f32 %55 = OpLoad %54 
                                         bool %56 = OpFOrdEqual %55 %42 
                                                      OpStore %28 %56 
                                        f32_3 %61 = OpLoad %60 
                                        f32_3 %62 = OpVectorShuffle %61 %61 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %35 %63 %64 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFMul %62 %68 
                                                      OpStore %58 %69 
                               Uniform f32_4* %71 = OpAccessChain %35 %63 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %60 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %58 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %35 %63 %37 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %60 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %58 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %58 %86 
                                        f32_3 %87 = OpLoad %58 
                               Uniform f32_4* %88 = OpAccessChain %35 %63 %63 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %87 %90 
                                                      OpStore %58 %91 
                                         bool %95 = OpLoad %28 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %99 
                                              %96 = OpLabel 
                                        f32_3 %98 = OpLoad %58 
                                                      OpStore %94 %98 
                                                      OpBranch %97 
                                              %99 = OpLabel 
                                       f32_3 %100 = OpLoad %60 
                                                      OpStore %94 %100 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                       f32_3 %101 = OpLoad %94 
                                       f32_4 %102 = OpLoad %92 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                      OpStore %92 %103 
                                       f32_4 %104 = OpLoad %92 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                              Uniform f32_3* %108 = OpAccessChain %35 %106 
                                       f32_3 %109 = OpLoad %108 
                                       f32_3 %110 = OpFNegate %109 
                                       f32_3 %111 = OpFAdd %105 %110 
                                       f32_4 %112 = OpLoad %92 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %92 %113 
                                       f32_4 %114 = OpLoad %92 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              Uniform f32_3* %117 = OpAccessChain %35 %116 
                                       f32_3 %118 = OpLoad %117 
                                       f32_3 %119 = OpFMul %115 %118 
                                       f32_4 %120 = OpLoad %92 
                                       f32_4 %121 = OpVectorShuffle %120 %119 0 4 5 6 
                                                      OpStore %92 %121 
                                Private f32* %123 = OpAccessChain %92 %53 
                                         f32 %124 = OpLoad %123 
                                         f32 %126 = OpFMul %124 %125 
                                         f32 %128 = OpFAdd %126 %127 
                                Private f32* %129 = OpAccessChain %58 %38 
                                                      OpStore %129 %128 
                                Uniform f32* %132 = OpAccessChain %35 %37 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %135 = OpFMul %133 %134 
                                         f32 %136 = OpFAdd %135 %127 
                                                      OpStore %130 %136 
                                Private f32* %137 = OpAccessChain %58 %38 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpLoad %130 
                                         f32 %140 = OpExtInst %1 40 %138 %139 
                                Private f32* %141 = OpAccessChain %92 %38 
                                                      OpStore %141 %140 
                  read_only Texture3DSampled %146 = OpLoad %145 
                                       f32_4 %147 = OpLoad %92 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 2 3 
                                       f32_4 %149 = OpImageSampleImplicitLod %146 %148 
                                                      OpStore %92 %149 
                                       f32_4 %151 = OpLoad %92 
                                                      OpStore %150 %151 
                                                      OpBranch %52 
                                             %152 = OpLabel 
                                Private f32* %153 = OpAccessChain %150 %38 
                                                      OpStore %153 %42 
                                Private f32* %154 = OpAccessChain %150 %53 
                                                      OpStore %154 %42 
                                Private f32* %155 = OpAccessChain %150 %131 
                                                      OpStore %155 %42 
                                Private f32* %157 = OpAccessChain %150 %156 
                                                      OpStore %157 %42 
                                                      OpBranch %52 
                                              %52 = OpLabel 
                                       f32_4 %159 = OpLoad %150 
                              Uniform f32_4* %160 = OpAccessChain %35 %64 
                                       f32_4 %161 = OpLoad %160 
                                         f32 %162 = OpDot %159 %161 
                                Private f32* %163 = OpAccessChain %158 %38 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %158 %38 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpExtInst %1 43 %165 %166 %42 
                                Private f32* %168 = OpAccessChain %158 %38 
                                                      OpStore %168 %167 
                                       f32_3 %169 = OpLoad %158 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                              Uniform f32_4* %172 = OpAccessChain %35 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %170 %174 
                                                      OpStore %158 %175 
                                       f32_3 %178 = OpLoad %177 
                              Uniform f32_4* %179 = OpAccessChain %35 %70 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %55 %277 %288 
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
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %55 Location 55 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %21 = OpVariable Uniform 
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
                                              %54 = OpTypePointer Input %14 
                                 Input f32_4* %55 = OpVariable Input 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %55 %259 %270 
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
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %55 Location 55 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %21 = OpVariable Uniform 
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
                                              %54 = OpTypePointer Input %14 
                                 Input f32_4* %55 = OpVariable Input 
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
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
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %147 
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
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %148 RelaxedPrecision 
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
                               Output f32_4* %146 = OpVariable Output 
                                Input f32_4* %147 = OpVariable Input 
                                             %149 = OpTypePointer Output %6 
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
                                       f32_4 %148 = OpLoad %147 
                                                      OpStore %146 %148 
                                 Output f32* %150 = OpAccessChain %85 %23 %81 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %85 %23 %81 
                                                      OpStore %153 %152 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %30 %230 %243 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %30 Location 30 
                                                      OpDecorate %35 ArrayStride 35 
                                                      OpDecorate %36 ArrayStride 36 
                                                      OpMemberDecorate %37 0 RelaxedPrecision 
                                                      OpMemberDecorate %37 0 Offset 37 
                                                      OpMemberDecorate %37 1 RelaxedPrecision 
                                                      OpMemberDecorate %37 1 Offset 37 
                                                      OpMemberDecorate %37 2 Offset 37 
                                                      OpMemberDecorate %37 3 Offset 37 
                                                      OpMemberDecorate %37 4 Offset 37 
                                                      OpMemberDecorate %37 5 Offset 37 
                                                      OpMemberDecorate %37 6 RelaxedPrecision 
                                                      OpMemberDecorate %37 6 Offset 37 
                                                      OpMemberDecorate %37 7 Offset 37 
                                                      OpDecorate %37 Block 
                                                      OpDecorate %39 DescriptorSet 39 
                                                      OpDecorate %39 Binding 39 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypePointer Private %15 
                               Private f32_2* %27 = OpVariable Private 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Input %28 
                                 Input f32_3* %30 = OpVariable Input 
                                              %33 = OpTypeInt 32 0 
                                          u32 %34 = OpConstant 4 
                                              %35 = OpTypeArray %7 %34 
                                              %36 = OpTypeArray %7 %34 
                                              %37 = OpTypeStruct %7 %7 %7 %35 %28 %28 %7 %36 
                                              %38 = OpTypePointer Uniform %37 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %39 = OpVariable Uniform 
                                              %40 = OpTypeInt 32 1 
                                          i32 %41 = OpConstant 7 
                                          i32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Uniform %7 
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
                                             %133 = OpTypePointer Function %28 
                                         i32 %147 = OpConstant 5 
                                             %148 = OpTypePointer Uniform %28 
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
                                             %198 = OpTypePointer Private %28 
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
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                        f32_3 %31 = OpLoad %30 
                                        f32_2 %32 = OpVectorShuffle %31 %31 1 1 
                               Uniform f32_4* %44 = OpAccessChain %39 %41 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpFMul %32 %46 
                                                      OpStore %27 %47 
                               Uniform f32_4* %49 = OpAccessChain %39 %41 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_3 %52 = OpLoad %30 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                                        f32_2 %54 = OpFMul %51 %53 
                                        f32_2 %55 = OpLoad %27 
                                        f32_2 %56 = OpFAdd %54 %55 
                                                      OpStore %27 %56 
                               Uniform f32_4* %58 = OpAccessChain %39 %41 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_3 %61 = OpLoad %30 
                                        f32_2 %62 = OpVectorShuffle %61 %61 2 2 
                                        f32_2 %63 = OpFMul %60 %62 
                                        f32_2 %64 = OpLoad %27 
                                        f32_2 %65 = OpFAdd %63 %64 
                                                      OpStore %27 %65 
                                        f32_2 %66 = OpLoad %27 
                               Uniform f32_4* %68 = OpAccessChain %39 %41 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_2 %71 = OpFAdd %66 %70 
                                                      OpStore %27 %71 
                                 Uniform f32* %77 = OpAccessChain %39 %57 %75 
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
                                 Uniform f32* %91 = OpAccessChain %39 %57 %90 
                                          f32 %92 = OpLoad %91 
                                         bool %93 = OpFOrdEqual %92 %79 
                                                      OpStore %74 %93 
                                        f32_3 %95 = OpLoad %30 
                                        f32_3 %96 = OpVectorShuffle %95 %95 1 1 1 
                               Uniform f32_4* %97 = OpAccessChain %39 %67 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpFMul %96 %99 
                                       f32_4 %101 = OpLoad %94 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 6 3 
                                                      OpStore %94 %102 
                              Uniform f32_4* %103 = OpAccessChain %39 %67 %48 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %30 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 0 0 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %94 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %94 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %94 %113 
                              Uniform f32_4* %114 = OpAccessChain %39 %67 %57 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpLoad %30 
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
                              Uniform f32_4* %127 = OpAccessChain %39 %67 %67 
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
                                       f32_3 %141 = OpLoad %30 
                                                      OpStore %134 %141 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                       f32_3 %142 = OpLoad %134 
                                       f32_4 %143 = OpLoad %94 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %94 %144 
                                       f32_4 %145 = OpLoad %94 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_3* %149 = OpAccessChain %39 %147 
                                       f32_3 %150 = OpLoad %149 
                                       f32_3 %151 = OpFNegate %150 
                                       f32_3 %152 = OpFAdd %146 %151 
                                       f32_4 %153 = OpLoad %94 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %94 %154 
                                       f32_4 %155 = OpLoad %94 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_3* %158 = OpAccessChain %39 %157 
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
                                Uniform f32* %173 = OpAccessChain %39 %57 %172 
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
                              Uniform f32_4* %201 = OpAccessChain %39 %42 
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
                                       f32_2 %212 = OpLoad %27 
                                       f32_4 %213 = OpImageSampleImplicitLod %211 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                Private f32* %215 = OpAccessChain %27 %75 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %199 %75 
                                         f32 %217 = OpLoad %216 
                                Private f32* %218 = OpAccessChain %27 %75 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %217 %219 
                                Private f32* %221 = OpAccessChain %27 %75 
                                                      OpStore %221 %220 
                                       f32_2 %222 = OpLoad %27 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 0 0 
                              Uniform f32_4* %225 = OpAccessChain %39 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_3 %228 = OpFMul %223 %227 
                                                      OpStore %199 %228 
                                       f32_3 %231 = OpLoad %230 
                              Uniform f32_4* %232 = OpAccessChain %39 %48 
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
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 191737
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
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
; Bound: 240
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %221 %231 %232 
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
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %232 Location 232 
                                                      OpDecorate %233 RelaxedPrecision 
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
                               Output f32_4* %231 = OpVariable Output 
                                Input f32_4* %232 = OpVariable Input 
                                             %234 = OpTypePointer Output %9 
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
                                       f32_4 %233 = OpLoad %232 
                                                      OpStore %231 %233 
                                 Output f32* %235 = OpAccessChain %166 %120 %162 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFNegate %236 
                                 Output f32* %238 = OpAccessChain %166 %120 %162 
                                                      OpStore %238 %237 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 121
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %26 %107 
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
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %26 Location 26 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpMemberDecorate %41 0 Offset 41 
                                                    OpMemberDecorate %41 1 Offset 41 
                                                    OpMemberDecorate %41 2 Offset 41 
                                                    OpDecorate %41 Block 
                                                    OpDecorate %43 DescriptorSet 43 
                                                    OpDecorate %43 Binding 43 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %107 Location 107 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
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
                                            %25 = OpTypePointer Input %19 
                               Input f32_4* %26 = OpVariable Input 
                                            %37 = OpTypePointer Private %6 
                               Private f32* %38 = OpVariable Private 
                                            %39 = OpTypeInt 32 0 
                                            %40 = OpTypeVector %39 4 
                                            %41 = OpTypeStruct %40 %6 %6 
                                            %42 = OpTypePointer Uniform %41 
         Uniform struct {u32_4; f32; f32;}* %43 = OpVariable Uniform 
                                            %44 = OpTypeInt 32 1 
                                        i32 %45 = OpConstant 1 
                                            %46 = OpTypePointer Uniform %6 
                                        f32 %50 = OpConstant 3.67402E-40 
                                        f32 %51 = OpConstant 3.67402E-40 
                             Private f32_3* %53 = OpVariable Private 
                                        i32 %62 = OpConstant 2 
                                            %75 = OpTypePointer Function %7 
                                        i32 %77 = OpConstant 0 
                                            %78 = OpTypeBool 
                                            %79 = OpTypeVector %78 4 
                                            %80 = OpTypePointer Uniform %40 
                                        u32 %84 = OpConstant 0 
                                      f32_3 %90 = OpConstantComposite %50 %50 %50 
                                            %94 = OpTypePointer Function %6 
                                       u32 %104 = OpConstant 3 
                                           %106 = OpTypePointer Output %19 
                             Output f32_4* %107 = OpVariable Output 
                                           %108 = OpTypePointer Function %19 
                                     f32_4 %116 = OpConstantComposite %50 %50 %50 %51 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %76 = OpVariable Function 
                              Function f32* %95 = OpVariable Function 
                           Function f32_4* %109 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                                      f32_4 %27 = OpLoad %26 
                                      f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                      f32_3 %29 = OpFMul %24 %28 
                                      f32_4 %30 = OpLoad %23 
                                      f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                    OpStore %23 %31 
                                      f32_4 %32 = OpLoad %23 
                                      f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                      f32_3 %34 = OpExtInst %1 30 %33 
                                      f32_4 %35 = OpLoad %23 
                                      f32_4 %36 = OpVectorShuffle %35 %34 4 5 6 3 
                                                    OpStore %23 %36 
                               Uniform f32* %47 = OpAccessChain %43 %45 
                                        f32 %48 = OpLoad %47 
                                                    OpStore %38 %48 
                                        f32 %49 = OpLoad %38 
                                        f32 %52 = OpExtInst %1 43 %49 %50 %51 
                                                    OpStore %38 %52 
                                      f32_4 %54 = OpLoad %23 
                                      f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32 %56 = OpLoad %38 
                                      f32_3 %57 = OpCompositeConstruct %56 %56 %56 
                                      f32_3 %58 = OpFMul %55 %57 
                                                    OpStore %53 %58 
                                      f32_3 %59 = OpLoad %53 
                                      f32_3 %60 = OpExtInst %1 29 %59 
                                                    OpStore %53 %60 
                                      f32_3 %61 = OpLoad %53 
                               Uniform f32* %63 = OpAccessChain %43 %62 
                                        f32 %64 = OpLoad %63 
                               Uniform f32* %65 = OpAccessChain %43 %62 
                                        f32 %66 = OpLoad %65 
                               Uniform f32* %67 = OpAccessChain %43 %62 
                                        f32 %68 = OpLoad %67 
                                      f32_3 %69 = OpCompositeConstruct %64 %66 %68 
                                        f32 %70 = OpCompositeExtract %69 0 
                                        f32 %71 = OpCompositeExtract %69 1 
                                        f32 %72 = OpCompositeExtract %69 2 
                                      f32_3 %73 = OpCompositeConstruct %70 %71 %72 
                                      f32_3 %74 = OpExtInst %1 37 %61 %73 
                                                    OpStore %53 %74 
                             Uniform u32_4* %81 = OpAccessChain %43 %77 
                                      u32_4 %82 = OpLoad %81 
                                        u32 %83 = OpCompositeExtract %82 0 
                                       bool %85 = OpINotEqual %83 %84 
                                                    OpSelectionMerge %87 None 
                                                    OpBranchConditional %85 %86 %89 
                                            %86 = OpLabel 
                                      f32_3 %88 = OpLoad %53 
                                                    OpStore %76 %88 
                                                    OpBranch %87 
                                            %89 = OpLabel 
                                                    OpStore %76 %90 
                                                    OpBranch %87 
                                            %87 = OpLabel 
                                      f32_3 %91 = OpLoad %76 
                                      f32_4 %92 = OpLoad %23 
                                      f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                    OpStore %23 %93 
                             Uniform u32_4* %96 = OpAccessChain %43 %77 
                                      u32_4 %97 = OpLoad %96 
                                        u32 %98 = OpCompositeExtract %97 0 
                                       bool %99 = OpINotEqual %98 %84 
                                                    OpSelectionMerge %101 None 
                                                    OpBranchConditional %99 %100 %102 
                                           %100 = OpLabel 
                                                    OpStore %95 %51 
                                                    OpBranch %101 
                                           %102 = OpLabel 
                                                    OpStore %95 %50 
                                                    OpBranch %101 
                                           %101 = OpLabel 
                                       f32 %103 = OpLoad %95 
                              Private f32* %105 = OpAccessChain %23 %104 
                                                    OpStore %105 %103 
                            Uniform u32_4* %110 = OpAccessChain %43 %77 
                                     u32_4 %111 = OpLoad %110 
                                       u32 %112 = OpCompositeExtract %111 1 
                                      bool %113 = OpINotEqual %112 %84 
                                                    OpSelectionMerge %115 None 
                                                    OpBranchConditional %113 %114 %117 
                                           %114 = OpLabel 
                                                    OpStore %109 %116 
                                                    OpBranch %115 
                                           %117 = OpLabel 
                                     f32_4 %118 = OpLoad %23 
                                                    OpStore %109 %118 
                                                    OpBranch %115 
                                           %115 = OpLabel 
                                     f32_4 %119 = OpLoad %109 
                                                    OpStore %107 %119 
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
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 196721
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
int u_xlati12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz;
    u_xlat2.xyz = u_xlat1.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat13 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat13 = max(u_xlat13, 0.0);
        u_xlat3.xyz = vec3(u_xlat13) * in_COLOR0.xyz;
        u_xlat3.xyz = u_xlat3.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat3.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    }
    u_xlat2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 353
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %161 %195 %266 %274 %275 %287 %334 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %21 0 RelaxedPrecision 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %195 Location 195 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 Location 266 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 Location 274 
                                                      OpDecorate %275 Location 275 
                                                      OpDecorate %287 Location 287 
                                                      OpMemberDecorate %332 0 BuiltIn 332 
                                                      OpMemberDecorate %332 1 BuiltIn 332 
                                                      OpMemberDecorate %332 2 BuiltIn 332 
                                                      OpDecorate %332 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeInt 32 1 
                                              %20 = OpTypeVector %19 4 
                                              %21 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %23 = OpVariable Uniform 
                                          i32 %24 = OpConstant 3 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 5 
                                          i32 %32 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                                             %122 = OpTypePointer Private %26 
                              Private f32_3* %123 = OpVariable Private 
                                             %160 = OpTypePointer Input %26 
                                Input f32_3* %161 = OpVariable Input 
                                         u32 %164 = OpConstant 0 
                                             %165 = OpTypePointer Private %6 
                                         u32 %171 = OpConstant 1 
                                         u32 %176 = OpConstant 2 
                                Private f32* %178 = OpVariable Private 
                              Private f32_3* %193 = OpVariable Private 
                                             %194 = OpTypePointer Input %7 
                                Input f32_4* %195 = OpVariable Input 
                                         i32 %198 = OpConstant 4 
                              Private f32_4* %203 = OpVariable Private 
                                             %207 = OpTypePointer Function %19 
                                         i32 %215 = OpConstant 7 
                                             %216 = OpTypePointer Uniform %19 
                                             %219 = OpTypeBool 
                                Private f32* %221 = OpVariable Private 
                                         f32 %230 = OpConstant 3.67402E-40 
                              Private f32_3* %232 = OpVariable Private 
                                         f32 %245 = OpConstant 3.67402E-40 
                                       f32_3 %246 = OpConstantComposite %245 %245 %245 
                                         f32 %249 = OpConstant 3.67402E-40 
                                       f32_3 %250 = OpConstantComposite %249 %249 %249 
                                         u32 %260 = OpConstant 3 
                                             %261 = OpTypePointer Input %6 
                                             %265 = OpTypePointer Output %7 
                               Output f32_4* %266 = OpVariable Output 
                                             %272 = OpTypeVector %6 2 
                                             %273 = OpTypePointer Output %272 
                               Output f32_2* %274 = OpVariable Output 
                                Input f32_3* %275 = OpVariable Input 
                                         i32 %278 = OpConstant 8 
                                Input f32_3* %287 = OpVariable Input 
                                         i32 %313 = OpConstant 6 
                                             %331 = OpTypeArray %6 %171 
                                             %332 = OpTypeStruct %7 %6 %331 
                                             %333 = OpTypePointer Output %332 
        Output struct {f32_4; f32; f32[1];}* %334 = OpVariable Output 
                                             %343 = OpTypePointer Output %6 
                                             %349 = OpTypePointer Private %219 
                               Private bool* %350 = OpVariable Private 
                                             %351 = OpTypePointer Private %19 
                                Private i32* %352 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %208 = OpVariable Function 
                               Uniform f32_4* %28 = OpAccessChain %23 %24 %25 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                               Uniform f32_4* %33 = OpAccessChain %23 %31 %32 
                                        f32_4 %34 = OpLoad %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 1 1 1 
                                        f32_3 %36 = OpFMul %30 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %23 %24 %32 
                                        f32_4 %40 = OpLoad %39 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               Uniform f32_4* %42 = OpAccessChain %23 %31 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 0 0 
                                        f32_3 %45 = OpFMul %41 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %9 %50 
                               Uniform f32_4* %52 = OpAccessChain %23 %24 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %23 %31 %32 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %64 = OpAccessChain %23 %24 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %23 %31 %32 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 3 3 3 
                                        f32_3 %70 = OpFMul %66 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %73 = OpFAdd %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %23 %24 %25 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               Uniform f32_4* %80 = OpAccessChain %23 %31 %25 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %76 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %76 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %24 %32 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               Uniform f32_4* %89 = OpAccessChain %23 %31 %25 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %88 %91 
                                        f32_4 %93 = OpLoad %76 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %76 %97 
                               Uniform f32_4* %98 = OpAccessChain %23 %24 %51 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                              Uniform f32_4* %101 = OpAccessChain %23 %31 %25 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %100 %103 
                                       f32_4 %105 = OpLoad %76 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %76 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %76 %109 
                              Uniform f32_4* %110 = OpAccessChain %23 %24 %24 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                              Uniform f32_4* %113 = OpAccessChain %23 %31 %25 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_3 %116 = OpFMul %112 %115 
                                       f32_4 %117 = OpLoad %76 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %76 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %76 %121 
                              Uniform f32_4* %124 = OpAccessChain %23 %24 %25 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %23 %31 %51 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                                       f32_3 %130 = OpFMul %126 %129 
                                                      OpStore %123 %130 
                              Uniform f32_4* %131 = OpAccessChain %23 %24 %32 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_4* %134 = OpAccessChain %23 %31 %51 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 0 0 
                                       f32_3 %137 = OpFMul %133 %136 
                                       f32_3 %138 = OpLoad %123 
                                       f32_3 %139 = OpFAdd %137 %138 
                                                      OpStore %123 %139 
                              Uniform f32_4* %140 = OpAccessChain %23 %24 %51 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              Uniform f32_4* %143 = OpAccessChain %23 %31 %51 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %142 %145 
                                       f32_3 %147 = OpLoad %123 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %123 %148 
                              Uniform f32_4* %149 = OpAccessChain %23 %24 %24 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                              Uniform f32_4* %152 = OpAccessChain %23 %31 %51 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 3 3 3 
                                       f32_3 %155 = OpFMul %151 %154 
                                       f32_3 %156 = OpLoad %123 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %123 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %162 = OpLoad %161 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %166 = OpAccessChain %9 %164 
                                                      OpStore %166 %163 
                                       f32_4 %167 = OpLoad %76 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %161 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %172 = OpAccessChain %9 %171 
                                                      OpStore %172 %170 
                                       f32_3 %173 = OpLoad %123 
                                       f32_3 %174 = OpLoad %161 
                                         f32 %175 = OpDot %173 %174 
                                Private f32* %177 = OpAccessChain %9 %176 
                                                      OpStore %177 %175 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                         f32 %183 = OpDot %180 %182 
                                                      OpStore %178 %183 
                                         f32 %184 = OpLoad %178 
                                         f32 %185 = OpExtInst %1 32 %184 
                                                      OpStore %178 %185 
                                         f32 %186 = OpLoad %178 
                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %9 %192 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                              Uniform f32_4* %199 = OpAccessChain %23 %198 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpFMul %197 %201 
                                                      OpStore %193 %202 
                                       f32_3 %204 = OpLoad %193 
                                       f32_4 %205 = OpLoad %203 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 5 6 3 
                                                      OpStore %203 %206 
                                                      OpStore %208 %32 
                                                      OpBranch %209 
                                             %209 = OpLabel 
                                                      OpLoopMerge %211 %212 None 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                         i32 %214 = OpLoad %208 
                                Uniform i32* %217 = OpAccessChain %23 %215 %164 
                                         i32 %218 = OpLoad %217 
                                        bool %220 = OpSLessThan %214 %218 
                                                      OpBranchConditional %220 %210 %211 
                                             %210 = OpLabel 
                                       f32_4 %222 = OpLoad %9 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         i32 %224 = OpLoad %208 
                              Uniform f32_4* %225 = OpAccessChain %23 %25 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                         f32 %228 = OpDot %223 %227 
                                                      OpStore %221 %228 
                                         f32 %229 = OpLoad %221 
                                         f32 %231 = OpExtInst %1 40 %229 %230 
                                                      OpStore %221 %231 
                                         f32 %233 = OpLoad %221 
                                       f32_3 %234 = OpCompositeConstruct %233 %233 %233 
                                       f32_4 %235 = OpLoad %195 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFMul %234 %236 
                                                      OpStore %232 %237 
                                       f32_3 %238 = OpLoad %232 
                                         i32 %239 = OpLoad %208 
                              Uniform f32_4* %240 = OpAccessChain %23 %32 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %238 %242 
                                                      OpStore %232 %243 
                                       f32_3 %244 = OpLoad %232 
                                       f32_3 %247 = OpFMul %244 %246 
                                                      OpStore %232 %247 
                                       f32_3 %248 = OpLoad %232 
                                       f32_3 %251 = OpExtInst %1 37 %248 %250 
                                                      OpStore %232 %251 
                                       f32_4 %252 = OpLoad %203 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpLoad %232 
                                       f32_3 %255 = OpFAdd %253 %254 
                                       f32_4 %256 = OpLoad %203 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %203 %257 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         i32 %258 = OpLoad %208 
                                         i32 %259 = OpIAdd %258 %25 
                                                      OpStore %208 %259 
                                                      OpBranch %209 
                                             %211 = OpLabel 
                                  Input f32* %262 = OpAccessChain %195 %260 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %203 %260 
                                                      OpStore %264 %263 
                                       f32_4 %267 = OpLoad %203 
                                                      OpStore %266 %267 
                                       f32_4 %268 = OpLoad %266 
                                       f32_4 %269 = OpCompositeConstruct %230 %230 %230 %230 
                                       f32_4 %270 = OpCompositeConstruct %249 %249 %249 %249 
                                       f32_4 %271 = OpExtInst %1 43 %268 %269 %270 
                                                      OpStore %266 %271 
                                       f32_3 %276 = OpLoad %275 
                                       f32_2 %277 = OpVectorShuffle %276 %276 0 1 
                              Uniform f32_4* %279 = OpAccessChain %23 %278 
                                       f32_4 %280 = OpLoad %279 
                                       f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                                       f32_2 %282 = OpFMul %277 %281 
                              Uniform f32_4* %283 = OpAccessChain %23 %278 
                                       f32_4 %284 = OpLoad %283 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_2 %286 = OpFAdd %282 %285 
                                                      OpStore %274 %286 
                                       f32_3 %288 = OpLoad %287 
                                       f32_4 %289 = OpVectorShuffle %288 %288 1 1 1 1 
                              Uniform f32_4* %290 = OpAccessChain %23 %51 %25 
                                       f32_4 %291 = OpLoad %290 
                                       f32_4 %292 = OpFMul %289 %291 
                                                      OpStore %9 %292 
                              Uniform f32_4* %293 = OpAccessChain %23 %51 %32 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpLoad %287 
                                       f32_4 %296 = OpVectorShuffle %295 %295 0 0 0 0 
                                       f32_4 %297 = OpFMul %294 %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpFAdd %297 %298 
                                                      OpStore %9 %299 
                              Uniform f32_4* %300 = OpAccessChain %23 %51 %51 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpLoad %287 
                                       f32_4 %303 = OpVectorShuffle %302 %302 2 2 2 2 
                                       f32_4 %304 = OpFMul %301 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %9 %306 
                                       f32_4 %307 = OpLoad %9 
                              Uniform f32_4* %308 = OpAccessChain %23 %51 %24 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpFAdd %307 %309 
                                                      OpStore %9 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpVectorShuffle %311 %311 1 1 1 1 
                              Uniform f32_4* %314 = OpAccessChain %23 %313 %25 
                                       f32_4 %315 = OpLoad %314 
                                       f32_4 %316 = OpFMul %312 %315 
                                                      OpStore %76 %316 
                              Uniform f32_4* %317 = OpAccessChain %23 %313 %32 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %319 0 0 0 0 
                                       f32_4 %321 = OpFMul %318 %320 
                                       f32_4 %322 = OpLoad %76 
                                       f32_4 %323 = OpFAdd %321 %322 
                                                      OpStore %76 %323 
                              Uniform f32_4* %324 = OpAccessChain %23 %313 %51 
                                       f32_4 %325 = OpLoad %324 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpVectorShuffle %326 %326 2 2 2 2 
                                       f32_4 %328 = OpFMul %325 %327 
                                       f32_4 %329 = OpLoad %76 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %76 %330 
                              Uniform f32_4* %335 = OpAccessChain %23 %313 %24 
                                       f32_4 %336 = OpLoad %335 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpVectorShuffle %337 %337 3 3 3 3 
                                       f32_4 %339 = OpFMul %336 %338 
                                       f32_4 %340 = OpLoad %76 
                                       f32_4 %341 = OpFAdd %339 %340 
                               Output f32_4* %342 = OpAccessChain %334 %32 
                                                      OpStore %342 %341 
                                 Output f32* %344 = OpAccessChain %334 %32 %171 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFNegate %345 
                                 Output f32* %347 = OpAccessChain %334 %32 %171 
                                                      OpStore %347 %346 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 49
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %26 %31 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %26 Location 26 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %31 Location 31 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
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
                                            %25 = OpTypePointer Input %7 
                               Input f32_4* %26 = OpVariable Input 
                                            %30 = OpTypePointer Output %7 
                              Output f32_4* %31 = OpVariable Output 
                                            %32 = OpTypeInt 32 0 
                                        u32 %33 = OpConstant 3 
                                            %34 = OpTypePointer Private %6 
                                            %37 = OpTypePointer Input %6 
                                            %41 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %23 = OpLoad %9 
                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                      f32_4 %27 = OpLoad %26 
                                      f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                      f32_3 %29 = OpFMul %24 %28 
                                                    OpStore %22 %29 
                               Private f32* %35 = OpAccessChain %9 %33 
                                        f32 %36 = OpLoad %35 
                                 Input f32* %38 = OpAccessChain %26 %33 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpFMul %36 %39 
                                Output f32* %42 = OpAccessChain %31 %33 
                                                    OpStore %42 %40 
                                      f32_3 %43 = OpLoad %22 
                                      f32_3 %44 = OpLoad %22 
                                      f32_3 %45 = OpFAdd %43 %44 
                                      f32_4 %46 = OpLoad %31 
                                      f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                                    OpStore %31 %47 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
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

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
vec3 u_xlat6;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb25;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz;
    u_xlat3.xyz = u_xlat2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat4.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat23 = unity_LightAtten[u_xlati_loop_1].z * u_xlat22 + 1.0;
        u_xlat23 = float(1.0) / u_xlat23;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb5 = unity_LightAtten[u_xlati_loop_1].w<u_xlat22;
        u_xlatb25 = u_xlatb25 && u_xlatb5;
        u_xlat22 = max(u_xlat22, 9.99999997e-007);
        u_xlat22 = inversesqrt(u_xlat22);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = u_xlat23 * 0.5;
        u_xlat22 = (u_xlatb25) ? 0.0 : u_xlat22;
        u_xlat23 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat23 = max(u_xlat23, 0.0);
        u_xlat4.xyz = vec3(u_xlat23) * in_COLOR0.xyz;
        u_xlat4.xyz = u_xlat4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    }
    u_xlat3.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat3;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
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
; Bound: 588
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %370 %503 %511 %512 %570 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 RelaxedPrecision 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 RelaxedPrecision 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 RelaxedPrecision 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %370 Location 370 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %435 RelaxedPrecision 
                                                      OpDecorate %453 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %481 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %489 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %492 RelaxedPrecision 
                                                      OpDecorate %493 RelaxedPrecision 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %503 Location 503 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %511 Location 511 
                                                      OpDecorate %512 Location 512 
                                                      OpMemberDecorate %568 0 BuiltIn 568 
                                                      OpMemberDecorate %568 1 BuiltIn 568 
                                                      OpMemberDecorate %568 2 BuiltIn 568 
                                                      OpDecorate %568 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                             %369 = OpTypePointer Input %7 
                                Input f32_4* %370 = OpVariable Input 
                                         i32 %373 = OpConstant 5 
                              Private f32_4* %378 = OpVariable Private 
                                             %382 = OpTypePointer Function %21 
                                         i32 %390 = OpConstant 9 
                                             %391 = OpTypePointer Uniform %21 
                                             %394 = OpTypeBool 
                                Private f32* %409 = OpVariable Private 
                                Private f32* %413 = OpVariable Private 
                                             %415 = OpTypePointer Uniform %6 
                                         f32 %420 = OpConstant 3.67402E-40 
                                             %424 = OpTypePointer Private %394 
                               Private bool* %425 = OpVariable Private 
                                         f32 %426 = OpConstant 3.67402E-40 
                                         u32 %428 = OpConstant 3 
                               Private bool* %432 = OpVariable Private 
                                         f32 %442 = OpConstant 3.67402E-40 
                                         f32 %451 = OpConstant 3.67402E-40 
                                Private f32* %453 = OpVariable Private 
                                             %454 = OpTypePointer Function %6 
                              Private f32_3* %462 = OpVariable Private 
                                       f32_3 %488 = OpConstantComposite %420 %420 %420 
                                             %498 = OpTypePointer Input %6 
                                             %502 = OpTypePointer Output %7 
                               Output f32_4* %503 = OpVariable Output 
                                             %509 = OpTypeVector %6 2 
                                             %510 = OpTypePointer Output %509 
                               Output f32_2* %511 = OpVariable Output 
                                Input f32_3* %512 = OpVariable Input 
                                         i32 %515 = OpConstant 10 
                                         i32 %549 = OpConstant 8 
                                             %567 = OpTypeArray %6 %346 
                                             %568 = OpTypeStruct %7 %6 %567 
                                             %569 = OpTypePointer Output %568 
        Output struct {f32_4; f32; f32[1];}* %570 = OpVariable Output 
                                             %579 = OpTypePointer Output %6 
                                             %585 = OpTypePointer Private %21 
                                Private i32* %586 = OpVariable Private 
                               Private bool* %587 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %383 = OpVariable Function 
                               Function f32* %455 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                                       f32_4 %371 = OpLoad %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                              Uniform f32_4* %374 = OpAccessChain %25 %373 
                                       f32_4 %375 = OpLoad %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpFMul %372 %376 
                                                      OpStore %368 %377 
                                       f32_3 %379 = OpLoad %368 
                                       f32_4 %380 = OpLoad %378 
                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                                      OpStore %378 %381 
                                                      OpStore %383 %27 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                                      OpLoopMerge %386 %387 None 
                                                      OpBranch %388 
                                             %388 = OpLabel 
                                         i32 %389 = OpLoad %383 
                                Uniform i32* %392 = OpAccessChain %25 %390 %340 
                                         i32 %393 = OpLoad %392 
                                        bool %395 = OpSLessThan %389 %393 
                                                      OpBranchConditional %395 %385 %386 
                                             %385 = OpLabel 
                                       f32_4 %396 = OpLoad %9 
                                       f32_3 %397 = OpVectorShuffle %396 %396 0 1 2 
                                       f32_3 %398 = OpFNegate %397 
                                         i32 %399 = OpLoad %383 
                              Uniform f32_4* %400 = OpAccessChain %25 %34 %399 
                                       f32_4 %401 = OpLoad %400 
                                       f32_3 %402 = OpVectorShuffle %401 %401 3 3 3 
                                       f32_3 %403 = OpFMul %398 %402 
                                         i32 %404 = OpLoad %383 
                              Uniform f32_4* %405 = OpAccessChain %25 %34 %404 
                                       f32_4 %406 = OpLoad %405 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                       f32_3 %408 = OpFAdd %403 %407 
                                                      OpStore %160 %408 
                                       f32_3 %410 = OpLoad %160 
                                       f32_3 %411 = OpLoad %160 
                                         f32 %412 = OpDot %410 %411 
                                                      OpStore %409 %412 
                                         i32 %414 = OpLoad %383 
                                Uniform f32* %416 = OpAccessChain %25 %53 %414 %351 
                                         f32 %417 = OpLoad %416 
                                         f32 %418 = OpLoad %409 
                                         f32 %419 = OpFMul %417 %418 
                                         f32 %421 = OpFAdd %419 %420 
                                                      OpStore %413 %421 
                                         f32 %422 = OpLoad %413 
                                         f32 %423 = OpFDiv %420 %422 
                                                      OpStore %413 %423 
                                         i32 %427 = OpLoad %383 
                                Uniform f32* %429 = OpAccessChain %25 %34 %427 %428 
                                         f32 %430 = OpLoad %429 
                                        bool %431 = OpFOrdNotEqual %426 %430 
                                                      OpStore %425 %431 
                                         i32 %433 = OpLoad %383 
                                Uniform f32* %434 = OpAccessChain %25 %53 %433 %428 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpLoad %409 
                                        bool %437 = OpFOrdLessThan %435 %436 
                                                      OpStore %432 %437 
                                        bool %438 = OpLoad %432 
                                        bool %439 = OpLoad %425 
                                        bool %440 = OpLogicalAnd %438 %439 
                                                      OpStore %425 %440 
                                         f32 %441 = OpLoad %409 
                                         f32 %443 = OpExtInst %1 40 %441 %442 
                                                      OpStore %409 %443 
                                         f32 %444 = OpLoad %409 
                                         f32 %445 = OpExtInst %1 32 %444 
                                                      OpStore %409 %445 
                                         f32 %446 = OpLoad %409 
                                       f32_3 %447 = OpCompositeConstruct %446 %446 %446 
                                       f32_3 %448 = OpLoad %160 
                                       f32_3 %449 = OpFMul %447 %448 
                                                      OpStore %160 %449 
                                         f32 %450 = OpLoad %413 
                                         f32 %452 = OpFMul %450 %451 
                                                      OpStore %409 %452 
                                        bool %456 = OpLoad %425 
                                                      OpSelectionMerge %458 None 
                                                      OpBranchConditional %456 %457 %459 
                                             %457 = OpLabel 
                                                      OpStore %455 %426 
                                                      OpBranch %458 
                                             %459 = OpLabel 
                                         f32 %460 = OpLoad %409 
                                                      OpStore %455 %460 
                                                      OpBranch %458 
                                             %458 = OpLabel 
                                         f32 %461 = OpLoad %455 
                                                      OpStore %453 %461 
                                       f32_4 %463 = OpLoad %78 
                                       f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
                                       f32_3 %465 = OpLoad %160 
                                         f32 %466 = OpDot %464 %465 
                                Private f32* %467 = OpAccessChain %462 %340 
                                                      OpStore %467 %466 
                                Private f32* %468 = OpAccessChain %462 %340 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpExtInst %1 40 %469 %426 
                                Private f32* %471 = OpAccessChain %462 %340 
                                                      OpStore %471 %470 
                                       f32_3 %472 = OpLoad %462 
                                       f32_3 %473 = OpVectorShuffle %472 %472 0 0 0 
                                       f32_4 %474 = OpLoad %370 
                                       f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
                                       f32_3 %476 = OpFMul %473 %475 
                                                      OpStore %462 %476 
                                       f32_3 %477 = OpLoad %462 
                                         i32 %478 = OpLoad %383 
                              Uniform f32_4* %479 = OpAccessChain %25 %27 %478 
                                       f32_4 %480 = OpLoad %479 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                                       f32_3 %482 = OpFMul %477 %481 
                                                      OpStore %462 %482 
                                         f32 %483 = OpLoad %453 
                                       f32_3 %484 = OpCompositeConstruct %483 %483 %483 
                                       f32_3 %485 = OpLoad %462 
                                       f32_3 %486 = OpFMul %484 %485 
                                                      OpStore %462 %486 
                                       f32_3 %487 = OpLoad %462 
                                       f32_3 %489 = OpExtInst %1 37 %487 %488 
                                                      OpStore %462 %489 
                                       f32_4 %490 = OpLoad %378 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                                       f32_3 %492 = OpLoad %462 
                                       f32_3 %493 = OpFAdd %491 %492 
                                       f32_4 %494 = OpLoad %378 
                                       f32_4 %495 = OpVectorShuffle %494 %493 4 5 6 3 
                                                      OpStore %378 %495 
                                                      OpBranch %387 
                                             %387 = OpLabel 
                                         i32 %496 = OpLoad %383 
                                         i32 %497 = OpIAdd %496 %34 
                                                      OpStore %383 %497 
                                                      OpBranch %384 
                                             %386 = OpLabel 
                                  Input f32* %499 = OpAccessChain %370 %428 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %378 %428 
                                                      OpStore %501 %500 
                                       f32_4 %504 = OpLoad %378 
                                                      OpStore %503 %504 
                                       f32_4 %505 = OpLoad %503 
                                       f32_4 %506 = OpCompositeConstruct %426 %426 %426 %426 
                                       f32_4 %507 = OpCompositeConstruct %420 %420 %420 %420 
                                       f32_4 %508 = OpExtInst %1 43 %505 %506 %507 
                                                      OpStore %503 %508 
                                       f32_3 %513 = OpLoad %512 
                                       f32_2 %514 = OpVectorShuffle %513 %513 0 1 
                              Uniform f32_4* %516 = OpAccessChain %25 %515 
                                       f32_4 %517 = OpLoad %516 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 1 
                                       f32_2 %519 = OpFMul %514 %518 
                              Uniform f32_4* %520 = OpAccessChain %25 %515 
                                       f32_4 %521 = OpLoad %520 
                                       f32_2 %522 = OpVectorShuffle %521 %521 2 3 
                                       f32_2 %523 = OpFAdd %519 %522 
                                                      OpStore %511 %523 
                                       f32_3 %524 = OpLoad %305 
                                       f32_4 %525 = OpVectorShuffle %524 %524 1 1 1 1 
                              Uniform f32_4* %526 = OpAccessChain %25 %26 %34 
                                       f32_4 %527 = OpLoad %526 
                                       f32_4 %528 = OpFMul %525 %527 
                                                      OpStore %9 %528 
                              Uniform f32_4* %529 = OpAccessChain %25 %26 %27 
                                       f32_4 %530 = OpLoad %529 
                                       f32_3 %531 = OpLoad %305 
                                       f32_4 %532 = OpVectorShuffle %531 %531 0 0 0 0 
                                       f32_4 %533 = OpFMul %530 %532 
                                       f32_4 %534 = OpLoad %9 
                                       f32_4 %535 = OpFAdd %533 %534 
                                                      OpStore %9 %535 
                              Uniform f32_4* %536 = OpAccessChain %25 %26 %53 
                                       f32_4 %537 = OpLoad %536 
                                       f32_3 %538 = OpLoad %305 
                                       f32_4 %539 = OpVectorShuffle %538 %538 2 2 2 2 
                                       f32_4 %540 = OpFMul %537 %539 
                                       f32_4 %541 = OpLoad %9 
                                       f32_4 %542 = OpFAdd %540 %541 
                                                      OpStore %9 %542 
                                       f32_4 %543 = OpLoad %9 
                              Uniform f32_4* %544 = OpAccessChain %25 %26 %26 
                                       f32_4 %545 = OpLoad %544 
                                       f32_4 %546 = OpFAdd %543 %545 
                                                      OpStore %9 %546 
                                       f32_4 %547 = OpLoad %9 
                                       f32_4 %548 = OpVectorShuffle %547 %547 1 1 1 1 
                              Uniform f32_4* %550 = OpAccessChain %25 %549 %34 
                                       f32_4 %551 = OpLoad %550 
                                       f32_4 %552 = OpFMul %548 %551 
                                                      OpStore %78 %552 
                              Uniform f32_4* %553 = OpAccessChain %25 %549 %27 
                                       f32_4 %554 = OpLoad %553 
                                       f32_4 %555 = OpLoad %9 
                                       f32_4 %556 = OpVectorShuffle %555 %555 0 0 0 0 
                                       f32_4 %557 = OpFMul %554 %556 
                                       f32_4 %558 = OpLoad %78 
                                       f32_4 %559 = OpFAdd %557 %558 
                                                      OpStore %78 %559 
                              Uniform f32_4* %560 = OpAccessChain %25 %549 %53 
                                       f32_4 %561 = OpLoad %560 
                                       f32_4 %562 = OpLoad %9 
                                       f32_4 %563 = OpVectorShuffle %562 %562 2 2 2 2 
                                       f32_4 %564 = OpFMul %561 %563 
                                       f32_4 %565 = OpLoad %78 
                                       f32_4 %566 = OpFAdd %564 %565 
                                                      OpStore %78 %566 
                              Uniform f32_4* %571 = OpAccessChain %25 %549 %26 
                                       f32_4 %572 = OpLoad %571 
                                       f32_4 %573 = OpLoad %9 
                                       f32_4 %574 = OpVectorShuffle %573 %573 3 3 3 3 
                                       f32_4 %575 = OpFMul %572 %574 
                                       f32_4 %576 = OpLoad %78 
                                       f32_4 %577 = OpFAdd %575 %576 
                               Output f32_4* %578 = OpAccessChain %570 %27 
                                                      OpStore %578 %577 
                                 Output f32* %580 = OpAccessChain %570 %27 %346 
                                         f32 %581 = OpLoad %580 
                                         f32 %582 = OpFNegate %581 
                                 Output f32* %583 = OpAccessChain %570 %27 %346 
                                                      OpStore %583 %582 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 49
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %26 %31 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %26 Location 26 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %31 Location 31 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
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
                                            %25 = OpTypePointer Input %7 
                               Input f32_4* %26 = OpVariable Input 
                                            %30 = OpTypePointer Output %7 
                              Output f32_4* %31 = OpVariable Output 
                                            %32 = OpTypeInt 32 0 
                                        u32 %33 = OpConstant 3 
                                            %34 = OpTypePointer Private %6 
                                            %37 = OpTypePointer Input %6 
                                            %41 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %23 = OpLoad %9 
                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                      f32_4 %27 = OpLoad %26 
                                      f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                      f32_3 %29 = OpFMul %24 %28 
                                                    OpStore %22 %29 
                               Private f32* %35 = OpAccessChain %9 %33 
                                        f32 %36 = OpLoad %35 
                                 Input f32* %38 = OpAccessChain %26 %33 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpFMul %36 %39 
                                Output f32* %42 = OpAccessChain %31 %33 
                                                    OpStore %42 %40 
                                      f32_3 %43 = OpLoad %22 
                                      f32_3 %44 = OpLoad %22 
                                      f32_3 %45 = OpFAdd %43 %44 
                                      f32_4 %46 = OpLoad %31 
                                      f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                                    OpStore %31 %47 
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

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_COLOR0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
vec3 u_xlat6;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb25;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz;
    u_xlat3.xyz = u_xlat2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat4.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat23 = unity_LightAtten[u_xlati_loop_1].z * u_xlat22 + 1.0;
        u_xlat23 = float(1.0) / u_xlat23;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb5 = unity_LightAtten[u_xlati_loop_1].w<u_xlat22;
        u_xlatb25 = u_xlatb25 && u_xlatb5;
        u_xlat23 = (u_xlatb25) ? 0.0 : u_xlat23;
        u_xlat22 = max(u_xlat22, 9.99999997e-007);
        u_xlat22 = inversesqrt(u_xlat22);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = dot(u_xlat4.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = u_xlat22 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat22 = u_xlat22 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat22 = u_xlat22 * u_xlat23;
        u_xlat22 = u_xlat22 * 0.5;
        u_xlat23 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat23 = max(u_xlat23, 0.0);
        u_xlat4.xyz = vec3(u_xlat23) * in_COLOR0.xyz;
        u_xlat4.xyz = u_xlat4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    }
    u_xlat3.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat3;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
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
; Bound: 620
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %372 %535 %543 %544 %602 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 RelaxedPrecision 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 RelaxedPrecision 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 RelaxedPrecision 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %372 Location 372 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %419 RelaxedPrecision 
                                                      OpDecorate %437 RelaxedPrecision 
                                                      OpDecorate %443 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %481 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %492 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %501 RelaxedPrecision 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %509 RelaxedPrecision 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %522 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %535 RelaxedPrecision 
                                                      OpDecorate %535 Location 535 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %537 RelaxedPrecision 
                                                      OpDecorate %538 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %543 Location 543 
                                                      OpDecorate %544 Location 544 
                                                      OpMemberDecorate %600 0 BuiltIn 600 
                                                      OpMemberDecorate %600 1 BuiltIn 600 
                                                      OpMemberDecorate %600 2 BuiltIn 600 
                                                      OpDecorate %600 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                              Private f32_3* %370 = OpVariable Private 
                                             %371 = OpTypePointer Input %7 
                                Input f32_4* %372 = OpVariable Input 
                                         i32 %375 = OpConstant 6 
                              Private f32_4* %380 = OpVariable Private 
                                             %384 = OpTypePointer Function %22 
                                         i32 %392 = OpConstant 10 
                                             %393 = OpTypePointer Uniform %22 
                                             %396 = OpTypeBool 
                                Private f32* %411 = OpVariable Private 
                                Private f32* %415 = OpVariable Private 
                                             %417 = OpTypePointer Uniform %6 
                                         f32 %422 = OpConstant 3.67402E-40 
                                             %426 = OpTypePointer Private %396 
                               Private bool* %427 = OpVariable Private 
                                         f32 %428 = OpConstant 3.67402E-40 
                                         u32 %430 = OpConstant 3 
                               Private bool* %434 = OpVariable Private 
                                Private f32* %443 = OpVariable Private 
                                             %444 = OpTypePointer Function %6 
                                         f32 %453 = OpConstant 3.67402E-40 
                              Private f32_3* %469 = OpVariable Private 
                                         f32 %493 = OpConstant 3.67402E-40 
                                       f32_3 %520 = OpConstantComposite %422 %422 %422 
                                             %530 = OpTypePointer Input %6 
                                             %534 = OpTypePointer Output %7 
                               Output f32_4* %535 = OpVariable Output 
                                             %541 = OpTypeVector %6 2 
                                             %542 = OpTypePointer Output %541 
                               Output f32_2* %543 = OpVariable Output 
                                Input f32_3* %544 = OpVariable Input 
                                         i32 %547 = OpConstant 11 
                                         i32 %581 = OpConstant 9 
                                             %599 = OpTypeArray %6 %348 
                                             %600 = OpTypeStruct %7 %6 %599 
                                             %601 = OpTypePointer Output %600 
        Output struct {f32_4; f32; f32[1];}* %602 = OpVariable Output 
                                             %611 = OpTypePointer Output %6 
                                             %617 = OpTypePointer Private %22 
                                Private i32* %618 = OpVariable Private 
                               Private bool* %619 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %385 = OpVariable Function 
                               Function f32* %445 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                              Uniform f32_4* %376 = OpAccessChain %26 %375 
                                       f32_4 %377 = OpLoad %376 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpFMul %374 %378 
                                                      OpStore %370 %379 
                                       f32_3 %381 = OpLoad %370 
                                       f32_4 %382 = OpLoad %380 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %380 %383 
                                                      OpStore %385 %28 
                                                      OpBranch %386 
                                             %386 = OpLabel 
                                                      OpLoopMerge %388 %389 None 
                                                      OpBranch %390 
                                             %390 = OpLabel 
                                         i32 %391 = OpLoad %385 
                                Uniform i32* %394 = OpAccessChain %26 %392 %342 
                                         i32 %395 = OpLoad %394 
                                        bool %397 = OpSLessThan %391 %395 
                                                      OpBranchConditional %397 %387 %388 
                                             %387 = OpLabel 
                                       f32_4 %398 = OpLoad %9 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_3 %400 = OpFNegate %399 
                                         i32 %401 = OpLoad %385 
                              Uniform f32_4* %402 = OpAccessChain %26 %35 %401 
                                       f32_4 %403 = OpLoad %402 
                                       f32_3 %404 = OpVectorShuffle %403 %403 3 3 3 
                                       f32_3 %405 = OpFMul %400 %404 
                                         i32 %406 = OpLoad %385 
                              Uniform f32_4* %407 = OpAccessChain %26 %35 %406 
                                       f32_4 %408 = OpLoad %407 
                                       f32_3 %409 = OpVectorShuffle %408 %408 0 1 2 
                                       f32_3 %410 = OpFAdd %405 %409 
                                                      OpStore %162 %410 
                                       f32_3 %412 = OpLoad %162 
                                       f32_3 %413 = OpLoad %162 
                                         f32 %414 = OpDot %412 %413 
                                                      OpStore %411 %414 
                                         i32 %416 = OpLoad %385 
                                Uniform f32* %418 = OpAccessChain %26 %54 %416 %353 
                                         f32 %419 = OpLoad %418 
                                         f32 %420 = OpLoad %411 
                                         f32 %421 = OpFMul %419 %420 
                                         f32 %423 = OpFAdd %421 %422 
                                                      OpStore %415 %423 
                                         f32 %424 = OpLoad %415 
                                         f32 %425 = OpFDiv %422 %424 
                                                      OpStore %415 %425 
                                         i32 %429 = OpLoad %385 
                                Uniform f32* %431 = OpAccessChain %26 %35 %429 %430 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdNotEqual %428 %432 
                                                      OpStore %427 %433 
                                         i32 %435 = OpLoad %385 
                                Uniform f32* %436 = OpAccessChain %26 %54 %435 %430 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpLoad %411 
                                        bool %439 = OpFOrdLessThan %437 %438 
                                                      OpStore %434 %439 
                                        bool %440 = OpLoad %434 
                                        bool %441 = OpLoad %427 
                                        bool %442 = OpLogicalAnd %440 %441 
                                                      OpStore %427 %442 
                                        bool %446 = OpLoad %427 
                                                      OpSelectionMerge %448 None 
                                                      OpBranchConditional %446 %447 %449 
                                             %447 = OpLabel 
                                                      OpStore %445 %428 
                                                      OpBranch %448 
                                             %449 = OpLabel 
                                         f32 %450 = OpLoad %415 
                                                      OpStore %445 %450 
                                                      OpBranch %448 
                                             %448 = OpLabel 
                                         f32 %451 = OpLoad %445 
                                                      OpStore %443 %451 
                                         f32 %452 = OpLoad %411 
                                         f32 %454 = OpExtInst %1 40 %452 %453 
                                                      OpStore %411 %454 
                                         f32 %455 = OpLoad %411 
                                         f32 %456 = OpExtInst %1 32 %455 
                                                      OpStore %411 %456 
                                         f32 %457 = OpLoad %411 
                                       f32_3 %458 = OpCompositeConstruct %457 %457 %457 
                                       f32_3 %459 = OpLoad %162 
                                       f32_3 %460 = OpFMul %458 %459 
                                                      OpStore %162 %460 
                                       f32_3 %461 = OpLoad %162 
                                         i32 %462 = OpLoad %385 
                              Uniform f32_4* %463 = OpAccessChain %26 %67 %462 
                                       f32_4 %464 = OpLoad %463 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                                         f32 %466 = OpDot %461 %465 
                                                      OpStore %411 %466 
                                         f32 %467 = OpLoad %411 
                                         f32 %468 = OpExtInst %1 40 %467 %428 
                                                      OpStore %411 %468 
                                         f32 %470 = OpLoad %411 
                                         i32 %471 = OpLoad %385 
                                Uniform f32* %472 = OpAccessChain %26 %54 %471 %342 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                         f32 %475 = OpFAdd %470 %474 
                                Private f32* %476 = OpAccessChain %469 %342 
                                                      OpStore %476 %475 
                                Private f32* %477 = OpAccessChain %469 %342 
                                         f32 %478 = OpLoad %477 
                                         i32 %479 = OpLoad %385 
                                Uniform f32* %480 = OpAccessChain %26 %54 %479 %348 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpFMul %478 %481 
                                Private f32* %483 = OpAccessChain %469 %342 
                                                      OpStore %483 %482 
                                Private f32* %484 = OpAccessChain %469 %342 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpExtInst %1 43 %485 %428 %422 
                                Private f32* %487 = OpAccessChain %469 %342 
                                                      OpStore %487 %486 
                                         f32 %488 = OpLoad %443 
                                Private f32* %489 = OpAccessChain %469 %342 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                                      OpStore %443 %491 
                                         f32 %492 = OpLoad %443 
                                         f32 %494 = OpFMul %492 %493 
                                                      OpStore %443 %494 
                                       f32_4 %495 = OpLoad %80 
                                       f32_3 %496 = OpVectorShuffle %495 %495 0 1 2 
                                       f32_3 %497 = OpLoad %162 
                                         f32 %498 = OpDot %496 %497 
                                Private f32* %499 = OpAccessChain %469 %342 
                                                      OpStore %499 %498 
                                Private f32* %500 = OpAccessChain %469 %342 
                                         f32 %501 = OpLoad %500 
                                         f32 %502 = OpExtInst %1 40 %501 %428 
                                Private f32* %503 = OpAccessChain %469 %342 
                                                      OpStore %503 %502 
                                       f32_3 %504 = OpLoad %469 
                                       f32_3 %505 = OpVectorShuffle %504 %504 0 0 0 
                                       f32_4 %506 = OpLoad %372 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpFMul %505 %507 
                                                      OpStore %469 %508 
                                       f32_3 %509 = OpLoad %469 
                                         i32 %510 = OpLoad %385 
                              Uniform f32_4* %511 = OpAccessChain %26 %28 %510 
                                       f32_4 %512 = OpLoad %511 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpFMul %509 %513 
                                                      OpStore %469 %514 
                                         f32 %515 = OpLoad %443 
                                       f32_3 %516 = OpCompositeConstruct %515 %515 %515 
                                       f32_3 %517 = OpLoad %469 
                                       f32_3 %518 = OpFMul %516 %517 
                                                      OpStore %469 %518 
                                       f32_3 %519 = OpLoad %469 
                                       f32_3 %521 = OpExtInst %1 37 %519 %520 
                                                      OpStore %469 %521 
                                       f32_4 %522 = OpLoad %380 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                       f32_3 %524 = OpLoad %469 
                                       f32_3 %525 = OpFAdd %523 %524 
                                       f32_4 %526 = OpLoad %380 
                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
                                                      OpStore %380 %527 
                                                      OpBranch %389 
                                             %389 = OpLabel 
                                         i32 %528 = OpLoad %385 
                                         i32 %529 = OpIAdd %528 %35 
                                                      OpStore %385 %529 
                                                      OpBranch %386 
                                             %388 = OpLabel 
                                  Input f32* %531 = OpAccessChain %372 %430 
                                         f32 %532 = OpLoad %531 
                                Private f32* %533 = OpAccessChain %380 %430 
                                                      OpStore %533 %532 
                                       f32_4 %536 = OpLoad %380 
                                                      OpStore %535 %536 
                                       f32_4 %537 = OpLoad %535 
                                       f32_4 %538 = OpCompositeConstruct %428 %428 %428 %428 
                                       f32_4 %539 = OpCompositeConstruct %422 %422 %422 %422 
                                       f32_4 %540 = OpExtInst %1 43 %537 %538 %539 
                                                      OpStore %535 %540 
                                       f32_3 %545 = OpLoad %544 
                                       f32_2 %546 = OpVectorShuffle %545 %545 0 1 
                              Uniform f32_4* %548 = OpAccessChain %26 %547 
                                       f32_4 %549 = OpLoad %548 
                                       f32_2 %550 = OpVectorShuffle %549 %549 0 1 
                                       f32_2 %551 = OpFMul %546 %550 
                              Uniform f32_4* %552 = OpAccessChain %26 %547 
                                       f32_4 %553 = OpLoad %552 
                                       f32_2 %554 = OpVectorShuffle %553 %553 2 3 
                                       f32_2 %555 = OpFAdd %551 %554 
                                                      OpStore %543 %555 
                                       f32_3 %556 = OpLoad %307 
                                       f32_4 %557 = OpVectorShuffle %556 %556 1 1 1 1 
                              Uniform f32_4* %558 = OpAccessChain %26 %27 %35 
                                       f32_4 %559 = OpLoad %558 
                                       f32_4 %560 = OpFMul %557 %559 
                                                      OpStore %9 %560 
                              Uniform f32_4* %561 = OpAccessChain %26 %27 %28 
                                       f32_4 %562 = OpLoad %561 
                                       f32_3 %563 = OpLoad %307 
                                       f32_4 %564 = OpVectorShuffle %563 %563 0 0 0 0 
                                       f32_4 %565 = OpFMul %562 %564 
                                       f32_4 %566 = OpLoad %9 
                                       f32_4 %567 = OpFAdd %565 %566 
                                                      OpStore %9 %567 
                              Uniform f32_4* %568 = OpAccessChain %26 %27 %54 
                                       f32_4 %569 = OpLoad %568 
                                       f32_3 %570 = OpLoad %307 
                                       f32_4 %571 = OpVectorShuffle %570 %570 2 2 2 2 
                                       f32_4 %572 = OpFMul %569 %571 
                                       f32_4 %573 = OpLoad %9 
                                       f32_4 %574 = OpFAdd %572 %573 
                                                      OpStore %9 %574 
                                       f32_4 %575 = OpLoad %9 
                              Uniform f32_4* %576 = OpAccessChain %26 %27 %67 
                                       f32_4 %577 = OpLoad %576 
                                       f32_4 %578 = OpFAdd %575 %577 
                                                      OpStore %9 %578 
                                       f32_4 %579 = OpLoad %9 
                                       f32_4 %580 = OpVectorShuffle %579 %579 1 1 1 1 
                              Uniform f32_4* %582 = OpAccessChain %26 %581 %35 
                                       f32_4 %583 = OpLoad %582 
                                       f32_4 %584 = OpFMul %580 %583 
                                                      OpStore %80 %584 
                              Uniform f32_4* %585 = OpAccessChain %26 %581 %28 
                                       f32_4 %586 = OpLoad %585 
                                       f32_4 %587 = OpLoad %9 
                                       f32_4 %588 = OpVectorShuffle %587 %587 0 0 0 0 
                                       f32_4 %589 = OpFMul %586 %588 
                                       f32_4 %590 = OpLoad %80 
                                       f32_4 %591 = OpFAdd %589 %590 
                                                      OpStore %80 %591 
                              Uniform f32_4* %592 = OpAccessChain %26 %581 %54 
                                       f32_4 %593 = OpLoad %592 
                                       f32_4 %594 = OpLoad %9 
                                       f32_4 %595 = OpVectorShuffle %594 %594 2 2 2 2 
                                       f32_4 %596 = OpFMul %593 %595 
                                       f32_4 %597 = OpLoad %80 
                                       f32_4 %598 = OpFAdd %596 %597 
                                                      OpStore %80 %598 
                              Uniform f32_4* %603 = OpAccessChain %26 %581 %67 
                                       f32_4 %604 = OpLoad %603 
                                       f32_4 %605 = OpLoad %9 
                                       f32_4 %606 = OpVectorShuffle %605 %605 3 3 3 3 
                                       f32_4 %607 = OpFMul %604 %606 
                                       f32_4 %608 = OpLoad %80 
                                       f32_4 %609 = OpFAdd %607 %608 
                               Output f32_4* %610 = OpAccessChain %602 %28 
                                                      OpStore %610 %609 
                                 Output f32* %612 = OpAccessChain %602 %28 %348 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                 Output f32* %615 = OpAccessChain %602 %28 %348 
                                                      OpStore %615 %614 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 49
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %26 %31 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %26 Location 26 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %31 Location 31 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
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
                                            %25 = OpTypePointer Input %7 
                               Input f32_4* %26 = OpVariable Input 
                                            %30 = OpTypePointer Output %7 
                              Output f32_4* %31 = OpVariable Output 
                                            %32 = OpTypeInt 32 0 
                                        u32 %33 = OpConstant 3 
                                            %34 = OpTypePointer Private %6 
                                            %37 = OpTypePointer Input %6 
                                            %41 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %23 = OpLoad %9 
                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                      f32_4 %27 = OpLoad %26 
                                      f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                      f32_3 %29 = OpFMul %24 %28 
                                                    OpStore %22 %29 
                               Private f32* %35 = OpAccessChain %9 %33 
                                        f32 %36 = OpLoad %35 
                                 Input f32* %38 = OpAccessChain %26 %33 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpFMul %36 %39 
                                Output f32* %42 = OpAccessChain %31 %33 
                                                    OpStore %42 %40 
                                      f32_3 %43 = OpLoad %22 
                                      f32_3 %44 = OpLoad %22 
                                      f32_3 %45 = OpFAdd %43 %44 
                                      f32_4 %46 = OpLoad %31 
                                      f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                                    OpStore %31 %47 
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
}
}
}
Fallback "tk2d/BlendVertexColor"
}