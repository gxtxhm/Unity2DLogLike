//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/DownwellAfterImage" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_DashColor ("Dash Color", Color) = (1,0,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Opacity ("Opacity", Float) = 1
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
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
  Lighting On
  GpuProgramID 46930
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
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat4 = u_xlat10_0.w * _Opacity;
    u_xlat8 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat8 = sin(u_xlat8);
    u_xlat4 = u_xlat8 * u_xlat4;
    u_xlat2.w = u_xlat4 * 3.0;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat12) + _OverrideColor.xyz;
    u_xlat2.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.w = 0.0;
    SV_Target0 = u_xlat2 + u_xlat1;
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
; Bound: 157
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 %149 
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
                                                      OpDecorate %149 Location 149 
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
                               Output f32_3* %146 = OpVariable Output 
                                         f32 %147 = OpConstant 3.67402E-40 
                                       f32_3 %148 = OpConstantComposite %147 %147 %147 
                               Output f32_4* %149 = OpVariable Output 
                                       f32_4 %150 = OpConstantComposite %147 %147 %147 %147 
                                             %151 = OpTypePointer Output %6 
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
                                                      OpStore %146 %148 
                                                      OpStore %149 %150 
                                 Output f32* %152 = OpAccessChain %85 %23 %81 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFNegate %153 
                                 Output f32* %155 = OpAccessChain %85 %23 %81 
                                                      OpStore %155 %154 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 281
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %239 %276 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %122 SpecId 122 
                                                      OpDecorate %219 DescriptorSet 219 
                                                      OpDecorate %219 Binding 219 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
                                                      OpDecorate %278 RelaxedPrecision 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                               Private f32_4* %34 = OpVariable Private 
                                              %37 = OpTypeInt 32 0 
                                          u32 %38 = OpConstant 4 
                                              %39 = OpTypeArray %7 %38 
                                              %40 = OpTypeStruct %7 %7 %39 %22 %22 %7 %7 %6 %7 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 6 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 7 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                              %86 = OpTypePointer Private %22 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                         u32 %112 = OpConstant 0 
                                        bool %116 = OpConstantFalse 
                                        bool %122 = OpSpecConstantFalse 
                                         u32 %125 = OpConstant 1 
                                         i32 %131 = OpConstant 2 
                                         i32 %138 = OpConstant 0 
                                         i32 %163 = OpConstant 3 
                                             %170 = OpTypePointer Function %22 
                                         i32 %184 = OpConstant 4 
                                             %185 = OpTypePointer Uniform %22 
                                Private f32* %199 = OpVariable Private 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %204 = OpConstant 3.67402E-40 
                                Private f32* %206 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                             %216 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %217 = OpTypeSampledImage %216 
                                             %218 = OpTypePointer UniformConstant %217 
 UniformConstant read_only Texture3DSampled* %219 = OpVariable UniformConstant 
                              Private f32_4* %224 = OpVariable Private 
                                Private f32* %231 = OpVariable Private 
                                Input f32_3* %239 = OpVariable Input 
                              Private f32_3* %244 = OpVariable Private 
                                         i32 %246 = OpConstant 5 
                              Private f32_3* %251 = OpVariable Private 
                                             %275 = OpTypePointer Output %7 
                               Output f32_4* %276 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %171 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %35 = OpLoad %30 
                                        f32_3 %36 = OpCompositeConstruct %35 %35 %35 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %34 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %34 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %42 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %88 = OpAccessChain %42 %44 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFNegate %90 
                                          f32 %92 = OpLoad %30 
                                        f32_3 %93 = OpCompositeConstruct %92 %92 %92 
                                        f32_3 %94 = OpFMul %91 %93 
                               Uniform f32_4* %96 = OpAccessChain %42 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %94 %98 
                                                      OpStore %87 %99 
                              Uniform f32_4* %100 = OpAccessChain %42 %95 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 3 3 3 
                                       f32_3 %103 = OpLoad %87 
                                       f32_3 %104 = OpFMul %102 %103 
                                       f32_4 %105 = OpLoad %34 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                                      OpStore %87 %107 
                                Uniform f32* %113 = OpAccessChain %42 %111 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %115 = OpFOrdEqual %114 %83 
                                                      OpStore %110 %115 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                        bool %119 = OpLoad %110 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %121 
                                             %120 = OpLabel 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpSelectionMerge %124 None 
                                                      OpBranchConditional %122 %123 %226 
                                             %123 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %42 %111 %125 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %83 
                                                      OpStore %110 %128 
                                       f32_3 %129 = OpLoad %63 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %42 %131 %111 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %130 %134 
                                       f32_4 %136 = OpLoad %34 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %34 %137 
                              Uniform f32_4* %139 = OpAccessChain %42 %131 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpLoad %63 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 0 0 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %34 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %34 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %34 %149 
                              Uniform f32_4* %150 = OpAccessChain %42 %131 %131 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %63 
                                       f32_3 %154 = OpVectorShuffle %153 %153 2 2 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %34 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %155 %157 
                                       f32_4 %159 = OpLoad %34 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %34 %160 
                                       f32_4 %161 = OpLoad %34 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                              Uniform f32_4* %164 = OpAccessChain %42 %131 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %162 %166 
                                       f32_4 %168 = OpLoad %34 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %34 %169 
                                        bool %172 = OpLoad %110 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %177 
                                             %173 = OpLabel 
                                       f32_4 %175 = OpLoad %34 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                                      OpStore %171 %176 
                                                      OpBranch %174 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %63 
                                                      OpStore %171 %178 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                       f32_3 %179 = OpLoad %171 
                                       f32_4 %180 = OpLoad %34 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %34 %181 
                                       f32_4 %182 = OpLoad %34 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %186 = OpAccessChain %42 %184 
                                       f32_3 %187 = OpLoad %186 
                                       f32_3 %188 = OpFNegate %187 
                                       f32_3 %189 = OpFAdd %183 %188 
                                       f32_4 %190 = OpLoad %34 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %34 %191 
                                       f32_4 %192 = OpLoad %34 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              Uniform f32_3* %194 = OpAccessChain %42 %163 
                                       f32_3 %195 = OpLoad %194 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %34 
                                       f32_4 %198 = OpVectorShuffle %197 %196 0 4 5 6 
                                                      OpStore %34 %198 
                                Private f32* %200 = OpAccessChain %34 %125 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %199 %205 
                                Uniform f32* %208 = OpAccessChain %42 %111 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %209 %32 
                                         f32 %211 = OpFAdd %210 %204 
                                                      OpStore %206 %211 
                                         f32 %212 = OpLoad %199 
                                         f32 %213 = OpLoad %206 
                                         f32 %214 = OpExtInst %1 40 %212 %213 
                                Private f32* %215 = OpAccessChain %34 %112 
                                                      OpStore %215 %214 
                  read_only Texture3DSampled %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %34 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 2 3 
                                       f32_4 %223 = OpImageSampleImplicitLod %220 %222 
                                                      OpStore %34 %223 
                                       f32_4 %225 = OpLoad %34 
                                                      OpStore %224 %225 
                                                      OpBranch %124 
                                             %226 = OpLabel 
                                Private f32* %227 = OpAccessChain %224 %112 
                                                      OpStore %227 %83 
                                Private f32* %228 = OpAccessChain %224 %125 
                                                      OpStore %228 %83 
                                Private f32* %229 = OpAccessChain %224 %207 
                                                      OpStore %229 %83 
                                Private f32* %230 = OpAccessChain %224 %53 
                                                      OpStore %230 %83 
                                                      OpBranch %124 
                                             %124 = OpLabel 
                                       f32_4 %232 = OpLoad %224 
                              Uniform f32_4* %233 = OpAccessChain %42 %138 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                                      OpStore %231 %235 
                                         f32 %236 = OpLoad %231 
                                         f32 %237 = OpExtInst %1 43 %236 %82 %83 
                                                      OpStore %231 %237 
                                       f32_3 %238 = OpLoad %87 
                                       f32_3 %240 = OpLoad %239 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %224 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %224 %243 
                                       f32_3 %245 = OpLoad %87 
                              Uniform f32_4* %247 = OpAccessChain %42 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %245 %249 
                                                      OpStore %244 %250 
                                         f32 %252 = OpLoad %231 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpLoad %244 
                                       f32_3 %255 = OpFMul %253 %254 
                                                      OpStore %251 %255 
                                       f32_3 %256 = OpLoad %244 
                                       f32_3 %257 = OpFNegate %256 
                                         f32 %258 = OpLoad %231 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpFMul %257 %259 
                              Uniform f32_4* %261 = OpAccessChain %42 %95 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %260 %263 
                                                      OpStore %87 %264 
                              Uniform f32_4* %265 = OpAccessChain %42 %95 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 3 3 3 
                                       f32_3 %268 = OpLoad %87 
                                       f32_3 %269 = OpFMul %267 %268 
                                       f32_3 %270 = OpLoad %251 
                                       f32_3 %271 = OpFAdd %269 %270 
                                       f32_4 %272 = OpLoad %75 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %75 %273 
                                Private f32* %274 = OpAccessChain %224 %53 
                                                      OpStore %274 %82 
                                       f32_4 %277 = OpLoad %75 
                                       f32_4 %278 = OpLoad %224 
                                       f32_4 %279 = OpFAdd %277 %278 
                                                      OpStore %276 %279 
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
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat4 = u_xlat10_0.w * _Opacity;
    u_xlat8 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat8 = sin(u_xlat8);
    u_xlat4 = u_xlat8 * u_xlat4;
    u_xlat2.w = u_xlat4 * 3.0;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat12) + _OverrideColor.xyz;
    u_xlat2.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.w = 0.0;
    SV_Target0 = u_xlat2 + u_xlat1;
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
; Bound: 272
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %87 %99 %100 %113 %151 %261 %264 
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
                               Output f32_4* %264 = OpVariable Output 
                                       f32_4 %265 = OpConstantComposite %227 %227 %227 %227 
                                             %266 = OpTypePointer Output %6 
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
                                                      OpStore %264 %265 
                                 Output f32* %267 = OpAccessChain %87 %29 %83 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFNegate %268 
                                 Output f32* %270 = OpAccessChain %87 %29 %83 
                                                      OpStore %270 %269 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 281
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %239 %276 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %122 SpecId 122 
                                                      OpDecorate %219 DescriptorSet 219 
                                                      OpDecorate %219 Binding 219 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
                                                      OpDecorate %278 RelaxedPrecision 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                               Private f32_4* %34 = OpVariable Private 
                                              %37 = OpTypeInt 32 0 
                                          u32 %38 = OpConstant 4 
                                              %39 = OpTypeArray %7 %38 
                                              %40 = OpTypeStruct %7 %7 %39 %22 %22 %7 %7 %6 %7 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 6 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 7 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                              %86 = OpTypePointer Private %22 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                         u32 %112 = OpConstant 0 
                                        bool %116 = OpConstantFalse 
                                        bool %122 = OpSpecConstantFalse 
                                         u32 %125 = OpConstant 1 
                                         i32 %131 = OpConstant 2 
                                         i32 %138 = OpConstant 0 
                                         i32 %163 = OpConstant 3 
                                             %170 = OpTypePointer Function %22 
                                         i32 %184 = OpConstant 4 
                                             %185 = OpTypePointer Uniform %22 
                                Private f32* %199 = OpVariable Private 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %204 = OpConstant 3.67402E-40 
                                Private f32* %206 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                             %216 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %217 = OpTypeSampledImage %216 
                                             %218 = OpTypePointer UniformConstant %217 
 UniformConstant read_only Texture3DSampled* %219 = OpVariable UniformConstant 
                              Private f32_4* %224 = OpVariable Private 
                                Private f32* %231 = OpVariable Private 
                                Input f32_3* %239 = OpVariable Input 
                              Private f32_3* %244 = OpVariable Private 
                                         i32 %246 = OpConstant 5 
                              Private f32_3* %251 = OpVariable Private 
                                             %275 = OpTypePointer Output %7 
                               Output f32_4* %276 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %171 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %35 = OpLoad %30 
                                        f32_3 %36 = OpCompositeConstruct %35 %35 %35 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %34 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %34 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %42 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %88 = OpAccessChain %42 %44 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFNegate %90 
                                          f32 %92 = OpLoad %30 
                                        f32_3 %93 = OpCompositeConstruct %92 %92 %92 
                                        f32_3 %94 = OpFMul %91 %93 
                               Uniform f32_4* %96 = OpAccessChain %42 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %94 %98 
                                                      OpStore %87 %99 
                              Uniform f32_4* %100 = OpAccessChain %42 %95 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 3 3 3 
                                       f32_3 %103 = OpLoad %87 
                                       f32_3 %104 = OpFMul %102 %103 
                                       f32_4 %105 = OpLoad %34 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                                      OpStore %87 %107 
                                Uniform f32* %113 = OpAccessChain %42 %111 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %115 = OpFOrdEqual %114 %83 
                                                      OpStore %110 %115 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                        bool %119 = OpLoad %110 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %121 
                                             %120 = OpLabel 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpSelectionMerge %124 None 
                                                      OpBranchConditional %122 %123 %226 
                                             %123 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %42 %111 %125 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %83 
                                                      OpStore %110 %128 
                                       f32_3 %129 = OpLoad %63 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %42 %131 %111 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %130 %134 
                                       f32_4 %136 = OpLoad %34 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %34 %137 
                              Uniform f32_4* %139 = OpAccessChain %42 %131 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpLoad %63 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 0 0 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %34 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %34 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %34 %149 
                              Uniform f32_4* %150 = OpAccessChain %42 %131 %131 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %63 
                                       f32_3 %154 = OpVectorShuffle %153 %153 2 2 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %34 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %155 %157 
                                       f32_4 %159 = OpLoad %34 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %34 %160 
                                       f32_4 %161 = OpLoad %34 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                              Uniform f32_4* %164 = OpAccessChain %42 %131 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %162 %166 
                                       f32_4 %168 = OpLoad %34 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %34 %169 
                                        bool %172 = OpLoad %110 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %177 
                                             %173 = OpLabel 
                                       f32_4 %175 = OpLoad %34 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                                      OpStore %171 %176 
                                                      OpBranch %174 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %63 
                                                      OpStore %171 %178 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                       f32_3 %179 = OpLoad %171 
                                       f32_4 %180 = OpLoad %34 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %34 %181 
                                       f32_4 %182 = OpLoad %34 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %186 = OpAccessChain %42 %184 
                                       f32_3 %187 = OpLoad %186 
                                       f32_3 %188 = OpFNegate %187 
                                       f32_3 %189 = OpFAdd %183 %188 
                                       f32_4 %190 = OpLoad %34 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %34 %191 
                                       f32_4 %192 = OpLoad %34 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              Uniform f32_3* %194 = OpAccessChain %42 %163 
                                       f32_3 %195 = OpLoad %194 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %34 
                                       f32_4 %198 = OpVectorShuffle %197 %196 0 4 5 6 
                                                      OpStore %34 %198 
                                Private f32* %200 = OpAccessChain %34 %125 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %199 %205 
                                Uniform f32* %208 = OpAccessChain %42 %111 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %209 %32 
                                         f32 %211 = OpFAdd %210 %204 
                                                      OpStore %206 %211 
                                         f32 %212 = OpLoad %199 
                                         f32 %213 = OpLoad %206 
                                         f32 %214 = OpExtInst %1 40 %212 %213 
                                Private f32* %215 = OpAccessChain %34 %112 
                                                      OpStore %215 %214 
                  read_only Texture3DSampled %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %34 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 2 3 
                                       f32_4 %223 = OpImageSampleImplicitLod %220 %222 
                                                      OpStore %34 %223 
                                       f32_4 %225 = OpLoad %34 
                                                      OpStore %224 %225 
                                                      OpBranch %124 
                                             %226 = OpLabel 
                                Private f32* %227 = OpAccessChain %224 %112 
                                                      OpStore %227 %83 
                                Private f32* %228 = OpAccessChain %224 %125 
                                                      OpStore %228 %83 
                                Private f32* %229 = OpAccessChain %224 %207 
                                                      OpStore %229 %83 
                                Private f32* %230 = OpAccessChain %224 %53 
                                                      OpStore %230 %83 
                                                      OpBranch %124 
                                             %124 = OpLabel 
                                       f32_4 %232 = OpLoad %224 
                              Uniform f32_4* %233 = OpAccessChain %42 %138 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                                      OpStore %231 %235 
                                         f32 %236 = OpLoad %231 
                                         f32 %237 = OpExtInst %1 43 %236 %82 %83 
                                                      OpStore %231 %237 
                                       f32_3 %238 = OpLoad %87 
                                       f32_3 %240 = OpLoad %239 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %224 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %224 %243 
                                       f32_3 %245 = OpLoad %87 
                              Uniform f32_4* %247 = OpAccessChain %42 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %245 %249 
                                                      OpStore %244 %250 
                                         f32 %252 = OpLoad %231 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpLoad %244 
                                       f32_3 %255 = OpFMul %253 %254 
                                                      OpStore %251 %255 
                                       f32_3 %256 = OpLoad %244 
                                       f32_3 %257 = OpFNegate %256 
                                         f32 %258 = OpLoad %231 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpFMul %257 %259 
                              Uniform f32_4* %261 = OpAccessChain %42 %95 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %260 %263 
                                                      OpStore %87 %264 
                              Uniform f32_4* %265 = OpAccessChain %42 %95 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 3 3 3 
                                       f32_3 %268 = OpLoad %87 
                                       f32_3 %269 = OpFMul %267 %268 
                                       f32_3 %270 = OpLoad %251 
                                       f32_3 %271 = OpFAdd %269 %270 
                                       f32_4 %272 = OpLoad %75 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %75 %273 
                                Private f32* %274 = OpAccessChain %224 %53 
                                                      OpStore %274 %82 
                                       f32_4 %277 = OpLoad %75 
                                       f32_4 %278 = OpLoad %224 
                                       f32_4 %279 = OpFAdd %277 %278 
                                                      OpStore %276 %279 
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
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat2.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat4 = u_xlat10_0.w * _Opacity;
    u_xlat8 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat8 = sin(u_xlat8);
    u_xlat4 = u_xlat8 * u_xlat4;
    u_xlat2.w = u_xlat4 * 3.0;
    u_xlat2.w = clamp(u_xlat2.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat12) + _OverrideColor.xyz;
    u_xlat2.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat1.w = 0.0;
    SV_Target0 = u_xlat2 + u_xlat1;
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
; Bound: 389
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %116 %155 %158 %379 %382 
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
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %379 Location 379 
                                                      OpDecorate %382 Location 382 
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
                                             %161 = OpTypePointer Private %53 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_4* %179 = OpVariable Private 
                              Private f32_3* %185 = OpVariable Private 
                                         i32 %186 = OpConstant 8 
                                         i32 %192 = OpConstant 9 
                                         i32 %198 = OpConstant 10 
                                         i32 %204 = OpConstant 11 
                                         f32 %213 = OpConstant 3.67402E-40 
                                         u32 %214 = OpConstant 3 
                                         i32 %216 = OpConstant 5 
                                         i32 %222 = OpConstant 6 
                                         i32 %228 = OpConstant 7 
                                         f32 %238 = OpConstant 3.67402E-40 
                                       f32_3 %239 = OpConstantComposite %238 %238 %238 
                              Private f32_3* %241 = OpVariable Private 
                                         f32 %245 = OpConstant 3.67402E-40 
                                       f32_3 %246 = OpConstantComposite %245 %245 %245 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                              Private f32_4* %265 = OpVariable Private 
                              Private f32_4* %273 = OpVariable Private 
                                         f32 %309 = OpConstant 3.67402E-40 
                                       f32_4 %310 = OpConstantComposite %309 %309 %309 %309 
                                       f32_4 %318 = OpConstantComposite %213 %213 %213 %213 
                                       f32_4 %326 = OpConstantComposite %238 %238 %238 %238 
                                         i32 %333 = OpConstant 4 
                               Output f32_3* %379 = OpVariable Output 
                               Output f32_4* %382 = OpVariable Output 
                                             %383 = OpTypePointer Output %6 
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
                                Private f32* %163 = OpAccessChain %47 %86 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %47 %86 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                Private f32* %168 = OpAccessChain %162 %123 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %47 %123 
                                         f32 %170 = OpLoad %169 
                                Private f32* %171 = OpAccessChain %47 %123 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Private f32* %174 = OpAccessChain %162 %123 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                         f32 %177 = OpFAdd %173 %176 
                                Private f32* %178 = OpAccessChain %162 %123 
                                                      OpStore %178 %177 
                                       f32_4 %180 = OpLoad %47 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 2 2 0 
                                       f32_4 %182 = OpLoad %47 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 1 2 2 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %179 %184 
                              Uniform f32_4* %187 = OpAccessChain %23 %186 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %179 
                                         f32 %190 = OpDot %188 %189 
                                Private f32* %191 = OpAccessChain %185 %123 
                                                      OpStore %191 %190 
                              Uniform f32_4* %193 = OpAccessChain %23 %192 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpLoad %179 
                                         f32 %196 = OpDot %194 %195 
                                Private f32* %197 = OpAccessChain %185 %86 
                                                      OpStore %197 %196 
                              Uniform f32_4* %199 = OpAccessChain %23 %198 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %179 
                                         f32 %202 = OpDot %200 %201 
                                Private f32* %203 = OpAccessChain %185 %137 
                                                      OpStore %203 %202 
                              Uniform f32_4* %205 = OpAccessChain %23 %204 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %162 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %185 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %162 %212 
                                Private f32* %215 = OpAccessChain %47 %214 
                                                      OpStore %215 %213 
                              Uniform f32_4* %217 = OpAccessChain %23 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %47 
                                         f32 %220 = OpDot %218 %219 
                                Private f32* %221 = OpAccessChain %185 %123 
                                                      OpStore %221 %220 
                              Uniform f32_4* %223 = OpAccessChain %23 %222 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %47 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %185 %86 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %23 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %47 
                                         f32 %232 = OpDot %230 %231 
                                Private f32* %233 = OpAccessChain %185 %137 
                                                      OpStore %233 %232 
                                       f32_3 %234 = OpLoad %162 
                                       f32_3 %235 = OpLoad %185 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %162 %236 
                                       f32_3 %237 = OpLoad %162 
                                       f32_3 %240 = OpExtInst %1 40 %237 %239 
                                                      OpStore %162 %240 
                                       f32_3 %242 = OpLoad %162 
                                       f32_3 %243 = OpExtInst %1 30 %242 
                                                      OpStore %241 %243 
                                       f32_3 %244 = OpLoad %241 
                                       f32_3 %247 = OpFMul %244 %246 
                                                      OpStore %241 %247 
                                       f32_3 %248 = OpLoad %241 
                                       f32_3 %249 = OpExtInst %1 29 %248 
                                                      OpStore %241 %249 
                                       f32_3 %250 = OpLoad %241 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_3 %256 = OpFAdd %253 %255 
                                                      OpStore %241 %256 
                                       f32_3 %257 = OpLoad %241 
                                       f32_3 %258 = OpExtInst %1 40 %257 %239 
                                                      OpStore %241 %258 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpVectorShuffle %259 %259 1 1 1 1 
                                       f32_4 %261 = OpFNegate %260 
                              Uniform f32_4* %262 = OpAccessChain %23 %26 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpFAdd %261 %263 
                                                      OpStore %65 %264 
                                       f32_4 %266 = OpLoad %47 
                                       f32_4 %267 = OpVectorShuffle %266 %266 1 1 1 1 
                                       f32_4 %268 = OpLoad %65 
                                       f32_4 %269 = OpFMul %267 %268 
                                                      OpStore %265 %269 
                                       f32_4 %270 = OpLoad %65 
                                       f32_4 %271 = OpLoad %65 
                                       f32_4 %272 = OpFMul %270 %271 
                                                      OpStore %65 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %274 0 0 0 0 
                                       f32_4 %276 = OpFNegate %275 
                              Uniform f32_4* %277 = OpAccessChain %23 %31 
                                       f32_4 %278 = OpLoad %277 
                                       f32_4 %279 = OpFAdd %276 %278 
                                                      OpStore %273 %279 
                                       f32_4 %280 = OpLoad %9 
                                       f32_4 %281 = OpVectorShuffle %280 %280 2 2 2 2 
                                       f32_4 %282 = OpFNegate %281 
                              Uniform f32_4* %283 = OpAccessChain %23 %39 
                                       f32_4 %284 = OpLoad %283 
                                       f32_4 %285 = OpFAdd %282 %284 
                                                      OpStore %9 %285 
                                       f32_4 %286 = OpLoad %273 
                                       f32_4 %287 = OpLoad %47 
                                       f32_4 %288 = OpVectorShuffle %287 %287 0 0 0 0 
                                       f32_4 %289 = OpFMul %286 %288 
                                       f32_4 %290 = OpLoad %265 
                                       f32_4 %291 = OpFAdd %289 %290 
                                                      OpStore %265 %291 
                                       f32_4 %292 = OpLoad %9 
                                       f32_4 %293 = OpLoad %47 
                                       f32_4 %294 = OpVectorShuffle %293 %293 2 2 2 2 
                                       f32_4 %295 = OpFMul %292 %294 
                                       f32_4 %296 = OpLoad %265 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %47 %297 
                                       f32_4 %298 = OpLoad %273 
                                       f32_4 %299 = OpLoad %273 
                                       f32_4 %300 = OpFMul %298 %299 
                                       f32_4 %301 = OpLoad %65 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %65 %302 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpFMul %303 %304 
                                       f32_4 %306 = OpLoad %65 
                                       f32_4 %307 = OpFAdd %305 %306 
                                                      OpStore %9 %307 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %311 = OpExtInst %1 40 %308 %310 
                                                      OpStore %9 %311 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpExtInst %1 32 %312 
                                                      OpStore %65 %313 
                                       f32_4 %314 = OpLoad %9 
                              Uniform f32_4* %315 = OpAccessChain %23 %49 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpFMul %314 %316 
                                       f32_4 %319 = OpFAdd %317 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %9 
                                       f32_4 %321 = OpFDiv %318 %320 
                                                      OpStore %9 %321 
                                       f32_4 %322 = OpLoad %47 
                                       f32_4 %323 = OpLoad %65 
                                       f32_4 %324 = OpFMul %322 %323 
                                                      OpStore %47 %324 
                                       f32_4 %325 = OpLoad %47 
                                       f32_4 %327 = OpExtInst %1 40 %325 %326 
                                                      OpStore %47 %327 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %47 
                                       f32_4 %330 = OpFMul %328 %329 
                                                      OpStore %9 %330 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 1 1 1 
                              Uniform f32_4* %334 = OpAccessChain %23 %333 %26 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFMul %332 %336 
                                       f32_4 %338 = OpLoad %47 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %47 %339 
                              Uniform f32_4* %340 = OpAccessChain %23 %333 %31 
                                       f32_4 %341 = OpLoad %340 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 1 2 
                                       f32_4 %343 = OpLoad %9 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 0 0 
                                       f32_3 %345 = OpFMul %342 %344 
                                       f32_4 %346 = OpLoad %47 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                       f32_3 %348 = OpFAdd %345 %347 
                                       f32_4 %349 = OpLoad %47 
                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
                                                      OpStore %47 %350 
                              Uniform f32_4* %351 = OpAccessChain %23 %333 %39 
                                       f32_4 %352 = OpLoad %351 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                       f32_4 %354 = OpLoad %9 
                                       f32_3 %355 = OpVectorShuffle %354 %354 2 2 2 
                                       f32_3 %356 = OpFMul %353 %355 
                                       f32_4 %357 = OpLoad %47 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                                       f32_3 %359 = OpFAdd %356 %358 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 6 3 
                                                      OpStore %9 %361 
                              Uniform f32_4* %362 = OpAccessChain %23 %333 %49 
                                       f32_4 %363 = OpLoad %362 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_4 %365 = OpLoad %9 
                                       f32_3 %366 = OpVectorShuffle %365 %365 3 3 3 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_3 %370 = OpFAdd %367 %369 
                                       f32_4 %371 = OpLoad %9 
                                       f32_4 %372 = OpVectorShuffle %371 %370 4 5 6 3 
                                                      OpStore %9 %372 
                                       f32_4 %373 = OpLoad %9 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpLoad %241 
                                       f32_3 %376 = OpFAdd %374 %375 
                                       f32_4 %377 = OpLoad %9 
                                       f32_4 %378 = OpVectorShuffle %377 %376 4 5 6 3 
                                                      OpStore %9 %378 
                                       f32_4 %380 = OpLoad %9 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                                      OpStore %379 %381 
                                                      OpStore %382 %326 
                                 Output f32* %384 = OpAccessChain %90 %31 %86 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFNegate %385 
                                 Output f32* %387 = OpAccessChain %90 %31 %86 
                                                      OpStore %387 %386 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 281
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %239 %276 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %122 SpecId 122 
                                                      OpDecorate %219 DescriptorSet 219 
                                                      OpDecorate %219 Binding 219 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
                                                      OpDecorate %278 RelaxedPrecision 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                               Private f32_4* %34 = OpVariable Private 
                                              %37 = OpTypeInt 32 0 
                                          u32 %38 = OpConstant 4 
                                              %39 = OpTypeArray %7 %38 
                                              %40 = OpTypeStruct %7 %7 %39 %22 %22 %7 %7 %6 %7 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 6 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 7 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                              %86 = OpTypePointer Private %22 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                         u32 %112 = OpConstant 0 
                                        bool %116 = OpConstantFalse 
                                        bool %122 = OpSpecConstantFalse 
                                         u32 %125 = OpConstant 1 
                                         i32 %131 = OpConstant 2 
                                         i32 %138 = OpConstant 0 
                                         i32 %163 = OpConstant 3 
                                             %170 = OpTypePointer Function %22 
                                         i32 %184 = OpConstant 4 
                                             %185 = OpTypePointer Uniform %22 
                                Private f32* %199 = OpVariable Private 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %204 = OpConstant 3.67402E-40 
                                Private f32* %206 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                             %216 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %217 = OpTypeSampledImage %216 
                                             %218 = OpTypePointer UniformConstant %217 
 UniformConstant read_only Texture3DSampled* %219 = OpVariable UniformConstant 
                              Private f32_4* %224 = OpVariable Private 
                                Private f32* %231 = OpVariable Private 
                                Input f32_3* %239 = OpVariable Input 
                              Private f32_3* %244 = OpVariable Private 
                                         i32 %246 = OpConstant 5 
                              Private f32_3* %251 = OpVariable Private 
                                             %275 = OpTypePointer Output %7 
                               Output f32_4* %276 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %171 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %35 = OpLoad %30 
                                        f32_3 %36 = OpCompositeConstruct %35 %35 %35 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %34 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %34 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %42 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %88 = OpAccessChain %42 %44 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFNegate %90 
                                          f32 %92 = OpLoad %30 
                                        f32_3 %93 = OpCompositeConstruct %92 %92 %92 
                                        f32_3 %94 = OpFMul %91 %93 
                               Uniform f32_4* %96 = OpAccessChain %42 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %94 %98 
                                                      OpStore %87 %99 
                              Uniform f32_4* %100 = OpAccessChain %42 %95 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 3 3 3 
                                       f32_3 %103 = OpLoad %87 
                                       f32_3 %104 = OpFMul %102 %103 
                                       f32_4 %105 = OpLoad %34 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                                      OpStore %87 %107 
                                Uniform f32* %113 = OpAccessChain %42 %111 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %115 = OpFOrdEqual %114 %83 
                                                      OpStore %110 %115 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                        bool %119 = OpLoad %110 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %121 
                                             %120 = OpLabel 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpSelectionMerge %124 None 
                                                      OpBranchConditional %122 %123 %226 
                                             %123 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %42 %111 %125 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %83 
                                                      OpStore %110 %128 
                                       f32_3 %129 = OpLoad %63 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %42 %131 %111 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %130 %134 
                                       f32_4 %136 = OpLoad %34 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %34 %137 
                              Uniform f32_4* %139 = OpAccessChain %42 %131 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpLoad %63 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 0 0 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %34 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %34 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %34 %149 
                              Uniform f32_4* %150 = OpAccessChain %42 %131 %131 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %63 
                                       f32_3 %154 = OpVectorShuffle %153 %153 2 2 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %34 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %155 %157 
                                       f32_4 %159 = OpLoad %34 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %34 %160 
                                       f32_4 %161 = OpLoad %34 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                              Uniform f32_4* %164 = OpAccessChain %42 %131 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %162 %166 
                                       f32_4 %168 = OpLoad %34 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %34 %169 
                                        bool %172 = OpLoad %110 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %177 
                                             %173 = OpLabel 
                                       f32_4 %175 = OpLoad %34 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                                      OpStore %171 %176 
                                                      OpBranch %174 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %63 
                                                      OpStore %171 %178 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                       f32_3 %179 = OpLoad %171 
                                       f32_4 %180 = OpLoad %34 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %34 %181 
                                       f32_4 %182 = OpLoad %34 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %186 = OpAccessChain %42 %184 
                                       f32_3 %187 = OpLoad %186 
                                       f32_3 %188 = OpFNegate %187 
                                       f32_3 %189 = OpFAdd %183 %188 
                                       f32_4 %190 = OpLoad %34 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %34 %191 
                                       f32_4 %192 = OpLoad %34 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              Uniform f32_3* %194 = OpAccessChain %42 %163 
                                       f32_3 %195 = OpLoad %194 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %34 
                                       f32_4 %198 = OpVectorShuffle %197 %196 0 4 5 6 
                                                      OpStore %34 %198 
                                Private f32* %200 = OpAccessChain %34 %125 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %199 %205 
                                Uniform f32* %208 = OpAccessChain %42 %111 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %209 %32 
                                         f32 %211 = OpFAdd %210 %204 
                                                      OpStore %206 %211 
                                         f32 %212 = OpLoad %199 
                                         f32 %213 = OpLoad %206 
                                         f32 %214 = OpExtInst %1 40 %212 %213 
                                Private f32* %215 = OpAccessChain %34 %112 
                                                      OpStore %215 %214 
                  read_only Texture3DSampled %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %34 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 2 3 
                                       f32_4 %223 = OpImageSampleImplicitLod %220 %222 
                                                      OpStore %34 %223 
                                       f32_4 %225 = OpLoad %34 
                                                      OpStore %224 %225 
                                                      OpBranch %124 
                                             %226 = OpLabel 
                                Private f32* %227 = OpAccessChain %224 %112 
                                                      OpStore %227 %83 
                                Private f32* %228 = OpAccessChain %224 %125 
                                                      OpStore %228 %83 
                                Private f32* %229 = OpAccessChain %224 %207 
                                                      OpStore %229 %83 
                                Private f32* %230 = OpAccessChain %224 %53 
                                                      OpStore %230 %83 
                                                      OpBranch %124 
                                             %124 = OpLabel 
                                       f32_4 %232 = OpLoad %224 
                              Uniform f32_4* %233 = OpAccessChain %42 %138 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                                      OpStore %231 %235 
                                         f32 %236 = OpLoad %231 
                                         f32 %237 = OpExtInst %1 43 %236 %82 %83 
                                                      OpStore %231 %237 
                                       f32_3 %238 = OpLoad %87 
                                       f32_3 %240 = OpLoad %239 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %224 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %224 %243 
                                       f32_3 %245 = OpLoad %87 
                              Uniform f32_4* %247 = OpAccessChain %42 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %245 %249 
                                                      OpStore %244 %250 
                                         f32 %252 = OpLoad %231 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpLoad %244 
                                       f32_3 %255 = OpFMul %253 %254 
                                                      OpStore %251 %255 
                                       f32_3 %256 = OpLoad %244 
                                       f32_3 %257 = OpFNegate %256 
                                         f32 %258 = OpLoad %231 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpFMul %257 %259 
                              Uniform f32_4* %261 = OpAccessChain %42 %95 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %260 %263 
                                                      OpStore %87 %264 
                              Uniform f32_4* %265 = OpAccessChain %42 %95 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 3 3 3 
                                       f32_3 %268 = OpLoad %87 
                                       f32_3 %269 = OpFMul %267 %268 
                                       f32_3 %270 = OpLoad %251 
                                       f32_3 %271 = OpFAdd %269 %270 
                                       f32_4 %272 = OpLoad %75 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %75 %273 
                                Private f32* %274 = OpAccessChain %224 %53 
                                                      OpStore %274 %82 
                                       f32_4 %277 = OpLoad %75 
                                       f32_4 %278 = OpLoad %224 
                                       f32_4 %279 = OpFAdd %277 %278 
                                                      OpStore %276 %279 
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
  Lighting On
  GpuProgramID 106299
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

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat3 = u_xlat10_0.w * _Opacity;
    u_xlat6 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat6 = sin(u_xlat6);
    u_xlat3 = u_xlat6 * u_xlat3;
    SV_Target0.w = u_xlat3 * 3.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 314
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %311 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %40 ArrayStride 40 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 RelaxedPrecision 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpMemberDecorate %42 5 RelaxedPrecision 
                                                      OpMemberDecorate %42 5 Offset 42 
                                                      OpMemberDecorate %42 6 Offset 42 
                                                      OpMemberDecorate %42 7 Offset 42 
                                                      OpMemberDecorate %42 8 Offset 42 
                                                      OpMemberDecorate %42 9 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %151 SpecId 151 
                                                      OpDecorate %246 DescriptorSet 246 
                                                      OpDecorate %246 Binding 246 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %311 Location 311 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                                              %34 = OpTypePointer Private %22 
                               Private f32_3* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 0 
                                          u32 %39 = OpConstant 4 
                                              %40 = OpTypeArray %7 %39 
                                              %41 = OpTypeArray %7 %39 
                                              %42 = OpTypeStruct %7 %7 %40 %22 %22 %7 %41 %7 %6 %7 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 7 
                                              %47 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 8 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                               Private f32_3* %86 = OpVariable Private 
                                          i32 %94 = OpConstant 9 
                                         i32 %108 = OpConstant 6 
                                         i32 %109 = OpConstant 1 
                                         i32 %114 = OpConstant 0 
                                         i32 %123 = OpConstant 2 
                                         i32 %133 = OpConstant 3 
                                             %138 = OpTypeBool 
                                             %139 = OpTypePointer Private %138 
                               Private bool* %140 = OpVariable Private 
                                         u32 %141 = OpConstant 0 
                                        bool %145 = OpConstantFalse 
                                        bool %151 = OpSpecConstantFalse 
                                         u32 %154 = OpConstant 1 
                              Private f32_4* %158 = OpVariable Private 
                                             %197 = OpTypePointer Function %22 
                                         i32 %211 = OpConstant 4 
                                             %212 = OpTypePointer Uniform %22 
                                Private f32* %226 = OpVariable Private 
                                         f32 %229 = OpConstant 3.67402E-40 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %233 = OpVariable Private 
                                         u32 %234 = OpConstant 2 
                                             %243 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %244 = OpTypeSampledImage %243 
                                             %245 = OpTypePointer UniformConstant %244 
 UniformConstant read_only Texture3DSampled* %246 = OpVariable UniformConstant 
                              Private f32_4* %251 = OpVariable Private 
                              Private f32_3* %258 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %271 = OpVariable UniformConstant 
                                         i32 %282 = OpConstant 5 
                              Private f32_3* %287 = OpVariable Private 
                                             %310 = OpTypePointer Output %7 
                               Output f32_4* %311 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %198 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                               Uniform f32_4* %48 = OpAccessChain %44 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFMul %37 %50 
                                                      OpStore %35 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %44 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %87 = OpAccessChain %44 %46 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                          f32 %91 = OpLoad %30 
                                        f32_3 %92 = OpCompositeConstruct %91 %91 %91 
                                        f32_3 %93 = OpFMul %90 %92 
                               Uniform f32_4* %95 = OpAccessChain %44 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %93 %97 
                                                      OpStore %86 %98 
                               Uniform f32_4* %99 = OpAccessChain %44 %94 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 3 3 3 
                                       f32_3 %102 = OpLoad %86 
                                       f32_3 %103 = OpFMul %101 %102 
                                       f32_3 %104 = OpLoad %35 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %86 %105 
                                       f32_3 %106 = OpLoad %63 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %110 = OpAccessChain %44 %108 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFMul %107 %112 
                                                      OpStore %35 %113 
                              Uniform f32_4* %115 = OpAccessChain %44 %108 %114 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpLoad %63 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_3 %121 = OpLoad %35 
                                       f32_3 %122 = OpFAdd %120 %121 
                                                      OpStore %35 %122 
                              Uniform f32_4* %124 = OpAccessChain %44 %108 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpLoad %63 
                                       f32_3 %128 = OpVectorShuffle %127 %127 2 2 2 
                                       f32_3 %129 = OpFMul %126 %128 
                                       f32_3 %130 = OpLoad %35 
                                       f32_3 %131 = OpFAdd %129 %130 
                                                      OpStore %35 %131 
                                       f32_3 %132 = OpLoad %35 
                              Uniform f32_4* %134 = OpAccessChain %44 %108 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %132 %136 
                                                      OpStore %35 %137 
                                Uniform f32* %142 = OpAccessChain %44 %109 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %83 
                                                      OpStore %140 %144 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %147 
                                             %146 = OpLabel 
                                        bool %148 = OpLoad %140 
                                                      OpSelectionMerge %150 None 
                                                      OpBranchConditional %148 %149 %150 
                                             %149 = OpLabel 
                                                      OpBranch %150 
                                             %150 = OpLabel 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %253 
                                             %152 = OpLabel 
                                Uniform f32* %155 = OpAccessChain %44 %109 %154 
                                         f32 %156 = OpLoad %155 
                                        bool %157 = OpFOrdEqual %156 %83 
                                                      OpStore %140 %157 
                                       f32_3 %159 = OpLoad %63 
                                       f32_3 %160 = OpVectorShuffle %159 %159 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %44 %123 %109 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFMul %160 %163 
                                       f32_4 %165 = OpLoad %158 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %158 %166 
                              Uniform f32_4* %167 = OpAccessChain %44 %123 %114 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %63 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %158 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %172 %174 
                                       f32_4 %176 = OpLoad %158 
                                       f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                      OpStore %158 %177 
                              Uniform f32_4* %178 = OpAccessChain %44 %123 %123 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpLoad %63 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %158 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFAdd %183 %185 
                                       f32_4 %187 = OpLoad %158 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %158 %188 
                                       f32_4 %189 = OpLoad %158 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %44 %123 %133 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                       f32_4 %195 = OpLoad %158 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %158 %196 
                                        bool %199 = OpLoad %140 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %204 
                                             %200 = OpLabel 
                                       f32_4 %202 = OpLoad %158 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                                      OpStore %198 %203 
                                                      OpBranch %201 
                                             %204 = OpLabel 
                                       f32_3 %205 = OpLoad %63 
                                                      OpStore %198 %205 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_3 %206 = OpLoad %198 
                                       f32_4 %207 = OpLoad %158 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %158 %208 
                                       f32_4 %209 = OpLoad %158 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                              Uniform f32_3* %213 = OpAccessChain %44 %211 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFNegate %214 
                                       f32_3 %216 = OpFAdd %210 %215 
                                       f32_4 %217 = OpLoad %158 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                      OpStore %158 %218 
                                       f32_4 %219 = OpLoad %158 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_3* %221 = OpAccessChain %44 %133 
                                       f32_3 %222 = OpLoad %221 
                                       f32_3 %223 = OpFMul %220 %222 
                                       f32_4 %224 = OpLoad %158 
                                       f32_4 %225 = OpVectorShuffle %224 %223 0 4 5 6 
                                                      OpStore %158 %225 
                                Private f32* %227 = OpAccessChain %158 %154 
                                         f32 %228 = OpLoad %227 
                                         f32 %230 = OpFMul %228 %229 
                                         f32 %232 = OpFAdd %230 %231 
                                                      OpStore %226 %232 
                                Uniform f32* %235 = OpAccessChain %44 %109 %234 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %236 %32 
                                         f32 %238 = OpFAdd %237 %231 
                                                      OpStore %233 %238 
                                         f32 %239 = OpLoad %226 
                                         f32 %240 = OpLoad %233 
                                         f32 %241 = OpExtInst %1 40 %239 %240 
                                Private f32* %242 = OpAccessChain %158 %141 
                                                      OpStore %242 %241 
                  read_only Texture3DSampled %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %158 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 2 3 
                                       f32_4 %250 = OpImageSampleImplicitLod %247 %249 
                                                      OpStore %158 %250 
                                       f32_4 %252 = OpLoad %158 
                                                      OpStore %251 %252 
                                                      OpBranch %153 
                                             %253 = OpLabel 
                                Private f32* %254 = OpAccessChain %251 %141 
                                                      OpStore %254 %83 
                                Private f32* %255 = OpAccessChain %251 %154 
                                                      OpStore %255 %83 
                                Private f32* %256 = OpAccessChain %251 %234 
                                                      OpStore %256 %83 
                                Private f32* %257 = OpAccessChain %251 %53 
                                                      OpStore %257 %83 
                                                      OpBranch %153 
                                             %153 = OpLabel 
                                       f32_4 %259 = OpLoad %251 
                              Uniform f32_4* %260 = OpAccessChain %44 %114 
                                       f32_4 %261 = OpLoad %260 
                                         f32 %262 = OpDot %259 %261 
                                Private f32* %263 = OpAccessChain %258 %141 
                                                      OpStore %263 %262 
                                Private f32* %264 = OpAccessChain %258 %141 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 43 %265 %82 %83 
                                Private f32* %267 = OpAccessChain %258 %141 
                                                      OpStore %267 %266 
                                       f32_3 %268 = OpLoad %35 
                                       f32_3 %269 = OpLoad %35 
                                         f32 %270 = OpDot %268 %269 
                                                      OpStore %226 %270 
                  read_only Texture2DSampled %272 = OpLoad %271 
                                         f32 %273 = OpLoad %226 
                                       f32_2 %274 = OpCompositeConstruct %273 %273 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                         f32 %276 = OpCompositeExtract %275 3 
                                                      OpStore %226 %276 
                                Private f32* %277 = OpAccessChain %258 %141 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpLoad %226 
                                         f32 %280 = OpFMul %278 %279 
                                                      OpStore %226 %280 
                                       f32_3 %281 = OpLoad %86 
                              Uniform f32_4* %283 = OpAccessChain %44 %282 
                                       f32_4 %284 = OpLoad %283 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFMul %281 %285 
                                                      OpStore %258 %286 
                                         f32 %288 = OpLoad %226 
                                       f32_3 %289 = OpCompositeConstruct %288 %288 %288 
                                       f32_3 %290 = OpLoad %258 
                                       f32_3 %291 = OpFMul %289 %290 
                                                      OpStore %287 %291 
                                       f32_3 %292 = OpLoad %258 
                                       f32_3 %293 = OpFNegate %292 
                                         f32 %294 = OpLoad %226 
                                       f32_3 %295 = OpCompositeConstruct %294 %294 %294 
                                       f32_3 %296 = OpFMul %293 %295 
                              Uniform f32_4* %297 = OpAccessChain %44 %94 
                                       f32_4 %298 = OpLoad %297 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_3 %300 = OpFAdd %296 %299 
                                                      OpStore %86 %300 
                              Uniform f32_4* %301 = OpAccessChain %44 %94 
                                       f32_4 %302 = OpLoad %301 
                                       f32_3 %303 = OpVectorShuffle %302 %302 3 3 3 
                                       f32_3 %304 = OpLoad %86 
                                       f32_3 %305 = OpFMul %303 %304 
                                       f32_3 %306 = OpLoad %287 
                                       f32_3 %307 = OpFAdd %305 %306 
                                       f32_4 %308 = OpLoad %75 
                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 6 3 
                                                      OpStore %75 %309 
                                       f32_4 %312 = OpLoad %75 
                                                      OpStore %311 %312 
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

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat2 = u_xlat10_0.w * _Opacity;
    u_xlat4 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat4 = sin(u_xlat4);
    u_xlat2 = u_xlat4 * u_xlat2;
    SV_Target0.w = u_xlat2 * 3.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb6 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb6){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6 = u_xlat1.y * 0.25 + 0.75;
        u_xlat3 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat6, u_xlat3);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat6 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat6) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 272
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %269 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %122 SpecId 122 
                                                      OpDecorate %219 DescriptorSet 219 
                                                      OpDecorate %219 Binding 219 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %269 Location 269 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                               Private f32_4* %34 = OpVariable Private 
                                              %37 = OpTypeInt 32 0 
                                          u32 %38 = OpConstant 4 
                                              %39 = OpTypeArray %7 %38 
                                              %40 = OpTypeStruct %7 %7 %39 %22 %22 %7 %7 %6 %7 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 6 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 7 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                              %86 = OpTypePointer Private %22 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                         u32 %112 = OpConstant 0 
                                        bool %116 = OpConstantFalse 
                                        bool %122 = OpSpecConstantFalse 
                                         u32 %125 = OpConstant 1 
                                         i32 %131 = OpConstant 2 
                                         i32 %138 = OpConstant 0 
                                         i32 %163 = OpConstant 3 
                                             %170 = OpTypePointer Function %22 
                                         i32 %184 = OpConstant 4 
                                             %185 = OpTypePointer Uniform %22 
                                Private f32* %199 = OpVariable Private 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %204 = OpConstant 3.67402E-40 
                                Private f32* %206 = OpVariable Private 
                                         u32 %207 = OpConstant 2 
                                             %216 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %217 = OpTypeSampledImage %216 
                                             %218 = OpTypePointer UniformConstant %217 
 UniformConstant read_only Texture3DSampled* %219 = OpVariable UniformConstant 
                              Private f32_4* %224 = OpVariable Private 
                                Private f32* %231 = OpVariable Private 
                              Private f32_3* %238 = OpVariable Private 
                                         i32 %240 = OpConstant 5 
                              Private f32_3* %245 = OpVariable Private 
                                             %268 = OpTypePointer Output %7 
                               Output f32_4* %269 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %171 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %35 = OpLoad %30 
                                        f32_3 %36 = OpCompositeConstruct %35 %35 %35 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %34 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %34 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %42 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %88 = OpAccessChain %42 %44 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFNegate %90 
                                          f32 %92 = OpLoad %30 
                                        f32_3 %93 = OpCompositeConstruct %92 %92 %92 
                                        f32_3 %94 = OpFMul %91 %93 
                               Uniform f32_4* %96 = OpAccessChain %42 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %94 %98 
                                                      OpStore %87 %99 
                              Uniform f32_4* %100 = OpAccessChain %42 %95 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 3 3 3 
                                       f32_3 %103 = OpLoad %87 
                                       f32_3 %104 = OpFMul %102 %103 
                                       f32_4 %105 = OpLoad %34 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                                      OpStore %87 %107 
                                Uniform f32* %113 = OpAccessChain %42 %111 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %115 = OpFOrdEqual %114 %83 
                                                      OpStore %110 %115 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                        bool %119 = OpLoad %110 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %121 
                                             %120 = OpLabel 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpSelectionMerge %124 None 
                                                      OpBranchConditional %122 %123 %226 
                                             %123 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %42 %111 %125 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %83 
                                                      OpStore %110 %128 
                                       f32_3 %129 = OpLoad %63 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %42 %131 %111 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %130 %134 
                                       f32_4 %136 = OpLoad %34 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %34 %137 
                              Uniform f32_4* %139 = OpAccessChain %42 %131 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpLoad %63 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 0 0 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %34 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %34 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %34 %149 
                              Uniform f32_4* %150 = OpAccessChain %42 %131 %131 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %63 
                                       f32_3 %154 = OpVectorShuffle %153 %153 2 2 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %34 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFAdd %155 %157 
                                       f32_4 %159 = OpLoad %34 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %34 %160 
                                       f32_4 %161 = OpLoad %34 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                              Uniform f32_4* %164 = OpAccessChain %42 %131 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %162 %166 
                                       f32_4 %168 = OpLoad %34 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %34 %169 
                                        bool %172 = OpLoad %110 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %177 
                                             %173 = OpLabel 
                                       f32_4 %175 = OpLoad %34 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                                      OpStore %171 %176 
                                                      OpBranch %174 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %63 
                                                      OpStore %171 %178 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                       f32_3 %179 = OpLoad %171 
                                       f32_4 %180 = OpLoad %34 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %34 %181 
                                       f32_4 %182 = OpLoad %34 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %186 = OpAccessChain %42 %184 
                                       f32_3 %187 = OpLoad %186 
                                       f32_3 %188 = OpFNegate %187 
                                       f32_3 %189 = OpFAdd %183 %188 
                                       f32_4 %190 = OpLoad %34 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %34 %191 
                                       f32_4 %192 = OpLoad %34 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              Uniform f32_3* %194 = OpAccessChain %42 %163 
                                       f32_3 %195 = OpLoad %194 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %34 
                                       f32_4 %198 = OpVectorShuffle %197 %196 0 4 5 6 
                                                      OpStore %34 %198 
                                Private f32* %200 = OpAccessChain %34 %125 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %199 %205 
                                Uniform f32* %208 = OpAccessChain %42 %111 %207 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %209 %32 
                                         f32 %211 = OpFAdd %210 %204 
                                                      OpStore %206 %211 
                                         f32 %212 = OpLoad %199 
                                         f32 %213 = OpLoad %206 
                                         f32 %214 = OpExtInst %1 40 %212 %213 
                                Private f32* %215 = OpAccessChain %34 %112 
                                                      OpStore %215 %214 
                  read_only Texture3DSampled %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %34 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 2 3 
                                       f32_4 %223 = OpImageSampleImplicitLod %220 %222 
                                                      OpStore %34 %223 
                                       f32_4 %225 = OpLoad %34 
                                                      OpStore %224 %225 
                                                      OpBranch %124 
                                             %226 = OpLabel 
                                Private f32* %227 = OpAccessChain %224 %112 
                                                      OpStore %227 %83 
                                Private f32* %228 = OpAccessChain %224 %125 
                                                      OpStore %228 %83 
                                Private f32* %229 = OpAccessChain %224 %207 
                                                      OpStore %229 %83 
                                Private f32* %230 = OpAccessChain %224 %53 
                                                      OpStore %230 %83 
                                                      OpBranch %124 
                                             %124 = OpLabel 
                                       f32_4 %232 = OpLoad %224 
                              Uniform f32_4* %233 = OpAccessChain %42 %138 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                                      OpStore %231 %235 
                                         f32 %236 = OpLoad %231 
                                         f32 %237 = OpExtInst %1 43 %236 %82 %83 
                                                      OpStore %231 %237 
                                       f32_3 %239 = OpLoad %87 
                              Uniform f32_4* %241 = OpAccessChain %42 %240 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFMul %239 %243 
                                                      OpStore %238 %244 
                                         f32 %246 = OpLoad %231 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_3 %248 = OpLoad %238 
                                       f32_3 %249 = OpFMul %247 %248 
                                                      OpStore %245 %249 
                                       f32_3 %250 = OpLoad %238 
                                       f32_3 %251 = OpFNegate %250 
                                         f32 %252 = OpLoad %231 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpFMul %251 %253 
                              Uniform f32_4* %255 = OpAccessChain %42 %95 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpFAdd %254 %257 
                                                      OpStore %87 %258 
                              Uniform f32_4* %259 = OpAccessChain %42 %95 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 3 3 3 
                                       f32_3 %262 = OpLoad %87 
                                       f32_3 %263 = OpFMul %261 %262 
                                       f32_3 %264 = OpLoad %245 
                                       f32_3 %265 = OpFAdd %263 %264 
                                       f32_4 %266 = OpLoad %75 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %75 %267 
                                       f32_4 %270 = OpLoad %75 
                                                      OpStore %269 %270 
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

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat10_3;
float u_xlat4;
vec2 u_xlat6;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat4 = u_xlat10_0.w * _Opacity;
    u_xlat8 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat8 = sin(u_xlat8);
    u_xlat4 = u_xlat8 * u_xlat4;
    SV_Target0.w = u_xlat4 * 3.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb12)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat12, u_xlat6.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb2 = 0.0<u_xlat1.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat13 = u_xlat2.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_2.w;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat12) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 349
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %64 %346 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpDecorate %40 ArrayStride 40 
                                                      OpMemberDecorate %41 0 RelaxedPrecision 
                                                      OpMemberDecorate %41 0 Offset 41 
                                                      OpMemberDecorate %41 1 Offset 41 
                                                      OpMemberDecorate %41 2 Offset 41 
                                                      OpMemberDecorate %41 3 Offset 41 
                                                      OpMemberDecorate %41 4 Offset 41 
                                                      OpMemberDecorate %41 5 RelaxedPrecision 
                                                      OpMemberDecorate %41 5 Offset 41 
                                                      OpMemberDecorate %41 6 Offset 41 
                                                      OpMemberDecorate %41 7 Offset 41 
                                                      OpMemberDecorate %41 8 Offset 41 
                                                      OpMemberDecorate %41 9 Offset 41 
                                                      OpDecorate %41 Block 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %150 SpecId 150 
                                                      OpDecorate %245 DescriptorSet 245 
                                                      OpDecorate %245 Binding 245 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %286 DescriptorSet 286 
                                                      OpDecorate %286 Binding 286 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %301 DescriptorSet 301 
                                                      OpDecorate %301 Binding 301 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %346 Location 346 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                               Private f32_4* %34 = OpVariable Private 
                                              %37 = OpTypeInt 32 0 
                                          u32 %38 = OpConstant 4 
                                              %39 = OpTypeArray %7 %38 
                                              %40 = OpTypeArray %7 %38 
                                              %41 = OpTypeStruct %7 %7 %39 %22 %22 %7 %40 %7 %6 %7 
                                              %42 = OpTypePointer Uniform %41 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %43 = OpVariable Uniform 
                                              %44 = OpTypeInt 32 1 
                                          i32 %45 = OpConstant 7 
                                              %46 = OpTypePointer Uniform %7 
                                 Private f32* %53 = OpVariable Private 
                                          u32 %54 = OpConstant 3 
                                          i32 %57 = OpConstant 8 
                                              %58 = OpTypePointer Uniform %6 
                                 Private f32* %62 = OpVariable Private 
                                              %63 = OpTypePointer Input %22 
                                 Input f32_3* %64 = OpVariable Input 
                                          f32 %67 = OpConstant 3.67402E-40 
                                          f32 %68 = OpConstant 3.67402E-40 
                                        f32_2 %69 = OpConstantComposite %67 %68 
                               Private f32_4* %76 = OpVariable Private 
                                          f32 %78 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                          f32 %84 = OpConstant 3.67402E-40 
                                              %87 = OpTypePointer Private %22 
                               Private f32_3* %88 = OpVariable Private 
                                          i32 %96 = OpConstant 9 
                                         i32 %111 = OpConstant 6 
                                         i32 %112 = OpConstant 1 
                                         i32 %116 = OpConstant 0 
                                         i32 %124 = OpConstant 2 
                                         i32 %133 = OpConstant 3 
                                             %137 = OpTypeBool 
                                             %138 = OpTypePointer Private %137 
                               Private bool* %139 = OpVariable Private 
                                         u32 %140 = OpConstant 0 
                                        bool %144 = OpConstantFalse 
                                        bool %150 = OpSpecConstantFalse 
                                         u32 %153 = OpConstant 1 
                              Private f32_4* %157 = OpVariable Private 
                                             %196 = OpTypePointer Function %22 
                                         i32 %210 = OpConstant 4 
                                             %211 = OpTypePointer Uniform %22 
                                Private f32* %225 = OpVariable Private 
                                         f32 %228 = OpConstant 3.67402E-40 
                                         f32 %230 = OpConstant 3.67402E-40 
                                Private f32* %232 = OpVariable Private 
                                         u32 %233 = OpConstant 2 
                                             %242 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %243 = OpTypeSampledImage %242 
                                             %244 = OpTypePointer UniformConstant %243 
 UniformConstant read_only Texture3DSampled* %245 = OpVariable UniformConstant 
                              Private f32_4* %250 = OpVariable Private 
                                Private f32* %257 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %268 = OpTypePointer Function %6 
                                             %276 = OpTypePointer Private %15 
                              Private f32_2* %277 = OpVariable Private 
                                       f32_2 %284 = OpConstantComposite %32 %32 
 UniformConstant read_only Texture2DSampled* %286 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %301 = OpVariable UniformConstant 
                                         i32 %317 = OpConstant 5 
                              Private f32_3* %322 = OpVariable Private 
                                             %345 = OpTypePointer Output %7 
                               Output f32_4* %346 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %197 = OpVariable Function 
                               Function f32* %269 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %35 = OpLoad %30 
                                        f32_3 %36 = OpCompositeConstruct %35 %35 %35 
                               Uniform f32_4* %47 = OpAccessChain %43 %45 
                                        f32_4 %48 = OpLoad %47 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFMul %36 %49 
                                        f32_4 %51 = OpLoad %34 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %34 %52 
                                 Private f32* %55 = OpAccessChain %9 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %59 = OpAccessChain %43 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFMul %56 %60 
                                                      OpStore %53 %61 
                                        f32_3 %65 = OpLoad %64 
                                        f32_2 %66 = OpVectorShuffle %65 %65 1 0 
                                          f32 %70 = OpDot %66 %69 
                                                      OpStore %62 %70 
                                          f32 %71 = OpLoad %62 
                                          f32 %72 = OpExtInst %1 13 %71 
                                                      OpStore %62 %72 
                                          f32 %73 = OpLoad %62 
                                          f32 %74 = OpLoad %53 
                                          f32 %75 = OpFMul %73 %74 
                                                      OpStore %53 %75 
                                          f32 %77 = OpLoad %53 
                                          f32 %79 = OpFMul %77 %78 
                                 Private f32* %80 = OpAccessChain %76 %54 
                                                      OpStore %80 %79 
                                 Private f32* %81 = OpAccessChain %76 %54 
                                          f32 %82 = OpLoad %81 
                                          f32 %85 = OpExtInst %1 43 %82 %83 %84 
                                 Private f32* %86 = OpAccessChain %76 %54 
                                                      OpStore %86 %85 
                               Uniform f32_4* %89 = OpAccessChain %43 %45 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFNegate %91 
                                          f32 %93 = OpLoad %30 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpFMul %92 %94 
                               Uniform f32_4* %97 = OpAccessChain %43 %96 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpFAdd %95 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %43 %96 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 3 3 3 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFMul %103 %104 
                                       f32_4 %106 = OpLoad %34 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %105 %107 
                                                      OpStore %88 %108 
                                       f32_3 %109 = OpLoad %64 
                                       f32_4 %110 = OpVectorShuffle %109 %109 1 1 1 1 
                              Uniform f32_4* %113 = OpAccessChain %43 %111 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpFMul %110 %114 
                                                      OpStore %34 %115 
                              Uniform f32_4* %117 = OpAccessChain %43 %111 %116 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpLoad %64 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 0 0 0 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %34 
                                       f32_4 %123 = OpFAdd %121 %122 
                                                      OpStore %34 %123 
                              Uniform f32_4* %125 = OpAccessChain %43 %111 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpLoad %64 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 2 2 2 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %34 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %34 %131 
                                       f32_4 %132 = OpLoad %34 
                              Uniform f32_4* %134 = OpAccessChain %43 %111 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_4 %136 = OpFAdd %132 %135 
                                                      OpStore %34 %136 
                                Uniform f32* %141 = OpAccessChain %43 %112 %140 
                                         f32 %142 = OpLoad %141 
                                        bool %143 = OpFOrdEqual %142 %84 
                                                      OpStore %139 %143 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %146 
                                             %145 = OpLabel 
                                        bool %147 = OpLoad %139 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %149 
                                             %148 = OpLabel 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                                      OpSelectionMerge %152 None 
                                                      OpBranchConditional %150 %151 %252 
                                             %151 = OpLabel 
                                Uniform f32* %154 = OpAccessChain %43 %112 %153 
                                         f32 %155 = OpLoad %154 
                                        bool %156 = OpFOrdEqual %155 %84 
                                                      OpStore %139 %156 
                                       f32_3 %158 = OpLoad %64 
                                       f32_3 %159 = OpVectorShuffle %158 %158 1 1 1 
                              Uniform f32_4* %160 = OpAccessChain %43 %124 %112 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpFMul %159 %162 
                                       f32_4 %164 = OpLoad %157 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %157 %165 
                              Uniform f32_4* %166 = OpAccessChain %43 %124 %116 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %64 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 0 0 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %157 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                       f32_4 %175 = OpLoad %157 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                      OpStore %157 %176 
                              Uniform f32_4* %177 = OpAccessChain %43 %124 %124 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpLoad %64 
                                       f32_3 %181 = OpVectorShuffle %180 %180 2 2 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %157 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                       f32_4 %186 = OpLoad %157 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %157 %187 
                                       f32_4 %188 = OpLoad %157 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                              Uniform f32_4* %190 = OpAccessChain %43 %124 %133 
                                       f32_4 %191 = OpLoad %190 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpFAdd %189 %192 
                                       f32_4 %194 = OpLoad %157 
                                       f32_4 %195 = OpVectorShuffle %194 %193 4 5 6 3 
                                                      OpStore %157 %195 
                                        bool %198 = OpLoad %139 
                                                      OpSelectionMerge %200 None 
                                                      OpBranchConditional %198 %199 %203 
                                             %199 = OpLabel 
                                       f32_4 %201 = OpLoad %157 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                                      OpStore %197 %202 
                                                      OpBranch %200 
                                             %203 = OpLabel 
                                       f32_3 %204 = OpLoad %64 
                                                      OpStore %197 %204 
                                                      OpBranch %200 
                                             %200 = OpLabel 
                                       f32_3 %205 = OpLoad %197 
                                       f32_4 %206 = OpLoad %157 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %157 %207 
                                       f32_4 %208 = OpLoad %157 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_3* %212 = OpAccessChain %43 %210 
                                       f32_3 %213 = OpLoad %212 
                                       f32_3 %214 = OpFNegate %213 
                                       f32_3 %215 = OpFAdd %209 %214 
                                       f32_4 %216 = OpLoad %157 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                      OpStore %157 %217 
                                       f32_4 %218 = OpLoad %157 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                              Uniform f32_3* %220 = OpAccessChain %43 %133 
                                       f32_3 %221 = OpLoad %220 
                                       f32_3 %222 = OpFMul %219 %221 
                                       f32_4 %223 = OpLoad %157 
                                       f32_4 %224 = OpVectorShuffle %223 %222 0 4 5 6 
                                                      OpStore %157 %224 
                                Private f32* %226 = OpAccessChain %157 %153 
                                         f32 %227 = OpLoad %226 
                                         f32 %229 = OpFMul %227 %228 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %225 %231 
                                Uniform f32* %234 = OpAccessChain %43 %112 %233 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %235 %32 
                                         f32 %237 = OpFAdd %236 %230 
                                                      OpStore %232 %237 
                                         f32 %238 = OpLoad %225 
                                         f32 %239 = OpLoad %232 
                                         f32 %240 = OpExtInst %1 40 %238 %239 
                                Private f32* %241 = OpAccessChain %157 %140 
                                                      OpStore %241 %240 
                  read_only Texture3DSampled %246 = OpLoad %245 
                                       f32_4 %247 = OpLoad %157 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 2 3 
                                       f32_4 %249 = OpImageSampleImplicitLod %246 %248 
                                                      OpStore %157 %249 
                                       f32_4 %251 = OpLoad %157 
                                                      OpStore %250 %251 
                                                      OpBranch %152 
                                             %252 = OpLabel 
                                Private f32* %253 = OpAccessChain %250 %140 
                                                      OpStore %253 %84 
                                Private f32* %254 = OpAccessChain %250 %153 
                                                      OpStore %254 %84 
                                Private f32* %255 = OpAccessChain %250 %233 
                                                      OpStore %255 %84 
                                Private f32* %256 = OpAccessChain %250 %54 
                                                      OpStore %256 %84 
                                                      OpBranch %152 
                                             %152 = OpLabel 
                                       f32_4 %258 = OpLoad %250 
                              Uniform f32_4* %259 = OpAccessChain %43 %116 
                                       f32_4 %260 = OpLoad %259 
                                         f32 %261 = OpDot %258 %260 
                                                      OpStore %257 %261 
                                         f32 %262 = OpLoad %257 
                                         f32 %263 = OpExtInst %1 43 %262 %83 %84 
                                                      OpStore %257 %263 
                                Private f32* %264 = OpAccessChain %34 %233 
                                         f32 %265 = OpLoad %264 
                                        bool %266 = OpFOrdLessThan %83 %265 
                                                      OpStore %139 %266 
                                        bool %270 = OpLoad %139 
                                                      OpSelectionMerge %272 None 
                                                      OpBranchConditional %270 %271 %273 
                                             %271 = OpLabel 
                                                      OpStore %269 %84 
                                                      OpBranch %272 
                                             %273 = OpLabel 
                                                      OpStore %269 %83 
                                                      OpBranch %272 
                                             %272 = OpLabel 
                                         f32 %274 = OpLoad %269 
                                Private f32* %275 = OpAccessChain %267 %140 
                                                      OpStore %275 %274 
                                       f32_4 %278 = OpLoad %34 
                                       f32_2 %279 = OpVectorShuffle %278 %278 0 1 
                                       f32_4 %280 = OpLoad %34 
                                       f32_2 %281 = OpVectorShuffle %280 %280 3 3 
                                       f32_2 %282 = OpFDiv %279 %281 
                                                      OpStore %277 %282 
                                       f32_2 %283 = OpLoad %277 
                                       f32_2 %285 = OpFAdd %283 %284 
                                                      OpStore %277 %285 
                  read_only Texture2DSampled %287 = OpLoad %286 
                                       f32_2 %288 = OpLoad %277 
                                       f32_4 %289 = OpImageSampleImplicitLod %287 %288 
                                         f32 %290 = OpCompositeExtract %289 3 
                                                      OpStore %225 %290 
                                         f32 %291 = OpLoad %225 
                                Private f32* %292 = OpAccessChain %267 %140 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFMul %291 %293 
                                Private f32* %295 = OpAccessChain %267 %140 
                                                      OpStore %295 %294 
                                       f32_4 %296 = OpLoad %34 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                       f32_4 %298 = OpLoad %34 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                         f32 %300 = OpDot %297 %299 
                                                      OpStore %225 %300 
                  read_only Texture2DSampled %302 = OpLoad %301 
                                         f32 %303 = OpLoad %225 
                                       f32_2 %304 = OpCompositeConstruct %303 %303 
                                       f32_4 %305 = OpImageSampleImplicitLod %302 %304 
                                         f32 %306 = OpCompositeExtract %305 3 
                                                      OpStore %225 %306 
                                         f32 %307 = OpLoad %225 
                                Private f32* %308 = OpAccessChain %267 %140 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFMul %307 %309 
                                Private f32* %311 = OpAccessChain %267 %140 
                                                      OpStore %311 %310 
                                         f32 %312 = OpLoad %257 
                                Private f32* %313 = OpAccessChain %267 %140 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %312 %314 
                                                      OpStore %257 %315 
                                       f32_3 %316 = OpLoad %88 
                              Uniform f32_4* %318 = OpAccessChain %43 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                                       f32_3 %321 = OpFMul %316 %320 
                                                      OpStore %267 %321 
                                         f32 %323 = OpLoad %257 
                                       f32_3 %324 = OpCompositeConstruct %323 %323 %323 
                                       f32_3 %325 = OpLoad %267 
                                       f32_3 %326 = OpFMul %324 %325 
                                                      OpStore %322 %326 
                                       f32_3 %327 = OpLoad %267 
                                       f32_3 %328 = OpFNegate %327 
                                         f32 %329 = OpLoad %257 
                                       f32_3 %330 = OpCompositeConstruct %329 %329 %329 
                                       f32_3 %331 = OpFMul %328 %330 
                              Uniform f32_4* %332 = OpAccessChain %43 %96 
                                       f32_4 %333 = OpLoad %332 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %331 %334 
                                                      OpStore %88 %335 
                              Uniform f32_4* %336 = OpAccessChain %43 %96 
                                       f32_4 %337 = OpLoad %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 3 3 3 
                                       f32_3 %339 = OpLoad %88 
                                       f32_3 %340 = OpFMul %338 %339 
                                       f32_3 %341 = OpLoad %322 
                                       f32_3 %342 = OpFAdd %340 %341 
                                       f32_4 %343 = OpLoad %76 
                                       f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
                                                      OpStore %76 %344 
                                       f32_4 %347 = OpLoad %76 
                                                      OpStore %346 %347 
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

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat3 = u_xlat10_0.w * _Opacity;
    u_xlat6 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat6 = sin(u_xlat6);
    u_xlat3 = u_xlat6 * u_xlat3;
    SV_Target0.w = u_xlat3 * 3.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat10));
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat9 = u_xlat9 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 327
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %324 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %40 ArrayStride 40 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 RelaxedPrecision 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpMemberDecorate %42 5 RelaxedPrecision 
                                                      OpMemberDecorate %42 5 Offset 42 
                                                      OpMemberDecorate %42 6 Offset 42 
                                                      OpMemberDecorate %42 7 Offset 42 
                                                      OpMemberDecorate %42 8 Offset 42 
                                                      OpMemberDecorate %42 9 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %151 SpecId 151 
                                                      OpDecorate %246 DescriptorSet 246 
                                                      OpDecorate %246 Binding 246 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %280 DescriptorSet 280 
                                                      OpDecorate %280 Binding 280 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %324 Location 324 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                                              %34 = OpTypePointer Private %22 
                               Private f32_3* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 0 
                                          u32 %39 = OpConstant 4 
                                              %40 = OpTypeArray %7 %39 
                                              %41 = OpTypeArray %7 %39 
                                              %42 = OpTypeStruct %7 %7 %40 %22 %22 %7 %41 %7 %6 %7 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 7 
                                              %47 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 8 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                               Private f32_3* %86 = OpVariable Private 
                                          i32 %94 = OpConstant 9 
                                         i32 %108 = OpConstant 6 
                                         i32 %109 = OpConstant 1 
                                         i32 %114 = OpConstant 0 
                                         i32 %123 = OpConstant 2 
                                         i32 %133 = OpConstant 3 
                                             %138 = OpTypeBool 
                                             %139 = OpTypePointer Private %138 
                               Private bool* %140 = OpVariable Private 
                                         u32 %141 = OpConstant 0 
                                        bool %145 = OpConstantFalse 
                                        bool %151 = OpSpecConstantFalse 
                                         u32 %154 = OpConstant 1 
                              Private f32_4* %158 = OpVariable Private 
                                             %197 = OpTypePointer Function %22 
                                         i32 %211 = OpConstant 4 
                                             %212 = OpTypePointer Uniform %22 
                                Private f32* %226 = OpVariable Private 
                                         f32 %229 = OpConstant 3.67402E-40 
                                         f32 %231 = OpConstant 3.67402E-40 
                                Private f32* %233 = OpVariable Private 
                                         u32 %234 = OpConstant 2 
                                             %243 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %244 = OpTypeSampledImage %243 
                                             %245 = OpTypePointer UniformConstant %244 
 UniformConstant read_only Texture3DSampled* %246 = OpVariable UniformConstant 
                              Private f32_4* %251 = OpVariable Private 
                              Private f32_3* %258 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %271 = OpVariable UniformConstant 
                                             %277 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %278 = OpTypeSampledImage %277 
                                             %279 = OpTypePointer UniformConstant %278 
