//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTintableTiltedCutout" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  ColorMask RGB 0
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 2364
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat5.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_3* %149 = OpVariable Output 
                                         f32 %150 = OpConstant 3.67402E-40 
                                       f32_3 %151 = OpConstantComposite %150 %150 %150 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %231 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %68 SpecId 68 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeStruct %7 %7 %27 %28 %28 %7 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %39 = OpConstant 0 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                                          i32 %52 = OpConstant -1 
                                          f32 %60 = OpConstant 3.67402E-40 
                                         bool %62 = OpConstantFalse 
                                         bool %68 = OpSpecConstantFalse 
                                          u32 %71 = OpConstant 1 
                                              %75 = OpTypePointer Private %28 
                               Private f32_3* %76 = OpVariable Private 
                                              %77 = OpTypePointer Input %28 
                                 Input f32_3* %78 = OpVariable Input 
                                          i32 %81 = OpConstant 2 
                                              %82 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Function %28 
                                         i32 %120 = OpConstant 4 
                                             %121 = OpTypePointer Uniform %28 
                              Private f32_4* %126 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         u32 %140 = OpConstant 2 
                                         f32 %143 = OpConstant 3.67402E-40 
                                             %153 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %154 = OpTypeSampledImage %153 
                                             %155 = OpTypePointer UniformConstant %154 
 UniformConstant read_only Texture3DSampled* %156 = OpVariable UniformConstant 
                              Private f32_3* %167 = OpVariable Private 
                                Input f32_3* %179 = OpVariable Input 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %198 = OpConstant 3.67402E-40 
                                       f32_3 %199 = OpConstantComposite %196 %197 %198 
                                         i32 %200 = OpConstant 6 
                                             %230 = OpTypePointer Output %7 
                               Output f32_4* %231 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %35 = OpAccessChain %31 %33 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %38 = OpFAdd %25 %37 
                                 Private f32* %40 = OpAccessChain %20 %39 
                                                      OpStore %40 %38 
                                 Private f32* %44 = OpAccessChain %20 %39 
                                          f32 %45 = OpLoad %44 
                                         bool %47 = OpFOrdLessThan %45 %46 
                                                      OpStore %43 %47 
                                         bool %48 = OpLoad %43 
                                          i32 %51 = OpSelect %48 %50 %49 
                                          i32 %53 = OpIMul %51 %52 
                                         bool %54 = OpINotEqual %53 %49 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %54 %55 %56 
                                              %55 = OpLabel 
                                                      OpKill
                                              %56 = OpLabel 
                                 Uniform f32* %58 = OpAccessChain %31 %50 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdEqual %59 %60 
                                                      OpStore %43 %61 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpBranch %67 
                                              %67 = OpLabel 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %162 
                                              %69 = OpLabel 
                                 Uniform f32* %72 = OpAccessChain %31 %50 %71 
                                          f32 %73 = OpLoad %72 
                                         bool %74 = OpFOrdEqual %73 %60 
                                                      OpStore %43 %74 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %31 %81 %50 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %80 %85 
                                                      OpStore %76 %86 
                               Uniform f32_4* %87 = OpAccessChain %31 %81 %49 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %76 
                                        f32_3 %94 = OpFAdd %92 %93 
                                                      OpStore %76 %94 
                               Uniform f32_4* %95 = OpAccessChain %31 %81 %81 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %78 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %76 %102 
                                       f32_3 %103 = OpLoad %76 
                              Uniform f32_4* %105 = OpAccessChain %31 %81 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %76 %108 
                                        bool %112 = OpLoad %43 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %116 
                                             %113 = OpLabel 
                                       f32_3 %115 = OpLoad %76 
                                                      OpStore %111 %115 
                                                      OpBranch %114 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %78 
                                                      OpStore %111 %117 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %118 = OpLoad %111 
                                                      OpStore %109 %118 
                                       f32_3 %119 = OpLoad %109 
                              Uniform f32_3* %122 = OpAccessChain %31 %120 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %119 %124 
                                                      OpStore %109 %125 
                                       f32_3 %127 = OpLoad %109 
                              Uniform f32_3* %128 = OpAccessChain %31 %104 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %126 
                                       f32_4 %132 = OpVectorShuffle %131 %130 0 4 5 6 
                                                      OpStore %126 %132 
                                Private f32* %133 = OpAccessChain %126 %71 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %109 %39 
                                                      OpStore %139 %138 
                                Uniform f32* %141 = OpAccessChain %31 %50 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %144 = OpFMul %142 %143 
                                         f32 %145 = OpFAdd %144 %137 
                                Private f32* %146 = OpAccessChain %76 %39 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %76 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %109 %39 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 40 %148 %150 
                                Private f32* %152 = OpAccessChain %126 %39 
                                                      OpStore %152 %151 
                  read_only Texture3DSampled %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %126 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 2 3 
                                       f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                                      OpStore %126 %160 
                                       f32_4 %161 = OpLoad %126 
                                                      OpStore %20 %161 
                                                      OpBranch %70 
                                             %162 = OpLabel 
                                Private f32* %163 = OpAccessChain %20 %39 
                                                      OpStore %163 %60 
                                Private f32* %164 = OpAccessChain %20 %71 
                                                      OpStore %164 %60 
                                Private f32* %165 = OpAccessChain %20 %140 
                                                      OpStore %165 %60 
                                Private f32* %166 = OpAccessChain %20 %22 
                                                      OpStore %166 %60 
                                                      OpBranch %70 
                                              %70 = OpLabel 
                                       f32_4 %168 = OpLoad %20 
                              Uniform f32_4* %169 = OpAccessChain %31 %49 
                                       f32_4 %170 = OpLoad %169 
                                         f32 %171 = OpDot %168 %170 
                                Private f32* %172 = OpAccessChain %167 %39 
                                                      OpStore %172 %171 
                                Private f32* %173 = OpAccessChain %167 %39 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 43 %174 %46 %60 
                                Private f32* %176 = OpAccessChain %167 %39 
                                                      OpStore %176 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %20 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %20 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %31 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %167 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %167 %195 
                              Uniform f32_4* %201 = OpAccessChain %31 %200 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                         f32 %204 = OpDot %199 %203 
                                Private f32* %205 = OpAccessChain %109 %39 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %109 %39 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %137 
                                         f32 %209 = OpFAdd %208 %135 
                                Private f32* %210 = OpAccessChain %109 %39 
                                                      OpStore %210 %209 
                                       f32_3 %211 = OpLoad %109 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                              Uniform f32_4* %213 = OpAccessChain %31 %200 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_3 %217 = OpLoad %167 
                                       f32_3 %218 = OpFNegate %217 
                                       f32_3 %219 = OpFAdd %216 %218 
                                                      OpStore %109 %219 
                              Uniform f32_4* %220 = OpAccessChain %31 %200 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 3 3 3 
                                       f32_3 %223 = OpLoad %109 
                                       f32_3 %224 = OpFMul %222 %223 
                                       f32_3 %225 = OpLoad %167 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %9 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %9 %228 
                                Private f32* %229 = OpAccessChain %20 %22 
                                                      OpStore %229 %46 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %20 
                                       f32_4 %234 = OpFAdd %232 %233 
                                                      OpStore %231 %234 
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat5.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %83 %95 %96 %110 %149 %152 %155 %264 
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
                                                      OpMemberDecorate %81 0 BuiltIn 81 
                                                      OpMemberDecorate %81 1 BuiltIn 81 
                                                      OpMemberDecorate %81 2 BuiltIn 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
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
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 9 
                                          u32 %79 = OpConstant 1 
                                              %80 = OpTypeArray %6 %79 
                                              %81 = OpTypeStruct %7 %6 %80 
                                              %82 = OpTypePointer Output %81 
         Output struct {f32_4; f32; f32[1];}* %83 = OpVariable Output 
                                              %91 = OpTypePointer Output %7 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Output %93 
                                Output f32_2* %95 = OpVariable Output 
                                 Input f32_4* %96 = OpVariable Input 
                                          i32 %99 = OpConstant 10 
                                             %108 = OpTypeVector %6 3 
                                             %109 = OpTypePointer Input %108 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %112 = OpConstant 8 
                                         u32 %117 = OpConstant 0 
                                             %118 = OpTypePointer Private %6 
                                         u32 %131 = OpConstant 2 
                                Private f32* %133 = OpVariable Private 
                                             %148 = OpTypePointer Output %108 
                               Output f32_3* %149 = OpVariable Output 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_4* %155 = OpVariable Output 
                                             %157 = OpTypePointer Private %108 
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
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %9 %57 
                                        f32_4 %59 = OpLoad %45 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %21 %61 %24 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %60 %63 
                                                      OpStore %58 %64 
                               Uniform f32_4* %65 = OpAccessChain %21 %61 %29 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %58 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %61 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %45 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %58 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %84 = OpAccessChain %21 %61 %47 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %45 
                                        f32_4 %87 = OpVectorShuffle %86 %86 3 3 3 3 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %58 
                                        f32_4 %90 = OpFAdd %88 %89 
                                Output f32_4* %92 = OpAccessChain %83 %29 
                                                      OpStore %92 %90 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %100 = OpAccessChain %21 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFMul %98 %102 
                              Uniform f32_4* %104 = OpAccessChain %21 %99 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 2 3 
                                       f32_2 %107 = OpFAdd %103 %106 
                                                      OpStore %95 %107 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 %29 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %111 %115 
                                Private f32* %119 = OpAccessChain %45 %117 
                                                      OpStore %119 %116 
                                       f32_3 %120 = OpLoad %110 
                              Uniform f32_4* %121 = OpAccessChain %21 %112 %24 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %120 %123 
                                Private f32* %125 = OpAccessChain %45 %79 
                                                      OpStore %125 %124 
                                       f32_3 %126 = OpLoad %110 
                              Uniform f32_4* %127 = OpAccessChain %21 %112 %37 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %126 %129 
                                Private f32* %132 = OpAccessChain %45 %131 
                                                      OpStore %132 %130 
                                       f32_4 %134 = OpLoad %45 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %45 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                                      OpStore %133 %138 
                                         f32 %139 = OpLoad %133 
                                         f32 %140 = OpExtInst %1 32 %139 
                                                      OpStore %133 %140 
                                         f32 %141 = OpLoad %133 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %45 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %45 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %45 %147 
                                       f32_4 %150 = OpLoad %45 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                                      OpStore %149 %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                                      OpStore %155 %156 
                                Private f32* %159 = OpAccessChain %45 %79 
                                         f32 %160 = OpLoad %159 
                                Private f32* %161 = OpAccessChain %45 %79 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFMul %160 %162 
                                Private f32* %164 = OpAccessChain %158 %117 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %45 %117 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %45 %117 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %158 %117 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFNegate %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %158 %117 
                                                      OpStore %174 %173 
                                       f32_4 %176 = OpLoad %45 
                                       f32_4 %177 = OpVectorShuffle %176 %176 1 2 2 0 
                                       f32_4 %178 = OpLoad %45 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 1 2 2 
                                       f32_4 %180 = OpFMul %177 %179 
                                                      OpStore %175 %180 
                              Uniform f32_4* %182 = OpAccessChain %21 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %175 
                                         f32 %185 = OpDot %183 %184 
                                Private f32* %186 = OpAccessChain %181 %117 
                                                      OpStore %186 %185 
                              Uniform f32_4* %188 = OpAccessChain %21 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %175 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %181 %79 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %21 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %175 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %181 %131 
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
                                Private f32* %210 = OpAccessChain %45 %209 
                                                      OpStore %210 %208 
                              Uniform f32_4* %211 = OpAccessChain %21 %29 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %45 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %181 %117 
                                                      OpStore %215 %214 
                              Uniform f32_4* %216 = OpAccessChain %21 %24 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %45 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %181 %79 
                                                      OpStore %220 %219 
                              Uniform f32_4* %221 = OpAccessChain %21 %37 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %45 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %181 %131 
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
                                       f32_4 %235 = OpLoad %45 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %45 %236 
                                       f32_4 %237 = OpLoad %45 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %45 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %45 %243 
                                       f32_4 %244 = OpLoad %45 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpExtInst %1 29 %245 
                                       f32_4 %247 = OpLoad %45 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %45 %248 
                                       f32_4 %249 = OpLoad %45 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %45 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %45 %258 
                                       f32_4 %259 = OpLoad %45 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpExtInst %1 40 %260 %231 
                                       f32_4 %262 = OpLoad %45 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %45 %263 
                                       f32_4 %265 = OpLoad %45 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %264 %266 
                                 Output f32* %268 = OpAccessChain %83 %29 %79 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFNegate %269 
                                 Output f32* %271 = OpAccessChain %83 %29 %79 
                                                      OpStore %271 %270 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %231 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %68 SpecId 68 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeStruct %7 %7 %27 %28 %28 %7 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %39 = OpConstant 0 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                                          i32 %52 = OpConstant -1 
                                          f32 %60 = OpConstant 3.67402E-40 
                                         bool %62 = OpConstantFalse 
                                         bool %68 = OpSpecConstantFalse 
                                          u32 %71 = OpConstant 1 
                                              %75 = OpTypePointer Private %28 
                               Private f32_3* %76 = OpVariable Private 
                                              %77 = OpTypePointer Input %28 
                                 Input f32_3* %78 = OpVariable Input 
                                          i32 %81 = OpConstant 2 
                                              %82 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Function %28 
                                         i32 %120 = OpConstant 4 
                                             %121 = OpTypePointer Uniform %28 
                              Private f32_4* %126 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         u32 %140 = OpConstant 2 
                                         f32 %143 = OpConstant 3.67402E-40 
                                             %153 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %154 = OpTypeSampledImage %153 
                                             %155 = OpTypePointer UniformConstant %154 
 UniformConstant read_only Texture3DSampled* %156 = OpVariable UniformConstant 
                              Private f32_3* %167 = OpVariable Private 
                                Input f32_3* %179 = OpVariable Input 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %198 = OpConstant 3.67402E-40 
                                       f32_3 %199 = OpConstantComposite %196 %197 %198 
                                         i32 %200 = OpConstant 6 
                                             %230 = OpTypePointer Output %7 
                               Output f32_4* %231 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %35 = OpAccessChain %31 %33 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %38 = OpFAdd %25 %37 
                                 Private f32* %40 = OpAccessChain %20 %39 
                                                      OpStore %40 %38 
                                 Private f32* %44 = OpAccessChain %20 %39 
                                          f32 %45 = OpLoad %44 
                                         bool %47 = OpFOrdLessThan %45 %46 
                                                      OpStore %43 %47 
                                         bool %48 = OpLoad %43 
                                          i32 %51 = OpSelect %48 %50 %49 
                                          i32 %53 = OpIMul %51 %52 
                                         bool %54 = OpINotEqual %53 %49 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %54 %55 %56 
                                              %55 = OpLabel 
                                                      OpKill
                                              %56 = OpLabel 
                                 Uniform f32* %58 = OpAccessChain %31 %50 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdEqual %59 %60 
                                                      OpStore %43 %61 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpBranch %67 
                                              %67 = OpLabel 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %162 
                                              %69 = OpLabel 
                                 Uniform f32* %72 = OpAccessChain %31 %50 %71 
                                          f32 %73 = OpLoad %72 
                                         bool %74 = OpFOrdEqual %73 %60 
                                                      OpStore %43 %74 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %31 %81 %50 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %80 %85 
                                                      OpStore %76 %86 
                               Uniform f32_4* %87 = OpAccessChain %31 %81 %49 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %76 
                                        f32_3 %94 = OpFAdd %92 %93 
                                                      OpStore %76 %94 
                               Uniform f32_4* %95 = OpAccessChain %31 %81 %81 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %78 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %76 %102 
                                       f32_3 %103 = OpLoad %76 
                              Uniform f32_4* %105 = OpAccessChain %31 %81 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %76 %108 
                                        bool %112 = OpLoad %43 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %116 
                                             %113 = OpLabel 
                                       f32_3 %115 = OpLoad %76 
                                                      OpStore %111 %115 
                                                      OpBranch %114 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %78 
                                                      OpStore %111 %117 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %118 = OpLoad %111 
                                                      OpStore %109 %118 
                                       f32_3 %119 = OpLoad %109 
                              Uniform f32_3* %122 = OpAccessChain %31 %120 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %119 %124 
                                                      OpStore %109 %125 
                                       f32_3 %127 = OpLoad %109 
                              Uniform f32_3* %128 = OpAccessChain %31 %104 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %126 
                                       f32_4 %132 = OpVectorShuffle %131 %130 0 4 5 6 
                                                      OpStore %126 %132 
                                Private f32* %133 = OpAccessChain %126 %71 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %109 %39 
                                                      OpStore %139 %138 
                                Uniform f32* %141 = OpAccessChain %31 %50 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %144 = OpFMul %142 %143 
                                         f32 %145 = OpFAdd %144 %137 
                                Private f32* %146 = OpAccessChain %76 %39 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %76 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %109 %39 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 40 %148 %150 
                                Private f32* %152 = OpAccessChain %126 %39 
                                                      OpStore %152 %151 
                  read_only Texture3DSampled %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %126 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 2 3 
                                       f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                                      OpStore %126 %160 
                                       f32_4 %161 = OpLoad %126 
                                                      OpStore %20 %161 
                                                      OpBranch %70 
                                             %162 = OpLabel 
                                Private f32* %163 = OpAccessChain %20 %39 
                                                      OpStore %163 %60 
                                Private f32* %164 = OpAccessChain %20 %71 
                                                      OpStore %164 %60 
                                Private f32* %165 = OpAccessChain %20 %140 
                                                      OpStore %165 %60 
                                Private f32* %166 = OpAccessChain %20 %22 
                                                      OpStore %166 %60 
                                                      OpBranch %70 
                                              %70 = OpLabel 
                                       f32_4 %168 = OpLoad %20 
                              Uniform f32_4* %169 = OpAccessChain %31 %49 
                                       f32_4 %170 = OpLoad %169 
                                         f32 %171 = OpDot %168 %170 
                                Private f32* %172 = OpAccessChain %167 %39 
                                                      OpStore %172 %171 
                                Private f32* %173 = OpAccessChain %167 %39 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 43 %174 %46 %60 
                                Private f32* %176 = OpAccessChain %167 %39 
                                                      OpStore %176 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %20 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %20 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %31 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %167 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %167 %195 
                              Uniform f32_4* %201 = OpAccessChain %31 %200 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                         f32 %204 = OpDot %199 %203 
                                Private f32* %205 = OpAccessChain %109 %39 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %109 %39 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %137 
                                         f32 %209 = OpFAdd %208 %135 
                                Private f32* %210 = OpAccessChain %109 %39 
                                                      OpStore %210 %209 
                                       f32_3 %211 = OpLoad %109 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                              Uniform f32_4* %213 = OpAccessChain %31 %200 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_3 %217 = OpLoad %167 
                                       f32_3 %218 = OpFNegate %217 
                                       f32_3 %219 = OpFAdd %216 %218 
                                                      OpStore %109 %219 
                              Uniform f32_4* %220 = OpAccessChain %31 %200 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 3 3 3 
                                       f32_3 %223 = OpLoad %109 
                                       f32_3 %224 = OpFMul %222 %223 
                                       f32_3 %225 = OpLoad %167 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %9 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %9 %228 
                                Private f32* %229 = OpAccessChain %20 %22 
                                                      OpStore %229 %46 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %20 
                                       f32_4 %234 = OpFAdd %232 %233 
                                                      OpStore %231 %234 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb5){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat9);
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 193
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %88 %94 %95 %109 %140 %146 %149 %151 %173 %185 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %86 0 BuiltIn 86 
                                                      OpMemberDecorate %86 1 BuiltIn 86 
                                                      OpMemberDecorate %86 2 BuiltIn 86 
                                                      OpDecorate %86 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %109 Location 109 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %185 Location 185 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %84 = OpConstant 1 
                                              %85 = OpTypeArray %6 %84 
                                              %86 = OpTypeStruct %7 %6 %85 
                                              %87 = OpTypePointer Output %86 
         Output struct {f32_4; f32; f32[1];}* %88 = OpVariable Output 
                                              %90 = OpTypePointer Output %7 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                                Output f32_2* %94 = OpVariable Output 
                                 Input f32_4* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 4 
                                             %107 = OpTypeVector %6 3 
                                             %108 = OpTypePointer Input %107 
                                Input f32_3* %109 = OpVariable Input 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Private %6 
                                         u32 %129 = OpConstant 2 
                                Private f32* %131 = OpVariable Private 
                                             %139 = OpTypePointer Output %107 
                               Output f32_3* %140 = OpVariable Output 
                               Output f32_3* %146 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                               Output f32_3* %151 = OpVariable Output 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_3 %153 = OpConstantComposite %152 %152 %152 
                                             %156 = OpTypePointer Uniform %6 
                                         f32 %163 = OpConstant 3.67402E-40 
                                         u32 %165 = OpConstant 3 
                                       f32_2 %169 = OpConstantComposite %163 %163 
                               Output f32_4* %173 = OpVariable Output 
                               Output f32_4* %185 = OpVariable Output 
                                       f32_4 %186 = OpConstantComposite %152 %152 %152 %152 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %46 %23 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %46 %28 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %46 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %77 = OpAccessChain %21 %46 %46 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %44 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %57 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %44 %83 
                                        f32_4 %89 = OpLoad %44 
                                Output f32_4* %91 = OpAccessChain %88 %28 
                                                      OpStore %91 %89 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                               Uniform f32_4* %99 = OpAccessChain %21 %98 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFMul %97 %101 
                              Uniform f32_4* %103 = OpAccessChain %21 %98 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_2 %106 = OpFAdd %102 %105 
                                                      OpStore %94 %106 
                                       f32_3 %110 = OpLoad %109 
                              Uniform f32_4* %111 = OpAccessChain %21 %36 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                         f32 %114 = OpDot %110 %113 
                                Private f32* %117 = OpAccessChain %57 %115 
                                                      OpStore %117 %114 
                                       f32_3 %118 = OpLoad %109 
                              Uniform f32_4* %119 = OpAccessChain %21 %36 %23 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                         f32 %122 = OpDot %118 %121 
                                Private f32* %123 = OpAccessChain %57 %84 
                                                      OpStore %123 %122 
                                       f32_3 %124 = OpLoad %109 
                              Uniform f32_4* %125 = OpAccessChain %21 %36 %36 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                         f32 %128 = OpDot %124 %127 
                                Private f32* %130 = OpAccessChain %57 %129 
                                                      OpStore %130 %128 
                                       f32_4 %132 = OpLoad %57 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_4 %134 = OpLoad %57 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %136 = OpDot %133 %135 
                                                      OpStore %131 %136 
                                         f32 %137 = OpLoad %131 
                                         f32 %138 = OpExtInst %1 32 %137 
                                                      OpStore %131 %138 
                                         f32 %141 = OpLoad %131 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %57 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                                      OpStore %146 %148 
                                       f32_4 %150 = OpLoad %9 
                                                      OpStore %149 %150 
                                                      OpStore %151 %153 
                                Private f32* %154 = OpAccessChain %44 %84 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %21 %28 %115 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFMul %155 %158 
                                Private f32* %160 = OpAccessChain %9 %115 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %9 %115 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                Private f32* %166 = OpAccessChain %9 %165 
                                                      OpStore %166 %164 
                                       f32_4 %167 = OpLoad %44 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %170 = OpFMul %168 %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 1 5 3 
                                                      OpStore %9 %172 
                                       f32_4 %174 = OpLoad %44 
                                       f32_2 %175 = OpVectorShuffle %174 %174 2 3 
                                       f32_4 %176 = OpLoad %173 
                                       f32_4 %177 = OpVectorShuffle %176 %175 0 1 4 5 
                                                      OpStore %173 %177 
                                       f32_4 %178 = OpLoad %9 
                                       f32_2 %179 = OpVectorShuffle %178 %178 2 2 
                                       f32_4 %180 = OpLoad %9 
                                       f32_2 %181 = OpVectorShuffle %180 %180 0 3 
                                       f32_2 %182 = OpFAdd %179 %181 
                                       f32_4 %183 = OpLoad %173 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
                                                      OpStore %173 %184 
                                                      OpStore %185 %186 
                                 Output f32* %188 = OpAccessChain %88 %28 %84 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFNegate %189 
                                 Output f32* %191 = OpAccessChain %88 %28 %84 
                                                      OpStore %191 %190 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 346
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %341 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 RelaxedPrecision 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 RelaxedPrecision 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpMemberDecorate %30 9 RelaxedPrecision 
                                                      OpMemberDecorate %30 9 Offset 30 
                                                      OpMemberDecorate %30 10 Offset 30 
                                                      OpMemberDecorate %30 11 RelaxedPrecision 
                                                      OpMemberDecorate %30 11 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %145 SpecId 145 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %248 Location 248 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %341 Location 341 
                                                      OpDecorate %343 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                              %26 = OpTypeVector %6 3 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %26 %7 %7 %7 %28 %7 %29 %26 %26 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 11 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %26 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %26 
                                 Input f32_3* %62 = OpVariable Input 
                                              %65 = OpTypePointer Uniform %26 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %70 = OpConstant 4 
                                          u32 %71 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant 2 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                         f32 %131 = OpConstant 3.67402E-40 
                               Private bool* %134 = OpVariable Private 
                                         i32 %135 = OpConstant 5 
                                        bool %139 = OpConstantFalse 
                                        bool %145 = OpSpecConstantFalse 
                               Private bool* %148 = OpVariable Private 
                                         i32 %154 = OpConstant 6 
                                             %180 = OpTypePointer Function %26 
                                         i32 %190 = OpConstant 8 
                              Private f32_4* %195 = OpVariable Private 
                                         i32 %197 = OpConstant 7 
                                             %203 = OpTypePointer Private %15 
                              Private f32_2* %204 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_3* %237 = OpVariable Private 
                                             %247 = OpTypePointer Input %7 
                                Input f32_4* %248 = OpVariable Input 
                                Private f32* %254 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %255 = OpVariable UniformConstant 
                              Private f32_3* %260 = OpVariable Private 
                                             %276 = OpTypePointer Function %6 
                                Input f32_3* %290 = OpVariable Input 
                                         i32 %297 = OpConstant 9 
                                         f32 %306 = OpConstant 3.67402E-40 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                       f32_3 %309 = OpConstantComposite %306 %307 %308 
                                         i32 %310 = OpConstant 10 
                                             %340 = OpTypePointer Output %7 
                               Output f32_4* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %181 = OpVariable Function 
                               Function f32* %277 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpFNegate %63 
                               Uniform f32_3* %66 = OpAccessChain %32 %50 
                                        f32_3 %67 = OpLoad %66 
                                        f32_3 %68 = OpFAdd %64 %67 
                                                      OpStore %60 %68 
                                 Uniform f32* %72 = OpAccessChain %32 %70 %50 %71 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %69 %40 
                                                      OpStore %74 %73 
                                 Uniform f32* %75 = OpAccessChain %32 %70 %51 %71 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %78 = OpAccessChain %69 %77 
                                                      OpStore %78 %76 
                                 Uniform f32* %80 = OpAccessChain %32 %70 %79 %71 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %69 %71 
                                                      OpStore %82 %81 
                                        f32_3 %83 = OpLoad %60 
                                        f32_3 %84 = OpLoad %69 
                                          f32 %85 = OpDot %83 %84 
                                 Private f32* %86 = OpAccessChain %60 %40 
                                                      OpStore %86 %85 
                                        f32_3 %88 = OpLoad %62 
                               Uniform f32_4* %91 = OpAccessChain %32 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFNegate %93 
                                        f32_3 %95 = OpFAdd %88 %94 
                                                      OpStore %87 %95 
                                        f32_3 %96 = OpLoad %87 
                                        f32_3 %97 = OpLoad %87 
                                          f32 %98 = OpDot %96 %97 
                                 Private f32* %99 = OpAccessChain %87 %40 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %87 %40 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 31 %101 
                                Private f32* %103 = OpAccessChain %87 %40 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %60 %40 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                Private f32* %107 = OpAccessChain %87 %40 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %87 %40 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %32 %89 %22 
                                         f32 %112 = OpLoad %111 
                                Private f32* %113 = OpAccessChain %87 %40 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %112 %114 
                                Private f32* %116 = OpAccessChain %60 %40 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %60 %40 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %60 %40 
                                         f32 %121 = OpLoad %120 
                                Uniform f32* %122 = OpAccessChain %32 %79 %71 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Uniform f32* %125 = OpAccessChain %32 %79 %22 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %60 %40 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %60 %40 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpExtInst %1 43 %130 %47 %131 
                                Private f32* %133 = OpAccessChain %60 %40 
                                                      OpStore %133 %132 
                                Uniform f32* %136 = OpAccessChain %32 %135 %40 
                                         f32 %137 = OpLoad %136 
                                        bool %138 = OpFOrdEqual %137 %131 
                                                      OpStore %134 %138 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %141 
                                             %140 = OpLabel 
                                        bool %142 = OpLoad %134 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %144 
                                             %143 = OpLabel 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %232 
                                             %146 = OpLabel 
                                Uniform f32* %149 = OpAccessChain %32 %135 %77 
                                         f32 %150 = OpLoad %149 
                                        bool %151 = OpFOrdEqual %150 %131 
                                                      OpStore %148 %151 
                                       f32_3 %152 = OpLoad %62 
                                       f32_3 %153 = OpVectorShuffle %152 %152 1 1 1 
                              Uniform f32_4* %155 = OpAccessChain %32 %154 %51 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFMul %153 %157 
                                                      OpStore %69 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %154 %50 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %62 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %69 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %69 %166 
                              Uniform f32_4* %167 = OpAccessChain %32 %154 %79 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %62 
                                       f32_3 %171 = OpVectorShuffle %170 %170 2 2 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_3 %173 = OpLoad %69 
                                       f32_3 %174 = OpFAdd %172 %173 
                                                      OpStore %69 %174 
                                       f32_3 %175 = OpLoad %69 
                              Uniform f32_4* %176 = OpAccessChain %32 %154 %89 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                                      OpStore %69 %179 
                                        bool %182 = OpLoad %148 
                                                      OpSelectionMerge %184 None 
                                                      OpBranchConditional %182 %183 %186 
                                             %183 = OpLabel 
                                       f32_3 %185 = OpLoad %69 
                                                      OpStore %181 %185 
                                                      OpBranch %184 
                                             %186 = OpLabel 
                                       f32_3 %187 = OpLoad %62 
                                                      OpStore %181 %187 
                                                      OpBranch %184 
                                             %184 = OpLabel 
                                       f32_3 %188 = OpLoad %181 
                                                      OpStore %69 %188 
                                       f32_3 %189 = OpLoad %69 
                              Uniform f32_3* %191 = OpAccessChain %32 %190 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %189 %193 
                                                      OpStore %69 %194 
                                       f32_3 %196 = OpLoad %69 
                              Uniform f32_3* %198 = OpAccessChain %32 %197 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %196 %199 
                                       f32_4 %201 = OpLoad %195 
                                       f32_4 %202 = OpVectorShuffle %201 %200 0 4 5 6 
                                                      OpStore %195 %202 
                                Private f32* %205 = OpAccessChain %195 %77 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %204 %40 
                                                      OpStore %211 %210 
                                Uniform f32* %213 = OpAccessChain %32 %135 %71 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %212 %217 
                                         f32 %218 = OpLoad %212 
                                Private f32* %219 = OpAccessChain %204 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpExtInst %1 40 %218 %220 
                                Private f32* %222 = OpAccessChain %195 %40 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %195 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %195 %230 
                                       f32_4 %231 = OpLoad %195 
                                                      OpStore %20 %231 
                                                      OpBranch %147 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %20 %40 
                                                      OpStore %233 %131 
                                Private f32* %234 = OpAccessChain %20 %77 
                                                      OpStore %234 %131 
                                Private f32* %235 = OpAccessChain %20 %71 
                                                      OpStore %235 %131 
                                Private f32* %236 = OpAccessChain %20 %22 
                                                      OpStore %236 %131 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                       f32_4 %238 = OpLoad %20 
                              Uniform f32_4* %239 = OpAccessChain %32 %51 
                                       f32_4 %240 = OpLoad %239 
                                         f32 %241 = OpDot %238 %240 
                                Private f32* %242 = OpAccessChain %237 %40 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %237 %40 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpExtInst %1 43 %244 %47 %131 
                                Private f32* %246 = OpAccessChain %237 %40 
                                                      OpStore %246 %245 
                                       f32_4 %249 = OpLoad %248 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_4 %251 = OpLoad %248 
                                       f32_2 %252 = OpVectorShuffle %251 %251 3 3 
                                       f32_2 %253 = OpFDiv %250 %252 
                                                      OpStore %204 %253 
                  read_only Texture2DSampled %256 = OpLoad %255 
                                       f32_2 %257 = OpLoad %204 
                                       f32_4 %258 = OpImageSampleImplicitLod %256 %257 
                                         f32 %259 = OpCompositeExtract %258 0 
                                                      OpStore %254 %259 
                                Private f32* %261 = OpAccessChain %60 %40 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpLoad %254 
                                         f32 %264 = OpFAdd %262 %263 
                                Private f32* %265 = OpAccessChain %260 %40 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %260 %40 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpExtInst %1 43 %267 %47 %131 
                                Private f32* %269 = OpAccessChain %260 %40 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %260 %40 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %237 %40 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 37 %271 %273 
                                Private f32* %275 = OpAccessChain %237 %40 
                                                      OpStore %275 %274 
                                        bool %278 = OpLoad %134 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %278 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %237 %40 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %277 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                Private f32* %284 = OpAccessChain %260 %40 
                                         f32 %285 = OpLoad %284 
                                                      OpStore %277 %285 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %286 = OpLoad %277 
                                Private f32* %287 = OpAccessChain %237 %40 
                                                      OpStore %287 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %291 = OpLoad %290 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %20 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %20 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %32 %297 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %296 %300 
                                                      OpStore %260 %301 
                                       f32_3 %302 = OpLoad %237 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 0 0 
                                       f32_3 %304 = OpLoad %260 
                                       f32_3 %305 = OpFMul %303 %304 
                                                      OpStore %237 %305 
                              Uniform f32_4* %311 = OpAccessChain %32 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                         f32 %314 = OpDot %309 %313 
                                Private f32* %315 = OpAccessChain %60 %40 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %60 %40 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %209 
                                         f32 %319 = OpFAdd %318 %207 
                                Private f32* %320 = OpAccessChain %60 %40 
                                                      OpStore %320 %319 
                                       f32_3 %321 = OpLoad %60 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 0 0 
                              Uniform f32_4* %323 = OpAccessChain %32 %310 
                                       f32_4 %324 = OpLoad %323 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFMul %322 %325 
                                       f32_3 %327 = OpLoad %237 
                                       f32_3 %328 = OpFNegate %327 
                                       f32_3 %329 = OpFAdd %326 %328 
                                                      OpStore %60 %329 
                              Uniform f32_4* %330 = OpAccessChain %32 %310 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 3 3 3 
                                       f32_3 %333 = OpLoad %60 
                                       f32_3 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %237 
                                       f32_3 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                      OpStore %9 %338 
                                Private f32* %339 = OpAccessChain %20 %22 
                                                      OpStore %339 %47 
                                       f32_4 %342 = OpLoad %9 
                                       f32_4 %343 = OpLoad %20 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %341 %344 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0.x = u_xlat2.y * u_xlat2.y;
    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb5){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat9);
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 303
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %96 %97 %111 %150 %153 %156 %266 %283 %295 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
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
                                                      OpMemberDecorate %19 7 RelaxedPrecision 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpMemberDecorate %19 11 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %88 0 BuiltIn 88 
                                                      OpMemberDecorate %88 1 BuiltIn 88 
                                                      OpMemberDecorate %88 2 BuiltIn 88 
                                                      OpDecorate %88 Block 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %111 Location 111 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %153 Location 153 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %266 Location 266 
                                                      OpDecorate %283 Location 283 
                                                      OpDecorate %295 Location 295 
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
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 8 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 10 
                                          u32 %86 = OpConstant 1 
                                              %87 = OpTypeArray %6 %86 
                                              %88 = OpTypeStruct %7 %6 %87 
                                              %89 = OpTypePointer Output %88 
         Output struct {f32_4; f32; f32[1];}* %90 = OpVariable Output 
                                              %92 = OpTypePointer Output %7 
                                              %94 = OpTypeVector %6 2 
                                              %95 = OpTypePointer Output %94 
                                Output f32_2* %96 = OpVariable Output 
                                 Input f32_4* %97 = OpVariable Input 
                                         i32 %100 = OpConstant 11 
                                             %109 = OpTypeVector %6 3 
                                             %110 = OpTypePointer Input %109 
                                Input f32_3* %111 = OpVariable Input 
                                         i32 %113 = OpConstant 9 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                                             %149 = OpTypePointer Output %109 
                               Output f32_3* %150 = OpVariable Output 
                               Output f32_3* %153 = OpVariable Output 
                               Output f32_4* %156 = OpVariable Output 
                                             %158 = OpTypePointer Private %109 
                              Private f32_3* %159 = OpVariable Private 
                              Private f32_4* %176 = OpVariable Private 
                              Private f32_3* %182 = OpVariable Private 
                                         i32 %183 = OpConstant 4 
                                         i32 %189 = OpConstant 5 
                                         i32 %195 = OpConstant 6 
                                         i32 %201 = OpConstant 7 
                                         f32 %210 = OpConstant 3.67402E-40 
                                         u32 %211 = OpConstant 3 
                                         f32 %232 = OpConstant 3.67402E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %241 = OpConstant 3.67402E-40 
                                       f32_3 %242 = OpConstantComposite %241 %241 %241 
                                         f32 %253 = OpConstant 3.67402E-40 
                                       f32_3 %254 = OpConstantComposite %253 %253 %253 
                                         f32 %256 = OpConstant 3.67402E-40 
                                       f32_3 %257 = OpConstantComposite %256 %256 %256 
                               Output f32_3* %266 = OpVariable Output 
                                             %271 = OpTypePointer Uniform %6 
                                         f32 %278 = OpConstant 3.67402E-40 
                                       f32_3 %279 = OpConstantComposite %278 %278 %278 
                               Output f32_4* %283 = OpVariable Output 
                               Output f32_4* %295 = OpVariable Output 
                                       f32_4 %296 = OpConstantComposite %232 %232 %232 %232 
                                             %297 = OpTypePointer Output %6 
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
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %9 %57 
                                        f32_4 %59 = OpLoad %45 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %21 %61 %24 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %60 %63 
                                                      OpStore %58 %64 
                               Uniform f32_4* %65 = OpAccessChain %21 %61 %29 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %58 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %61 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %45 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %58 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %61 %47 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %45 
                                        f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %58 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %45 %85 
                                        f32_4 %91 = OpLoad %45 
                                Output f32_4* %93 = OpAccessChain %90 %29 
                                                      OpStore %93 %91 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %100 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %99 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %100 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %96 %108 
                                       f32_3 %112 = OpLoad %111 
                              Uniform f32_4* %114 = OpAccessChain %21 %113 %29 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %112 %116 
                                Private f32* %120 = OpAccessChain %58 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %111 
                              Uniform f32_4* %122 = OpAccessChain %21 %113 %24 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %58 %86 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %111 
                              Uniform f32_4* %128 = OpAccessChain %21 %113 %37 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %58 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %58 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %58 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %142 = OpLoad %134 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_4 %144 = OpLoad %58 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %58 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %58 %148 
                                       f32_4 %151 = OpLoad %58 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                                      OpStore %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                                      OpStore %153 %155 
                                       f32_4 %157 = OpLoad %9 
                                                      OpStore %156 %157 
                                Private f32* %160 = OpAccessChain %58 %86 
                                         f32 %161 = OpLoad %160 
                                Private f32* %162 = OpAccessChain %58 %86 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Private f32* %165 = OpAccessChain %159 %118 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %58 %118 
                                         f32 %167 = OpLoad %166 
                                Private f32* %168 = OpAccessChain %58 %118 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFMul %167 %169 
                                Private f32* %171 = OpAccessChain %159 %118 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                         f32 %174 = OpFAdd %170 %173 
                                Private f32* %175 = OpAccessChain %159 %118 
                                                      OpStore %175 %174 
                                       f32_4 %177 = OpLoad %58 
                                       f32_4 %178 = OpVectorShuffle %177 %177 1 2 2 0 
                                       f32_4 %179 = OpLoad %58 
                                       f32_4 %180 = OpVectorShuffle %179 %179 0 1 2 2 
                                       f32_4 %181 = OpFMul %178 %180 
                                                      OpStore %176 %181 
                              Uniform f32_4* %184 = OpAccessChain %21 %183 
                                       f32_4 %185 = OpLoad %184 
                                       f32_4 %186 = OpLoad %176 
                                         f32 %187 = OpDot %185 %186 
                                Private f32* %188 = OpAccessChain %182 %118 
                                                      OpStore %188 %187 
                              Uniform f32_4* %190 = OpAccessChain %21 %189 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %176 
                                         f32 %193 = OpDot %191 %192 
                                Private f32* %194 = OpAccessChain %182 %86 
                                                      OpStore %194 %193 
                              Uniform f32_4* %196 = OpAccessChain %21 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpLoad %176 
                                         f32 %199 = OpDot %197 %198 
                                Private f32* %200 = OpAccessChain %182 %132 
                                                      OpStore %200 %199 
                              Uniform f32_4* %202 = OpAccessChain %21 %201 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpLoad %159 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 0 0 
                                       f32_3 %207 = OpFMul %204 %206 
                                       f32_3 %208 = OpLoad %182 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %159 %209 
                                Private f32* %212 = OpAccessChain %58 %211 
                                                      OpStore %212 %210 
                              Uniform f32_4* %213 = OpAccessChain %21 %24 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %58 
                                         f32 %216 = OpDot %214 %215 
                                Private f32* %217 = OpAccessChain %182 %118 
                                                      OpStore %217 %216 
                              Uniform f32_4* %218 = OpAccessChain %21 %37 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %58 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %182 %86 
                                                      OpStore %222 %221 
                              Uniform f32_4* %223 = OpAccessChain %21 %47 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %58 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %182 %132 
                                                      OpStore %227 %226 
                                       f32_3 %228 = OpLoad %159 
                                       f32_3 %229 = OpLoad %182 
                                       f32_3 %230 = OpFAdd %228 %229 
                                                      OpStore %159 %230 
                                       f32_3 %231 = OpLoad %159 
                                       f32_3 %234 = OpExtInst %1 40 %231 %233 
                                                      OpStore %159 %234 
                                       f32_3 %235 = OpLoad %159 
                                       f32_3 %236 = OpExtInst %1 30 %235 
                                       f32_4 %237 = OpLoad %58 
                                       f32_4 %238 = OpVectorShuffle %237 %236 4 5 6 3 
                                                      OpStore %58 %238 
                                       f32_4 %239 = OpLoad %58 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %58 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %58 %245 
                                       f32_4 %246 = OpLoad %58 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %248 = OpExtInst %1 29 %247 
                                       f32_4 %249 = OpLoad %58 
                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 6 3 
                                                      OpStore %58 %250 
                                       f32_4 %251 = OpLoad %58 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %255 = OpFMul %252 %254 
                                       f32_3 %258 = OpFAdd %255 %257 
                                       f32_4 %259 = OpLoad %58 
                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 6 3 
                                                      OpStore %58 %260 
                                       f32_4 %261 = OpLoad %58 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpExtInst %1 40 %262 %233 
                                       f32_4 %264 = OpLoad %58 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %58 %265 
                                       f32_4 %267 = OpLoad %58 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                                      OpStore %266 %268 
                                Private f32* %269 = OpAccessChain %45 %86 
                                         f32 %270 = OpLoad %269 
                                Uniform f32* %272 = OpAccessChain %21 %29 %118 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %270 %273 
                                Private f32* %275 = OpAccessChain %45 %86 
                                                      OpStore %275 %274 
                                       f32_4 %276 = OpLoad %45 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 3 1 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %58 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 1 5 6 
                                                      OpStore %58 %282 
                                       f32_4 %284 = OpLoad %45 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_4 %286 = OpLoad %283 
                                       f32_4 %287 = OpVectorShuffle %286 %285 0 1 4 5 
                                                      OpStore %283 %287 
                                       f32_4 %288 = OpLoad %58 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_4 %290 = OpLoad %58 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 3 
                                       f32_2 %292 = OpFAdd %289 %291 
                                       f32_4 %293 = OpLoad %283 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 2 3 
                                                      OpStore %283 %294 
                                                      OpStore %295 %296 
                                 Output f32* %298 = OpAccessChain %90 %29 %86 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpFNegate %299 
                                 Output f32* %301 = OpAccessChain %90 %29 %86 
                                                      OpStore %301 %300 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 346
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %341 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 RelaxedPrecision 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 RelaxedPrecision 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpMemberDecorate %30 9 RelaxedPrecision 
                                                      OpMemberDecorate %30 9 Offset 30 
                                                      OpMemberDecorate %30 10 Offset 30 
                                                      OpMemberDecorate %30 11 RelaxedPrecision 
                                                      OpMemberDecorate %30 11 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %145 SpecId 145 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %248 Location 248 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %341 Location 341 
                                                      OpDecorate %343 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                              %26 = OpTypeVector %6 3 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %26 %7 %7 %7 %28 %7 %29 %26 %26 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 11 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %26 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %26 
                                 Input f32_3* %62 = OpVariable Input 
                                              %65 = OpTypePointer Uniform %26 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %70 = OpConstant 4 
                                          u32 %71 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant 2 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                         f32 %131 = OpConstant 3.67402E-40 
                               Private bool* %134 = OpVariable Private 
                                         i32 %135 = OpConstant 5 
                                        bool %139 = OpConstantFalse 
                                        bool %145 = OpSpecConstantFalse 
                               Private bool* %148 = OpVariable Private 
                                         i32 %154 = OpConstant 6 
                                             %180 = OpTypePointer Function %26 
                                         i32 %190 = OpConstant 8 
                              Private f32_4* %195 = OpVariable Private 
                                         i32 %197 = OpConstant 7 
                                             %203 = OpTypePointer Private %15 
                              Private f32_2* %204 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_3* %237 = OpVariable Private 
                                             %247 = OpTypePointer Input %7 
                                Input f32_4* %248 = OpVariable Input 
                                Private f32* %254 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %255 = OpVariable UniformConstant 
                              Private f32_3* %260 = OpVariable Private 
                                             %276 = OpTypePointer Function %6 
                                Input f32_3* %290 = OpVariable Input 
                                         i32 %297 = OpConstant 9 
                                         f32 %306 = OpConstant 3.67402E-40 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                       f32_3 %309 = OpConstantComposite %306 %307 %308 
                                         i32 %310 = OpConstant 10 
                                             %340 = OpTypePointer Output %7 
                               Output f32_4* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %181 = OpVariable Function 
                               Function f32* %277 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpFNegate %63 
                               Uniform f32_3* %66 = OpAccessChain %32 %50 
                                        f32_3 %67 = OpLoad %66 
                                        f32_3 %68 = OpFAdd %64 %67 
                                                      OpStore %60 %68 
                                 Uniform f32* %72 = OpAccessChain %32 %70 %50 %71 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %69 %40 
                                                      OpStore %74 %73 
                                 Uniform f32* %75 = OpAccessChain %32 %70 %51 %71 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %78 = OpAccessChain %69 %77 
                                                      OpStore %78 %76 
                                 Uniform f32* %80 = OpAccessChain %32 %70 %79 %71 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %69 %71 
                                                      OpStore %82 %81 
                                        f32_3 %83 = OpLoad %60 
                                        f32_3 %84 = OpLoad %69 
                                          f32 %85 = OpDot %83 %84 
                                 Private f32* %86 = OpAccessChain %60 %40 
                                                      OpStore %86 %85 
                                        f32_3 %88 = OpLoad %62 
                               Uniform f32_4* %91 = OpAccessChain %32 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFNegate %93 
                                        f32_3 %95 = OpFAdd %88 %94 
                                                      OpStore %87 %95 
                                        f32_3 %96 = OpLoad %87 
                                        f32_3 %97 = OpLoad %87 
                                          f32 %98 = OpDot %96 %97 
                                 Private f32* %99 = OpAccessChain %87 %40 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %87 %40 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 31 %101 
                                Private f32* %103 = OpAccessChain %87 %40 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %60 %40 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                Private f32* %107 = OpAccessChain %87 %40 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %87 %40 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %32 %89 %22 
                                         f32 %112 = OpLoad %111 
                                Private f32* %113 = OpAccessChain %87 %40 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %112 %114 
                                Private f32* %116 = OpAccessChain %60 %40 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %60 %40 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %60 %40 
                                         f32 %121 = OpLoad %120 
                                Uniform f32* %122 = OpAccessChain %32 %79 %71 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Uniform f32* %125 = OpAccessChain %32 %79 %22 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %60 %40 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %60 %40 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpExtInst %1 43 %130 %47 %131 
                                Private f32* %133 = OpAccessChain %60 %40 
                                                      OpStore %133 %132 
                                Uniform f32* %136 = OpAccessChain %32 %135 %40 
                                         f32 %137 = OpLoad %136 
                                        bool %138 = OpFOrdEqual %137 %131 
                                                      OpStore %134 %138 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %141 
                                             %140 = OpLabel 
                                        bool %142 = OpLoad %134 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %144 
                                             %143 = OpLabel 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %232 
                                             %146 = OpLabel 
                                Uniform f32* %149 = OpAccessChain %32 %135 %77 
                                         f32 %150 = OpLoad %149 
                                        bool %151 = OpFOrdEqual %150 %131 
                                                      OpStore %148 %151 
                                       f32_3 %152 = OpLoad %62 
                                       f32_3 %153 = OpVectorShuffle %152 %152 1 1 1 
                              Uniform f32_4* %155 = OpAccessChain %32 %154 %51 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFMul %153 %157 
                                                      OpStore %69 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %154 %50 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %62 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %69 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %69 %166 
                              Uniform f32_4* %167 = OpAccessChain %32 %154 %79 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %62 
                                       f32_3 %171 = OpVectorShuffle %170 %170 2 2 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_3 %173 = OpLoad %69 
                                       f32_3 %174 = OpFAdd %172 %173 
                                                      OpStore %69 %174 
                                       f32_3 %175 = OpLoad %69 
                              Uniform f32_4* %176 = OpAccessChain %32 %154 %89 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                                      OpStore %69 %179 
                                        bool %182 = OpLoad %148 
                                                      OpSelectionMerge %184 None 
                                                      OpBranchConditional %182 %183 %186 
                                             %183 = OpLabel 
                                       f32_3 %185 = OpLoad %69 
                                                      OpStore %181 %185 
                                                      OpBranch %184 
                                             %186 = OpLabel 
                                       f32_3 %187 = OpLoad %62 
                                                      OpStore %181 %187 
                                                      OpBranch %184 
                                             %184 = OpLabel 
                                       f32_3 %188 = OpLoad %181 
                                                      OpStore %69 %188 
                                       f32_3 %189 = OpLoad %69 
                              Uniform f32_3* %191 = OpAccessChain %32 %190 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %189 %193 
                                                      OpStore %69 %194 
                                       f32_3 %196 = OpLoad %69 
                              Uniform f32_3* %198 = OpAccessChain %32 %197 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %196 %199 
                                       f32_4 %201 = OpLoad %195 
                                       f32_4 %202 = OpVectorShuffle %201 %200 0 4 5 6 
                                                      OpStore %195 %202 
                                Private f32* %205 = OpAccessChain %195 %77 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %204 %40 
                                                      OpStore %211 %210 
                                Uniform f32* %213 = OpAccessChain %32 %135 %71 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %212 %217 
                                         f32 %218 = OpLoad %212 
                                Private f32* %219 = OpAccessChain %204 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpExtInst %1 40 %218 %220 
                                Private f32* %222 = OpAccessChain %195 %40 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %195 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %195 %230 
                                       f32_4 %231 = OpLoad %195 
                                                      OpStore %20 %231 
                                                      OpBranch %147 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %20 %40 
                                                      OpStore %233 %131 
                                Private f32* %234 = OpAccessChain %20 %77 
                                                      OpStore %234 %131 
                                Private f32* %235 = OpAccessChain %20 %71 
                                                      OpStore %235 %131 
                                Private f32* %236 = OpAccessChain %20 %22 
                                                      OpStore %236 %131 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                       f32_4 %238 = OpLoad %20 
                              Uniform f32_4* %239 = OpAccessChain %32 %51 
                                       f32_4 %240 = OpLoad %239 
                                         f32 %241 = OpDot %238 %240 
                                Private f32* %242 = OpAccessChain %237 %40 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %237 %40 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpExtInst %1 43 %244 %47 %131 
                                Private f32* %246 = OpAccessChain %237 %40 
                                                      OpStore %246 %245 
                                       f32_4 %249 = OpLoad %248 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_4 %251 = OpLoad %248 
                                       f32_2 %252 = OpVectorShuffle %251 %251 3 3 
                                       f32_2 %253 = OpFDiv %250 %252 
                                                      OpStore %204 %253 
                  read_only Texture2DSampled %256 = OpLoad %255 
                                       f32_2 %257 = OpLoad %204 
                                       f32_4 %258 = OpImageSampleImplicitLod %256 %257 
                                         f32 %259 = OpCompositeExtract %258 0 
                                                      OpStore %254 %259 
                                Private f32* %261 = OpAccessChain %60 %40 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpLoad %254 
                                         f32 %264 = OpFAdd %262 %263 
                                Private f32* %265 = OpAccessChain %260 %40 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %260 %40 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpExtInst %1 43 %267 %47 %131 
                                Private f32* %269 = OpAccessChain %260 %40 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %260 %40 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %237 %40 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 37 %271 %273 
                                Private f32* %275 = OpAccessChain %237 %40 
                                                      OpStore %275 %274 
                                        bool %278 = OpLoad %134 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %278 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %237 %40 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %277 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                Private f32* %284 = OpAccessChain %260 %40 
                                         f32 %285 = OpLoad %284 
                                                      OpStore %277 %285 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %286 = OpLoad %277 
                                Private f32* %287 = OpAccessChain %237 %40 
                                                      OpStore %287 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %291 = OpLoad %290 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %20 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %20 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %32 %297 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %296 %300 
                                                      OpStore %260 %301 
                                       f32_3 %302 = OpLoad %237 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 0 0 
                                       f32_3 %304 = OpLoad %260 
                                       f32_3 %305 = OpFMul %303 %304 
                                                      OpStore %237 %305 
                              Uniform f32_4* %311 = OpAccessChain %32 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                         f32 %314 = OpDot %309 %313 
                                Private f32* %315 = OpAccessChain %60 %40 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %60 %40 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %209 
                                         f32 %319 = OpFAdd %318 %207 
                                Private f32* %320 = OpAccessChain %60 %40 
                                                      OpStore %320 %319 
                                       f32_3 %321 = OpLoad %60 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 0 0 
                              Uniform f32_4* %323 = OpAccessChain %32 %310 
                                       f32_4 %324 = OpLoad %323 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFMul %322 %325 
                                       f32_3 %327 = OpLoad %237 
                                       f32_3 %328 = OpFNegate %327 
                                       f32_3 %329 = OpFAdd %326 %328 
                                                      OpStore %60 %329 
                              Uniform f32_4* %330 = OpAccessChain %32 %310 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 3 3 3 
                                       f32_3 %333 = OpLoad %60 
                                       f32_3 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %237 
                                       f32_3 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                      OpStore %9 %338 
                                Private f32* %339 = OpAccessChain %20 %22 
                                                      OpStore %339 %47 
                                       f32_4 %342 = OpLoad %9 
                                       f32_4 %343 = OpLoad %20 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %341 %344 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat5.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 284
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %275 
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
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 Location 275 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 5 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 7 
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
                                         i32 %101 = OpConstant 8 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 6 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                              Private f32_4* %165 = OpVariable Private 
                              Private f32_4* %173 = OpVariable Private 
                                         f32 %209 = OpConstant 3.67402E-40 
                                       f32_4 %210 = OpConstantComposite %209 %209 %209 %209 
                                         f32 %218 = OpConstant 3.67402E-40 
                                       f32_4 %219 = OpConstantComposite %218 %218 %218 %218 
                                         f32 %227 = OpConstant 3.67402E-40 
                                       f32_4 %228 = OpConstantComposite %227 %227 %227 %227 
                                         i32 %235 = OpConstant 4 
                               Output f32_3* %275 = OpVariable Output 
                                             %278 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                                      OpStore %157 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                                       f32_4 %161 = OpFNegate %160 
                              Uniform f32_4* %162 = OpAccessChain %23 %26 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpFAdd %161 %163 
                                                      OpStore %60 %164 
                                       f32_4 %166 = OpLoad %47 
                                       f32_4 %167 = OpVectorShuffle %166 %166 1 1 1 1 
                                       f32_4 %168 = OpLoad %60 
                                       f32_4 %169 = OpFMul %167 %168 
                                                      OpStore %165 %169 
                                       f32_4 %170 = OpLoad %60 
                                       f32_4 %171 = OpLoad %60 
                                       f32_4 %172 = OpFMul %170 %171 
                                                      OpStore %60 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_4 %175 = OpVectorShuffle %174 %174 0 0 0 0 
                                       f32_4 %176 = OpFNegate %175 
                              Uniform f32_4* %177 = OpAccessChain %23 %31 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFAdd %176 %178 
                                                      OpStore %173 %179 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpVectorShuffle %180 %180 2 2 2 2 
                                       f32_4 %182 = OpFNegate %181 
                              Uniform f32_4* %183 = OpAccessChain %23 %39 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpFAdd %182 %184 
                                                      OpStore %9 %185 
                                       f32_4 %186 = OpLoad %173 
                                       f32_4 %187 = OpLoad %47 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %165 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %165 %191 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpLoad %47 
                                       f32_4 %194 = OpVectorShuffle %193 %193 2 2 2 2 
                                       f32_4 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %165 
                                       f32_4 %197 = OpFAdd %195 %196 
                                                      OpStore %47 %197 
                                       f32_4 %198 = OpLoad %173 
                                       f32_4 %199 = OpLoad %173 
                                       f32_4 %200 = OpFMul %198 %199 
                                       f32_4 %201 = OpLoad %60 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %60 %202 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpFMul %203 %204 
                                       f32_4 %206 = OpLoad %60 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %211 = OpExtInst %1 40 %208 %210 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 32 %212 
                                                      OpStore %60 %213 
                                       f32_4 %214 = OpLoad %9 
                              Uniform f32_4* %215 = OpAccessChain %23 %49 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpFMul %214 %216 
                                       f32_4 %220 = OpFAdd %217 %219 
                                                      OpStore %9 %220 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpFDiv %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %47 
                                       f32_4 %224 = OpLoad %60 
                                       f32_4 %225 = OpFMul %223 %224 
                                                      OpStore %47 %225 
                                       f32_4 %226 = OpLoad %47 
                                       f32_4 %229 = OpExtInst %1 40 %226 %228 
                                                      OpStore %47 %229 
                                       f32_4 %230 = OpLoad %9 
                                       f32_4 %231 = OpLoad %47 
                                       f32_4 %232 = OpFMul %230 %231 
                                                      OpStore %9 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_3 %234 = OpVectorShuffle %233 %233 1 1 1 
                              Uniform f32_4* %236 = OpAccessChain %23 %235 %26 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFMul %234 %238 
                                       f32_4 %240 = OpLoad %47 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %47 %241 
                              Uniform f32_4* %242 = OpAccessChain %23 %235 %31 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_4 %245 = OpLoad %9 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_4 %248 = OpLoad %47 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFAdd %247 %249 
                                       f32_4 %251 = OpLoad %47 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %47 %252 
                              Uniform f32_4* %253 = OpAccessChain %23 %235 %39 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_4 %256 = OpLoad %9 
                                       f32_3 %257 = OpVectorShuffle %256 %256 2 2 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                       f32_4 %259 = OpLoad %47 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %9 %263 
                              Uniform f32_4* %264 = OpAccessChain %23 %235 %49 
                                       f32_4 %265 = OpLoad %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 3 3 3 
                                       f32_3 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %9 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                                      OpStore %275 %277 
                                 Output f32* %279 = OpAccessChain %85 %31 %81 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFNegate %280 
                                 Output f32* %282 = OpAccessChain %85 %31 %81 
                                                      OpStore %282 %281 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %231 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %68 SpecId 68 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeStruct %7 %7 %27 %28 %28 %7 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %39 = OpConstant 0 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                                          i32 %52 = OpConstant -1 
                                          f32 %60 = OpConstant 3.67402E-40 
                                         bool %62 = OpConstantFalse 
                                         bool %68 = OpSpecConstantFalse 
                                          u32 %71 = OpConstant 1 
                                              %75 = OpTypePointer Private %28 
                               Private f32_3* %76 = OpVariable Private 
                                              %77 = OpTypePointer Input %28 
                                 Input f32_3* %78 = OpVariable Input 
                                          i32 %81 = OpConstant 2 
                                              %82 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Function %28 
                                         i32 %120 = OpConstant 4 
                                             %121 = OpTypePointer Uniform %28 
                              Private f32_4* %126 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         u32 %140 = OpConstant 2 
                                         f32 %143 = OpConstant 3.67402E-40 
                                             %153 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %154 = OpTypeSampledImage %153 
                                             %155 = OpTypePointer UniformConstant %154 
 UniformConstant read_only Texture3DSampled* %156 = OpVariable UniformConstant 
                              Private f32_3* %167 = OpVariable Private 
                                Input f32_3* %179 = OpVariable Input 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %198 = OpConstant 3.67402E-40 
                                       f32_3 %199 = OpConstantComposite %196 %197 %198 
                                         i32 %200 = OpConstant 6 
                                             %230 = OpTypePointer Output %7 
                               Output f32_4* %231 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %35 = OpAccessChain %31 %33 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %38 = OpFAdd %25 %37 
                                 Private f32* %40 = OpAccessChain %20 %39 
                                                      OpStore %40 %38 
                                 Private f32* %44 = OpAccessChain %20 %39 
                                          f32 %45 = OpLoad %44 
                                         bool %47 = OpFOrdLessThan %45 %46 
                                                      OpStore %43 %47 
                                         bool %48 = OpLoad %43 
                                          i32 %51 = OpSelect %48 %50 %49 
                                          i32 %53 = OpIMul %51 %52 
                                         bool %54 = OpINotEqual %53 %49 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %54 %55 %56 
                                              %55 = OpLabel 
                                                      OpKill
                                              %56 = OpLabel 
                                 Uniform f32* %58 = OpAccessChain %31 %50 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdEqual %59 %60 
                                                      OpStore %43 %61 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpBranch %67 
                                              %67 = OpLabel 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %162 
                                              %69 = OpLabel 
                                 Uniform f32* %72 = OpAccessChain %31 %50 %71 
                                          f32 %73 = OpLoad %72 
                                         bool %74 = OpFOrdEqual %73 %60 
                                                      OpStore %43 %74 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %31 %81 %50 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %80 %85 
                                                      OpStore %76 %86 
                               Uniform f32_4* %87 = OpAccessChain %31 %81 %49 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %76 
                                        f32_3 %94 = OpFAdd %92 %93 
                                                      OpStore %76 %94 
                               Uniform f32_4* %95 = OpAccessChain %31 %81 %81 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %78 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %76 %102 
                                       f32_3 %103 = OpLoad %76 
                              Uniform f32_4* %105 = OpAccessChain %31 %81 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %76 %108 
                                        bool %112 = OpLoad %43 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %116 
                                             %113 = OpLabel 
                                       f32_3 %115 = OpLoad %76 
                                                      OpStore %111 %115 
                                                      OpBranch %114 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %78 
                                                      OpStore %111 %117 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %118 = OpLoad %111 
                                                      OpStore %109 %118 
                                       f32_3 %119 = OpLoad %109 
                              Uniform f32_3* %122 = OpAccessChain %31 %120 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %119 %124 
                                                      OpStore %109 %125 
                                       f32_3 %127 = OpLoad %109 
                              Uniform f32_3* %128 = OpAccessChain %31 %104 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %126 
                                       f32_4 %132 = OpVectorShuffle %131 %130 0 4 5 6 
                                                      OpStore %126 %132 
                                Private f32* %133 = OpAccessChain %126 %71 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %109 %39 
                                                      OpStore %139 %138 
                                Uniform f32* %141 = OpAccessChain %31 %50 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %144 = OpFMul %142 %143 
                                         f32 %145 = OpFAdd %144 %137 
                                Private f32* %146 = OpAccessChain %76 %39 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %76 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %109 %39 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 40 %148 %150 
                                Private f32* %152 = OpAccessChain %126 %39 
                                                      OpStore %152 %151 
                  read_only Texture3DSampled %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %126 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 2 3 
                                       f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                                      OpStore %126 %160 
                                       f32_4 %161 = OpLoad %126 
                                                      OpStore %20 %161 
                                                      OpBranch %70 
                                             %162 = OpLabel 
                                Private f32* %163 = OpAccessChain %20 %39 
                                                      OpStore %163 %60 
                                Private f32* %164 = OpAccessChain %20 %71 
                                                      OpStore %164 %60 
                                Private f32* %165 = OpAccessChain %20 %140 
                                                      OpStore %165 %60 
                                Private f32* %166 = OpAccessChain %20 %22 
                                                      OpStore %166 %60 
                                                      OpBranch %70 
                                              %70 = OpLabel 
                                       f32_4 %168 = OpLoad %20 
                              Uniform f32_4* %169 = OpAccessChain %31 %49 
                                       f32_4 %170 = OpLoad %169 
                                         f32 %171 = OpDot %168 %170 
                                Private f32* %172 = OpAccessChain %167 %39 
                                                      OpStore %172 %171 
                                Private f32* %173 = OpAccessChain %167 %39 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 43 %174 %46 %60 
                                Private f32* %176 = OpAccessChain %167 %39 
                                                      OpStore %176 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %20 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %20 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %31 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %167 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %167 %195 
                              Uniform f32_4* %201 = OpAccessChain %31 %200 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                         f32 %204 = OpDot %199 %203 
                                Private f32* %205 = OpAccessChain %109 %39 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %109 %39 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %137 
                                         f32 %209 = OpFAdd %208 %135 
                                Private f32* %210 = OpAccessChain %109 %39 
                                                      OpStore %210 %209 
                                       f32_3 %211 = OpLoad %109 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                              Uniform f32_4* %213 = OpAccessChain %31 %200 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_3 %217 = OpLoad %167 
                                       f32_3 %218 = OpFNegate %217 
                                       f32_3 %219 = OpFAdd %216 %218 
                                                      OpStore %109 %219 
                              Uniform f32_4* %220 = OpAccessChain %31 %200 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 3 3 3 
                                       f32_3 %223 = OpLoad %109 
                                       f32_3 %224 = OpFMul %222 %223 
                                       f32_3 %225 = OpLoad %167 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %9 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %9 %228 
                                Private f32* %229 = OpAccessChain %20 %22 
                                                      OpStore %229 %46 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %20 
                                       f32_4 %234 = OpFAdd %232 %233 
                                                      OpStore %231 %234 
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat5.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
; Bound: 386
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %377 
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
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %377 Location 377 
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
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 14 
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
                                         i32 %101 = OpConstant 15 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 13 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                                             %159 = OpTypePointer Private %110 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_4* %177 = OpVariable Private 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %184 = OpConstant 8 
                                         i32 %190 = OpConstant 9 
                                         i32 %196 = OpConstant 10 
                                         i32 %202 = OpConstant 11 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         u32 %212 = OpConstant 3 
                                         i32 %214 = OpConstant 5 
                                         i32 %220 = OpConstant 6 
                                         i32 %226 = OpConstant 7 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                              Private f32_3* %239 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                                       f32_3 %244 = OpConstantComposite %243 %243 %243 
                                         f32 %249 = OpConstant 3.67402E-40 
                                       f32_3 %250 = OpConstantComposite %249 %249 %249 
                                         f32 %252 = OpConstant 3.67402E-40 
                                       f32_3 %253 = OpConstantComposite %252 %252 %252 
                              Private f32_4* %263 = OpVariable Private 
                              Private f32_4* %271 = OpVariable Private 
                                         f32 %307 = OpConstant 3.67402E-40 
                                       f32_4 %308 = OpConstantComposite %307 %307 %307 %307 
                                       f32_4 %316 = OpConstantComposite %211 %211 %211 %211 
                                       f32_4 %324 = OpConstantComposite %236 %236 %236 %236 
                                         i32 %331 = OpConstant 4 
                               Output f32_3* %377 = OpVariable Output 
                                             %380 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                                      OpStore %157 %158 
                                Private f32* %161 = OpAccessChain %47 %81 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %47 %81 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %162 %164 
                                Private f32* %166 = OpAccessChain %160 %119 
                                                      OpStore %166 %165 
                                Private f32* %167 = OpAccessChain %47 %119 
                                         f32 %168 = OpLoad %167 
                                Private f32* %169 = OpAccessChain %47 %119 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFMul %168 %170 
                                Private f32* %172 = OpAccessChain %160 %119 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpFAdd %171 %174 
                                Private f32* %176 = OpAccessChain %160 %119 
                                                      OpStore %176 %175 
                                       f32_4 %178 = OpLoad %47 
                                       f32_4 %179 = OpVectorShuffle %178 %178 1 2 2 0 
                                       f32_4 %180 = OpLoad %47 
                                       f32_4 %181 = OpVectorShuffle %180 %180 0 1 2 2 
                                       f32_4 %182 = OpFMul %179 %181 
                                                      OpStore %177 %182 
                              Uniform f32_4* %185 = OpAccessChain %23 %184 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %177 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %183 %119 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %23 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %177 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %183 %81 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %23 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %177 
                                         f32 %200 = OpDot %198 %199 
                                Private f32* %201 = OpAccessChain %183 %133 
                                                      OpStore %201 %200 
                              Uniform f32_4* %203 = OpAccessChain %23 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %160 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_3 %209 = OpLoad %183 
                                       f32_3 %210 = OpFAdd %208 %209 
                                                      OpStore %160 %210 
                                Private f32* %213 = OpAccessChain %47 %212 
                                                      OpStore %213 %211 
                              Uniform f32_4* %215 = OpAccessChain %23 %214 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %47 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %183 %119 
                                                      OpStore %219 %218 
                              Uniform f32_4* %221 = OpAccessChain %23 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %47 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %183 %81 
                                                      OpStore %225 %224 
                              Uniform f32_4* %227 = OpAccessChain %23 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %47 
                                         f32 %230 = OpDot %228 %229 
                                Private f32* %231 = OpAccessChain %183 %133 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %160 
                                       f32_3 %233 = OpLoad %183 
                                       f32_3 %234 = OpFAdd %232 %233 
                                                      OpStore %160 %234 
                                       f32_3 %235 = OpLoad %160 
                                       f32_3 %238 = OpExtInst %1 40 %235 %237 
                                                      OpStore %160 %238 
                                       f32_3 %240 = OpLoad %160 
                                       f32_3 %241 = OpExtInst %1 30 %240 
                                                      OpStore %239 %241 
                                       f32_3 %242 = OpLoad %239 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %239 %245 
                                       f32_3 %246 = OpLoad %239 
                                       f32_3 %247 = OpExtInst %1 29 %246 
                                                      OpStore %239 %247 
                                       f32_3 %248 = OpLoad %239 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %254 = OpFAdd %251 %253 
                                                      OpStore %239 %254 
                                       f32_3 %255 = OpLoad %239 
                                       f32_3 %256 = OpExtInst %1 40 %255 %237 
                                                      OpStore %239 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpVectorShuffle %257 %257 1 1 1 1 
                                       f32_4 %259 = OpFNegate %258 
                              Uniform f32_4* %260 = OpAccessChain %23 %26 
                                       f32_4 %261 = OpLoad %260 
                                       f32_4 %262 = OpFAdd %259 %261 
                                                      OpStore %60 %262 
                                       f32_4 %264 = OpLoad %47 
                                       f32_4 %265 = OpVectorShuffle %264 %264 1 1 1 1 
                                       f32_4 %266 = OpLoad %60 
                                       f32_4 %267 = OpFMul %265 %266 
                                                      OpStore %263 %267 
                                       f32_4 %268 = OpLoad %60 
                                       f32_4 %269 = OpLoad %60 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %60 %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_4 %273 = OpVectorShuffle %272 %272 0 0 0 0 
                                       f32_4 %274 = OpFNegate %273 
                              Uniform f32_4* %275 = OpAccessChain %23 %31 
                                       f32_4 %276 = OpLoad %275 
                                       f32_4 %277 = OpFAdd %274 %276 
                                                      OpStore %271 %277 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %278 2 2 2 2 
                                       f32_4 %280 = OpFNegate %279 
                              Uniform f32_4* %281 = OpAccessChain %23 %39 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFAdd %280 %282 
                                                      OpStore %9 %283 
                                       f32_4 %284 = OpLoad %271 
                                       f32_4 %285 = OpLoad %47 
                                       f32_4 %286 = OpVectorShuffle %285 %285 0 0 0 0 
                                       f32_4 %287 = OpFMul %284 %286 
                                       f32_4 %288 = OpLoad %263 
                                       f32_4 %289 = OpFAdd %287 %288 
                                                      OpStore %263 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpLoad %47 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %263 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %47 %295 
                                       f32_4 %296 = OpLoad %271 
                                       f32_4 %297 = OpLoad %271 
                                       f32_4 %298 = OpFMul %296 %297 
                                       f32_4 %299 = OpLoad %60 
                                       f32_4 %300 = OpFAdd %298 %299 
                                                      OpStore %60 %300 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpFMul %301 %302 
                                       f32_4 %304 = OpLoad %60 
                                       f32_4 %305 = OpFAdd %303 %304 
                                                      OpStore %9 %305 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %309 = OpExtInst %1 40 %306 %308 
                                                      OpStore %9 %309 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpExtInst %1 32 %310 
                                                      OpStore %60 %311 
                                       f32_4 %312 = OpLoad %9 
                              Uniform f32_4* %313 = OpAccessChain %23 %49 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFMul %312 %314 
                                       f32_4 %317 = OpFAdd %315 %316 
                                                      OpStore %9 %317 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpFDiv %316 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %47 
                                       f32_4 %321 = OpLoad %60 
                                       f32_4 %322 = OpFMul %320 %321 
                                                      OpStore %47 %322 
                                       f32_4 %323 = OpLoad %47 
                                       f32_4 %325 = OpExtInst %1 40 %323 %324 
                                                      OpStore %47 %325 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpLoad %47 
                                       f32_4 %328 = OpFMul %326 %327 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 1 1 1 
                              Uniform f32_4* %332 = OpAccessChain %23 %331 %26 
                                       f32_4 %333 = OpLoad %332 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFMul %330 %334 
                                       f32_4 %336 = OpLoad %47 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %47 %337 
                              Uniform f32_4* %338 = OpAccessChain %23 %331 %31 
                                       f32_4 %339 = OpLoad %338 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                       f32_4 %341 = OpLoad %9 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpFMul %340 %342 
                                       f32_4 %344 = OpLoad %47 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                       f32_3 %346 = OpFAdd %343 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_4 %348 = OpVectorShuffle %347 %346 4 5 6 3 
                                                      OpStore %47 %348 
                              Uniform f32_4* %349 = OpAccessChain %23 %331 %39 
                                       f32_4 %350 = OpLoad %349 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_4 %352 = OpLoad %9 
                                       f32_3 %353 = OpVectorShuffle %352 %352 2 2 2 
                                       f32_3 %354 = OpFMul %351 %353 
                                       f32_4 %355 = OpLoad %47 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                                       f32_3 %357 = OpFAdd %354 %356 
                                       f32_4 %358 = OpLoad %9 
                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
                                                      OpStore %9 %359 
                              Uniform f32_4* %360 = OpAccessChain %23 %331 %49 
                                       f32_4 %361 = OpLoad %360 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_4 %363 = OpLoad %9 
                                       f32_3 %364 = OpVectorShuffle %363 %363 3 3 3 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFAdd %365 %367 
                                       f32_4 %369 = OpLoad %9 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %9 %370 
                                       f32_4 %371 = OpLoad %9 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                       f32_3 %373 = OpLoad %239 
                                       f32_3 %374 = OpFAdd %372 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                                      OpStore %377 %379 
                                 Output f32* %381 = OpAccessChain %85 %31 %81 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpFNegate %382 
                                 Output f32* %384 = OpAccessChain %85 %31 %81 
                                                      OpStore %384 %383 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %231 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %68 SpecId 68 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeStruct %7 %7 %27 %28 %28 %7 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %39 = OpConstant 0 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                                          i32 %52 = OpConstant -1 
                                          f32 %60 = OpConstant 3.67402E-40 
                                         bool %62 = OpConstantFalse 
                                         bool %68 = OpSpecConstantFalse 
                                          u32 %71 = OpConstant 1 
                                              %75 = OpTypePointer Private %28 
                               Private f32_3* %76 = OpVariable Private 
                                              %77 = OpTypePointer Input %28 
                                 Input f32_3* %78 = OpVariable Input 
                                          i32 %81 = OpConstant 2 
                                              %82 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Function %28 
                                         i32 %120 = OpConstant 4 
                                             %121 = OpTypePointer Uniform %28 
                              Private f32_4* %126 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         u32 %140 = OpConstant 2 
                                         f32 %143 = OpConstant 3.67402E-40 
                                             %153 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %154 = OpTypeSampledImage %153 
                                             %155 = OpTypePointer UniformConstant %154 
 UniformConstant read_only Texture3DSampled* %156 = OpVariable UniformConstant 
                              Private f32_3* %167 = OpVariable Private 
                                Input f32_3* %179 = OpVariable Input 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %198 = OpConstant 3.67402E-40 
                                       f32_3 %199 = OpConstantComposite %196 %197 %198 
                                         i32 %200 = OpConstant 6 
                                             %230 = OpTypePointer Output %7 
                               Output f32_4* %231 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %35 = OpAccessChain %31 %33 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %38 = OpFAdd %25 %37 
                                 Private f32* %40 = OpAccessChain %20 %39 
                                                      OpStore %40 %38 
                                 Private f32* %44 = OpAccessChain %20 %39 
                                          f32 %45 = OpLoad %44 
                                         bool %47 = OpFOrdLessThan %45 %46 
                                                      OpStore %43 %47 
                                         bool %48 = OpLoad %43 
                                          i32 %51 = OpSelect %48 %50 %49 
                                          i32 %53 = OpIMul %51 %52 
                                         bool %54 = OpINotEqual %53 %49 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %54 %55 %56 
                                              %55 = OpLabel 
                                                      OpKill
                                              %56 = OpLabel 
                                 Uniform f32* %58 = OpAccessChain %31 %50 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdEqual %59 %60 
                                                      OpStore %43 %61 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpBranch %67 
                                              %67 = OpLabel 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %162 
                                              %69 = OpLabel 
                                 Uniform f32* %72 = OpAccessChain %31 %50 %71 
                                          f32 %73 = OpLoad %72 
                                         bool %74 = OpFOrdEqual %73 %60 
                                                      OpStore %43 %74 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %31 %81 %50 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %80 %85 
                                                      OpStore %76 %86 
                               Uniform f32_4* %87 = OpAccessChain %31 %81 %49 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %76 
                                        f32_3 %94 = OpFAdd %92 %93 
                                                      OpStore %76 %94 
                               Uniform f32_4* %95 = OpAccessChain %31 %81 %81 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %78 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %76 %102 
                                       f32_3 %103 = OpLoad %76 
                              Uniform f32_4* %105 = OpAccessChain %31 %81 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %76 %108 
                                        bool %112 = OpLoad %43 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %116 
                                             %113 = OpLabel 
                                       f32_3 %115 = OpLoad %76 
                                                      OpStore %111 %115 
                                                      OpBranch %114 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %78 
                                                      OpStore %111 %117 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %118 = OpLoad %111 
                                                      OpStore %109 %118 
                                       f32_3 %119 = OpLoad %109 
                              Uniform f32_3* %122 = OpAccessChain %31 %120 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %119 %124 
                                                      OpStore %109 %125 
                                       f32_3 %127 = OpLoad %109 
                              Uniform f32_3* %128 = OpAccessChain %31 %104 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %126 
                                       f32_4 %132 = OpVectorShuffle %131 %130 0 4 5 6 
                                                      OpStore %126 %132 
                                Private f32* %133 = OpAccessChain %126 %71 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %109 %39 
                                                      OpStore %139 %138 
                                Uniform f32* %141 = OpAccessChain %31 %50 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %144 = OpFMul %142 %143 
                                         f32 %145 = OpFAdd %144 %137 
                                Private f32* %146 = OpAccessChain %76 %39 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %76 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %109 %39 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 40 %148 %150 
                                Private f32* %152 = OpAccessChain %126 %39 
                                                      OpStore %152 %151 
                  read_only Texture3DSampled %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %126 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 2 3 
                                       f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                                      OpStore %126 %160 
                                       f32_4 %161 = OpLoad %126 
                                                      OpStore %20 %161 
                                                      OpBranch %70 
                                             %162 = OpLabel 
                                Private f32* %163 = OpAccessChain %20 %39 
                                                      OpStore %163 %60 
                                Private f32* %164 = OpAccessChain %20 %71 
                                                      OpStore %164 %60 
                                Private f32* %165 = OpAccessChain %20 %140 
                                                      OpStore %165 %60 
                                Private f32* %166 = OpAccessChain %20 %22 
                                                      OpStore %166 %60 
                                                      OpBranch %70 
                                              %70 = OpLabel 
                                       f32_4 %168 = OpLoad %20 
                              Uniform f32_4* %169 = OpAccessChain %31 %49 
                                       f32_4 %170 = OpLoad %169 
                                         f32 %171 = OpDot %168 %170 
                                Private f32* %172 = OpAccessChain %167 %39 
                                                      OpStore %172 %171 
                                Private f32* %173 = OpAccessChain %167 %39 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 43 %174 %46 %60 
                                Private f32* %176 = OpAccessChain %167 %39 
                                                      OpStore %176 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %20 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %20 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %31 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %167 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %167 %195 
                              Uniform f32_4* %201 = OpAccessChain %31 %200 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                         f32 %204 = OpDot %199 %203 
                                Private f32* %205 = OpAccessChain %109 %39 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %109 %39 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %137 
                                         f32 %209 = OpFAdd %208 %135 
                                Private f32* %210 = OpAccessChain %109 %39 
                                                      OpStore %210 %209 
                                       f32_3 %211 = OpLoad %109 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                              Uniform f32_4* %213 = OpAccessChain %31 %200 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFMul %212 %215 
                                       f32_3 %217 = OpLoad %167 
                                       f32_3 %218 = OpFNegate %217 
                                       f32_3 %219 = OpFAdd %216 %218 
                                                      OpStore %109 %219 
                              Uniform f32_4* %220 = OpAccessChain %31 %200 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 3 3 3 
                                       f32_3 %223 = OpLoad %109 
                                       f32_3 %224 = OpFMul %222 %223 
                                       f32_3 %225 = OpLoad %167 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %9 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %9 %228 
                                Private f32* %229 = OpAccessChain %20 %22 
                                                      OpStore %229 %46 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %20 
                                       f32_4 %234 = OpFAdd %232 %233 
                                                      OpStore %231 %234 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat20;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb5){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat9);
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 319
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %98 %99 %113 %152 %155 %158 %278 %300 %312 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %278 Location 278 
                                                      OpDecorate %300 Location 300 
                                                      OpDecorate %312 Location 312 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 6 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 8 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 9 
                                             %111 = OpTypeVector %6 3 
                                             %112 = OpTypePointer Input %111 
                                Input f32_3* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 7 
                                         u32 %120 = OpConstant 0 
                                             %121 = OpTypePointer Private %6 
                                         u32 %134 = OpConstant 2 
                                Private f32* %136 = OpVariable Private 
                                             %151 = OpTypePointer Output %111 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_4* %158 = OpVariable Output 
                              Private f32_4* %160 = OpVariable Private 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         f32 %211 = OpConstant 3.67402E-40 
                                       f32_4 %212 = OpConstantComposite %211 %211 %211 %211 
                                         i32 %217 = OpConstant 4 
                                         f32 %221 = OpConstant 3.67402E-40 
                                       f32_4 %222 = OpConstantComposite %221 %221 %221 %221 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_4 %231 = OpConstantComposite %230 %230 %230 %230 
                                         i32 %238 = OpConstant 5 
                               Output f32_3* %278 = OpVariable Output 
                                             %283 = OpTypePointer Uniform %6 
                                         f32 %290 = OpConstant 3.67402E-40 
                                         u32 %292 = OpConstant 3 
                                       f32_2 %296 = OpConstantComposite %290 %290 
                               Output f32_4* %300 = OpVariable Output 
                               Output f32_4* %312 = OpVariable Output 
                                             %313 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %81 = OpAccessChain %23 %63 %49 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %47 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %60 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %47 %87 
                                        f32_4 %93 = OpLoad %47 
                                Output f32_4* %95 = OpAccessChain %92 %31 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %23 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %23 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %23 %115 %31 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %114 %118 
                                Private f32* %122 = OpAccessChain %60 %120 
                                                      OpStore %122 %119 
                                       f32_3 %123 = OpLoad %113 
                              Uniform f32_4* %124 = OpAccessChain %23 %115 %26 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %123 %126 
                                Private f32* %128 = OpAccessChain %60 %88 
                                                      OpStore %128 %127 
                                       f32_3 %129 = OpLoad %113 
                              Uniform f32_4* %130 = OpAccessChain %23 %115 %39 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                         f32 %133 = OpDot %129 %132 
                                Private f32* %135 = OpAccessChain %60 %134 
                                                      OpStore %135 %133 
                                       f32_4 %137 = OpLoad %60 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %60 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                         f32 %141 = OpDot %138 %140 
                                                      OpStore %136 %141 
                                         f32 %142 = OpLoad %136 
                                         f32 %143 = OpExtInst %1 32 %142 
                                                      OpStore %136 %143 
                                         f32 %144 = OpLoad %136 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_4 %146 = OpLoad %60 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %60 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %60 %150 
                                       f32_4 %153 = OpLoad %60 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %155 %157 
                                       f32_4 %159 = OpLoad %9 
                                                      OpStore %158 %159 
                                       f32_4 %161 = OpLoad %9 
                                       f32_4 %162 = OpVectorShuffle %161 %161 1 1 1 1 
                                       f32_4 %163 = OpFNegate %162 
                              Uniform f32_4* %164 = OpAccessChain %23 %39 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFAdd %163 %165 
                                                      OpStore %160 %166 
                                       f32_4 %168 = OpLoad %60 
                                       f32_4 %169 = OpVectorShuffle %168 %168 1 1 1 1 
                                       f32_4 %170 = OpLoad %160 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %167 %171 
                                       f32_4 %172 = OpLoad %160 
                                       f32_4 %173 = OpLoad %160 
                                       f32_4 %174 = OpFMul %172 %173 
                                                      OpStore %160 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 0 0 0 
                                       f32_4 %178 = OpFNegate %177 
                              Uniform f32_4* %179 = OpAccessChain %23 %26 
                                       f32_4 %180 = OpLoad %179 
                                       f32_4 %181 = OpFAdd %178 %180 
                                                      OpStore %175 %181 
                                       f32_4 %182 = OpLoad %9 
                                       f32_4 %183 = OpVectorShuffle %182 %182 2 2 2 2 
                                       f32_4 %184 = OpFNegate %183 
                              Uniform f32_4* %185 = OpAccessChain %23 %49 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpFAdd %184 %186 
                                                      OpStore %9 %187 
                                       f32_4 %188 = OpLoad %175 
                                       f32_4 %189 = OpLoad %60 
                                       f32_4 %190 = OpVectorShuffle %189 %189 0 0 0 0 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %167 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %167 %193 
                                       f32_4 %194 = OpLoad %9 
                                       f32_4 %195 = OpLoad %60 
                                       f32_4 %196 = OpVectorShuffle %195 %195 2 2 2 2 
                                       f32_4 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %167 
                                       f32_4 %199 = OpFAdd %197 %198 
                                                      OpStore %60 %199 
                                       f32_4 %200 = OpLoad %175 
                                       f32_4 %201 = OpLoad %175 
                                       f32_4 %202 = OpFMul %200 %201 
                                       f32_4 %203 = OpLoad %160 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %160 %204 
                                       f32_4 %205 = OpLoad %9 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpFMul %205 %206 
                                       f32_4 %208 = OpLoad %160 
                                       f32_4 %209 = OpFAdd %207 %208 
                                                      OpStore %9 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 40 %210 %212 
                                                      OpStore %9 %213 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpExtInst %1 32 %214 
                                                      OpStore %160 %215 
                                       f32_4 %216 = OpLoad %9 
                              Uniform f32_4* %218 = OpAccessChain %23 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpFMul %216 %219 
                                       f32_4 %223 = OpFAdd %220 %222 
                                                      OpStore %9 %223 
                                       f32_4 %224 = OpLoad %9 
                                       f32_4 %225 = OpFDiv %222 %224 
                                                      OpStore %9 %225 
                                       f32_4 %226 = OpLoad %60 
                                       f32_4 %227 = OpLoad %160 
                                       f32_4 %228 = OpFMul %226 %227 
                                                      OpStore %60 %228 
                                       f32_4 %229 = OpLoad %60 
                                       f32_4 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %60 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_4 %234 = OpLoad %60 
                                       f32_4 %235 = OpFMul %233 %234 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_3 %237 = OpVectorShuffle %236 %236 1 1 1 
                              Uniform f32_4* %239 = OpAccessChain %23 %238 %26 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpFMul %237 %241 
                                       f32_4 %243 = OpLoad %60 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                                      OpStore %60 %244 
                              Uniform f32_4* %245 = OpAccessChain %23 %238 %31 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_4 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 0 0 
                                       f32_3 %250 = OpFMul %247 %249 
                                       f32_4 %251 = OpLoad %60 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFAdd %250 %252 
                                       f32_4 %254 = OpLoad %60 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %60 %255 
                              Uniform f32_4* %256 = OpAccessChain %23 %238 %39 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                       f32_4 %259 = OpLoad %9 
                                       f32_3 %260 = OpVectorShuffle %259 %259 2 2 2 
                                       f32_3 %261 = OpFMul %258 %260 
                                       f32_4 %262 = OpLoad %60 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %9 %266 
                              Uniform f32_4* %267 = OpAccessChain %23 %238 %49 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpFMul %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %9 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                                      OpStore %278 %280 
                                Private f32* %281 = OpAccessChain %47 %88 
                                         f32 %282 = OpLoad %281 
                                Uniform f32* %284 = OpAccessChain %23 %31 %120 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFMul %282 %285 
                                Private f32* %287 = OpAccessChain %9 %120 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %9 %120 
                                         f32 %289 = OpLoad %288 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %293 = OpAccessChain %9 %292 
                                                      OpStore %293 %291 
                                       f32_4 %294 = OpLoad %47 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 3 
                                       f32_2 %297 = OpFMul %295 %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 1 5 3 
                                                      OpStore %9 %299 
                                       f32_4 %301 = OpLoad %47 
                                       f32_2 %302 = OpVectorShuffle %301 %301 2 3 
                                       f32_4 %303 = OpLoad %300 
                                       f32_4 %304 = OpVectorShuffle %303 %302 0 1 4 5 
                                                      OpStore %300 %304 
                                       f32_4 %305 = OpLoad %9 
                                       f32_2 %306 = OpVectorShuffle %305 %305 2 2 
                                       f32_4 %307 = OpLoad %9 
                                       f32_2 %308 = OpVectorShuffle %307 %307 0 3 
                                       f32_2 %309 = OpFAdd %306 %308 
                                       f32_4 %310 = OpLoad %300 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 2 3 
                                                      OpStore %300 %311 
                                                      OpStore %312 %231 
                                 Output f32* %314 = OpAccessChain %92 %31 %88 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpFNegate %315 
                                 Output f32* %317 = OpAccessChain %92 %31 %88 
                                                      OpStore %317 %316 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 346
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %341 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 RelaxedPrecision 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 RelaxedPrecision 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpMemberDecorate %30 9 RelaxedPrecision 
                                                      OpMemberDecorate %30 9 Offset 30 
                                                      OpMemberDecorate %30 10 Offset 30 
                                                      OpMemberDecorate %30 11 RelaxedPrecision 
                                                      OpMemberDecorate %30 11 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %145 SpecId 145 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %248 Location 248 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %341 Location 341 
                                                      OpDecorate %343 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                              %26 = OpTypeVector %6 3 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %26 %7 %7 %7 %28 %7 %29 %26 %26 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 11 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %26 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %26 
                                 Input f32_3* %62 = OpVariable Input 
                                              %65 = OpTypePointer Uniform %26 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %70 = OpConstant 4 
                                          u32 %71 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant 2 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                         f32 %131 = OpConstant 3.67402E-40 
                               Private bool* %134 = OpVariable Private 
                                         i32 %135 = OpConstant 5 
                                        bool %139 = OpConstantFalse 
                                        bool %145 = OpSpecConstantFalse 
                               Private bool* %148 = OpVariable Private 
                                         i32 %154 = OpConstant 6 
                                             %180 = OpTypePointer Function %26 
                                         i32 %190 = OpConstant 8 
                              Private f32_4* %195 = OpVariable Private 
                                         i32 %197 = OpConstant 7 
                                             %203 = OpTypePointer Private %15 
                              Private f32_2* %204 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_3* %237 = OpVariable Private 
                                             %247 = OpTypePointer Input %7 
                                Input f32_4* %248 = OpVariable Input 
                                Private f32* %254 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %255 = OpVariable UniformConstant 
                              Private f32_3* %260 = OpVariable Private 
                                             %276 = OpTypePointer Function %6 
                                Input f32_3* %290 = OpVariable Input 
                                         i32 %297 = OpConstant 9 
                                         f32 %306 = OpConstant 3.67402E-40 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                       f32_3 %309 = OpConstantComposite %306 %307 %308 
                                         i32 %310 = OpConstant 10 
                                             %340 = OpTypePointer Output %7 
                               Output f32_4* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %181 = OpVariable Function 
                               Function f32* %277 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpFNegate %63 
                               Uniform f32_3* %66 = OpAccessChain %32 %50 
                                        f32_3 %67 = OpLoad %66 
                                        f32_3 %68 = OpFAdd %64 %67 
                                                      OpStore %60 %68 
                                 Uniform f32* %72 = OpAccessChain %32 %70 %50 %71 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %69 %40 
                                                      OpStore %74 %73 
                                 Uniform f32* %75 = OpAccessChain %32 %70 %51 %71 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %78 = OpAccessChain %69 %77 
                                                      OpStore %78 %76 
                                 Uniform f32* %80 = OpAccessChain %32 %70 %79 %71 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %69 %71 
                                                      OpStore %82 %81 
                                        f32_3 %83 = OpLoad %60 
                                        f32_3 %84 = OpLoad %69 
                                          f32 %85 = OpDot %83 %84 
                                 Private f32* %86 = OpAccessChain %60 %40 
                                                      OpStore %86 %85 
                                        f32_3 %88 = OpLoad %62 
                               Uniform f32_4* %91 = OpAccessChain %32 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFNegate %93 
                                        f32_3 %95 = OpFAdd %88 %94 
                                                      OpStore %87 %95 
                                        f32_3 %96 = OpLoad %87 
                                        f32_3 %97 = OpLoad %87 
                                          f32 %98 = OpDot %96 %97 
                                 Private f32* %99 = OpAccessChain %87 %40 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %87 %40 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 31 %101 
                                Private f32* %103 = OpAccessChain %87 %40 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %60 %40 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                Private f32* %107 = OpAccessChain %87 %40 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %87 %40 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %32 %89 %22 
                                         f32 %112 = OpLoad %111 
                                Private f32* %113 = OpAccessChain %87 %40 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %112 %114 
                                Private f32* %116 = OpAccessChain %60 %40 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %60 %40 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %60 %40 
                                         f32 %121 = OpLoad %120 
                                Uniform f32* %122 = OpAccessChain %32 %79 %71 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Uniform f32* %125 = OpAccessChain %32 %79 %22 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %60 %40 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %60 %40 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpExtInst %1 43 %130 %47 %131 
                                Private f32* %133 = OpAccessChain %60 %40 
                                                      OpStore %133 %132 
                                Uniform f32* %136 = OpAccessChain %32 %135 %40 
                                         f32 %137 = OpLoad %136 
                                        bool %138 = OpFOrdEqual %137 %131 
                                                      OpStore %134 %138 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %141 
                                             %140 = OpLabel 
                                        bool %142 = OpLoad %134 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %144 
                                             %143 = OpLabel 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %232 
                                             %146 = OpLabel 
                                Uniform f32* %149 = OpAccessChain %32 %135 %77 
                                         f32 %150 = OpLoad %149 
                                        bool %151 = OpFOrdEqual %150 %131 
                                                      OpStore %148 %151 
                                       f32_3 %152 = OpLoad %62 
                                       f32_3 %153 = OpVectorShuffle %152 %152 1 1 1 
                              Uniform f32_4* %155 = OpAccessChain %32 %154 %51 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFMul %153 %157 
                                                      OpStore %69 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %154 %50 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %62 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %69 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %69 %166 
                              Uniform f32_4* %167 = OpAccessChain %32 %154 %79 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %62 
                                       f32_3 %171 = OpVectorShuffle %170 %170 2 2 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_3 %173 = OpLoad %69 
                                       f32_3 %174 = OpFAdd %172 %173 
                                                      OpStore %69 %174 
                                       f32_3 %175 = OpLoad %69 
                              Uniform f32_4* %176 = OpAccessChain %32 %154 %89 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                                      OpStore %69 %179 
                                        bool %182 = OpLoad %148 
                                                      OpSelectionMerge %184 None 
                                                      OpBranchConditional %182 %183 %186 
                                             %183 = OpLabel 
                                       f32_3 %185 = OpLoad %69 
                                                      OpStore %181 %185 
                                                      OpBranch %184 
                                             %186 = OpLabel 
                                       f32_3 %187 = OpLoad %62 
                                                      OpStore %181 %187 
                                                      OpBranch %184 
                                             %184 = OpLabel 
                                       f32_3 %188 = OpLoad %181 
                                                      OpStore %69 %188 
                                       f32_3 %189 = OpLoad %69 
                              Uniform f32_3* %191 = OpAccessChain %32 %190 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %189 %193 
                                                      OpStore %69 %194 
                                       f32_3 %196 = OpLoad %69 
                              Uniform f32_3* %198 = OpAccessChain %32 %197 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %196 %199 
                                       f32_4 %201 = OpLoad %195 
                                       f32_4 %202 = OpVectorShuffle %201 %200 0 4 5 6 
                                                      OpStore %195 %202 
                                Private f32* %205 = OpAccessChain %195 %77 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %204 %40 
                                                      OpStore %211 %210 
                                Uniform f32* %213 = OpAccessChain %32 %135 %71 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %212 %217 
                                         f32 %218 = OpLoad %212 
                                Private f32* %219 = OpAccessChain %204 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpExtInst %1 40 %218 %220 
                                Private f32* %222 = OpAccessChain %195 %40 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %195 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %195 %230 
                                       f32_4 %231 = OpLoad %195 
                                                      OpStore %20 %231 
                                                      OpBranch %147 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %20 %40 
                                                      OpStore %233 %131 
                                Private f32* %234 = OpAccessChain %20 %77 
                                                      OpStore %234 %131 
                                Private f32* %235 = OpAccessChain %20 %71 
                                                      OpStore %235 %131 
                                Private f32* %236 = OpAccessChain %20 %22 
                                                      OpStore %236 %131 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                       f32_4 %238 = OpLoad %20 
                              Uniform f32_4* %239 = OpAccessChain %32 %51 
                                       f32_4 %240 = OpLoad %239 
                                         f32 %241 = OpDot %238 %240 
                                Private f32* %242 = OpAccessChain %237 %40 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %237 %40 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpExtInst %1 43 %244 %47 %131 
                                Private f32* %246 = OpAccessChain %237 %40 
                                                      OpStore %246 %245 
                                       f32_4 %249 = OpLoad %248 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_4 %251 = OpLoad %248 
                                       f32_2 %252 = OpVectorShuffle %251 %251 3 3 
                                       f32_2 %253 = OpFDiv %250 %252 
                                                      OpStore %204 %253 
                  read_only Texture2DSampled %256 = OpLoad %255 
                                       f32_2 %257 = OpLoad %204 
                                       f32_4 %258 = OpImageSampleImplicitLod %256 %257 
                                         f32 %259 = OpCompositeExtract %258 0 
                                                      OpStore %254 %259 
                                Private f32* %261 = OpAccessChain %60 %40 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpLoad %254 
                                         f32 %264 = OpFAdd %262 %263 
                                Private f32* %265 = OpAccessChain %260 %40 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %260 %40 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpExtInst %1 43 %267 %47 %131 
                                Private f32* %269 = OpAccessChain %260 %40 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %260 %40 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %237 %40 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 37 %271 %273 
                                Private f32* %275 = OpAccessChain %237 %40 
                                                      OpStore %275 %274 
                                        bool %278 = OpLoad %134 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %278 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %237 %40 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %277 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                Private f32* %284 = OpAccessChain %260 %40 
                                         f32 %285 = OpLoad %284 
                                                      OpStore %277 %285 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %286 = OpLoad %277 
                                Private f32* %287 = OpAccessChain %237 %40 
                                                      OpStore %287 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %291 = OpLoad %290 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %20 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %20 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %32 %297 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %296 %300 
                                                      OpStore %260 %301 
                                       f32_3 %302 = OpLoad %237 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 0 0 
                                       f32_3 %304 = OpLoad %260 
                                       f32_3 %305 = OpFMul %303 %304 
                                                      OpStore %237 %305 
                              Uniform f32_4* %311 = OpAccessChain %32 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                         f32 %314 = OpDot %309 %313 
                                Private f32* %315 = OpAccessChain %60 %40 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %60 %40 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %209 
                                         f32 %319 = OpFAdd %318 %207 
                                Private f32* %320 = OpAccessChain %60 %40 
                                                      OpStore %320 %319 
                                       f32_3 %321 = OpLoad %60 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 0 0 
                              Uniform f32_4* %323 = OpAccessChain %32 %310 
                                       f32_4 %324 = OpLoad %323 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFMul %322 %325 
                                       f32_3 %327 = OpLoad %237 
                                       f32_3 %328 = OpFNegate %327 
                                       f32_3 %329 = OpFAdd %326 %328 
                                                      OpStore %60 %329 
                              Uniform f32_4* %330 = OpAccessChain %32 %310 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 3 3 3 
                                       f32_3 %333 = OpLoad %60 
                                       f32_3 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %237 
                                       f32_3 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                      OpStore %9 %338 
                                Private f32* %339 = OpAccessChain %20 %22 
                                                      OpStore %339 %47 
                                       f32_4 %342 = OpLoad %9 
                                       f32_4 %343 = OpLoad %20 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %341 %344 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat21;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat21 = u_xlat2.y * u_xlat2.y;
    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat4 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat5.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb5 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb5){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat13 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat9);
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat13 = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat13 = u_xlat13 * 0.75 + 0.25;
    u_xlat3.xyz = vec3(u_xlat13) * _OverrideColor.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 421
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %98 %99 %113 %152 %155 %158 %381 %402 %414 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
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
                                                      OpMemberDecorate %21 12 RelaxedPrecision 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpMemberDecorate %21 16 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %381 Location 381 
                                                      OpDecorate %402 Location 402 
                                                      OpDecorate %414 Location 414 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 13 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 15 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 16 
                                             %111 = OpTypeVector %6 3 
                                             %112 = OpTypePointer Input %111 
                                Input f32_3* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 14 
                                         u32 %120 = OpConstant 0 
                                             %121 = OpTypePointer Private %6 
                                         u32 %134 = OpConstant 2 
                                Private f32* %136 = OpVariable Private 
                                             %151 = OpTypePointer Output %111 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_4* %158 = OpVariable Output 
                                             %160 = OpTypePointer Private %111 
                              Private f32_3* %161 = OpVariable Private 
                              Private f32_4* %178 = OpVariable Private 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %185 = OpConstant 9 
                                         i32 %191 = OpConstant 10 
                                         i32 %197 = OpConstant 11 
                                         i32 %203 = OpConstant 12 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         u32 %213 = OpConstant 3 
                                         i32 %215 = OpConstant 6 
                                         i32 %221 = OpConstant 7 
                                         i32 %227 = OpConstant 8 
                                         f32 %238 = OpConstant 3.67402E-40 
                                       f32_3 %239 = OpConstantComposite %238 %238 %238 
                              Private f32_3* %241 = OpVariable Private 
                                         f32 %245 = OpConstant 3.67402E-40 
                                       f32_3 %246 = OpConstantComposite %245 %245 %245 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                              Private f32_4* %259 = OpVariable Private 
                              Private f32_4* %266 = OpVariable Private 
                              Private f32_4* %274 = OpVariable Private 
                                         f32 %310 = OpConstant 3.67402E-40 
                                       f32_4 %311 = OpConstantComposite %310 %310 %310 %310 
                                         i32 %316 = OpConstant 4 
                                       f32_4 %320 = OpConstantComposite %212 %212 %212 %212 
                                       f32_4 %328 = OpConstantComposite %238 %238 %238 %238 
                                         i32 %335 = OpConstant 5 
                               Output f32_3* %381 = OpVariable Output 
                                             %386 = OpTypePointer Uniform %6 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_2 %398 = OpConstantComposite %393 %393 
                               Output f32_4* %402 = OpVariable Output 
                               Output f32_4* %414 = OpVariable Output 
                                             %415 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %81 = OpAccessChain %23 %63 %49 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %47 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %60 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %47 %87 
                                        f32_4 %93 = OpLoad %47 
                                Output f32_4* %95 = OpAccessChain %92 %31 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %23 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %23 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %23 %115 %31 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %114 %118 
                                Private f32* %122 = OpAccessChain %60 %120 
                                                      OpStore %122 %119 
                                       f32_3 %123 = OpLoad %113 
                              Uniform f32_4* %124 = OpAccessChain %23 %115 %26 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %123 %126 
                                Private f32* %128 = OpAccessChain %60 %88 
                                                      OpStore %128 %127 
                                       f32_3 %129 = OpLoad %113 
                              Uniform f32_4* %130 = OpAccessChain %23 %115 %39 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                         f32 %133 = OpDot %129 %132 
                                Private f32* %135 = OpAccessChain %60 %134 
                                                      OpStore %135 %133 
                                       f32_4 %137 = OpLoad %60 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %60 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                         f32 %141 = OpDot %138 %140 
                                                      OpStore %136 %141 
                                         f32 %142 = OpLoad %136 
                                         f32 %143 = OpExtInst %1 32 %142 
                                                      OpStore %136 %143 
                                         f32 %144 = OpLoad %136 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_4 %146 = OpLoad %60 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %60 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %60 %150 
                                       f32_4 %153 = OpLoad %60 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %155 %157 
                                       f32_4 %159 = OpLoad %9 
                                                      OpStore %158 %159 
                                Private f32* %162 = OpAccessChain %60 %88 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %60 %88 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %163 %165 
                                Private f32* %167 = OpAccessChain %161 %120 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %60 %120 
                                         f32 %169 = OpLoad %168 
                                Private f32* %170 = OpAccessChain %60 %120 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %169 %171 
                                Private f32* %173 = OpAccessChain %161 %120 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                         f32 %176 = OpFAdd %172 %175 
                                Private f32* %177 = OpAccessChain %161 %120 
                                                      OpStore %177 %176 
                                       f32_4 %179 = OpLoad %60 
                                       f32_4 %180 = OpVectorShuffle %179 %179 1 2 2 0 
                                       f32_4 %181 = OpLoad %60 
                                       f32_4 %182 = OpVectorShuffle %181 %181 0 1 2 2 
                                       f32_4 %183 = OpFMul %180 %182 
                                                      OpStore %178 %183 
                              Uniform f32_4* %186 = OpAccessChain %23 %185 
                                       f32_4 %187 = OpLoad %186 
                                       f32_4 %188 = OpLoad %178 
                                         f32 %189 = OpDot %187 %188 
                                Private f32* %190 = OpAccessChain %184 %120 
                                                      OpStore %190 %189 
                              Uniform f32_4* %192 = OpAccessChain %23 %191 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %178 
                                         f32 %195 = OpDot %193 %194 
                                Private f32* %196 = OpAccessChain %184 %88 
                                                      OpStore %196 %195 
                              Uniform f32_4* %198 = OpAccessChain %23 %197 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %178 
                                         f32 %201 = OpDot %199 %200 
                                Private f32* %202 = OpAccessChain %184 %134 
                                                      OpStore %202 %201 
                              Uniform f32_4* %204 = OpAccessChain %23 %203 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
                                       f32_3 %207 = OpLoad %161 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 0 0 
                                       f32_3 %209 = OpFMul %206 %208 
                                       f32_3 %210 = OpLoad %184 
                                       f32_3 %211 = OpFAdd %209 %210 
                                                      OpStore %161 %211 
                                Private f32* %214 = OpAccessChain %60 %213 
                                                      OpStore %214 %212 
                              Uniform f32_4* %216 = OpAccessChain %23 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %60 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %178 %120 
                                                      OpStore %220 %219 
                              Uniform f32_4* %222 = OpAccessChain %23 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %60 
                                         f32 %225 = OpDot %223 %224 
                                Private f32* %226 = OpAccessChain %178 %88 
                                                      OpStore %226 %225 
                              Uniform f32_4* %228 = OpAccessChain %23 %227 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %60 
                                         f32 %231 = OpDot %229 %230 
                                Private f32* %232 = OpAccessChain %178 %134 
                                                      OpStore %232 %231 
                                       f32_3 %233 = OpLoad %161 
                                       f32_4 %234 = OpLoad %178 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFAdd %233 %235 
                                                      OpStore %161 %236 
                                       f32_3 %237 = OpLoad %161 
                                       f32_3 %240 = OpExtInst %1 40 %237 %239 
                                                      OpStore %161 %240 
                                       f32_3 %242 = OpLoad %161 
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
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                                       f32_4 %262 = OpFNegate %261 
                              Uniform f32_4* %263 = OpAccessChain %23 %39 
                                       f32_4 %264 = OpLoad %263 
                                       f32_4 %265 = OpFAdd %262 %264 
                                                      OpStore %259 %265 
                                       f32_4 %267 = OpLoad %60 
                                       f32_4 %268 = OpVectorShuffle %267 %267 1 1 1 1 
                                       f32_4 %269 = OpLoad %259 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %266 %270 
                                       f32_4 %271 = OpLoad %259 
                                       f32_4 %272 = OpLoad %259 
                                       f32_4 %273 = OpFMul %271 %272 
                                                      OpStore %259 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_4 %276 = OpVectorShuffle %275 %275 0 0 0 0 
                                       f32_4 %277 = OpFNegate %276 
                              Uniform f32_4* %278 = OpAccessChain %23 %26 
                                       f32_4 %279 = OpLoad %278 
                                       f32_4 %280 = OpFAdd %277 %279 
                                                      OpStore %274 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %281 2 2 2 2 
                                       f32_4 %283 = OpFNegate %282 
                              Uniform f32_4* %284 = OpAccessChain %23 %49 
                                       f32_4 %285 = OpLoad %284 
                                       f32_4 %286 = OpFAdd %283 %285 
                                                      OpStore %9 %286 
                                       f32_4 %287 = OpLoad %274 
                                       f32_4 %288 = OpLoad %60 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpFMul %287 %289 
                                       f32_4 %291 = OpLoad %266 
                                       f32_4 %292 = OpFAdd %290 %291 
                                                      OpStore %266 %292 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpLoad %60 
                                       f32_4 %295 = OpVectorShuffle %294 %294 2 2 2 2 
                                       f32_4 %296 = OpFMul %293 %295 
                                       f32_4 %297 = OpLoad %266 
                                       f32_4 %298 = OpFAdd %296 %297 
                                                      OpStore %60 %298 
                                       f32_4 %299 = OpLoad %274 
                                       f32_4 %300 = OpLoad %274 
                                       f32_4 %301 = OpFMul %299 %300 
                                       f32_4 %302 = OpLoad %259 
                                       f32_4 %303 = OpFAdd %301 %302 
                                                      OpStore %259 %303 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpFMul %304 %305 
                                       f32_4 %307 = OpLoad %259 
                                       f32_4 %308 = OpFAdd %306 %307 
                                                      OpStore %9 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %312 = OpExtInst %1 40 %309 %311 
                                                      OpStore %9 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_4 %314 = OpExtInst %1 32 %313 
                                                      OpStore %259 %314 
                                       f32_4 %315 = OpLoad %9 
                              Uniform f32_4* %317 = OpAccessChain %23 %316 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpFMul %315 %318 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %9 %321 
                                       f32_4 %322 = OpLoad %9 
                                       f32_4 %323 = OpFDiv %320 %322 
                                                      OpStore %9 %323 
                                       f32_4 %324 = OpLoad %60 
                                       f32_4 %325 = OpLoad %259 
                                       f32_4 %326 = OpFMul %324 %325 
                                                      OpStore %60 %326 
                                       f32_4 %327 = OpLoad %60 
                                       f32_4 %329 = OpExtInst %1 40 %327 %328 
                                                      OpStore %60 %329 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpLoad %60 
                                       f32_4 %332 = OpFMul %330 %331 
                                                      OpStore %9 %332 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 1 1 1 
                              Uniform f32_4* %336 = OpAccessChain %23 %335 %26 
                                       f32_4 %337 = OpLoad %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                                       f32_3 %339 = OpFMul %334 %338 
                                       f32_4 %340 = OpLoad %60 
                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
                                                      OpStore %60 %341 
                              Uniform f32_4* %342 = OpAccessChain %23 %335 %31 
                                       f32_4 %343 = OpLoad %342 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
                                       f32_4 %345 = OpLoad %9 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 0 0 
                                       f32_3 %347 = OpFMul %344 %346 
                                       f32_4 %348 = OpLoad %60 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 2 
                                       f32_3 %350 = OpFAdd %347 %349 
                                       f32_4 %351 = OpLoad %60 
                                       f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
                                                      OpStore %60 %352 
                              Uniform f32_4* %353 = OpAccessChain %23 %335 %39 
                                       f32_4 %354 = OpLoad %353 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %9 
                                       f32_3 %357 = OpVectorShuffle %356 %356 2 2 2 
                                       f32_3 %358 = OpFMul %355 %357 
                                       f32_4 %359 = OpLoad %60 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %361 = OpFAdd %358 %360 
                                       f32_4 %362 = OpLoad %9 
                                       f32_4 %363 = OpVectorShuffle %362 %361 4 5 6 3 
                                                      OpStore %9 %363 
                              Uniform f32_4* %364 = OpAccessChain %23 %335 %49 
                                       f32_4 %365 = OpLoad %364 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_4 %367 = OpLoad %9 
                                       f32_3 %368 = OpVectorShuffle %367 %367 3 3 3 
                                       f32_3 %369 = OpFMul %366 %368 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_3 %372 = OpFAdd %369 %371 
                                       f32_4 %373 = OpLoad %9 
                                       f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
                                                      OpStore %9 %374 
                                       f32_4 %375 = OpLoad %9 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpLoad %241 
                                       f32_3 %378 = OpFAdd %376 %377 
                                       f32_4 %379 = OpLoad %9 
                                       f32_4 %380 = OpVectorShuffle %379 %378 4 5 6 3 
                                                      OpStore %9 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                                      OpStore %381 %383 
                                Private f32* %384 = OpAccessChain %47 %88 
                                         f32 %385 = OpLoad %384 
                                Uniform f32* %387 = OpAccessChain %23 %31 %120 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFMul %385 %388 
                                Private f32* %390 = OpAccessChain %9 %120 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %9 %120 
                                         f32 %392 = OpLoad %391 
                                         f32 %394 = OpFMul %392 %393 
                                Private f32* %395 = OpAccessChain %9 %213 
                                                      OpStore %395 %394 
                                       f32_4 %396 = OpLoad %47 
                                       f32_2 %397 = OpVectorShuffle %396 %396 0 3 
                                       f32_2 %399 = OpFMul %397 %398 
                                       f32_4 %400 = OpLoad %9 
                                       f32_4 %401 = OpVectorShuffle %400 %399 4 1 5 3 
                                                      OpStore %9 %401 
                                       f32_4 %403 = OpLoad %47 
                                       f32_2 %404 = OpVectorShuffle %403 %403 2 3 
                                       f32_4 %405 = OpLoad %402 
                                       f32_4 %406 = OpVectorShuffle %405 %404 0 1 4 5 
                                                      OpStore %402 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_2 %408 = OpVectorShuffle %407 %407 2 2 
                                       f32_4 %409 = OpLoad %9 
                                       f32_2 %410 = OpVectorShuffle %409 %409 0 3 
                                       f32_2 %411 = OpFAdd %408 %410 
                                       f32_4 %412 = OpLoad %402 
                                       f32_4 %413 = OpVectorShuffle %412 %411 4 5 2 3 
                                                      OpStore %402 %413 
                                                      OpStore %414 %328 
                                 Output f32* %416 = OpAccessChain %92 %31 %88 
                                         f32 %417 = OpLoad %416 
                                         f32 %418 = OpFNegate %417 
                                 Output f32* %419 = OpAccessChain %92 %31 %88 
                                                      OpStore %419 %418 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 346
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %341 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 RelaxedPrecision 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 RelaxedPrecision 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpMemberDecorate %30 9 RelaxedPrecision 
                                                      OpMemberDecorate %30 9 Offset 30 
                                                      OpMemberDecorate %30 10 Offset 30 
                                                      OpMemberDecorate %30 11 RelaxedPrecision 
                                                      OpMemberDecorate %30 11 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %145 SpecId 145 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %248 Location 248 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %341 Location 341 
                                                      OpDecorate %343 RelaxedPrecision 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                              %26 = OpTypeVector %6 3 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %26 %7 %7 %7 %28 %7 %29 %26 %26 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 11 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %26 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %26 
                                 Input f32_3* %62 = OpVariable Input 
                                              %65 = OpTypePointer Uniform %26 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %70 = OpConstant 4 
                                          u32 %71 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant 2 
                               Private f32_3* %87 = OpVariable Private 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                         f32 %131 = OpConstant 3.67402E-40 
                               Private bool* %134 = OpVariable Private 
                                         i32 %135 = OpConstant 5 
                                        bool %139 = OpConstantFalse 
                                        bool %145 = OpSpecConstantFalse 
                               Private bool* %148 = OpVariable Private 
                                         i32 %154 = OpConstant 6 
                                             %180 = OpTypePointer Function %26 
                                         i32 %190 = OpConstant 8 
                              Private f32_4* %195 = OpVariable Private 
                                         i32 %197 = OpConstant 7 
                                             %203 = OpTypePointer Private %15 
                              Private f32_2* %204 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_3* %237 = OpVariable Private 
                                             %247 = OpTypePointer Input %7 
                                Input f32_4* %248 = OpVariable Input 
                                Private f32* %254 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %255 = OpVariable UniformConstant 
                              Private f32_3* %260 = OpVariable Private 
                                             %276 = OpTypePointer Function %6 
                                Input f32_3* %290 = OpVariable Input 
                                         i32 %297 = OpConstant 9 
                                         f32 %306 = OpConstant 3.67402E-40 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                       f32_3 %309 = OpConstantComposite %306 %307 %308 
                                         i32 %310 = OpConstant 10 
                                             %340 = OpTypePointer Output %7 
                               Output f32_4* %341 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %181 = OpVariable Function 
                               Function f32* %277 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpFNegate %63 
                               Uniform f32_3* %66 = OpAccessChain %32 %50 
                                        f32_3 %67 = OpLoad %66 
                                        f32_3 %68 = OpFAdd %64 %67 
                                                      OpStore %60 %68 
                                 Uniform f32* %72 = OpAccessChain %32 %70 %50 %71 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %69 %40 
                                                      OpStore %74 %73 
                                 Uniform f32* %75 = OpAccessChain %32 %70 %51 %71 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %78 = OpAccessChain %69 %77 
                                                      OpStore %78 %76 
                                 Uniform f32* %80 = OpAccessChain %32 %70 %79 %71 
                                          f32 %81 = OpLoad %80 
                                 Private f32* %82 = OpAccessChain %69 %71 
                                                      OpStore %82 %81 
                                        f32_3 %83 = OpLoad %60 
                                        f32_3 %84 = OpLoad %69 
                                          f32 %85 = OpDot %83 %84 
                                 Private f32* %86 = OpAccessChain %60 %40 
                                                      OpStore %86 %85 
                                        f32_3 %88 = OpLoad %62 
                               Uniform f32_4* %91 = OpAccessChain %32 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFNegate %93 
                                        f32_3 %95 = OpFAdd %88 %94 
                                                      OpStore %87 %95 
                                        f32_3 %96 = OpLoad %87 
                                        f32_3 %97 = OpLoad %87 
                                          f32 %98 = OpDot %96 %97 
                                 Private f32* %99 = OpAccessChain %87 %40 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %87 %40 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpExtInst %1 31 %101 
                                Private f32* %103 = OpAccessChain %87 %40 
                                                      OpStore %103 %102 
                                Private f32* %104 = OpAccessChain %60 %40 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                Private f32* %107 = OpAccessChain %87 %40 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %87 %40 
                                                      OpStore %110 %109 
                                Uniform f32* %111 = OpAccessChain %32 %89 %22 
                                         f32 %112 = OpLoad %111 
                                Private f32* %113 = OpAccessChain %87 %40 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %112 %114 
                                Private f32* %116 = OpAccessChain %60 %40 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %60 %40 
                                                      OpStore %119 %118 
                                Private f32* %120 = OpAccessChain %60 %40 
                                         f32 %121 = OpLoad %120 
                                Uniform f32* %122 = OpAccessChain %32 %79 %71 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Uniform f32* %125 = OpAccessChain %32 %79 %22 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %60 %40 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %60 %40 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpExtInst %1 43 %130 %47 %131 
                                Private f32* %133 = OpAccessChain %60 %40 
                                                      OpStore %133 %132 
                                Uniform f32* %136 = OpAccessChain %32 %135 %40 
                                         f32 %137 = OpLoad %136 
                                        bool %138 = OpFOrdEqual %137 %131 
                                                      OpStore %134 %138 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %141 
                                             %140 = OpLabel 
                                        bool %142 = OpLoad %134 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %144 
                                             %143 = OpLabel 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %232 
                                             %146 = OpLabel 
                                Uniform f32* %149 = OpAccessChain %32 %135 %77 
                                         f32 %150 = OpLoad %149 
                                        bool %151 = OpFOrdEqual %150 %131 
                                                      OpStore %148 %151 
                                       f32_3 %152 = OpLoad %62 
                                       f32_3 %153 = OpVectorShuffle %152 %152 1 1 1 
                              Uniform f32_4* %155 = OpAccessChain %32 %154 %51 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFMul %153 %157 
                                                      OpStore %69 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %154 %50 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %62 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %69 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %69 %166 
                              Uniform f32_4* %167 = OpAccessChain %32 %154 %79 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpLoad %62 
                                       f32_3 %171 = OpVectorShuffle %170 %170 2 2 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_3 %173 = OpLoad %69 
                                       f32_3 %174 = OpFAdd %172 %173 
                                                      OpStore %69 %174 
                                       f32_3 %175 = OpLoad %69 
                              Uniform f32_4* %176 = OpAccessChain %32 %154 %89 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                                      OpStore %69 %179 
                                        bool %182 = OpLoad %148 
                                                      OpSelectionMerge %184 None 
                                                      OpBranchConditional %182 %183 %186 
                                             %183 = OpLabel 
                                       f32_3 %185 = OpLoad %69 
                                                      OpStore %181 %185 
                                                      OpBranch %184 
                                             %186 = OpLabel 
                                       f32_3 %187 = OpLoad %62 
                                                      OpStore %181 %187 
                                                      OpBranch %184 
                                             %184 = OpLabel 
                                       f32_3 %188 = OpLoad %181 
                                                      OpStore %69 %188 
                                       f32_3 %189 = OpLoad %69 
                              Uniform f32_3* %191 = OpAccessChain %32 %190 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %189 %193 
                                                      OpStore %69 %194 
                                       f32_3 %196 = OpLoad %69 
                              Uniform f32_3* %198 = OpAccessChain %32 %197 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %196 %199 
                                       f32_4 %201 = OpLoad %195 
                                       f32_4 %202 = OpVectorShuffle %201 %200 0 4 5 6 
                                                      OpStore %195 %202 
                                Private f32* %205 = OpAccessChain %195 %77 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %204 %40 
                                                      OpStore %211 %210 
                                Uniform f32* %213 = OpAccessChain %32 %135 %71 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %212 %217 
                                         f32 %218 = OpLoad %212 
                                Private f32* %219 = OpAccessChain %204 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpExtInst %1 40 %218 %220 
                                Private f32* %222 = OpAccessChain %195 %40 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %195 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %195 %230 
                                       f32_4 %231 = OpLoad %195 
                                                      OpStore %20 %231 
                                                      OpBranch %147 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %20 %40 
                                                      OpStore %233 %131 
                                Private f32* %234 = OpAccessChain %20 %77 
                                                      OpStore %234 %131 
                                Private f32* %235 = OpAccessChain %20 %71 
                                                      OpStore %235 %131 
                                Private f32* %236 = OpAccessChain %20 %22 
                                                      OpStore %236 %131 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                       f32_4 %238 = OpLoad %20 
                              Uniform f32_4* %239 = OpAccessChain %32 %51 
                                       f32_4 %240 = OpLoad %239 
                                         f32 %241 = OpDot %238 %240 
                                Private f32* %242 = OpAccessChain %237 %40 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %237 %40 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpExtInst %1 43 %244 %47 %131 
                                Private f32* %246 = OpAccessChain %237 %40 
                                                      OpStore %246 %245 
                                       f32_4 %249 = OpLoad %248 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                       f32_4 %251 = OpLoad %248 
                                       f32_2 %252 = OpVectorShuffle %251 %251 3 3 
                                       f32_2 %253 = OpFDiv %250 %252 
                                                      OpStore %204 %253 
                  read_only Texture2DSampled %256 = OpLoad %255 
                                       f32_2 %257 = OpLoad %204 
                                       f32_4 %258 = OpImageSampleImplicitLod %256 %257 
                                         f32 %259 = OpCompositeExtract %258 0 
                                                      OpStore %254 %259 
                                Private f32* %261 = OpAccessChain %60 %40 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpLoad %254 
                                         f32 %264 = OpFAdd %262 %263 
                                Private f32* %265 = OpAccessChain %260 %40 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %260 %40 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpExtInst %1 43 %267 %47 %131 
                                Private f32* %269 = OpAccessChain %260 %40 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %260 %40 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %237 %40 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 37 %271 %273 
                                Private f32* %275 = OpAccessChain %237 %40 
                                                      OpStore %275 %274 
                                        bool %278 = OpLoad %134 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %278 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %237 %40 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %277 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                Private f32* %284 = OpAccessChain %260 %40 
                                         f32 %285 = OpLoad %284 
                                                      OpStore %277 %285 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %286 = OpLoad %277 
                                Private f32* %287 = OpAccessChain %237 %40 
                                                      OpStore %287 %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %291 = OpLoad %290 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %20 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %20 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %32 %297 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %296 %300 
                                                      OpStore %260 %301 
                                       f32_3 %302 = OpLoad %237 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 0 0 
                                       f32_3 %304 = OpLoad %260 
                                       f32_3 %305 = OpFMul %303 %304 
                                                      OpStore %237 %305 
                              Uniform f32_4* %311 = OpAccessChain %32 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                         f32 %314 = OpDot %309 %313 
                                Private f32* %315 = OpAccessChain %60 %40 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %60 %40 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %209 
                                         f32 %319 = OpFAdd %318 %207 
                                Private f32* %320 = OpAccessChain %60 %40 
                                                      OpStore %320 %319 
                                       f32_3 %321 = OpLoad %60 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 0 0 
                              Uniform f32_4* %323 = OpAccessChain %32 %310 
                                       f32_4 %324 = OpLoad %323 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFMul %322 %325 
                                       f32_3 %327 = OpLoad %237 
                                       f32_3 %328 = OpFNegate %327 
                                       f32_3 %329 = OpFAdd %326 %328 
                                                      OpStore %60 %329 
                              Uniform f32_4* %330 = OpAccessChain %32 %310 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 3 3 3 
                                       f32_3 %333 = OpLoad %60 
                                       f32_3 %334 = OpFMul %332 %333 
                                       f32_3 %335 = OpLoad %237 
                                       f32_3 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                      OpStore %9 %338 
                                Private f32* %339 = OpAccessChain %20 %22 
                                                      OpStore %339 %47 
                                       f32_4 %342 = OpLoad %9 
                                       f32_4 %343 = OpLoad %20 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %341 %344 
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
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend One One, One One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 68827
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
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb10 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb10){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10 = u_xlat2.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat5);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat10 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat1.x = u_xlat10 * u_xlat10_2.w;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.x = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat1.x = u_xlat1.x * 0.75 + 0.25;
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 271
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %268 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 RelaxedPrecision 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 RelaxedPrecision 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %105 SpecId 105 
                                                      OpDecorate %185 DescriptorSet 185 
                                                      OpDecorate %185 Binding 185 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %268 Location 268 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeArray %7 %26 
                                              %30 = OpTypeStruct %7 %7 %27 %28 %28 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 8 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %28 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %28 
                                 Input f32_3* %62 = OpVariable Input 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %7 
                                          i32 %79 = OpConstant 2 
                                          i32 %89 = OpConstant 3 
                                Private bool* %94 = OpVariable Private 
                                          f32 %97 = OpConstant 3.67402E-40 
                                         bool %99 = OpConstantFalse 
                                        bool %105 = OpSpecConstantFalse 
                                         u32 %108 = OpConstant 1 
                              Private f32_3* %112 = OpVariable Private 
                                             %140 = OpTypePointer Function %28 
                                         i32 %150 = OpConstant 4 
                                             %151 = OpTypePointer Uniform %28 
                              Private f32_4* %156 = OpVariable Private 
                                Private f32* %163 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         f32 %168 = OpConstant 3.67402E-40 
                                         u32 %170 = OpConstant 2 
                                         f32 %173 = OpConstant 3.67402E-40 
                                             %182 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %183 = OpTypeSampledImage %182 
                                             %184 = OpTypePointer UniformConstant %183 
 UniformConstant read_only Texture3DSampled* %185 = OpVariable UniformConstant 
                              Private f32_3* %196 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %210 = OpVariable UniformConstant 
                                         i32 %225 = OpConstant 5 
                                         f32 %234 = OpConstant 3.67402E-40 
                                         f32 %235 = OpConstant 3.67402E-40 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_3 %237 = OpConstantComposite %234 %235 %236 
                                         i32 %238 = OpConstant 7 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %141 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %32 %65 %51 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %64 %69 
                                                      OpStore %60 %70 
                               Uniform f32_4* %71 = OpAccessChain %32 %65 %50 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %62 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %60 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %60 %78 
                               Uniform f32_4* %80 = OpAccessChain %32 %65 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpLoad %62 
                                        f32_3 %84 = OpVectorShuffle %83 %83 2 2 2 
                                        f32_3 %85 = OpFMul %82 %84 
                                        f32_3 %86 = OpLoad %60 
                                        f32_3 %87 = OpFAdd %85 %86 
                                                      OpStore %60 %87 
                                        f32_3 %88 = OpLoad %60 
                               Uniform f32_4* %90 = OpAccessChain %32 %65 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpFAdd %88 %92 
                                                      OpStore %60 %93 
                                 Uniform f32* %95 = OpAccessChain %32 %51 %40 
                                          f32 %96 = OpLoad %95 
                                         bool %98 = OpFOrdEqual %96 %97 
                                                      OpStore %94 %98 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                        bool %102 = OpLoad %94 
                                                      OpSelectionMerge %104 None 
                                                      OpBranchConditional %102 %103 %104 
                                             %103 = OpLabel 
                                                      OpBranch %104 
                                             %104 = OpLabel 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %191 
                                             %106 = OpLabel 
                                Uniform f32* %109 = OpAccessChain %32 %51 %108 
                                         f32 %110 = OpLoad %109 
                                        bool %111 = OpFOrdEqual %110 %97 
                                                      OpStore %94 %111 
                                       f32_3 %113 = OpLoad %62 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %32 %79 %51 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                                      OpStore %112 %118 
                              Uniform f32_4* %119 = OpAccessChain %32 %79 %50 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpLoad %62 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 0 0 
                                       f32_3 %124 = OpFMul %121 %123 
                                       f32_3 %125 = OpLoad %112 
                                       f32_3 %126 = OpFAdd %124 %125 
                                                      OpStore %112 %126 
                              Uniform f32_4* %127 = OpAccessChain %32 %79 %79 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpLoad %62 
                                       f32_3 %131 = OpVectorShuffle %130 %130 2 2 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                       f32_3 %133 = OpLoad %112 
                                       f32_3 %134 = OpFAdd %132 %133 
                                                      OpStore %112 %134 
                                       f32_3 %135 = OpLoad %112 
                              Uniform f32_4* %136 = OpAccessChain %32 %79 %89 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %135 %138 
                                                      OpStore %112 %139 
                                        bool %142 = OpLoad %94 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %146 
                                             %143 = OpLabel 
                                       f32_3 %145 = OpLoad %112 
                                                      OpStore %141 %145 
                                                      OpBranch %144 
                                             %146 = OpLabel 
                                       f32_3 %147 = OpLoad %62 
                                                      OpStore %141 %147 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                       f32_3 %148 = OpLoad %141 
                                                      OpStore %112 %148 
                                       f32_3 %149 = OpLoad %112 
                              Uniform f32_3* %152 = OpAccessChain %32 %150 
                                       f32_3 %153 = OpLoad %152 
                                       f32_3 %154 = OpFNegate %153 
                                       f32_3 %155 = OpFAdd %149 %154 
                                                      OpStore %112 %155 
                                       f32_3 %157 = OpLoad %112 
                              Uniform f32_3* %158 = OpAccessChain %32 %89 
                                       f32_3 %159 = OpLoad %158 
                                       f32_3 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %156 
                                       f32_4 %162 = OpVectorShuffle %161 %160 0 4 5 6 
                                                      OpStore %156 %162 
                                Private f32* %164 = OpAccessChain %156 %108 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpFMul %165 %166 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %163 %169 
                                Uniform f32* %171 = OpAccessChain %32 %51 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %174 = OpFMul %172 %173 
                                         f32 %175 = OpFAdd %174 %168 
                                Private f32* %176 = OpAccessChain %112 %40 
                                                      OpStore %176 %175 
                                         f32 %177 = OpLoad %163 
                                Private f32* %178 = OpAccessChain %112 %40 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpExtInst %1 40 %177 %179 
                                Private f32* %181 = OpAccessChain %156 %40 
                                                      OpStore %181 %180 
                  read_only Texture3DSampled %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %156 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 2 3 
                                       f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                                      OpStore %156 %189 
                                       f32_4 %190 = OpLoad %156 
                                                      OpStore %20 %190 
                                                      OpBranch %107 
                                             %191 = OpLabel 
                                Private f32* %192 = OpAccessChain %20 %40 
                                                      OpStore %192 %97 
                                Private f32* %193 = OpAccessChain %20 %108 
                                                      OpStore %193 %97 
                                Private f32* %194 = OpAccessChain %20 %170 
                                                      OpStore %194 %97 
                                Private f32* %195 = OpAccessChain %20 %22 
                                                      OpStore %195 %97 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_4 %197 = OpLoad %20 
                              Uniform f32_4* %198 = OpAccessChain %32 %50 
                                       f32_4 %199 = OpLoad %198 
                                         f32 %200 = OpDot %197 %199 
                                Private f32* %201 = OpAccessChain %196 %40 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %196 %40 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpExtInst %1 43 %203 %47 %97 
                                Private f32* %205 = OpAccessChain %196 %40 
                                                      OpStore %205 %204 
                                       f32_3 %206 = OpLoad %60 
                                       f32_3 %207 = OpLoad %60 
                                         f32 %208 = OpDot %206 %207 
                                Private f32* %209 = OpAccessChain %60 %40 
                                                      OpStore %209 %208 
                  read_only Texture2DSampled %211 = OpLoad %210 
                                       f32_3 %212 = OpLoad %60 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 0 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                         f32 %215 = OpCompositeExtract %214 3 
                                Private f32* %216 = OpAccessChain %60 %40 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %196 %40 
                                         f32 %218 = OpLoad %217 
                                Private f32* %219 = OpAccessChain %60 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFMul %218 %220 
                                Private f32* %222 = OpAccessChain %60 %40 
                                                      OpStore %222 %221 
                                       f32_4 %223 = OpLoad %9 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %32 %225 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFMul %224 %228 
                                                      OpStore %196 %229 
                                       f32_3 %230 = OpLoad %60 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 0 0 
                                       f32_3 %232 = OpLoad %196 
                                       f32_3 %233 = OpFMul %231 %232 
                                                      OpStore %196 %233 
                              Uniform f32_4* %239 = OpAccessChain %32 %238 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %237 %241 
                                Private f32* %243 = OpAccessChain %60 %40 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %60 %40 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFMul %245 %168 
                                         f32 %247 = OpFAdd %246 %166 
                                Private f32* %248 = OpAccessChain %60 %40 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %60 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 0 0 
                              Uniform f32_4* %251 = OpAccessChain %32 %238 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpFMul %250 %253 
                                       f32_3 %255 = OpLoad %196 
                                       f32_3 %256 = OpFNegate %255 
                                       f32_3 %257 = OpFAdd %254 %256 
                                                      OpStore %60 %257 
                              Uniform f32_4* %258 = OpAccessChain %32 %238 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 3 3 3 
                                       f32_3 %261 = OpLoad %60 
                                       f32_3 %262 = OpFMul %260 %261 
                                       f32_3 %263 = OpLoad %196 
                                       f32_3 %264 = OpFAdd %262 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %9 %266 
                                       f32_4 %269 = OpLoad %9 
                                                      OpStore %268 %269 
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
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.x = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat1.x = u_xlat1.x * 0.75 + 0.25;
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %223 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %68 SpecId 68 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeStruct %7 %7 %27 %28 %28 %7 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %39 = OpConstant 0 
                                              %41 = OpTypeBool 
                                              %42 = OpTypePointer Private %41 
                                Private bool* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                          i32 %49 = OpConstant 0 
                                          i32 %50 = OpConstant 1 
                                          i32 %52 = OpConstant -1 
                                          f32 %60 = OpConstant 3.67402E-40 
                                         bool %62 = OpConstantFalse 
                                         bool %68 = OpSpecConstantFalse 
                                          u32 %71 = OpConstant 1 
                                              %75 = OpTypePointer Private %28 
                               Private f32_3* %76 = OpVariable Private 
                                              %77 = OpTypePointer Input %28 
                                 Input f32_3* %78 = OpVariable Input 
                                          i32 %81 = OpConstant 2 
                                              %82 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Function %28 
                                         i32 %120 = OpConstant 4 
                                             %121 = OpTypePointer Uniform %28 
                              Private f32_4* %126 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         u32 %140 = OpConstant 2 
                                         f32 %143 = OpConstant 3.67402E-40 
                                             %153 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %154 = OpTypeSampledImage %153 
                                             %155 = OpTypePointer UniformConstant %154 
 UniformConstant read_only Texture3DSampled* %156 = OpVariable UniformConstant 
                              Private f32_3* %167 = OpVariable Private 
                              Private f32_3* %177 = OpVariable Private 
                                         i32 %180 = OpConstant 5 
                                         f32 %189 = OpConstant 3.67402E-40 
                                         f32 %190 = OpConstant 3.67402E-40 
                                         f32 %191 = OpConstant 3.67402E-40 
                                       f32_3 %192 = OpConstantComposite %189 %190 %191 
                                         i32 %193 = OpConstant 6 
                                             %222 = OpTypePointer Output %7 
                               Output f32_4* %223 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %35 = OpAccessChain %31 %33 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %38 = OpFAdd %25 %37 
                                 Private f32* %40 = OpAccessChain %20 %39 
                                                      OpStore %40 %38 
                                 Private f32* %44 = OpAccessChain %20 %39 
                                          f32 %45 = OpLoad %44 
                                         bool %47 = OpFOrdLessThan %45 %46 
                                                      OpStore %43 %47 
                                         bool %48 = OpLoad %43 
                                          i32 %51 = OpSelect %48 %50 %49 
                                          i32 %53 = OpIMul %51 %52 
                                         bool %54 = OpINotEqual %53 %49 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %54 %55 %56 
                                              %55 = OpLabel 
                                                      OpKill
                                              %56 = OpLabel 
                                 Uniform f32* %58 = OpAccessChain %31 %50 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdEqual %59 %60 
                                                      OpStore %43 %61 
                                                      OpSelectionMerge %64 None 
                                                      OpBranchConditional %62 %63 %64 
                                              %63 = OpLabel 
                                         bool %65 = OpLoad %43 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpBranch %67 
                                              %67 = OpLabel 
                                                      OpBranch %64 
                                              %64 = OpLabel 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %162 
                                              %69 = OpLabel 
                                 Uniform f32* %72 = OpAccessChain %31 %50 %71 
                                          f32 %73 = OpLoad %72 
                                         bool %74 = OpFOrdEqual %73 %60 
                                                      OpStore %43 %74 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %31 %81 %50 
                                        f32_4 %84 = OpLoad %83 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFMul %80 %85 
                                                      OpStore %76 %86 
                               Uniform f32_4* %87 = OpAccessChain %31 %81 %49 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %78 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %76 
                                        f32_3 %94 = OpFAdd %92 %93 
                                                      OpStore %76 %94 
                               Uniform f32_4* %95 = OpAccessChain %31 %81 %81 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %78 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %76 %102 
                                       f32_3 %103 = OpLoad %76 
                              Uniform f32_4* %105 = OpAccessChain %31 %81 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %76 %108 
                                        bool %112 = OpLoad %43 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %116 
                                             %113 = OpLabel 
                                       f32_3 %115 = OpLoad %76 
                                                      OpStore %111 %115 
                                                      OpBranch %114 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %78 
                                                      OpStore %111 %117 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %118 = OpLoad %111 
                                                      OpStore %109 %118 
                                       f32_3 %119 = OpLoad %109 
                              Uniform f32_3* %122 = OpAccessChain %31 %120 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %124 = OpFNegate %123 
                                       f32_3 %125 = OpFAdd %119 %124 
                                                      OpStore %109 %125 
                                       f32_3 %127 = OpLoad %109 
                              Uniform f32_3* %128 = OpAccessChain %31 %104 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %126 
                                       f32_4 %132 = OpVectorShuffle %131 %130 0 4 5 6 
                                                      OpStore %126 %132 
                                Private f32* %133 = OpAccessChain %126 %71 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                         f32 %138 = OpFAdd %136 %137 
                                Private f32* %139 = OpAccessChain %109 %39 
                                                      OpStore %139 %138 
                                Uniform f32* %141 = OpAccessChain %31 %50 %140 
                                         f32 %142 = OpLoad %141 
                                         f32 %144 = OpFMul %142 %143 
                                         f32 %145 = OpFAdd %144 %137 
                                Private f32* %146 = OpAccessChain %76 %39 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %76 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %109 %39 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 40 %148 %150 
                                Private f32* %152 = OpAccessChain %126 %39 
                                                      OpStore %152 %151 
                  read_only Texture3DSampled %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %126 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 2 3 
                                       f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                                      OpStore %126 %160 
                                       f32_4 %161 = OpLoad %126 
                                                      OpStore %20 %161 
                                                      OpBranch %70 
                                             %162 = OpLabel 
                                Private f32* %163 = OpAccessChain %20 %39 
                                                      OpStore %163 %60 
                                Private f32* %164 = OpAccessChain %20 %71 
                                                      OpStore %164 %60 
                                Private f32* %165 = OpAccessChain %20 %140 
                                                      OpStore %165 %60 
                                Private f32* %166 = OpAccessChain %20 %22 
                                                      OpStore %166 %60 
                                                      OpBranch %70 
                                              %70 = OpLabel 
                                       f32_4 %168 = OpLoad %20 
                              Uniform f32_4* %169 = OpAccessChain %31 %49 
                                       f32_4 %170 = OpLoad %169 
                                         f32 %171 = OpDot %168 %170 
                                Private f32* %172 = OpAccessChain %167 %39 
                                                      OpStore %172 %171 
                                Private f32* %173 = OpAccessChain %167 %39 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 43 %174 %46 %60 
                                Private f32* %176 = OpAccessChain %167 %39 
                                                      OpStore %176 %175 
                                       f32_4 %178 = OpLoad %9 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %181 = OpAccessChain %31 %180 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFMul %179 %183 
                                                      OpStore %177 %184 
                                       f32_3 %185 = OpLoad %167 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
                                       f32_3 %187 = OpLoad %177 
                                       f32_3 %188 = OpFMul %186 %187 
                                                      OpStore %167 %188 
                              Uniform f32_4* %194 = OpAccessChain %31 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                         f32 %197 = OpDot %192 %196 
                                Private f32* %198 = OpAccessChain %109 %39 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %109 %39 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %200 %137 
                                         f32 %202 = OpFAdd %201 %135 
                                Private f32* %203 = OpAccessChain %109 %39 
                                                      OpStore %203 %202 
                                       f32_3 %204 = OpLoad %109 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
                              Uniform f32_4* %206 = OpAccessChain %31 %193 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFMul %205 %208 
                                       f32_3 %210 = OpLoad %167 
                                       f32_3 %211 = OpFNegate %210 
                                       f32_3 %212 = OpFAdd %209 %211 
                                                      OpStore %109 %212 
                              Uniform f32_4* %213 = OpAccessChain %31 %193 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 3 3 3 
                                       f32_3 %216 = OpLoad %109 
                                       f32_3 %217 = OpFMul %215 %216 
                                       f32_3 %218 = OpLoad %167 
                                       f32_3 %219 = OpFAdd %217 %218 
                                       f32_4 %220 = OpLoad %9 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %9 %221 
                                       f32_4 %224 = OpLoad %9 
                                                      OpStore %223 %224 
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
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat3 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat6.x, u_xlat3);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat2.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat1.z;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat10.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat10.xy);
    u_xlat13 = u_xlat6.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_3.w;
    u_xlat1.x = u_xlat2.x * u_xlat1.x;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.x = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat1.x = u_xlat1.x * 0.75 + 0.25;
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 320
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %58 %317 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 RelaxedPrecision 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 RelaxedPrecision 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %97 SpecId 97 
                                                      OpDecorate %186 DescriptorSet 186 
                                                      OpDecorate %186 Binding 186 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %234 DescriptorSet 234 
                                                      OpDecorate %234 Binding 234 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %253 DescriptorSet 253 
                                                      OpDecorate %253 Binding 253 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %317 Location 317 
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
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 3 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeArray %7 %26 
                                              %30 = OpTypeStruct %7 %7 %27 %28 %28 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 8 
                                              %35 = OpTypePointer Uniform %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                          i32 %47 = OpConstant 0 
                                          i32 %48 = OpConstant 1 
                                          i32 %50 = OpConstant -1 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypePointer Input %28 
                                 Input f32_3* %58 = OpVariable Input 
                                          i32 %61 = OpConstant 6 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                                          i32 %82 = OpConstant 3 
                                          u32 %86 = OpConstant 0 
                                          f32 %89 = OpConstant 3.67402E-40 
                                         bool %91 = OpConstantFalse 
                                         bool %97 = OpSpecConstantFalse 
                                         u32 %100 = OpConstant 1 
                                             %104 = OpTypePointer Private %28 
                              Private f32_3* %105 = OpVariable Private 
                              Private f32_4* %133 = OpVariable Private 
                                             %134 = OpTypePointer Function %28 
                                         i32 %147 = OpConstant 4 
                                             %148 = OpTypePointer Uniform %28 
                                         f32 %164 = OpConstant 3.67402E-40 
                                         f32 %166 = OpConstant 3.67402E-40 
                              Private f32_3* %169 = OpVariable Private 
                                         u32 %170 = OpConstant 2 
                                         f32 %173 = OpConstant 3.67402E-40 
                                             %183 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %184 = OpTypeSampledImage %183 
                                             %185 = OpTypePointer UniformConstant %184 
 UniformConstant read_only Texture3DSampled* %186 = OpVariable UniformConstant 
                              Private f32_4* %191 = OpVariable Private 
                              Private f32_3* %198 = OpVariable Private 
                               Private bool* %208 = OpVariable Private 
                              Private f32_3* %212 = OpVariable Private 
                                             %213 = OpTypePointer Function %6 
                                       f32_2 %230 = OpConstantComposite %173 %173 
 UniformConstant read_only Texture2DSampled* %234 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %253 = OpVariable UniformConstant 
                                         i32 %274 = OpConstant 5 
                                         f32 %283 = OpConstant 3.67402E-40 
                                         f32 %284 = OpConstant 3.67402E-40 
                                         f32 %285 = OpConstant 3.67402E-40 
                                       f32_3 %286 = OpConstantComposite %283 %284 %285 
                                         i32 %287 = OpConstant 7 
                                             %316 = OpTypePointer Output %7 
                               Output f32_4* %317 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %135 = OpVariable Function 
                               Function f32* %214 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %23 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                                      OpStore %21 %39 
                                          f32 %43 = OpLoad %21 
                                         bool %45 = OpFOrdLessThan %43 %44 
                                                      OpStore %42 %45 
                                         bool %46 = OpLoad %42 
                                          i32 %49 = OpSelect %46 %48 %47 
                                          i32 %51 = OpIMul %49 %50 
                                         bool %52 = OpINotEqual %51 %47 
                                                      OpSelectionMerge %54 None 
                                                      OpBranchConditional %52 %53 %54 
                                              %53 = OpLabel 
                                                      OpKill
                                              %54 = OpLabel 
                                        f32_3 %59 = OpLoad %58 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %63 = OpAccessChain %32 %61 %48 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %60 %64 
                                                      OpStore %56 %65 
                               Uniform f32_4* %66 = OpAccessChain %32 %61 %47 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpLoad %58 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %56 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %56 %72 
                               Uniform f32_4* %74 = OpAccessChain %32 %61 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpLoad %58 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %56 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %56 %80 
                                        f32_4 %81 = OpLoad %56 
                               Uniform f32_4* %83 = OpAccessChain %32 %61 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %81 %84 
                                                      OpStore %56 %85 
                                 Uniform f32* %87 = OpAccessChain %32 %48 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdEqual %88 %89 
                                                      OpStore %42 %90 
                                                      OpSelectionMerge %93 None 
                                                      OpBranchConditional %91 %92 %93 
                                              %92 = OpLabel 
                                         bool %94 = OpLoad %42 
                                                      OpSelectionMerge %96 None 
                                                      OpBranchConditional %94 %95 %96 
                                              %95 = OpLabel 
                                                      OpBranch %96 
                                              %96 = OpLabel 
                                                      OpBranch %93 
                                              %93 = OpLabel 
                                                      OpSelectionMerge %99 None 
                                                      OpBranchConditional %97 %98 %193 
                                              %98 = OpLabel 
                                Uniform f32* %101 = OpAccessChain %32 %48 %100 
                                         f32 %102 = OpLoad %101 
                                        bool %103 = OpFOrdEqual %102 %89 
                                                      OpStore %42 %103 
                                       f32_3 %106 = OpLoad %58 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %108 = OpAccessChain %32 %73 %48 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFMul %107 %110 
                                                      OpStore %105 %111 
                              Uniform f32_4* %112 = OpAccessChain %32 %73 %47 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpLoad %58 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 0 0 
                                       f32_3 %117 = OpFMul %114 %116 
                                       f32_3 %118 = OpLoad %105 
                                       f32_3 %119 = OpFAdd %117 %118 
                                                      OpStore %105 %119 
                              Uniform f32_4* %120 = OpAccessChain %32 %73 %73 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpLoad %58 
                                       f32_3 %124 = OpVectorShuffle %123 %123 2 2 2 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_3 %126 = OpLoad %105 
                                       f32_3 %127 = OpFAdd %125 %126 
                                                      OpStore %105 %127 
                                       f32_3 %128 = OpLoad %105 
                              Uniform f32_4* %129 = OpAccessChain %32 %73 %82 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFAdd %128 %131 
                                                      OpStore %105 %132 
                                        bool %136 = OpLoad %42 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %140 
                                             %137 = OpLabel 
                                       f32_3 %139 = OpLoad %105 
                                                      OpStore %135 %139 
                                                      OpBranch %138 
                                             %140 = OpLabel 
                                       f32_3 %141 = OpLoad %58 
                                                      OpStore %135 %141 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_3 %142 = OpLoad %135 
                                       f32_4 %143 = OpLoad %133 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %133 %144 
                                       f32_4 %145 = OpLoad %133 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_3* %149 = OpAccessChain %32 %147 
                                       f32_3 %150 = OpLoad %149 
                                       f32_3 %151 = OpFNegate %150 
                                       f32_3 %152 = OpFAdd %146 %151 
                                       f32_4 %153 = OpLoad %133 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %133 %154 
                                       f32_4 %155 = OpLoad %133 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_3* %157 = OpAccessChain %32 %82 
                                       f32_3 %158 = OpLoad %157 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %133 
                                       f32_4 %161 = OpVectorShuffle %160 %159 0 4 5 6 
                                                      OpStore %133 %161 
                                Private f32* %162 = OpAccessChain %133 %100 
                                         f32 %163 = OpLoad %162 
                                         f32 %165 = OpFMul %163 %164 
                                         f32 %167 = OpFAdd %165 %166 
                                Private f32* %168 = OpAccessChain %105 %86 
                                                      OpStore %168 %167 
                                Uniform f32* %171 = OpAccessChain %32 %48 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %174 = OpFMul %172 %173 
                                         f32 %175 = OpFAdd %174 %166 
                                Private f32* %176 = OpAccessChain %169 %86 
                                                      OpStore %176 %175 
                                Private f32* %177 = OpAccessChain %105 %86 
                                         f32 %178 = OpLoad %177 
                                Private f32* %179 = OpAccessChain %169 %86 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpExtInst %1 40 %178 %180 
                                Private f32* %182 = OpAccessChain %133 %86 
                                                      OpStore %182 %181 
                  read_only Texture3DSampled %187 = OpLoad %186 
                                       f32_4 %188 = OpLoad %133 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 2 3 
                                       f32_4 %190 = OpImageSampleImplicitLod %187 %189 
                                                      OpStore %133 %190 
                                       f32_4 %192 = OpLoad %133 
                                                      OpStore %191 %192 
                                                      OpBranch %99 
                                             %193 = OpLabel 
                                Private f32* %194 = OpAccessChain %191 %86 
                                                      OpStore %194 %89 
                                Private f32* %195 = OpAccessChain %191 %100 
                                                      OpStore %195 %89 
                                Private f32* %196 = OpAccessChain %191 %170 
                                                      OpStore %196 %89 
                                Private f32* %197 = OpAccessChain %191 %23 
                                                      OpStore %197 %89 
                                                      OpBranch %99 
                                              %99 = OpLabel 
                                       f32_4 %199 = OpLoad %191 
                              Uniform f32_4* %200 = OpAccessChain %32 %47 
                                       f32_4 %201 = OpLoad %200 
                                         f32 %202 = OpDot %199 %201 
                                Private f32* %203 = OpAccessChain %198 %86 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %198 %86 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 43 %205 %44 %89 
                                Private f32* %207 = OpAccessChain %198 %86 
                                                      OpStore %207 %206 
                                Private f32* %209 = OpAccessChain %56 %170 
                                         f32 %210 = OpLoad %209 
                                        bool %211 = OpFOrdLessThan %44 %210 
                                                      OpStore %208 %211 
                                        bool %215 = OpLoad %208 
                                                      OpSelectionMerge %217 None 
                                                      OpBranchConditional %215 %216 %218 
                                             %216 = OpLabel 
                                                      OpStore %214 %89 
                                                      OpBranch %217 
                                             %218 = OpLabel 
                                                      OpStore %214 %44 
                                                      OpBranch %217 
                                             %217 = OpLabel 
                                         f32 %219 = OpLoad %214 
                                Private f32* %220 = OpAccessChain %212 %86 
                                                      OpStore %220 %219 
                                       f32_4 %221 = OpLoad %56 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
                                       f32_4 %223 = OpLoad %56 
                                       f32_2 %224 = OpVectorShuffle %223 %223 3 3 
                                       f32_2 %225 = OpFDiv %222 %224 
                                       f32_3 %226 = OpLoad %169 
                                       f32_3 %227 = OpVectorShuffle %226 %225 3 4 2 
                                                      OpStore %169 %227 
                                       f32_3 %228 = OpLoad %169 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 1 
                                       f32_2 %231 = OpFAdd %229 %230 
                                       f32_3 %232 = OpLoad %169 
                                       f32_3 %233 = OpVectorShuffle %232 %231 3 4 2 
                                                      OpStore %169 %233 
                  read_only Texture2DSampled %235 = OpLoad %234 
                                       f32_3 %236 = OpLoad %169 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                       f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                         f32 %239 = OpCompositeExtract %238 3 
                                Private f32* %240 = OpAccessChain %169 %86 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %169 %86 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %212 %86 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                Private f32* %246 = OpAccessChain %212 %86 
                                                      OpStore %246 %245 
                                       f32_4 %247 = OpLoad %56 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_4 %249 = OpLoad %56 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                         f32 %251 = OpDot %248 %250 
                                Private f32* %252 = OpAccessChain %169 %86 
                                                      OpStore %252 %251 
                  read_only Texture2DSampled %254 = OpLoad %253 
                                       f32_3 %255 = OpLoad %169 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 0 
                                       f32_4 %257 = OpImageSampleImplicitLod %254 %256 
                                         f32 %258 = OpCompositeExtract %257 3 
                                Private f32* %259 = OpAccessChain %169 %86 
                                                      OpStore %259 %258 
                                Private f32* %260 = OpAccessChain %169 %86 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %212 %86 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFMul %261 %263 
                                Private f32* %265 = OpAccessChain %212 %86 
                                                      OpStore %265 %264 
                                Private f32* %266 = OpAccessChain %198 %86 
                                         f32 %267 = OpLoad %266 
                                Private f32* %268 = OpAccessChain %212 %86 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFMul %267 %269 
                                Private f32* %271 = OpAccessChain %198 %86 
                                                      OpStore %271 %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_4* %275 = OpAccessChain %32 %274 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpFMul %273 %277 
                                                      OpStore %212 %278 
                                       f32_3 %279 = OpLoad %198 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpLoad %212 
                                       f32_3 %282 = OpFMul %280 %281 
                                                      OpStore %198 %282 
                              Uniform f32_4* %288 = OpAccessChain %32 %287 
                                       f32_4 %289 = OpLoad %288 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                                         f32 %291 = OpDot %286 %290 
                                Private f32* %292 = OpAccessChain %169 %86 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %169 %86 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %294 %166 
                                         f32 %296 = OpFAdd %295 %164 
                                Private f32* %297 = OpAccessChain %169 %86 
                                                      OpStore %297 %296 
                                       f32_3 %298 = OpLoad %169 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 0 0 
                              Uniform f32_4* %300 = OpAccessChain %32 %287 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                       f32_3 %303 = OpFMul %299 %302 
                                       f32_3 %304 = OpLoad %198 
                                       f32_3 %305 = OpFNegate %304 
                                       f32_3 %306 = OpFAdd %303 %305 
                                                      OpStore %169 %306 
                              Uniform f32_4* %307 = OpAccessChain %32 %287 
                                       f32_4 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 3 3 3 
                                       f32_3 %310 = OpLoad %169 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_3 %312 = OpLoad %198 
                                       f32_3 %313 = OpFAdd %311 %312 
                                       f32_4 %314 = OpLoad %9 
                                       f32_4 %315 = OpVectorShuffle %314 %313 4 5 6 3 
                                                      OpStore %9 %315 
                                       f32_4 %318 = OpLoad %9 
                                                      OpStore %317 %318 
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
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat6);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_3 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat13 * u_xlat16_1;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.x = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat1.x = u_xlat1.x * 0.75 + 0.25;
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 283
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %280 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 RelaxedPrecision 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 RelaxedPrecision 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %105 SpecId 105 
                                                      OpDecorate %185 DescriptorSet 185 
                                                      OpDecorate %185 Binding 185 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeArray %7 %26 
                                              %30 = OpTypeStruct %7 %7 %27 %28 %28 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 8 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %28 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %28 
                                 Input f32_3* %62 = OpVariable Input 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %7 
                                          i32 %79 = OpConstant 2 
                                          i32 %89 = OpConstant 3 
                                Private bool* %94 = OpVariable Private 
                                          f32 %97 = OpConstant 3.67402E-40 
                                         bool %99 = OpConstantFalse 
                                        bool %105 = OpSpecConstantFalse 
                                         u32 %108 = OpConstant 1 
                              Private f32_3* %112 = OpVariable Private 
                                             %140 = OpTypePointer Function %28 
                                         i32 %150 = OpConstant 4 
                                             %151 = OpTypePointer Uniform %28 
                              Private f32_4* %156 = OpVariable Private 
                                Private f32* %163 = OpVariable Private 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         f32 %168 = OpConstant 3.67402E-40 
                                         u32 %170 = OpConstant 2 
                                         f32 %173 = OpConstant 3.67402E-40 
                                             %182 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %183 = OpTypeSampledImage %182 
                                             %184 = OpTypePointer UniformConstant %183 
 UniformConstant read_only Texture3DSampled* %185 = OpVariable UniformConstant 
                              Private f32_3* %196 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %209 = OpVariable UniformConstant 
                                             %215 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
UniformConstant read_only TextureCubeSampled* %218 = OpVariable UniformConstant 
                                         i32 %237 = OpConstant 5 
                                         f32 %246 = OpConstant 3.67402E-40 
                                         f32 %247 = OpConstant 3.67402E-40 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_3 %249 = OpConstantComposite %246 %247 %248 
                                         i32 %250 = OpConstant 7 
                                             %279 = OpTypePointer Output %7 
                               Output f32_4* %280 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %141 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %32 %65 %51 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFMul %64 %69 
                                                      OpStore %60 %70 
                               Uniform f32_4* %71 = OpAccessChain %32 %65 %50 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpLoad %62 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 0 0 
                                        f32_3 %76 = OpFMul %73 %75 
                                        f32_3 %77 = OpLoad %60 
                                        f32_3 %78 = OpFAdd %76 %77 
                                                      OpStore %60 %78 
                               Uniform f32_4* %80 = OpAccessChain %32 %65 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpLoad %62 
                                        f32_3 %84 = OpVectorShuffle %83 %83 2 2 2 
                                        f32_3 %85 = OpFMul %82 %84 
                                        f32_3 %86 = OpLoad %60 
                                        f32_3 %87 = OpFAdd %85 %86 
                                                      OpStore %60 %87 
                                        f32_3 %88 = OpLoad %60 
                               Uniform f32_4* %90 = OpAccessChain %32 %65 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpFAdd %88 %92 
                                                      OpStore %60 %93 
                                 Uniform f32* %95 = OpAccessChain %32 %51 %40 
                                          f32 %96 = OpLoad %95 
                                         bool %98 = OpFOrdEqual %96 %97 
                                                      OpStore %94 %98 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                        bool %102 = OpLoad %94 
                                                      OpSelectionMerge %104 None 
                                                      OpBranchConditional %102 %103 %104 
                                             %103 = OpLabel 
                                                      OpBranch %104 
                                             %104 = OpLabel 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %191 
                                             %106 = OpLabel 
                                Uniform f32* %109 = OpAccessChain %32 %51 %108 
                                         f32 %110 = OpLoad %109 
                                        bool %111 = OpFOrdEqual %110 %97 
                                                      OpStore %94 %111 
                                       f32_3 %113 = OpLoad %62 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %32 %79 %51 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %114 %117 
                                                      OpStore %112 %118 
                              Uniform f32_4* %119 = OpAccessChain %32 %79 %50 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpLoad %62 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 0 0 
                                       f32_3 %124 = OpFMul %121 %123 
                                       f32_3 %125 = OpLoad %112 
                                       f32_3 %126 = OpFAdd %124 %125 
                                                      OpStore %112 %126 
                              Uniform f32_4* %127 = OpAccessChain %32 %79 %79 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpLoad %62 
                                       f32_3 %131 = OpVectorShuffle %130 %130 2 2 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                       f32_3 %133 = OpLoad %112 
                                       f32_3 %134 = OpFAdd %132 %133 
                                                      OpStore %112 %134 
                                       f32_3 %135 = OpLoad %112 
                              Uniform f32_4* %136 = OpAccessChain %32 %79 %89 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %135 %138 
                                                      OpStore %112 %139 
                                        bool %142 = OpLoad %94 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %146 
                                             %143 = OpLabel 
                                       f32_3 %145 = OpLoad %112 
                                                      OpStore %141 %145 
                                                      OpBranch %144 
                                             %146 = OpLabel 
                                       f32_3 %147 = OpLoad %62 
                                                      OpStore %141 %147 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                       f32_3 %148 = OpLoad %141 
                                                      OpStore %112 %148 
                                       f32_3 %149 = OpLoad %112 
                              Uniform f32_3* %152 = OpAccessChain %32 %150 
                                       f32_3 %153 = OpLoad %152 
                                       f32_3 %154 = OpFNegate %153 
                                       f32_3 %155 = OpFAdd %149 %154 
                                                      OpStore %112 %155 
                                       f32_3 %157 = OpLoad %112 
                              Uniform f32_3* %158 = OpAccessChain %32 %89 
                                       f32_3 %159 = OpLoad %158 
                                       f32_3 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %156 
                                       f32_4 %162 = OpVectorShuffle %161 %160 0 4 5 6 
                                                      OpStore %156 %162 
                                Private f32* %164 = OpAccessChain %156 %108 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpFMul %165 %166 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %163 %169 
                                Uniform f32* %171 = OpAccessChain %32 %51 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %174 = OpFMul %172 %173 
                                         f32 %175 = OpFAdd %174 %168 
                                Private f32* %176 = OpAccessChain %112 %40 
                                                      OpStore %176 %175 
                                         f32 %177 = OpLoad %163 
                                Private f32* %178 = OpAccessChain %112 %40 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpExtInst %1 40 %177 %179 
                                Private f32* %181 = OpAccessChain %156 %40 
                                                      OpStore %181 %180 
                  read_only Texture3DSampled %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %156 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 2 3 
                                       f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                                      OpStore %156 %189 
                                       f32_4 %190 = OpLoad %156 
                                                      OpStore %20 %190 
                                                      OpBranch %107 
                                             %191 = OpLabel 
                                Private f32* %192 = OpAccessChain %20 %40 
                                                      OpStore %192 %97 
                                Private f32* %193 = OpAccessChain %20 %108 
                                                      OpStore %193 %97 
                                Private f32* %194 = OpAccessChain %20 %170 
                                                      OpStore %194 %97 
                                Private f32* %195 = OpAccessChain %20 %22 
                                                      OpStore %195 %97 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_4 %197 = OpLoad %20 
                              Uniform f32_4* %198 = OpAccessChain %32 %50 
                                       f32_4 %199 = OpLoad %198 
                                         f32 %200 = OpDot %197 %199 
                                Private f32* %201 = OpAccessChain %196 %40 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %196 %40 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpExtInst %1 43 %203 %47 %97 
                                Private f32* %205 = OpAccessChain %196 %40 
                                                      OpStore %205 %204 
                                       f32_3 %206 = OpLoad %60 
                                       f32_3 %207 = OpLoad %60 
                                         f32 %208 = OpDot %206 %207 
                                                      OpStore %163 %208 
                  read_only Texture2DSampled %210 = OpLoad %209 
                                         f32 %211 = OpLoad %163 
                                       f32_2 %212 = OpCompositeConstruct %211 %211 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                                      OpStore %163 %214 
                read_only TextureCubeSampled %219 = OpLoad %218 
                                       f32_3 %220 = OpLoad %60 
                                       f32_4 %221 = OpImageSampleImplicitLod %219 %220 
                                         f32 %222 = OpCompositeExtract %221 3 
                                Private f32* %223 = OpAccessChain %60 %40 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %60 %40 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpLoad %163 
                                         f32 %227 = OpFMul %225 %226 
                                Private f32* %228 = OpAccessChain %60 %40 
                                                      OpStore %228 %227 
                                Private f32* %229 = OpAccessChain %196 %40 
                                         f32 %230 = OpLoad %229 
                                Private f32* %231 = OpAccessChain %60 %40 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %230 %232 
                                Private f32* %234 = OpAccessChain %60 %40 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %32 %237 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpFMul %236 %240 
                                                      OpStore %196 %241 
                                       f32_3 %242 = OpLoad %60 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpLoad %196 
                                       f32_3 %245 = OpFMul %243 %244 
                                                      OpStore %196 %245 
                              Uniform f32_4* %251 = OpAccessChain %32 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                         f32 %254 = OpDot %249 %253 
                                Private f32* %255 = OpAccessChain %60 %40 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %60 %40 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFMul %257 %168 
                                         f32 %259 = OpFAdd %258 %166 
                                Private f32* %260 = OpAccessChain %60 %40 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %60 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 0 0 
                              Uniform f32_4* %263 = OpAccessChain %32 %250 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %196 
                                       f32_3 %268 = OpFNegate %267 
                                       f32_3 %269 = OpFAdd %266 %268 
                                                      OpStore %60 %269 
                              Uniform f32_4* %270 = OpAccessChain %32 %250 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 3 3 3 
                                       f32_3 %273 = OpLoad %60 
                                       f32_3 %274 = OpFMul %272 %273 
                                       f32_3 %275 = OpLoad %196 
                                       f32_3 %276 = OpFAdd %274 %275 
                                       f32_4 %277 = OpLoad %9 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
                                                      OpStore %9 %278 
                                       f32_4 %281 = OpLoad %9 
                                                      OpStore %280 %281 
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
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.x = dot(vec3(0.212500006, 0.715399981, 0.0720999986), _OverrideColor.xyz);
    u_xlat1.x = u_xlat1.x * 0.75 + 0.25;
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 277
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %274 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 RelaxedPrecision 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 RelaxedPrecision 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %116 SpecId 116 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %274 Location 274 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypeArray %7 %26 
                                              %30 = OpTypeStruct %7 %7 %27 %28 %28 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 8 
                                              %35 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 0 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          i32 %50 = OpConstant 0 
                                          i32 %51 = OpConstant 1 
                                          i32 %53 = OpConstant -1 
                                              %59 = OpTypePointer Private %28 
                               Private f32_3* %60 = OpVariable Private 
                                              %61 = OpTypePointer Input %28 
                                 Input f32_3* %62 = OpVariable Input 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %7 
                                          i32 %84 = OpConstant 2 
                                          i32 %98 = OpConstant 3 
                               Private bool* %105 = OpVariable Private 
                                         f32 %108 = OpConstant 3.67402E-40 
                                        bool %110 = OpConstantFalse 
                                        bool %116 = OpSpecConstantFalse 
                                         u32 %119 = OpConstant 1 
                              Private f32_3* %123 = OpVariable Private 
                                             %151 = OpTypePointer Function %28 
                                         i32 %161 = OpConstant 4 
                                             %162 = OpTypePointer Uniform %28 
                              Private f32_4* %167 = OpVariable Private 
                                Private f32* %174 = OpVariable Private 
                                         f32 %177 = OpConstant 3.67402E-40 
                                         f32 %179 = OpConstant 3.67402E-40 
                                Private f32* %181 = OpVariable Private 
                                         u32 %182 = OpConstant 2 
                                         f32 %185 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_3* %206 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %216 = OpVariable UniformConstant 
                                         i32 %231 = OpConstant 5 
                                         f32 %240 = OpConstant 3.67402E-40 
                                         f32 %241 = OpConstant 3.67402E-40 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %240 %241 %242 
                                         i32 %244 = OpConstant 7 
                                             %273 = OpTypePointer Output %7 
                               Output f32_4* %274 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %152 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %36 = OpAccessChain %32 %34 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %39 = OpFAdd %25 %38 
                                 Private f32* %41 = OpAccessChain %20 %40 
                                                      OpStore %41 %39 
                                 Private f32* %45 = OpAccessChain %20 %40 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %52 = OpSelect %49 %51 %50 
                                          i32 %54 = OpIMul %52 %53 
                                         bool %55 = OpINotEqual %54 %50 
                                                      OpSelectionMerge %57 None 
                                                      OpBranchConditional %55 %56 %57 
                                              %56 = OpLabel 
                                                      OpKill
                                              %57 = OpLabel 
                                        f32_3 %63 = OpLoad %62 
                                        f32_2 %64 = OpVectorShuffle %63 %63 1 1 
                               Uniform f32_4* %67 = OpAccessChain %32 %65 %51 
                                        f32_4 %68 = OpLoad %67 
                                        f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                                        f32_2 %70 = OpFMul %64 %69 
                                        f32_3 %71 = OpLoad %60 
                                        f32_3 %72 = OpVectorShuffle %71 %70 3 4 2 
                                                      OpStore %60 %72 
                               Uniform f32_4* %73 = OpAccessChain %32 %65 %50 
                                        f32_4 %74 = OpLoad %73 
                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                        f32_3 %76 = OpLoad %62 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 0 
                                        f32_2 %78 = OpFMul %75 %77 
                                        f32_3 %79 = OpLoad %60 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpFAdd %78 %80 
                                        f32_3 %82 = OpLoad %60 
                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
                                                      OpStore %60 %83 
                               Uniform f32_4* %85 = OpAccessChain %32 %65 %84 
                                        f32_4 %86 = OpLoad %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                        f32_3 %88 = OpLoad %62 
                                        f32_2 %89 = OpVectorShuffle %88 %88 2 2 
                                        f32_2 %90 = OpFMul %87 %89 
                                        f32_3 %91 = OpLoad %60 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFAdd %90 %92 
                                        f32_3 %94 = OpLoad %60 
                                        f32_3 %95 = OpVectorShuffle %94 %93 3 4 2 
                                                      OpStore %60 %95 
                                        f32_3 %96 = OpLoad %60 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                               Uniform f32_4* %99 = OpAccessChain %32 %65 %98 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %97 %101 
                                       f32_3 %103 = OpLoad %60 
                                       f32_3 %104 = OpVectorShuffle %103 %102 3 4 2 
                                                      OpStore %60 %104 
                                Uniform f32* %106 = OpAccessChain %32 %51 %40 
                                         f32 %107 = OpLoad %106 
                                        bool %109 = OpFOrdEqual %107 %108 
                                                      OpStore %105 %109 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                        bool %113 = OpLoad %105 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %115 
                                             %114 = OpLabel 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %201 
                                             %117 = OpLabel 
                                Uniform f32* %120 = OpAccessChain %32 %51 %119 
                                         f32 %121 = OpLoad %120 
                                        bool %122 = OpFOrdEqual %121 %108 
                                                      OpStore %105 %122 
                                       f32_3 %124 = OpLoad %62 
                                       f32_3 %125 = OpVectorShuffle %124 %124 1 1 1 
                              Uniform f32_4* %126 = OpAccessChain %32 %84 %51 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFMul %125 %128 
                                                      OpStore %123 %129 
                              Uniform f32_4* %130 = OpAccessChain %32 %84 %50 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpLoad %62 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 0 0 
                                       f32_3 %135 = OpFMul %132 %134 
                                       f32_3 %136 = OpLoad %123 
                                       f32_3 %137 = OpFAdd %135 %136 
                                                      OpStore %123 %137 
                              Uniform f32_4* %138 = OpAccessChain %32 %84 %84 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpLoad %62 
                                       f32_3 %142 = OpVectorShuffle %141 %141 2 2 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                       f32_3 %144 = OpLoad %123 
                                       f32_3 %145 = OpFAdd %143 %144 
                                                      OpStore %123 %145 
                                       f32_3 %146 = OpLoad %123 
                              Uniform f32_4* %147 = OpAccessChain %32 %84 %98 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %146 %149 
                                                      OpStore %123 %150 
                                        bool %153 = OpLoad %105 
                                                      OpSelectionMerge %155 None 
                                                      OpBranchConditional %153 %154 %157 
                                             %154 = OpLabel 
                                       f32_3 %156 = OpLoad %123 
                                                      OpStore %152 %156 
                                                      OpBranch %155 
                                             %157 = OpLabel 
                                       f32_3 %158 = OpLoad %62 
                                                      OpStore %152 %158 
                                                      OpBranch %155 
                                             %155 = OpLabel 
                                       f32_3 %159 = OpLoad %152 
                                                      OpStore %123 %159 
                                       f32_3 %160 = OpLoad %123 
                              Uniform f32_3* %163 = OpAccessChain %32 %161 
                                       f32_3 %164 = OpLoad %163 
                                       f32_3 %165 = OpFNegate %164 
                                       f32_3 %166 = OpFAdd %160 %165 
                                                      OpStore %123 %166 
                                       f32_3 %168 = OpLoad %123 
                              Uniform f32_3* %169 = OpAccessChain %32 %98 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %167 
                                       f32_4 %173 = OpVectorShuffle %172 %171 0 4 5 6 
                                                      OpStore %167 %173 
                                Private f32* %175 = OpAccessChain %167 %119 
                                         f32 %176 = OpLoad %175 
                                         f32 %178 = OpFMul %176 %177 
                                         f32 %180 = OpFAdd %178 %179 
                                                      OpStore %174 %180 
                                Uniform f32* %183 = OpAccessChain %32 %51 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %186 = OpFMul %184 %185 
                                         f32 %187 = OpFAdd %186 %179 
                                                      OpStore %181 %187 
                                         f32 %188 = OpLoad %181 
                                         f32 %189 = OpLoad %174 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %167 %40 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %167 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %167 %199 
                                       f32_4 %200 = OpLoad %167 
                                                      OpStore %20 %200 
                                                      OpBranch %118 
                                             %201 = OpLabel 
                                Private f32* %202 = OpAccessChain %20 %40 
                                                      OpStore %202 %108 
                                Private f32* %203 = OpAccessChain %20 %119 
                                                      OpStore %203 %108 
                                Private f32* %204 = OpAccessChain %20 %182 
                                                      OpStore %204 %108 
                                Private f32* %205 = OpAccessChain %20 %22 
                                                      OpStore %205 %108 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                       f32_4 %207 = OpLoad %20 
                              Uniform f32_4* %208 = OpAccessChain %32 %50 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                Private f32* %211 = OpAccessChain %206 %40 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %206 %40 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpExtInst %1 43 %213 %47 %108 
                                Private f32* %215 = OpAccessChain %206 %40 
                                                      OpStore %215 %214 
                  read_only Texture2DSampled %217 = OpLoad %216 
                                       f32_3 %218 = OpLoad %60 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                         f32 %221 = OpCompositeExtract %220 3 
                                Private f32* %222 = OpAccessChain %60 %40 
                                                      OpStore %222 %221 
                                Private f32* %223 = OpAccessChain %206 %40 
                                         f32 %224 = OpLoad %223 
                                Private f32* %225 = OpAccessChain %60 %40 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %224 %226 
                                Private f32* %228 = OpAccessChain %60 %40 
                                                      OpStore %228 %227 
                                       f32_4 %229 = OpLoad %9 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                              Uniform f32_4* %232 = OpAccessChain %32 %231 
                                       f32_4 %233 = OpLoad %232 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                       f32_3 %235 = OpFMul %230 %234 
                                                      OpStore %206 %235 
                                       f32_3 %236 = OpLoad %60 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 0 0 
                                       f32_3 %238 = OpLoad %206 
                                       f32_3 %239 = OpFMul %237 %238 
                                                      OpStore %206 %239 
                              Uniform f32_4* %245 = OpAccessChain %32 %244 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                         f32 %248 = OpDot %243 %247 
                                Private f32* %249 = OpAccessChain %60 %40 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %60 %40 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpFMul %251 %179 
                                         f32 %253 = OpFAdd %252 %177 
                                Private f32* %254 = OpAccessChain %60 %40 
                                                      OpStore %254 %253 
                                       f32_3 %255 = OpLoad %60 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 0 0 
                              Uniform f32_4* %257 = OpAccessChain %32 %244 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                       f32_3 %260 = OpFMul %256 %259 
                                       f32_3 %261 = OpLoad %206 
                                       f32_3 %262 = OpFNegate %261 
                                       f32_3 %263 = OpFAdd %260 %262 
                                                      OpStore %60 %263 
                              Uniform f32_4* %264 = OpAccessChain %32 %244 
                                       f32_4 %265 = OpLoad %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 3 3 3 
                                       f32_3 %267 = OpLoad %60 
                                       f32_3 %268 = OpFMul %266 %267 
                                       f32_3 %269 = OpLoad %206 
                                       f32_3 %270 = OpFAdd %268 %269 
                                       f32_4 %271 = OpLoad %9 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %9 %272 
                                       f32_4 %275 = OpLoad %9 
                                                      OpStore %274 %275 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 158206
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
out vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_0.w + (-_Cutoff);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
    u_xlatb3 = u_xlat3<0.0;
    if((int(u_xlatb3) * int(0xffffffffu))!=0){discard;}
    u_xlat3 = unity_OneOverOutputBoost;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat3);
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
; Bound: 223
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %209 
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
                                                      OpDecorate %209 Location 209 
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
                               Output f32_4* %209 = OpVariable Output 
                                             %217 = OpTypePointer Output %9 
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
                                       f32_4 %191 = OpVectorShuffle %190 %190 1 1 1 1 
                              Uniform f32_4* %192 = OpAccessChain %42 %120 %121 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpFMul %191 %193 
                                                      OpStore %21 %194 
                              Uniform f32_4* %195 = OpAccessChain %42 %120 %120 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %13 
                                       f32_4 %198 = OpVectorShuffle %197 %197 0 0 0 0 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %21 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %21 %201 
                              Uniform f32_4* %202 = OpAccessChain %42 %120 %44 
                                       f32_4 %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %13 
                                       f32_4 %205 = OpVectorShuffle %204 %204 2 2 2 2 
                                       f32_4 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %21 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %21 %208 
                              Uniform f32_4* %210 = OpAccessChain %42 %120 %92 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %13 
                                       f32_4 %213 = OpVectorShuffle %212 %212 3 3 3 3 
                                       f32_4 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %21 
                                       f32_4 %216 = OpFAdd %214 %215 
                                                      OpStore %209 %216 
                                 Output f32* %218 = OpAccessChain %166 %120 %162 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFNegate %219 
                                 Output f32* %221 = OpAccessChain %166 %120 %162 
                                                      OpStore %221 %220 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 132
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %118 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpMemberDecorate %27 0 Offset 27 
                                                    OpMemberDecorate %27 1 Offset 27 
                                                    OpMemberDecorate %27 2 Offset 27 
                                                    OpMemberDecorate %27 3 RelaxedPrecision 
                                                    OpMemberDecorate %27 3 Offset 27 
                                                    OpDecorate %27 Block 
                                                    OpDecorate %29 DescriptorSet 29 
                                                    OpDecorate %29 Binding 29 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %47 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %118 Location 118 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %130 RelaxedPrecision 
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
                                            %22 = OpTypeInt 32 0 
                                        u32 %23 = OpConstant 3 
                                            %26 = OpTypeVector %22 4 
                                            %27 = OpTypeStruct %26 %6 %6 %6 
                                            %28 = OpTypePointer Uniform %27 
    Uniform struct {u32_4; f32; f32; f32;}* %29 = OpVariable Uniform 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 3 
                                            %32 = OpTypePointer Uniform %6 
                             Private f32_4* %37 = OpVariable Private 
                                            %38 = OpTypeVector %6 3 
                                            %44 = OpTypeBool 
                                            %45 = OpTypePointer Private %44 
                              Private bool* %46 = OpVariable Private 
                                        f32 %48 = OpConstant 3.67402E-40 
                                        i32 %51 = OpConstant 0 
                                        i32 %52 = OpConstant 1 
                                        i32 %54 = OpConstant -1 
                               Private f32* %60 = OpVariable Private 
                                        f32 %64 = OpConstant 3.67402E-40 
                                            %66 = OpTypePointer Private %38 
                             Private f32_3* %67 = OpVariable Private 
                                        i32 %76 = OpConstant 2 
                                            %89 = OpTypePointer Function %38 
                                            %91 = OpTypeVector %44 4 
                                            %92 = OpTypePointer Uniform %26 
                                        u32 %96 = OpConstant 0 
                                     f32_3 %102 = OpConstantComposite %48 %48 %48 
                                           %106 = OpTypePointer Function %6 
                                           %117 = OpTypePointer Output %7 
                             Output f32_4* %118 = OpVariable Output 
                                           %119 = OpTypePointer Function %7 
                                     f32_4 %127 = OpConstantComposite %48 %48 %48 %64 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %90 = OpVariable Function 
                             Function f32* %107 = OpVariable Function 
                           Function f32_4* %120 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                        f32 %25 = OpLoad %24 
                               Uniform f32* %33 = OpAccessChain %29 %31 
                                        f32 %34 = OpLoad %33 
                                        f32 %35 = OpFNegate %34 
                                        f32 %36 = OpFAdd %25 %35 
                                                    OpStore %21 %36 
                                      f32_4 %39 = OpLoad %9 
                                      f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                      f32_3 %41 = OpExtInst %1 30 %40 
                                      f32_4 %42 = OpLoad %37 
                                      f32_4 %43 = OpVectorShuffle %42 %41 4 5 6 3 
                                                    OpStore %37 %43 
                                        f32 %47 = OpLoad %21 
                                       bool %49 = OpFOrdLessThan %47 %48 
                                                    OpStore %46 %49 
                                       bool %50 = OpLoad %46 
                                        i32 %53 = OpSelect %50 %52 %51 
                                        i32 %55 = OpIMul %53 %54 
                                       bool %56 = OpINotEqual %55 %51 
                                                    OpSelectionMerge %58 None 
                                                    OpBranchConditional %56 %57 %58 
                                            %57 = OpLabel 
                                                    OpKill
                                            %58 = OpLabel 
                               Uniform f32* %61 = OpAccessChain %29 %52 
                                        f32 %62 = OpLoad %61 
                                                    OpStore %60 %62 
                                        f32 %63 = OpLoad %60 
                                        f32 %65 = OpExtInst %1 43 %63 %48 %64 
                                                    OpStore %60 %65 
                                      f32_4 %68 = OpLoad %37 
                                      f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32 %70 = OpLoad %60 
                                      f32_3 %71 = OpCompositeConstruct %70 %70 %70 
                                      f32_3 %72 = OpFMul %69 %71 
                                                    OpStore %67 %72 
                                      f32_3 %73 = OpLoad %67 
                                      f32_3 %74 = OpExtInst %1 29 %73 
                                                    OpStore %67 %74 
                                      f32_3 %75 = OpLoad %67 
                               Uniform f32* %77 = OpAccessChain %29 %76 
                                        f32 %78 = OpLoad %77 
                               Uniform f32* %79 = OpAccessChain %29 %76 
                                        f32 %80 = OpLoad %79 
                               Uniform f32* %81 = OpAccessChain %29 %76 
                                        f32 %82 = OpLoad %81 
                                      f32_3 %83 = OpCompositeConstruct %78 %80 %82 
                                        f32 %84 = OpCompositeExtract %83 0 
                                        f32 %85 = OpCompositeExtract %83 1 
                                        f32 %86 = OpCompositeExtract %83 2 
                                      f32_3 %87 = OpCompositeConstruct %84 %85 %86 
                                      f32_3 %88 = OpExtInst %1 37 %75 %87 
                                                    OpStore %67 %88 
                             Uniform u32_4* %93 = OpAccessChain %29 %51 
                                      u32_4 %94 = OpLoad %93 
                                        u32 %95 = OpCompositeExtract %94 0 
                                       bool %97 = OpINotEqual %95 %96 
                                                    OpSelectionMerge %99 None 
                                                    OpBranchConditional %97 %98 %101 
                                            %98 = OpLabel 
                                     f32_3 %100 = OpLoad %67 
                                                    OpStore %90 %100 
                                                    OpBranch %99 
                                           %101 = OpLabel 
                                                    OpStore %90 %102 
                                                    OpBranch %99 
                                            %99 = OpLabel 
                                     f32_3 %103 = OpLoad %90 
                                     f32_4 %104 = OpLoad %37 
                                     f32_4 %105 = OpVectorShuffle %104 %103 4 5 6 3 
                                                    OpStore %37 %105 
                            Uniform u32_4* %108 = OpAccessChain %29 %51 
                                     u32_4 %109 = OpLoad %108 
                                       u32 %110 = OpCompositeExtract %109 0 
                                      bool %111 = OpINotEqual %110 %96 
                                                    OpSelectionMerge %113 None 
                                                    OpBranchConditional %111 %112 %114 
                                           %112 = OpLabel 
                                                    OpStore %107 %64 
                                                    OpBranch %113 
                                           %114 = OpLabel 
                                                    OpStore %107 %48 
                                                    OpBranch %113 
                                           %113 = OpLabel 
                                       f32 %115 = OpLoad %107 
                              Private f32* %116 = OpAccessChain %37 %23 
                                                    OpStore %116 %115 
                            Uniform u32_4* %121 = OpAccessChain %29 %51 
                                     u32_4 %122 = OpLoad %121 
                                       u32 %123 = OpCompositeExtract %122 1 
                                      bool %124 = OpINotEqual %123 %96 
                                                    OpSelectionMerge %126 None 
                                                    OpBranchConditional %124 %125 %128 
                                           %125 = OpLabel 
                                                    OpStore %120 %127 
                                                    OpBranch %126 
                                           %128 = OpLabel 
                                     f32_4 %129 = OpLoad %37 
                                                    OpStore %120 %129 
                                                    OpBranch %126 
                                           %126 = OpLabel 
                                     f32_4 %130 = OpLoad %120 
                                                    OpStore %118 %130 
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