UniformConstant read_only TextureCubeSampled* %280 = OpVariable UniformConstant 
                                         i32 %295 = OpConstant 5 
                              Private f32_3* %300 = OpVariable Private 
                                             %323 = OpTypePointer Output %7 
                               Output f32_4* %324 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %198 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                               Uniform f32_4* %48 = OpAccessChain %44 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFMul %37 %50 
                                                      OpStore %35 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %44 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %87 = OpAccessChain %44 %46 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                          f32 %91 = OpLoad %30 
                                        f32_3 %92 = OpCompositeConstruct %91 %91 %91 
                                        f32_3 %93 = OpFMul %90 %92 
                               Uniform f32_4* %95 = OpAccessChain %44 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %93 %97 
                                                      OpStore %86 %98 
                               Uniform f32_4* %99 = OpAccessChain %44 %94 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 3 3 3 
                                       f32_3 %102 = OpLoad %86 
                                       f32_3 %103 = OpFMul %101 %102 
                                       f32_3 %104 = OpLoad %35 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %86 %105 
                                       f32_3 %106 = OpLoad %63 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %110 = OpAccessChain %44 %108 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFMul %107 %112 
                                                      OpStore %35 %113 
                              Uniform f32_4* %115 = OpAccessChain %44 %108 %114 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpLoad %63 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_3 %121 = OpLoad %35 
                                       f32_3 %122 = OpFAdd %120 %121 
                                                      OpStore %35 %122 
                              Uniform f32_4* %124 = OpAccessChain %44 %108 %123 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpLoad %63 
                                       f32_3 %128 = OpVectorShuffle %127 %127 2 2 2 
                                       f32_3 %129 = OpFMul %126 %128 
                                       f32_3 %130 = OpLoad %35 
                                       f32_3 %131 = OpFAdd %129 %130 
                                                      OpStore %35 %131 
                                       f32_3 %132 = OpLoad %35 
                              Uniform f32_4* %134 = OpAccessChain %44 %108 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %132 %136 
                                                      OpStore %35 %137 
                                Uniform f32* %142 = OpAccessChain %44 %109 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %83 
                                                      OpStore %140 %144 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %147 
                                             %146 = OpLabel 
                                        bool %148 = OpLoad %140 
                                                      OpSelectionMerge %150 None 
                                                      OpBranchConditional %148 %149 %150 
                                             %149 = OpLabel 
                                                      OpBranch %150 
                                             %150 = OpLabel 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %253 
                                             %152 = OpLabel 
                                Uniform f32* %155 = OpAccessChain %44 %109 %154 
                                         f32 %156 = OpLoad %155 
                                        bool %157 = OpFOrdEqual %156 %83 
                                                      OpStore %140 %157 
                                       f32_3 %159 = OpLoad %63 
                                       f32_3 %160 = OpVectorShuffle %159 %159 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %44 %123 %109 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFMul %160 %163 
                                       f32_4 %165 = OpLoad %158 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %158 %166 
                              Uniform f32_4* %167 = OpAccessChain %44 %123 %114 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %63 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %158 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %172 %174 
                                       f32_4 %176 = OpLoad %158 
                                       f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                      OpStore %158 %177 
                              Uniform f32_4* %178 = OpAccessChain %44 %123 %123 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpLoad %63 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %158 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFAdd %183 %185 
                                       f32_4 %187 = OpLoad %158 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %158 %188 
                                       f32_4 %189 = OpLoad %158 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %44 %123 %133 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                       f32_4 %195 = OpLoad %158 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %158 %196 
                                        bool %199 = OpLoad %140 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %204 
                                             %200 = OpLabel 
                                       f32_4 %202 = OpLoad %158 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                                      OpStore %198 %203 
                                                      OpBranch %201 
                                             %204 = OpLabel 
                                       f32_3 %205 = OpLoad %63 
                                                      OpStore %198 %205 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_3 %206 = OpLoad %198 
                                       f32_4 %207 = OpLoad %158 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %158 %208 
                                       f32_4 %209 = OpLoad %158 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                              Uniform f32_3* %213 = OpAccessChain %44 %211 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFNegate %214 
                                       f32_3 %216 = OpFAdd %210 %215 
                                       f32_4 %217 = OpLoad %158 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                      OpStore %158 %218 
                                       f32_4 %219 = OpLoad %158 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_3* %221 = OpAccessChain %44 %133 
                                       f32_3 %222 = OpLoad %221 
                                       f32_3 %223 = OpFMul %220 %222 
                                       f32_4 %224 = OpLoad %158 
                                       f32_4 %225 = OpVectorShuffle %224 %223 0 4 5 6 
                                                      OpStore %158 %225 
                                Private f32* %227 = OpAccessChain %158 %154 
                                         f32 %228 = OpLoad %227 
                                         f32 %230 = OpFMul %228 %229 
                                         f32 %232 = OpFAdd %230 %231 
                                                      OpStore %226 %232 
                                Uniform f32* %235 = OpAccessChain %44 %109 %234 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %236 %32 
                                         f32 %238 = OpFAdd %237 %231 
                                                      OpStore %233 %238 
                                         f32 %239 = OpLoad %226 
                                         f32 %240 = OpLoad %233 
                                         f32 %241 = OpExtInst %1 40 %239 %240 
                                Private f32* %242 = OpAccessChain %158 %141 
                                                      OpStore %242 %241 
                  read_only Texture3DSampled %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %158 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 2 3 
                                       f32_4 %250 = OpImageSampleImplicitLod %247 %249 
                                                      OpStore %158 %250 
                                       f32_4 %252 = OpLoad %158 
                                                      OpStore %251 %252 
                                                      OpBranch %153 
                                             %253 = OpLabel 
                                Private f32* %254 = OpAccessChain %251 %141 
                                                      OpStore %254 %83 
                                Private f32* %255 = OpAccessChain %251 %154 
                                                      OpStore %255 %83 
                                Private f32* %256 = OpAccessChain %251 %234 
                                                      OpStore %256 %83 
                                Private f32* %257 = OpAccessChain %251 %53 
                                                      OpStore %257 %83 
                                                      OpBranch %153 
                                             %153 = OpLabel 
                                       f32_4 %259 = OpLoad %251 
                              Uniform f32_4* %260 = OpAccessChain %44 %114 
                                       f32_4 %261 = OpLoad %260 
                                         f32 %262 = OpDot %259 %261 
                                Private f32* %263 = OpAccessChain %258 %141 
                                                      OpStore %263 %262 
                                Private f32* %264 = OpAccessChain %258 %141 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 43 %265 %82 %83 
                                Private f32* %267 = OpAccessChain %258 %141 
                                                      OpStore %267 %266 
                                       f32_3 %268 = OpLoad %35 
                                       f32_3 %269 = OpLoad %35 
                                         f32 %270 = OpDot %268 %269 
                                                      OpStore %226 %270 
                  read_only Texture2DSampled %272 = OpLoad %271 
                                         f32 %273 = OpLoad %226 
                                       f32_2 %274 = OpCompositeConstruct %273 %273 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                         f32 %276 = OpCompositeExtract %275 3 
                                                      OpStore %226 %276 
                read_only TextureCubeSampled %281 = OpLoad %280 
                                       f32_3 %282 = OpLoad %35 
                                       f32_4 %283 = OpImageSampleImplicitLod %281 %282 
                                         f32 %284 = OpCompositeExtract %283 3 
                                Private f32* %285 = OpAccessChain %35 %141 
                                                      OpStore %285 %284 
                                         f32 %286 = OpLoad %226 
                                Private f32* %287 = OpAccessChain %35 %141 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFMul %286 %288 
                                                      OpStore %226 %289 
                                Private f32* %290 = OpAccessChain %258 %141 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpLoad %226 
                                         f32 %293 = OpFMul %291 %292 
                                                      OpStore %226 %293 
                                       f32_3 %294 = OpLoad %86 
                              Uniform f32_4* %296 = OpAccessChain %44 %295 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFMul %294 %298 
                                                      OpStore %258 %299 
                                         f32 %301 = OpLoad %226 
                                       f32_3 %302 = OpCompositeConstruct %301 %301 %301 
                                       f32_3 %303 = OpLoad %258 
                                       f32_3 %304 = OpFMul %302 %303 
                                                      OpStore %300 %304 
                                       f32_3 %305 = OpLoad %258 
                                       f32_3 %306 = OpFNegate %305 
                                         f32 %307 = OpLoad %226 
                                       f32_3 %308 = OpCompositeConstruct %307 %307 %307 
                                       f32_3 %309 = OpFMul %306 %308 
                              Uniform f32_4* %310 = OpAccessChain %44 %94 
                                       f32_4 %311 = OpLoad %310 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpFAdd %309 %312 
                                                      OpStore %86 %313 
                              Uniform f32_4* %314 = OpAccessChain %44 %94 
                                       f32_4 %315 = OpLoad %314 
                                       f32_3 %316 = OpVectorShuffle %315 %315 3 3 3 
                                       f32_3 %317 = OpLoad %86 
                                       f32_3 %318 = OpFMul %316 %317 
                                       f32_3 %319 = OpLoad %300 
                                       f32_3 %320 = OpFAdd %318 %319 
                                       f32_4 %321 = OpLoad %75 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %75 %322 
                                       f32_4 %325 = OpLoad %75 
                                                      OpStore %324 %325 
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

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat1.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat3 = u_xlat10_0.w * _Opacity;
    u_xlat6 = dot(vs_TEXCOORD2.yx, vec2(8000.0, 400.0));
    u_xlat6 = sin(u_xlat6);
    u_xlat3 = u_xlat6 * u_xlat3;
    SV_Target0.w = u_xlat3 * 3.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 322
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %63 %319 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %40 ArrayStride 40 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 RelaxedPrecision 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpMemberDecorate %42 5 RelaxedPrecision 
                                                      OpMemberDecorate %42 5 Offset 42 
                                                      OpMemberDecorate %42 6 Offset 42 
                                                      OpMemberDecorate %42 7 Offset 42 
                                                      OpMemberDecorate %42 8 Offset 42 
                                                      OpMemberDecorate %42 9 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %63 Location 63 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %162 SpecId 162 
                                                      OpDecorate %257 DescriptorSet 257 
                                                      OpDecorate %257 Binding 257 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %319 Location 319 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                 Private f32* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                                              %34 = OpTypePointer Private %22 
                               Private f32_3* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 0 
                                          u32 %39 = OpConstant 4 
                                              %40 = OpTypeArray %7 %39 
                                              %41 = OpTypeArray %7 %39 
                                              %42 = OpTypeStruct %7 %7 %40 %22 %22 %7 %41 %7 %6 %7 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 7 
                                              %47 = OpTypePointer Uniform %7 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          i32 %56 = OpConstant 8 
                                              %57 = OpTypePointer Uniform %6 
                                 Private f32* %61 = OpVariable Private 
                                              %62 = OpTypePointer Input %22 
                                 Input f32_3* %63 = OpVariable Input 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          f32 %67 = OpConstant 3.67402E-40 
                                        f32_2 %68 = OpConstantComposite %66 %67 
                               Private f32_4* %75 = OpVariable Private 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                               Private f32_3* %86 = OpVariable Private 
                                          i32 %94 = OpConstant 9 
                                         i32 %108 = OpConstant 6 
                                         i32 %109 = OpConstant 1 
                                         i32 %116 = OpConstant 0 
                                         i32 %128 = OpConstant 2 
                                         i32 %142 = OpConstant 3 
                                             %149 = OpTypeBool 
                                             %150 = OpTypePointer Private %149 
                               Private bool* %151 = OpVariable Private 
                                         u32 %152 = OpConstant 0 
                                        bool %156 = OpConstantFalse 
                                        bool %162 = OpSpecConstantFalse 
                                         u32 %165 = OpConstant 1 
                              Private f32_4* %169 = OpVariable Private 
                                             %208 = OpTypePointer Function %22 
                                         i32 %222 = OpConstant 4 
                                             %223 = OpTypePointer Uniform %22 
                                Private f32* %237 = OpVariable Private 
                                         f32 %240 = OpConstant 3.67402E-40 
                                         f32 %242 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         u32 %245 = OpConstant 2 
                                             %254 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %255 = OpTypeSampledImage %254 
                                             %256 = OpTypePointer UniformConstant %255 
 UniformConstant read_only Texture3DSampled* %257 = OpVariable UniformConstant 
                              Private f32_4* %262 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %279 = OpVariable UniformConstant 
                                         i32 %290 = OpConstant 5 
                              Private f32_3* %295 = OpVariable Private 
                                             %318 = OpTypePointer Output %7 
                               Output f32_4* %319 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %209 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %33 = OpFAdd %31 %32 
                                                      OpStore %30 %33 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                               Uniform f32_4* %48 = OpAccessChain %44 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFMul %37 %50 
                                                      OpStore %35 %51 
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %58 = OpAccessChain %44 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFMul %55 %59 
                                                      OpStore %52 %60 
                                        f32_3 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 1 0 
                                          f32 %69 = OpDot %65 %68 
                                                      OpStore %61 %69 
                                          f32 %70 = OpLoad %61 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %61 %71 
                                          f32 %72 = OpLoad %61 
                                          f32 %73 = OpLoad %52 
                                          f32 %74 = OpFMul %72 %73 
                                                      OpStore %52 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %78 = OpFMul %76 %77 
                                 Private f32* %79 = OpAccessChain %75 %53 
                                                      OpStore %79 %78 
                                 Private f32* %80 = OpAccessChain %75 %53 
                                          f32 %81 = OpLoad %80 
                                          f32 %84 = OpExtInst %1 43 %81 %82 %83 
                                 Private f32* %85 = OpAccessChain %75 %53 
                                                      OpStore %85 %84 
                               Uniform f32_4* %87 = OpAccessChain %44 %46 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                          f32 %91 = OpLoad %30 
                                        f32_3 %92 = OpCompositeConstruct %91 %91 %91 
                                        f32_3 %93 = OpFMul %90 %92 
                               Uniform f32_4* %95 = OpAccessChain %44 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %93 %97 
                                                      OpStore %86 %98 
                               Uniform f32_4* %99 = OpAccessChain %44 %94 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 3 3 3 
                                       f32_3 %102 = OpLoad %86 
                                       f32_3 %103 = OpFMul %101 %102 
                                       f32_3 %104 = OpLoad %35 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %86 %105 
                                       f32_3 %106 = OpLoad %63 
                                       f32_2 %107 = OpVectorShuffle %106 %106 1 1 
                              Uniform f32_4* %110 = OpAccessChain %44 %108 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFMul %107 %112 
                                       f32_3 %114 = OpLoad %35 
                                       f32_3 %115 = OpVectorShuffle %114 %113 3 4 2 
                                                      OpStore %35 %115 
                              Uniform f32_4* %117 = OpAccessChain %44 %108 %116 
                                       f32_4 %118 = OpLoad %117 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_3 %120 = OpLoad %63 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 0 
                                       f32_2 %122 = OpFMul %119 %121 
                                       f32_3 %123 = OpLoad %35 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpFAdd %122 %124 
                                       f32_3 %126 = OpLoad %35 
                                       f32_3 %127 = OpVectorShuffle %126 %125 3 4 2 
                                                      OpStore %35 %127 
                              Uniform f32_4* %129 = OpAccessChain %44 %108 %128 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_3 %132 = OpLoad %63 
                                       f32_2 %133 = OpVectorShuffle %132 %132 2 2 
                                       f32_2 %134 = OpFMul %131 %133 
                                       f32_3 %135 = OpLoad %35 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFAdd %134 %136 
                                       f32_3 %138 = OpLoad %35 
                                       f32_3 %139 = OpVectorShuffle %138 %137 3 4 2 
                                                      OpStore %35 %139 
                                       f32_3 %140 = OpLoad %35 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              Uniform f32_4* %143 = OpAccessChain %44 %108 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_2 %146 = OpFAdd %141 %145 
                                       f32_3 %147 = OpLoad %35 
                                       f32_3 %148 = OpVectorShuffle %147 %146 3 4 2 
                                                      OpStore %35 %148 
                                Uniform f32* %153 = OpAccessChain %44 %109 %152 
                                         f32 %154 = OpLoad %153 
                                        bool %155 = OpFOrdEqual %154 %83 
                                                      OpStore %151 %155 
                                                      OpSelectionMerge %158 None 
                                                      OpBranchConditional %156 %157 %158 
                                             %157 = OpLabel 
                                        bool %159 = OpLoad %151 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %159 %160 %161 
                                             %160 = OpLabel 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                                      OpBranch %158 
                                             %158 = OpLabel 
                                                      OpSelectionMerge %164 None 
                                                      OpBranchConditional %162 %163 %264 
                                             %163 = OpLabel 
                                Uniform f32* %166 = OpAccessChain %44 %109 %165 
                                         f32 %167 = OpLoad %166 
                                        bool %168 = OpFOrdEqual %167 %83 
                                                      OpStore %151 %168 
                                       f32_3 %170 = OpLoad %63 
                                       f32_3 %171 = OpVectorShuffle %170 %170 1 1 1 
                              Uniform f32_4* %172 = OpAccessChain %44 %128 %109 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %171 %174 
                                       f32_4 %176 = OpLoad %169 
                                       f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                      OpStore %169 %177 
                              Uniform f32_4* %178 = OpAccessChain %44 %128 %116 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpLoad %63 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 0 0 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %169 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFAdd %183 %185 
                                       f32_4 %187 = OpLoad %169 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %169 %188 
                              Uniform f32_4* %189 = OpAccessChain %44 %128 %128 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %192 = OpLoad %63 
                                       f32_3 %193 = OpVectorShuffle %192 %192 2 2 2 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %169 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFAdd %194 %196 
                                       f32_4 %198 = OpLoad %169 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %169 %199 
                                       f32_4 %200 = OpLoad %169 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %202 = OpAccessChain %44 %128 %142 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %201 %204 
                                       f32_4 %206 = OpLoad %169 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %169 %207 
                                        bool %210 = OpLoad %151 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %215 
                                             %211 = OpLabel 
                                       f32_4 %213 = OpLoad %169 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                                      OpStore %209 %214 
                                                      OpBranch %212 
                                             %215 = OpLabel 
                                       f32_3 %216 = OpLoad %63 
                                                      OpStore %209 %216 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                       f32_3 %217 = OpLoad %209 
                                       f32_4 %218 = OpLoad %169 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
                                                      OpStore %169 %219 
                                       f32_4 %220 = OpLoad %169 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                              Uniform f32_3* %224 = OpAccessChain %44 %222 
                                       f32_3 %225 = OpLoad %224 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %221 %226 
                                       f32_4 %228 = OpLoad %169 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %169 %229 
                                       f32_4 %230 = OpLoad %169 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_3* %232 = OpAccessChain %44 %142 
                                       f32_3 %233 = OpLoad %232 
                                       f32_3 %234 = OpFMul %231 %233 
                                       f32_4 %235 = OpLoad %169 
                                       f32_4 %236 = OpVectorShuffle %235 %234 0 4 5 6 
                                                      OpStore %169 %236 
                                Private f32* %238 = OpAccessChain %169 %165 
                                         f32 %239 = OpLoad %238 
                                         f32 %241 = OpFMul %239 %240 
                                         f32 %243 = OpFAdd %241 %242 
                                                      OpStore %237 %243 
                                Uniform f32* %246 = OpAccessChain %44 %109 %245 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFMul %247 %32 
                                         f32 %249 = OpFAdd %248 %242 
                                                      OpStore %244 %249 
                                         f32 %250 = OpLoad %237 
                                         f32 %251 = OpLoad %244 
                                         f32 %252 = OpExtInst %1 40 %250 %251 
                                Private f32* %253 = OpAccessChain %169 %152 
                                                      OpStore %253 %252 
                  read_only Texture3DSampled %258 = OpLoad %257 
                                       f32_4 %259 = OpLoad %169 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 2 3 
                                       f32_4 %261 = OpImageSampleImplicitLod %258 %260 
                                                      OpStore %169 %261 
                                       f32_4 %263 = OpLoad %169 
                                                      OpStore %262 %263 
                                                      OpBranch %164 
                                             %264 = OpLabel 
                                Private f32* %265 = OpAccessChain %262 %152 
                                                      OpStore %265 %83 
                                Private f32* %266 = OpAccessChain %262 %165 
                                                      OpStore %266 %83 
                                Private f32* %267 = OpAccessChain %262 %245 
                                                      OpStore %267 %83 
                                Private f32* %268 = OpAccessChain %262 %53 
                                                      OpStore %268 %83 
                                                      OpBranch %164 
                                             %164 = OpLabel 
                                       f32_4 %270 = OpLoad %262 
                              Uniform f32_4* %271 = OpAccessChain %44 %116 
                                       f32_4 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                Private f32* %274 = OpAccessChain %269 %152 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %269 %152 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 43 %276 %82 %83 
                                Private f32* %278 = OpAccessChain %269 %152 
                                                      OpStore %278 %277 
                  read_only Texture2DSampled %280 = OpLoad %279 
                                       f32_3 %281 = OpLoad %35 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                         f32 %284 = OpCompositeExtract %283 3 
                                                      OpStore %237 %284 
                                Private f32* %285 = OpAccessChain %269 %152 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpLoad %237 
                                         f32 %288 = OpFMul %286 %287 
                                                      OpStore %237 %288 
                                       f32_3 %289 = OpLoad %86 
                              Uniform f32_4* %291 = OpAccessChain %44 %290 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_3 %294 = OpFMul %289 %293 
                                                      OpStore %269 %294 
                                         f32 %296 = OpLoad %237 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %269 
                                       f32_3 %299 = OpFMul %297 %298 
                                                      OpStore %295 %299 
                                       f32_3 %300 = OpLoad %269 
                                       f32_3 %301 = OpFNegate %300 
                                         f32 %302 = OpLoad %237 
                                       f32_3 %303 = OpCompositeConstruct %302 %302 %302 
                                       f32_3 %304 = OpFMul %301 %303 
                              Uniform f32_4* %305 = OpAccessChain %44 %94 
                                       f32_4 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
                                       f32_3 %308 = OpFAdd %304 %307 
                                                      OpStore %86 %308 
                              Uniform f32_4* %309 = OpAccessChain %44 %94 
                                       f32_4 %310 = OpLoad %309 
                                       f32_3 %311 = OpVectorShuffle %310 %310 3 3 3 
                                       f32_3 %312 = OpLoad %86 
                                       f32_3 %313 = OpFMul %311 %312 
                                       f32_3 %314 = OpLoad %295 
                                       f32_3 %315 = OpFAdd %313 %314 
                                       f32_4 %316 = OpLoad %75 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %75 %317 
                                       f32_4 %320 = OpLoad %75 
                                                      OpStore %319 %320 
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
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
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
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
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
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
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
  Lighting On
  GpuProgramID 135991
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
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _DashColor;
uniform 	vec4 _OverrideColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 + 0.5;
    u_xlat2.xyz = vec3(u_xlat16_0) * _DashColor.xyz;
    u_xlat1.xyz = (-_DashColor.xyz) * vec3(u_xlat16_0) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat6 = unity_OneOverOutputBoost;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
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
; Bound: 196
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 
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
                                             %190 = OpTypePointer Output %9 
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
                                 Output f32* %191 = OpAccessChain %166 %120 %162 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFNegate %192 
                                 Output f32* %194 = OpAccessChain %166 %120 %162 
                                                      OpStore %194 %193 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 149
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %135 
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
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %131 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
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
                                              %22 = OpTypePointer Private %6 
                                 Private f32* %23 = OpVariable Private 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                              %30 = OpTypePointer Private %19 
                               Private f32_4* %31 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                               Private f32_3* %38 = OpVariable Private 
                                              %41 = OpTypeVector %35 4 
                                              %42 = OpTypeStruct %19 %19 %41 %6 %6 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; u32_4; f32; f32;}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 0 
                                              %47 = OpTypePointer Uniform %19 
                               Private f32_3* %52 = OpVariable Private 
                                          i32 %60 = OpConstant 1 
                               Private f32_3* %65 = OpVariable Private 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %76 = OpConstant 3 
                                              %77 = OpTypePointer Uniform %6 
                                          f32 %81 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          i32 %91 = OpConstant 4 
                                             %104 = OpTypePointer Function %7 
                                         i32 %106 = OpConstant 2 
                                             %107 = OpTypeBool 
                                             %108 = OpTypeVector %107 4 
                                             %109 = OpTypePointer Uniform %41 
                                       f32_3 %118 = OpConstantComposite %81 %81 %81 
                                             %122 = OpTypePointer Function %6 
                                         u32 %132 = OpConstant 3 
                                             %134 = OpTypePointer Output %19 
                               Output f32_4* %135 = OpVariable Output 
                                             %136 = OpTypePointer Function %19 
                                       f32_4 %144 = OpConstantComposite %81 %81 %81 %82 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %105 = OpVariable Function 
                               Function f32* %123 = OpVariable Function 
                             Function f32_4* %137 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %24 = OpLoad %9 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %23 %29 
                                          f32 %32 = OpLoad %23 
                                          f32 %34 = OpFAdd %32 %33 
                                 Private f32* %37 = OpAccessChain %31 %36 
                                                      OpStore %37 %34 
                                        f32_4 %39 = OpLoad %31 
                                        f32_3 %40 = OpVectorShuffle %39 %39 0 0 0 
                               Uniform f32_4* %48 = OpAccessChain %44 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFMul %40 %50 
                                                      OpStore %38 %51 
                               Uniform f32_4* %53 = OpAccessChain %44 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFNegate %55 
                                        f32_4 %57 = OpLoad %31 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 0 0 
                                        f32_3 %59 = OpFMul %56 %58 
                               Uniform f32_4* %61 = OpAccessChain %44 %60 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %59 %63 
                                                      OpStore %52 %64 
                               Uniform f32_4* %66 = OpAccessChain %44 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                                        f32_3 %69 = OpLoad %52 
                                        f32_3 %70 = OpFMul %68 %69 
                                        f32_3 %71 = OpLoad %38 
                                        f32_3 %72 = OpFAdd %70 %71 
                                                      OpStore %65 %72 
                                        f32_3 %73 = OpLoad %65 
                                        f32_3 %74 = OpExtInst %1 30 %73 
                                                      OpStore %65 %74 
                                 Uniform f32* %78 = OpAccessChain %44 %76 
                                          f32 %79 = OpLoad %78 
                                                      OpStore %75 %79 
                                          f32 %80 = OpLoad %75 
                                          f32 %83 = OpExtInst %1 43 %80 %81 %82 
                                                      OpStore %75 %83 
                                        f32_3 %84 = OpLoad %65 
                                          f32 %85 = OpLoad %75 
                                        f32_3 %86 = OpCompositeConstruct %85 %85 %85 
                                        f32_3 %87 = OpFMul %84 %86 
                                                      OpStore %65 %87 
                                        f32_3 %88 = OpLoad %65 
                                        f32_3 %89 = OpExtInst %1 29 %88 
                                                      OpStore %65 %89 
                                        f32_3 %90 = OpLoad %65 
                                 Uniform f32* %92 = OpAccessChain %44 %91 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %94 = OpAccessChain %44 %91 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %44 %91 
                                          f32 %97 = OpLoad %96 
                                        f32_3 %98 = OpCompositeConstruct %93 %95 %97 
                                          f32 %99 = OpCompositeExtract %98 0 
                                         f32 %100 = OpCompositeExtract %98 1 
                                         f32 %101 = OpCompositeExtract %98 2 
                                       f32_3 %102 = OpCompositeConstruct %99 %100 %101 
                                       f32_3 %103 = OpExtInst %1 37 %90 %102 
                                                      OpStore %65 %103 
                              Uniform u32_4* %110 = OpAccessChain %44 %106 
                                       u32_4 %111 = OpLoad %110 
                                         u32 %112 = OpCompositeExtract %111 0 
                                        bool %113 = OpINotEqual %112 %36 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %117 
                                             %114 = OpLabel 
                                       f32_3 %116 = OpLoad %65 
                                                      OpStore %105 %116 
                                                      OpBranch %115 
                                             %117 = OpLabel 
                                                      OpStore %105 %118 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                       f32_3 %119 = OpLoad %105 
                                       f32_4 %120 = OpLoad %31 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %31 %121 
                              Uniform u32_4* %124 = OpAccessChain %44 %106 
                                       u32_4 %125 = OpLoad %124 
                                         u32 %126 = OpCompositeExtract %125 0 
                                        bool %127 = OpINotEqual %126 %36 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %130 
                                             %128 = OpLabel 
                                                      OpStore %123 %82 
                                                      OpBranch %129 
                                             %130 = OpLabel 
                                                      OpStore %123 %81 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                         f32 %131 = OpLoad %123 
                                Private f32* %133 = OpAccessChain %31 %132 
                                                      OpStore %133 %131 
                              Uniform u32_4* %138 = OpAccessChain %44 %106 
                                       u32_4 %139 = OpLoad %138 
                                         u32 %140 = OpCompositeExtract %139 1 
                                        bool %141 = OpINotEqual %140 %36 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %145 
                                             %142 = OpLabel 
                                                      OpStore %137 %144 
                                                      OpBranch %143 
                                             %145 = OpLabel 
                                       f32_4 %146 = OpLoad %31 
                                                      OpStore %137 %146 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %147 = OpLoad %137 
                                                      OpStore %135 %147 
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
Fallback "tk2d/BlendVertexColor"
}