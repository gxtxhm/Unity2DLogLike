//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/DebrisPitfallShader" {
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
  GpuProgramID 51617
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
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %110 %140 %146 
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
; Bound: 245
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %229 
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
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %229 Location 229 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
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
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %202 = OpConstant 6 
                              Private f32_4* %217 = OpVariable Private 
                                             %228 = OpTypePointer Output %7 
                               Output f32_4* %229 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
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
                                       f32_3 %193 = OpLoad %167 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpLoad %184 
                                       f32_3 %196 = OpFMul %194 %195 
                                                      OpStore %192 %196 
                                       f32_3 %197 = OpLoad %184 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpLoad %167 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 0 0 
                                       f32_3 %201 = OpFMul %198 %200 
                              Uniform f32_4* %203 = OpAccessChain %31 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %201 %205 
                                                      OpStore %109 %206 
                              Uniform f32_4* %207 = OpAccessChain %31 %202 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 3 3 3 
                                       f32_3 %210 = OpLoad %109 
                                       f32_3 %211 = OpFMul %209 %210 
                                       f32_3 %212 = OpLoad %192 
                                       f32_3 %213 = OpFAdd %211 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %9 %215 
                                Private f32* %216 = OpAccessChain %20 %22 
                                                      OpStore %216 %46 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpLoad %20 
                                       f32_4 %220 = OpFAdd %218 %219 
                                                      OpStore %217 %220 
                                       f32_4 %221 = OpLoad %217 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFNegate %222 
                              Uniform f32_4* %224 = OpAccessChain %31 %202 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFAdd %223 %226 
                                                      OpStore %167 %227 
                              Uniform f32_4* %230 = OpAccessChain %31 %202 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 3 3 3 
                                       f32_3 %233 = OpLoad %167 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_4 %235 = OpLoad %217 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFAdd %234 %236 
                                       f32_4 %238 = OpLoad %229 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %229 %239 
                                Private f32* %240 = OpAccessChain %217 %22 
                                         f32 %241 = OpLoad %240 
                                 Output f32* %243 = OpAccessChain %229 %22 
                                                      OpStore %243 %241 
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
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 245
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %229 
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
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %229 Location 229 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
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
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %202 = OpConstant 6 
                              Private f32_4* %217 = OpVariable Private 
                                             %228 = OpTypePointer Output %7 
                               Output f32_4* %229 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
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
                                       f32_3 %193 = OpLoad %167 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpLoad %184 
                                       f32_3 %196 = OpFMul %194 %195 
                                                      OpStore %192 %196 
                                       f32_3 %197 = OpLoad %184 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpLoad %167 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 0 0 
                                       f32_3 %201 = OpFMul %198 %200 
                              Uniform f32_4* %203 = OpAccessChain %31 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %201 %205 
                                                      OpStore %109 %206 
                              Uniform f32_4* %207 = OpAccessChain %31 %202 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 3 3 3 
                                       f32_3 %210 = OpLoad %109 
                                       f32_3 %211 = OpFMul %209 %210 
                                       f32_3 %212 = OpLoad %192 
                                       f32_3 %213 = OpFAdd %211 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %9 %215 
                                Private f32* %216 = OpAccessChain %20 %22 
                                                      OpStore %216 %46 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpLoad %20 
                                       f32_4 %220 = OpFAdd %218 %219 
                                                      OpStore %217 %220 
                                       f32_4 %221 = OpLoad %217 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFNegate %222 
                              Uniform f32_4* %224 = OpAccessChain %31 %202 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFAdd %223 %226 
                                                      OpStore %167 %227 
                              Uniform f32_4* %230 = OpAccessChain %31 %202 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 3 3 3 
                                       f32_3 %233 = OpLoad %167 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_4 %235 = OpLoad %217 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFAdd %234 %236 
                                       f32_4 %238 = OpLoad %229 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %229 %239 
                                Private f32* %240 = OpAccessChain %217 %22 
                                         f32 %241 = OpLoad %240 
                                 Output f32* %243 = OpAccessChain %229 %22 
                                                      OpStore %243 %241 
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
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
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
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 185
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %92 %98 %99 %112 %142 %148 %165 %177 
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
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate %165 Location 165 
                                                      OpDecorate %177 Location 177 
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
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
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
                                         i32 %102 = OpConstant 4 
                                             %111 = OpTypePointer Input %50 
                                Input f32_3* %112 = OpVariable Input 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                               Output f32_3* %142 = OpVariable Output 
                               Output f32_3* %148 = OpVariable Output 
                                         f32 %149 = OpConstant 3.67402E-40 
                                       f32_3 %150 = OpConstantComposite %149 %149 %149 
                                             %153 = OpTypePointer Uniform %6 
                                         f32 %160 = OpConstant 3.67402E-40 
                                       f32_3 %161 = OpConstantComposite %160 %160 %160 
                               Output f32_4* %165 = OpVariable Output 
                               Output f32_4* %177 = OpVariable Output 
                                       f32_4 %178 = OpConstantComposite %149 %149 %149 %149 
                                             %179 = OpTypePointer Output %6 
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
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %23 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %46 %28 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %46 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %81 = OpAccessChain %21 %46 %46 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %44 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %93 = OpLoad %9 
                                Output f32_4* %95 = OpAccessChain %92 %28 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %21 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %114 = OpAccessChain %21 %36 %28 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %113 %116 
                                Private f32* %120 = OpAccessChain %44 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %112 
                              Uniform f32_4* %122 = OpAccessChain %21 %36 %23 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %44 %88 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %112 
                              Uniform f32_4* %128 = OpAccessChain %21 %36 %36 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %44 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %44 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %44 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %143 = OpLoad %134 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %44 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                                      OpStore %142 %147 
                                                      OpStore %148 %150 
                                Private f32* %151 = OpAccessChain %9 %88 
                                         f32 %152 = OpLoad %151 
                                Uniform f32* %154 = OpAccessChain %21 %28 %118 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %152 %155 
                                Private f32* %157 = OpAccessChain %9 %88 
                                                      OpStore %157 %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 3 1 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %44 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 1 5 6 
                                                      OpStore %44 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_2 %167 = OpVectorShuffle %166 %166 2 3 
                                       f32_4 %168 = OpLoad %165 
                                       f32_4 %169 = OpVectorShuffle %168 %167 0 1 4 5 
                                                      OpStore %165 %169 
                                       f32_4 %170 = OpLoad %44 
                                       f32_2 %171 = OpVectorShuffle %170 %170 2 2 
                                       f32_4 %172 = OpLoad %44 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 3 
                                       f32_2 %174 = OpFAdd %171 %173 
                                       f32_4 %175 = OpLoad %165 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 2 3 
                                                      OpStore %165 %176 
                                                      OpStore %177 %178 
                                 Output f32* %180 = OpAccessChain %92 %28 %88 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFNegate %181 
                                 Output f32* %183 = OpAccessChain %92 %28 %88 
                                                      OpStore %183 %182 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %339 
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
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
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
                              Private f32_3* %302 = OpVariable Private 
                                         i32 %312 = OpConstant 10 
                              Private f32_4* %327 = OpVariable Private 
                                             %338 = OpTypePointer Output %7 
                               Output f32_4* %339 = OpVariable Output 
                                             %352 = OpTypePointer Output %6 
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
                                       f32_3 %303 = OpLoad %237 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %260 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %302 %306 
                                       f32_3 %307 = OpLoad %260 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpLoad %237 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 0 0 
                                       f32_3 %311 = OpFMul %308 %310 
                              Uniform f32_4* %313 = OpAccessChain %32 %312 
                                       f32_4 %314 = OpLoad %313 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %311 %315 
                                                      OpStore %60 %316 
                              Uniform f32_4* %317 = OpAccessChain %32 %312 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 3 3 3 
                                       f32_3 %320 = OpLoad %60 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_3 %322 = OpLoad %302 
                                       f32_3 %323 = OpFAdd %321 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
                                                      OpStore %9 %325 
                                Private f32* %326 = OpAccessChain %20 %22 
                                                      OpStore %326 %47 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %327 %330 
                                       f32_4 %331 = OpLoad %327 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFNegate %332 
                              Uniform f32_4* %334 = OpAccessChain %32 %312 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %333 %336 
                                                      OpStore %237 %337 
                              Uniform f32_4* %340 = OpAccessChain %32 %312 
                                       f32_4 %341 = OpLoad %340 
                                       f32_3 %342 = OpVectorShuffle %341 %341 3 3 3 
                                       f32_3 %343 = OpLoad %237 
                                       f32_3 %344 = OpFMul %342 %343 
                                       f32_4 %345 = OpLoad %327 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFAdd %344 %346 
                                       f32_4 %348 = OpLoad %339 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                      OpStore %339 %349 
                                Private f32* %350 = OpAccessChain %327 %22 
                                         f32 %351 = OpLoad %350 
                                 Output f32* %353 = OpAccessChain %339 %22 
                                                      OpStore %353 %351 
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
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.x = u_xlat1.y * u_xlat1.y;
    u_xlat2.x = u_xlat1.x * u_xlat1.x + (-u_xlat2.x);
    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat2.xyz = unity_SHC.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
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
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 301
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %94 %100 %101 %114 %152 %264 %281 %293 
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
                                                      OpDecorate %53 Location 53 
                                                      OpMemberDecorate %92 0 BuiltIn 92 
                                                      OpMemberDecorate %92 1 BuiltIn 92 
                                                      OpMemberDecorate %92 2 BuiltIn 92 
                                                      OpDecorate %92 Block 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %114 Location 114 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %281 Location 281 
                                                      OpDecorate %293 Location 293 
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
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Output %51 
                                Output f32_3* %53 = OpVariable Output 
                                          i32 %65 = OpConstant 10 
                                          u32 %90 = OpConstant 1 
                                              %91 = OpTypeArray %6 %90 
                                              %92 = OpTypeStruct %7 %6 %91 
                                              %93 = OpTypePointer Output %92 
         Output struct {f32_4; f32; f32[1];}* %94 = OpVariable Output 
                                              %96 = OpTypePointer Output %7 
                                              %98 = OpTypeVector %6 2 
                                              %99 = OpTypePointer Output %98 
                               Output f32_2* %100 = OpVariable Output 
                                Input f32_4* %101 = OpVariable Input 
                                         i32 %104 = OpConstant 11 
                                             %113 = OpTypePointer Input %51 
                                Input f32_3* %114 = OpVariable Input 
                                         i32 %116 = OpConstant 9 
                                         u32 %121 = OpConstant 0 
                                             %122 = OpTypePointer Private %6 
                                         u32 %135 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                               Output f32_3* %152 = OpVariable Output 
                                             %155 = OpTypePointer Private %51 
                              Private f32_3* %156 = OpVariable Private 
                              Private f32_4* %173 = OpVariable Private 
                              Private f32_3* %179 = OpVariable Private 
                                         i32 %180 = OpConstant 4 
                                         i32 %186 = OpConstant 5 
                                         i32 %192 = OpConstant 6 
                                         i32 %198 = OpConstant 7 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         u32 %208 = OpConstant 3 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_3 %231 = OpConstantComposite %230 %230 %230 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                               Output f32_3* %264 = OpVariable Output 
                                             %269 = OpTypePointer Uniform %6 
                                         f32 %276 = OpConstant 3.67402E-40 
                                       f32_3 %277 = OpConstantComposite %276 %276 %276 
                               Output f32_4* %281 = OpVariable Output 
                               Output f32_4* %293 = OpVariable Output 
                                       f32_4 %294 = OpConstantComposite %230 %230 %230 %230 
                                             %295 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %21 %65 %47 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %45 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %95 = OpLoad %9 
                                Output f32_4* %97 = OpAccessChain %94 %29 
                                                      OpStore %97 %95 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                              Uniform f32_4* %105 = OpAccessChain %21 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFMul %103 %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %104 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                       f32_2 %112 = OpFAdd %108 %111 
                                                      OpStore %100 %112 
                                       f32_3 %115 = OpLoad %114 
                              Uniform f32_4* %117 = OpAccessChain %21 %116 %29 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %115 %119 
                                Private f32* %123 = OpAccessChain %45 %121 
                                                      OpStore %123 %120 
                                       f32_3 %124 = OpLoad %114 
                              Uniform f32_4* %125 = OpAccessChain %21 %116 %24 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                         f32 %128 = OpDot %124 %127 
                                Private f32* %129 = OpAccessChain %45 %90 
                                                      OpStore %129 %128 
                                       f32_3 %130 = OpLoad %114 
                              Uniform f32_4* %131 = OpAccessChain %21 %116 %37 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %130 %133 
                                Private f32* %136 = OpAccessChain %45 %135 
                                                      OpStore %136 %134 
                                       f32_4 %138 = OpLoad %45 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_4 %140 = OpLoad %45 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                         f32 %142 = OpDot %139 %141 
                                                      OpStore %137 %142 
                                         f32 %143 = OpLoad %137 
                                         f32 %144 = OpExtInst %1 32 %143 
                                                      OpStore %137 %144 
                                         f32 %145 = OpLoad %137 
                                       f32_3 %146 = OpCompositeConstruct %145 %145 %145 
                                       f32_4 %147 = OpLoad %45 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %45 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %45 %151 
                                       f32_4 %153 = OpLoad %45 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                Private f32* %157 = OpAccessChain %45 %90 
                                         f32 %158 = OpLoad %157 
                                Private f32* %159 = OpAccessChain %45 %90 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFMul %158 %160 
                                Private f32* %162 = OpAccessChain %156 %121 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %45 %121 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %45 %121 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                Private f32* %168 = OpAccessChain %156 %121 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFNegate %169 
                                         f32 %171 = OpFAdd %167 %170 
                                Private f32* %172 = OpAccessChain %156 %121 
                                                      OpStore %172 %171 
                                       f32_4 %174 = OpLoad %45 
                                       f32_4 %175 = OpVectorShuffle %174 %174 1 2 2 0 
                                       f32_4 %176 = OpLoad %45 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 1 2 2 
                                       f32_4 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                              Uniform f32_4* %181 = OpAccessChain %21 %180 
                                       f32_4 %182 = OpLoad %181 
                                       f32_4 %183 = OpLoad %173 
                                         f32 %184 = OpDot %182 %183 
                                Private f32* %185 = OpAccessChain %179 %121 
                                                      OpStore %185 %184 
                              Uniform f32_4* %187 = OpAccessChain %21 %186 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %173 
                                         f32 %190 = OpDot %188 %189 
                                Private f32* %191 = OpAccessChain %179 %90 
                                                      OpStore %191 %190 
                              Uniform f32_4* %193 = OpAccessChain %21 %192 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpLoad %173 
                                         f32 %196 = OpDot %194 %195 
                                Private f32* %197 = OpAccessChain %179 %135 
                                                      OpStore %197 %196 
                              Uniform f32_4* %199 = OpAccessChain %21 %198 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpLoad %156 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 0 0 
                                       f32_3 %204 = OpFMul %201 %203 
                                       f32_3 %205 = OpLoad %179 
                                       f32_3 %206 = OpFAdd %204 %205 
                                                      OpStore %156 %206 
                                Private f32* %209 = OpAccessChain %45 %208 
                                                      OpStore %209 %207 
                              Uniform f32_4* %210 = OpAccessChain %21 %24 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %45 
                                         f32 %213 = OpDot %211 %212 
                                Private f32* %214 = OpAccessChain %173 %121 
                                                      OpStore %214 %213 
                              Uniform f32_4* %215 = OpAccessChain %21 %37 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %45 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %173 %90 
                                                      OpStore %219 %218 
                              Uniform f32_4* %220 = OpAccessChain %21 %47 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpLoad %45 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %173 %135 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %156 
                                       f32_4 %226 = OpLoad %173 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                                       f32_3 %228 = OpFAdd %225 %227 
                                                      OpStore %156 %228 
                                       f32_3 %229 = OpLoad %156 
                                       f32_3 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %156 %232 
                                       f32_3 %233 = OpLoad %156 
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
                                Private f32* %267 = OpAccessChain %9 %90 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %270 = OpAccessChain %21 %29 %121 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFMul %268 %271 
                                Private f32* %273 = OpAccessChain %9 %90 
                                                      OpStore %273 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 3 1 
                                       f32_3 %278 = OpFMul %275 %277 
                                       f32_4 %279 = OpLoad %45 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 1 5 6 
                                                      OpStore %45 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_2 %283 = OpVectorShuffle %282 %282 2 3 
                                       f32_4 %284 = OpLoad %281 
                                       f32_4 %285 = OpVectorShuffle %284 %283 0 1 4 5 
                                                      OpStore %281 %285 
                                       f32_4 %286 = OpLoad %45 
                                       f32_2 %287 = OpVectorShuffle %286 %286 2 2 
                                       f32_4 %288 = OpLoad %45 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 3 
                                       f32_2 %290 = OpFAdd %287 %289 
                                       f32_4 %291 = OpLoad %281 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 2 3 
                                                      OpStore %281 %292 
                                                      OpStore %293 %294 
                                 Output f32* %296 = OpAccessChain %94 %29 %90 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFNegate %297 
                                 Output f32* %299 = OpAccessChain %94 %29 %90 
                                                      OpStore %299 %298 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %339 
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
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
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
                              Private f32_3* %302 = OpVariable Private 
                                         i32 %312 = OpConstant 10 
                              Private f32_4* %327 = OpVariable Private 
                                             %338 = OpTypePointer Output %7 
                               Output f32_4* %339 = OpVariable Output 
                                             %352 = OpTypePointer Output %6 
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
                                       f32_3 %303 = OpLoad %237 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %260 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %302 %306 
                                       f32_3 %307 = OpLoad %260 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpLoad %237 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 0 0 
                                       f32_3 %311 = OpFMul %308 %310 
                              Uniform f32_4* %313 = OpAccessChain %32 %312 
                                       f32_4 %314 = OpLoad %313 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %311 %315 
                                                      OpStore %60 %316 
                              Uniform f32_4* %317 = OpAccessChain %32 %312 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 3 3 3 
                                       f32_3 %320 = OpLoad %60 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_3 %322 = OpLoad %302 
                                       f32_3 %323 = OpFAdd %321 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
                                                      OpStore %9 %325 
                                Private f32* %326 = OpAccessChain %20 %22 
                                                      OpStore %326 %47 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %327 %330 
                                       f32_4 %331 = OpLoad %327 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFNegate %332 
                              Uniform f32_4* %334 = OpAccessChain %32 %312 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %333 %336 
                                                      OpStore %237 %337 
                              Uniform f32_4* %340 = OpAccessChain %32 %312 
                                       f32_4 %341 = OpLoad %340 
                                       f32_3 %342 = OpVectorShuffle %341 %341 3 3 3 
                                       f32_3 %343 = OpLoad %237 
                                       f32_3 %344 = OpFMul %342 %343 
                                       f32_4 %345 = OpLoad %327 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFAdd %344 %346 
                                       f32_4 %348 = OpLoad %339 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                      OpStore %339 %349 
                                Private f32* %350 = OpAccessChain %327 %22 
                                         f32 %351 = OpLoad %350 
                                 Output f32* %353 = OpAccessChain %339 %22 
                                                      OpStore %353 %351 
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
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
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
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 286
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %116 %155 %158 %277 
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
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %277 Location 277 
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
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 7 
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
                                         i32 %106 = OpConstant 8 
                                             %115 = OpTypePointer Input %53 
                                Input f32_3* %116 = OpVariable Input 
                                         i32 %118 = OpConstant 6 
                                         u32 %123 = OpConstant 0 
                                             %124 = OpTypePointer Private %6 
                                         u32 %137 = OpConstant 2 
                                Private f32* %139 = OpVariable Private 
                                             %154 = OpTypePointer Output %53 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_3* %158 = OpVariable Output 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         f32 %211 = OpConstant 3.67402E-40 
                                       f32_4 %212 = OpConstantComposite %211 %211 %211 %211 
                                         f32 %220 = OpConstant 3.67402E-40 
                                       f32_4 %221 = OpConstantComposite %220 %220 %220 %220 
                                         f32 %229 = OpConstant 3.67402E-40 
                                       f32_4 %230 = OpConstantComposite %229 %229 %229 %229 
                                         i32 %237 = OpConstant 4 
                               Output f32_3* %277 = OpVariable Output 
                                             %280 = OpTypePointer Output %6 
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
                                       f32_4 %162 = OpVectorShuffle %161 %161 1 1 1 1 
                                       f32_4 %163 = OpFNegate %162 
                              Uniform f32_4* %164 = OpAccessChain %23 %26 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpFAdd %163 %165 
                                                      OpStore %65 %166 
                                       f32_4 %168 = OpLoad %47 
                                       f32_4 %169 = OpVectorShuffle %168 %168 1 1 1 1 
                                       f32_4 %170 = OpLoad %65 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %167 %171 
                                       f32_4 %172 = OpLoad %65 
                                       f32_4 %173 = OpLoad %65 
                                       f32_4 %174 = OpFMul %172 %173 
                                                      OpStore %65 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 0 0 0 
                                       f32_4 %178 = OpFNegate %177 
                              Uniform f32_4* %179 = OpAccessChain %23 %31 
                                       f32_4 %180 = OpLoad %179 
                                       f32_4 %181 = OpFAdd %178 %180 
                                                      OpStore %175 %181 
                                       f32_4 %182 = OpLoad %9 
                                       f32_4 %183 = OpVectorShuffle %182 %182 2 2 2 2 
                                       f32_4 %184 = OpFNegate %183 
                              Uniform f32_4* %185 = OpAccessChain %23 %39 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpFAdd %184 %186 
                                                      OpStore %9 %187 
                                       f32_4 %188 = OpLoad %175 
                                       f32_4 %189 = OpLoad %47 
                                       f32_4 %190 = OpVectorShuffle %189 %189 0 0 0 0 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %167 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %167 %193 
                                       f32_4 %194 = OpLoad %9 
                                       f32_4 %195 = OpLoad %47 
                                       f32_4 %196 = OpVectorShuffle %195 %195 2 2 2 2 
                                       f32_4 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %167 
                                       f32_4 %199 = OpFAdd %197 %198 
                                                      OpStore %47 %199 
                                       f32_4 %200 = OpLoad %175 
                                       f32_4 %201 = OpLoad %175 
                                       f32_4 %202 = OpFMul %200 %201 
                                       f32_4 %203 = OpLoad %65 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %65 %204 
                                       f32_4 %205 = OpLoad %9 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpFMul %205 %206 
                                       f32_4 %208 = OpLoad %65 
                                       f32_4 %209 = OpFAdd %207 %208 
                                                      OpStore %9 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 40 %210 %212 
                                                      OpStore %9 %213 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpExtInst %1 32 %214 
                                                      OpStore %65 %215 
                                       f32_4 %216 = OpLoad %9 
                              Uniform f32_4* %217 = OpAccessChain %23 %49 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpFMul %216 %218 
                                       f32_4 %222 = OpFAdd %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %9 
                                       f32_4 %224 = OpFDiv %221 %223 
                                                      OpStore %9 %224 
                                       f32_4 %225 = OpLoad %47 
                                       f32_4 %226 = OpLoad %65 
                                       f32_4 %227 = OpFMul %225 %226 
                                                      OpStore %47 %227 
                                       f32_4 %228 = OpLoad %47 
                                       f32_4 %231 = OpExtInst %1 40 %228 %230 
                                                      OpStore %47 %231 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpLoad %47 
                                       f32_4 %234 = OpFMul %232 %233 
                                                      OpStore %9 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 1 1 1 
                              Uniform f32_4* %238 = OpAccessChain %23 %237 %26 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpFMul %236 %240 
                                       f32_4 %242 = OpLoad %47 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %47 %243 
                              Uniform f32_4* %244 = OpAccessChain %23 %237 %31 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                       f32_4 %247 = OpLoad %9 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                                       f32_3 %249 = OpFMul %246 %248 
                                       f32_4 %250 = OpLoad %47 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpFAdd %249 %251 
                                       f32_4 %253 = OpLoad %47 
                                       f32_4 %254 = OpVectorShuffle %253 %252 4 5 6 3 
                                                      OpStore %47 %254 
                              Uniform f32_4* %255 = OpAccessChain %23 %237 %39 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_4 %258 = OpLoad %9 
                                       f32_3 %259 = OpVectorShuffle %258 %258 2 2 2 
                                       f32_3 %260 = OpFMul %257 %259 
                                       f32_4 %261 = OpLoad %47 
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
                                       f32_4 %278 = OpLoad %9 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                                      OpStore %277 %279 
                                 Output f32* %281 = OpAccessChain %90 %31 %86 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFNegate %282 
                                 Output f32* %284 = OpAccessChain %90 %31 %86 
                                                      OpStore %284 %283 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 245
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %229 
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
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %229 Location 229 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
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
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %202 = OpConstant 6 
                              Private f32_4* %217 = OpVariable Private 
                                             %228 = OpTypePointer Output %7 
                               Output f32_4* %229 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
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
                                       f32_3 %193 = OpLoad %167 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpLoad %184 
                                       f32_3 %196 = OpFMul %194 %195 
                                                      OpStore %192 %196 
                                       f32_3 %197 = OpLoad %184 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpLoad %167 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 0 0 
                                       f32_3 %201 = OpFMul %198 %200 
                              Uniform f32_4* %203 = OpAccessChain %31 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %201 %205 
                                                      OpStore %109 %206 
                              Uniform f32_4* %207 = OpAccessChain %31 %202 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 3 3 3 
                                       f32_3 %210 = OpLoad %109 
                                       f32_3 %211 = OpFMul %209 %210 
                                       f32_3 %212 = OpLoad %192 
                                       f32_3 %213 = OpFAdd %211 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %9 %215 
                                Private f32* %216 = OpAccessChain %20 %22 
                                                      OpStore %216 %46 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpLoad %20 
                                       f32_4 %220 = OpFAdd %218 %219 
                                                      OpStore %217 %220 
                                       f32_4 %221 = OpLoad %217 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFNegate %222 
                              Uniform f32_4* %224 = OpAccessChain %31 %202 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFAdd %223 %226 
                                                      OpStore %167 %227 
                              Uniform f32_4* %230 = OpAccessChain %31 %202 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 3 3 3 
                                       f32_3 %233 = OpLoad %167 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_4 %235 = OpLoad %217 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFAdd %234 %236 
                                       f32_4 %238 = OpLoad %229 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %229 %239 
                                Private f32* %240 = OpAccessChain %217 %22 
                                         f32 %241 = OpLoad %240 
                                 Output f32* %243 = OpAccessChain %229 %22 
                                                      OpStore %243 %241 
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 388
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %116 %155 %158 %379 
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
                                             %382 = OpTypePointer Output %6 
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
                                 Output f32* %383 = OpAccessChain %90 %31 %86 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFNegate %384 
                                 Output f32* %386 = OpAccessChain %90 %31 %86 
                                                      OpStore %386 %385 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 245
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %179 %229 
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
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %229 Location 229 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
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
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %202 = OpConstant 6 
                              Private f32_4* %217 = OpVariable Private 
                                             %228 = OpTypePointer Output %7 
                               Output f32_4* %229 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
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
                                       f32_3 %193 = OpLoad %167 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpLoad %184 
                                       f32_3 %196 = OpFMul %194 %195 
                                                      OpStore %192 %196 
                                       f32_3 %197 = OpLoad %184 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpLoad %167 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 0 0 
                                       f32_3 %201 = OpFMul %198 %200 
                              Uniform f32_4* %203 = OpAccessChain %31 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %201 %205 
                                                      OpStore %109 %206 
                              Uniform f32_4* %207 = OpAccessChain %31 %202 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 3 3 3 
                                       f32_3 %210 = OpLoad %109 
                                       f32_3 %211 = OpFMul %209 %210 
                                       f32_3 %212 = OpLoad %192 
                                       f32_3 %213 = OpFAdd %211 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %9 %215 
                                Private f32* %216 = OpAccessChain %20 %22 
                                                      OpStore %216 %46 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpLoad %20 
                                       f32_4 %220 = OpFAdd %218 %219 
                                                      OpStore %217 %220 
                                       f32_4 %221 = OpLoad %217 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFNegate %222 
                              Uniform f32_4* %224 = OpAccessChain %31 %202 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFAdd %223 %226 
                                                      OpStore %167 %227 
                              Uniform f32_4* %230 = OpAccessChain %31 %202 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 3 3 3 
                                       f32_3 %233 = OpLoad %167 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_4 %235 = OpLoad %217 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFAdd %234 %236 
                                       f32_4 %238 = OpLoad %229 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %229 %239 
                                Private f32* %240 = OpAccessChain %217 %22 
                                         f32 %241 = OpLoad %240 
                                 Output f32* %243 = OpAccessChain %229 %22 
                                                      OpStore %243 %241 
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
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
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
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 321
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %97 %103 %104 %117 %156 %159 %280 %302 %314 
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
                                                      OpMemberDecorate %95 0 BuiltIn 95 
                                                      OpMemberDecorate %95 1 BuiltIn 95 
                                                      OpMemberDecorate %95 2 BuiltIn 95 
                                                      OpDecorate %95 Block 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 Location 104 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %302 Location 302 
                                                      OpDecorate %314 Location 314 
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
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 8 
                                          u32 %93 = OpConstant 1 
                                              %94 = OpTypeArray %6 %93 
                                              %95 = OpTypeStruct %7 %6 %94 
                                              %96 = OpTypePointer Output %95 
         Output struct {f32_4; f32; f32[1];}* %97 = OpVariable Output 
                                              %99 = OpTypePointer Output %7 
                                             %101 = OpTypeVector %6 2 
                                             %102 = OpTypePointer Output %101 
                               Output f32_2* %103 = OpVariable Output 
                                Input f32_4* %104 = OpVariable Input 
                                         i32 %107 = OpConstant 9 
                                             %116 = OpTypePointer Input %53 
                                Input f32_3* %117 = OpVariable Input 
                                         i32 %119 = OpConstant 7 
                                         u32 %124 = OpConstant 0 
                                             %125 = OpTypePointer Private %6 
                                         u32 %138 = OpConstant 2 
                                Private f32* %140 = OpVariable Private 
                                             %155 = OpTypePointer Output %53 
                               Output f32_3* %156 = OpVariable Output 
                               Output f32_3* %159 = OpVariable Output 
                              Private f32_4* %162 = OpVariable Private 
                              Private f32_4* %169 = OpVariable Private 
                              Private f32_4* %177 = OpVariable Private 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_4 %214 = OpConstantComposite %213 %213 %213 %213 
                                         i32 %219 = OpConstant 4 
                                         f32 %223 = OpConstant 3.67402E-40 
                                       f32_4 %224 = OpConstantComposite %223 %223 %223 %223 
                                         f32 %232 = OpConstant 3.67402E-40 
                                       f32_4 %233 = OpConstantComposite %232 %232 %232 %232 
                                         i32 %240 = OpConstant 5 
                               Output f32_3* %280 = OpVariable Output 
                                             %285 = OpTypePointer Uniform %6 
                                         f32 %292 = OpConstant 3.67402E-40 
                                         u32 %294 = OpConstant 3 
                                       f32_2 %298 = OpConstantComposite %292 %292 
                               Output f32_4* %302 = OpVariable Output 
                               Output f32_4* %314 = OpVariable Output 
                                             %315 = OpTypePointer Output %6 
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
                               Uniform f32_4* %86 = OpAccessChain %23 %68 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %65 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %47 %92 
                                        f32_4 %98 = OpLoad %47 
                               Output f32_4* %100 = OpAccessChain %97 %31 
                                                      OpStore %100 %98 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                              Uniform f32_4* %108 = OpAccessChain %23 %107 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %111 = OpFMul %106 %110 
                              Uniform f32_4* %112 = OpAccessChain %23 %107 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 2 3 
                                       f32_2 %115 = OpFAdd %111 %114 
                                                      OpStore %103 %115 
                                       f32_3 %118 = OpLoad %117 
                              Uniform f32_4* %120 = OpAccessChain %23 %119 %31 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %118 %122 
                                Private f32* %126 = OpAccessChain %65 %124 
                                                      OpStore %126 %123 
                                       f32_3 %127 = OpLoad %117 
                              Uniform f32_4* %128 = OpAccessChain %23 %119 %26 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %132 = OpAccessChain %65 %93 
                                                      OpStore %132 %131 
                                       f32_3 %133 = OpLoad %117 
                              Uniform f32_4* %134 = OpAccessChain %23 %119 %39 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %133 %136 
                                Private f32* %139 = OpAccessChain %65 %138 
                                                      OpStore %139 %137 
                                       f32_4 %141 = OpLoad %65 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_4 %143 = OpLoad %65 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %142 %144 
                                                      OpStore %140 %145 
                                         f32 %146 = OpLoad %140 
                                         f32 %147 = OpExtInst %1 32 %146 
                                                      OpStore %140 %147 
                                         f32 %148 = OpLoad %140 
                                       f32_3 %149 = OpCompositeConstruct %148 %148 %148 
                                       f32_4 %150 = OpLoad %65 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %65 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %65 %154 
                                       f32_4 %157 = OpLoad %65 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                                      OpStore %159 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                                       f32_4 %165 = OpFNegate %164 
                              Uniform f32_4* %166 = OpAccessChain %23 %39 
                                       f32_4 %167 = OpLoad %166 
                                       f32_4 %168 = OpFAdd %165 %167 
                                                      OpStore %162 %168 
                                       f32_4 %170 = OpLoad %65 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                                       f32_4 %172 = OpLoad %162 
                                       f32_4 %173 = OpFMul %171 %172 
                                                      OpStore %169 %173 
                                       f32_4 %174 = OpLoad %162 
                                       f32_4 %175 = OpLoad %162 
                                       f32_4 %176 = OpFMul %174 %175 
                                                      OpStore %162 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFNegate %179 
                              Uniform f32_4* %181 = OpAccessChain %23 %26 
                                       f32_4 %182 = OpLoad %181 
                                       f32_4 %183 = OpFAdd %180 %182 
                                                      OpStore %177 %183 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %184 2 2 2 2 
                                       f32_4 %186 = OpFNegate %185 
                              Uniform f32_4* %187 = OpAccessChain %23 %49 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                                                      OpStore %9 %189 
                                       f32_4 %190 = OpLoad %177 
                                       f32_4 %191 = OpLoad %65 
                                       f32_4 %192 = OpVectorShuffle %191 %191 0 0 0 0 
                                       f32_4 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpFAdd %193 %194 
                                                      OpStore %169 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_4 %197 = OpLoad %65 
                                       f32_4 %198 = OpVectorShuffle %197 %197 2 2 2 2 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %169 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %65 %201 
                                       f32_4 %202 = OpLoad %177 
                                       f32_4 %203 = OpLoad %177 
                                       f32_4 %204 = OpFMul %202 %203 
                                       f32_4 %205 = OpLoad %162 
                                       f32_4 %206 = OpFAdd %204 %205 
                                                      OpStore %162 %206 
                                       f32_4 %207 = OpLoad %9 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpFMul %207 %208 
                                       f32_4 %210 = OpLoad %162 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %215 = OpExtInst %1 40 %212 %214 
                                                      OpStore %9 %215 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpExtInst %1 32 %216 
                                                      OpStore %162 %217 
                                       f32_4 %218 = OpLoad %9 
                              Uniform f32_4* %220 = OpAccessChain %23 %219 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpFMul %218 %221 
                                       f32_4 %225 = OpFAdd %222 %224 
                                                      OpStore %9 %225 
                                       f32_4 %226 = OpLoad %9 
                                       f32_4 %227 = OpFDiv %224 %226 
                                                      OpStore %9 %227 
                                       f32_4 %228 = OpLoad %65 
                                       f32_4 %229 = OpLoad %162 
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
                                       f32_4 %281 = OpLoad %9 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                                      OpStore %280 %282 
                                Private f32* %283 = OpAccessChain %47 %93 
                                         f32 %284 = OpLoad %283 
                                Uniform f32* %286 = OpAccessChain %23 %31 %124 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFMul %284 %287 
                                Private f32* %289 = OpAccessChain %9 %124 
                                                      OpStore %289 %288 
                                Private f32* %290 = OpAccessChain %9 %124 
                                         f32 %291 = OpLoad %290 
                                         f32 %293 = OpFMul %291 %292 
                                Private f32* %295 = OpAccessChain %9 %294 
                                                      OpStore %295 %293 
                                       f32_4 %296 = OpLoad %47 
                                       f32_2 %297 = OpVectorShuffle %296 %296 0 3 
                                       f32_2 %299 = OpFMul %297 %298 
                                       f32_4 %300 = OpLoad %9 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 1 5 3 
                                                      OpStore %9 %301 
                                       f32_4 %303 = OpLoad %47 
                                       f32_2 %304 = OpVectorShuffle %303 %303 2 3 
                                       f32_4 %305 = OpLoad %302 
                                       f32_4 %306 = OpVectorShuffle %305 %304 0 1 4 5 
                                                      OpStore %302 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_2 %308 = OpVectorShuffle %307 %307 2 2 
                                       f32_4 %309 = OpLoad %9 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 3 
                                       f32_2 %311 = OpFAdd %308 %310 
                                       f32_4 %312 = OpLoad %302 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 2 3 
                                                      OpStore %302 %313 
                                                      OpStore %314 %233 
                                 Output f32* %316 = OpAccessChain %97 %31 %93 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFNegate %317 
                                 Output f32* %319 = OpAccessChain %97 %31 %93 
                                                      OpStore %319 %318 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %339 
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
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
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
                              Private f32_3* %302 = OpVariable Private 
                                         i32 %312 = OpConstant 10 
                              Private f32_4* %327 = OpVariable Private 
                                             %338 = OpTypePointer Output %7 
                               Output f32_4* %339 = OpVariable Output 
                                             %352 = OpTypePointer Output %6 
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
                                       f32_3 %303 = OpLoad %237 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %260 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %302 %306 
                                       f32_3 %307 = OpLoad %260 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpLoad %237 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 0 0 
                                       f32_3 %311 = OpFMul %308 %310 
                              Uniform f32_4* %313 = OpAccessChain %32 %312 
                                       f32_4 %314 = OpLoad %313 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %311 %315 
                                                      OpStore %60 %316 
                              Uniform f32_4* %317 = OpAccessChain %32 %312 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 3 3 3 
                                       f32_3 %320 = OpLoad %60 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_3 %322 = OpLoad %302 
                                       f32_3 %323 = OpFAdd %321 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
                                                      OpStore %9 %325 
                                Private f32* %326 = OpAccessChain %20 %22 
                                                      OpStore %326 %47 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %327 %330 
                                       f32_4 %331 = OpLoad %327 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFNegate %332 
                              Uniform f32_4* %334 = OpAccessChain %32 %312 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %333 %336 
                                                      OpStore %237 %337 
                              Uniform f32_4* %340 = OpAccessChain %32 %312 
                                       f32_4 %341 = OpLoad %340 
                                       f32_3 %342 = OpVectorShuffle %341 %341 3 3 3 
                                       f32_3 %343 = OpLoad %237 
                                       f32_3 %344 = OpFMul %342 %343 
                                       f32_4 %345 = OpLoad %327 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFAdd %344 %346 
                                       f32_4 %348 = OpLoad %339 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                      OpStore %339 %349 
                                Private f32* %350 = OpAccessChain %327 %22 
                                         f32 %351 = OpLoad %350 
                                 Output f32* %353 = OpAccessChain %339 %22 
                                                      OpStore %353 %351 
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
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat21;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
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
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9 = min(u_xlat1.x, u_xlat9);
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : u_xlat1.x;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat1.xxx * u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat5.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 423
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %97 %103 %104 %117 %156 %159 %383 %404 %416 
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
                                                      OpMemberDecorate %95 0 BuiltIn 95 
                                                      OpMemberDecorate %95 1 BuiltIn 95 
                                                      OpMemberDecorate %95 2 BuiltIn 95 
                                                      OpDecorate %95 Block 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 Location 104 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %383 Location 383 
                                                      OpDecorate %404 Location 404 
                                                      OpDecorate %416 Location 416 
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
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 15 
                                          u32 %93 = OpConstant 1 
                                              %94 = OpTypeArray %6 %93 
                                              %95 = OpTypeStruct %7 %6 %94 
                                              %96 = OpTypePointer Output %95 
         Output struct {f32_4; f32; f32[1];}* %97 = OpVariable Output 
                                              %99 = OpTypePointer Output %7 
                                             %101 = OpTypeVector %6 2 
                                             %102 = OpTypePointer Output %101 
                               Output f32_2* %103 = OpVariable Output 
                                Input f32_4* %104 = OpVariable Input 
                                         i32 %107 = OpConstant 16 
                                             %116 = OpTypePointer Input %53 
                                Input f32_3* %117 = OpVariable Input 
                                         i32 %119 = OpConstant 14 
                                         u32 %124 = OpConstant 0 
                                             %125 = OpTypePointer Private %6 
                                         u32 %138 = OpConstant 2 
                                Private f32* %140 = OpVariable Private 
                                             %155 = OpTypePointer Output %53 
                               Output f32_3* %156 = OpVariable Output 
                               Output f32_3* %159 = OpVariable Output 
                                             %162 = OpTypePointer Private %53 
                              Private f32_3* %163 = OpVariable Private 
                              Private f32_4* %180 = OpVariable Private 
                              Private f32_3* %186 = OpVariable Private 
                                         i32 %187 = OpConstant 9 
                                         i32 %193 = OpConstant 10 
                                         i32 %199 = OpConstant 11 
                                         i32 %205 = OpConstant 12 
                                         f32 %214 = OpConstant 3.67402E-40 
                                         u32 %215 = OpConstant 3 
                                         i32 %217 = OpConstant 6 
                                         i32 %223 = OpConstant 7 
                                         i32 %229 = OpConstant 8 
                                         f32 %240 = OpConstant 3.67402E-40 
                                       f32_3 %241 = OpConstantComposite %240 %240 %240 
                              Private f32_3* %243 = OpVariable Private 
                                         f32 %247 = OpConstant 3.67402E-40 
                                       f32_3 %248 = OpConstantComposite %247 %247 %247 
                                         f32 %253 = OpConstant 3.67402E-40 
                                       f32_3 %254 = OpConstantComposite %253 %253 %253 
                                         f32 %256 = OpConstant 3.67402E-40 
                                       f32_3 %257 = OpConstantComposite %256 %256 %256 
                              Private f32_4* %261 = OpVariable Private 
                              Private f32_4* %268 = OpVariable Private 
                              Private f32_4* %276 = OpVariable Private 
                                         f32 %312 = OpConstant 3.67402E-40 
                                       f32_4 %313 = OpConstantComposite %312 %312 %312 %312 
                                         i32 %318 = OpConstant 4 
                                       f32_4 %322 = OpConstantComposite %214 %214 %214 %214 
                                       f32_4 %330 = OpConstantComposite %240 %240 %240 %240 
                                         i32 %337 = OpConstant 5 
                               Output f32_3* %383 = OpVariable Output 
                                             %388 = OpTypePointer Uniform %6 
                                         f32 %395 = OpConstant 3.67402E-40 
                                       f32_2 %400 = OpConstantComposite %395 %395 
                               Output f32_4* %404 = OpVariable Output 
                               Output f32_4* %416 = OpVariable Output 
                                             %417 = OpTypePointer Output %6 
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
                               Uniform f32_4* %86 = OpAccessChain %23 %68 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %65 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %47 %92 
                                        f32_4 %98 = OpLoad %47 
                               Output f32_4* %100 = OpAccessChain %97 %31 
                                                      OpStore %100 %98 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                              Uniform f32_4* %108 = OpAccessChain %23 %107 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %111 = OpFMul %106 %110 
                              Uniform f32_4* %112 = OpAccessChain %23 %107 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 2 3 
                                       f32_2 %115 = OpFAdd %111 %114 
                                                      OpStore %103 %115 
                                       f32_3 %118 = OpLoad %117 
                              Uniform f32_4* %120 = OpAccessChain %23 %119 %31 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpDot %118 %122 
                                Private f32* %126 = OpAccessChain %65 %124 
                                                      OpStore %126 %123 
                                       f32_3 %127 = OpLoad %117 
                              Uniform f32_4* %128 = OpAccessChain %23 %119 %26 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %132 = OpAccessChain %65 %93 
                                                      OpStore %132 %131 
                                       f32_3 %133 = OpLoad %117 
                              Uniform f32_4* %134 = OpAccessChain %23 %119 %39 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %133 %136 
                                Private f32* %139 = OpAccessChain %65 %138 
                                                      OpStore %139 %137 
                                       f32_4 %141 = OpLoad %65 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_4 %143 = OpLoad %65 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %142 %144 
                                                      OpStore %140 %145 
                                         f32 %146 = OpLoad %140 
                                         f32 %147 = OpExtInst %1 32 %146 
                                                      OpStore %140 %147 
                                         f32 %148 = OpLoad %140 
                                       f32_3 %149 = OpCompositeConstruct %148 %148 %148 
                                       f32_4 %150 = OpLoad %65 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %65 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %65 %154 
                                       f32_4 %157 = OpLoad %65 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                                      OpStore %159 %161 
                                Private f32* %164 = OpAccessChain %65 %93 
                                         f32 %165 = OpLoad %164 
                                Private f32* %166 = OpAccessChain %65 %93 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFMul %165 %167 
                                Private f32* %169 = OpAccessChain %163 %124 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %65 %124 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %65 %124 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %171 %173 
                                Private f32* %175 = OpAccessChain %163 %124 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                         f32 %178 = OpFAdd %174 %177 
                                Private f32* %179 = OpAccessChain %163 %124 
                                                      OpStore %179 %178 
                                       f32_4 %181 = OpLoad %65 
                                       f32_4 %182 = OpVectorShuffle %181 %181 1 2 2 0 
                                       f32_4 %183 = OpLoad %65 
                                       f32_4 %184 = OpVectorShuffle %183 %183 0 1 2 2 
                                       f32_4 %185 = OpFMul %182 %184 
                                                      OpStore %180 %185 
                              Uniform f32_4* %188 = OpAccessChain %23 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %180 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %186 %124 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %23 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %180 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %186 %93 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %23 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %180 
                                         f32 %203 = OpDot %201 %202 
                                Private f32* %204 = OpAccessChain %186 %138 
                                                      OpStore %204 %203 
                              Uniform f32_4* %206 = OpAccessChain %23 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpLoad %163 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %208 %210 
                                       f32_3 %212 = OpLoad %186 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %163 %213 
                                Private f32* %216 = OpAccessChain %65 %215 
                                                      OpStore %216 %214 
                              Uniform f32_4* %218 = OpAccessChain %23 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %65 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %180 %124 
                                                      OpStore %222 %221 
                              Uniform f32_4* %224 = OpAccessChain %23 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %65 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %180 %93 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %23 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %65 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %180 %138 
                                                      OpStore %234 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_4 %236 = OpLoad %180 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                                      OpStore %163 %238 
                                       f32_3 %239 = OpLoad %163 
                                       f32_3 %242 = OpExtInst %1 40 %239 %241 
                                                      OpStore %163 %242 
                                       f32_3 %244 = OpLoad %163 
                                       f32_3 %245 = OpExtInst %1 30 %244 
                                                      OpStore %243 %245 
                                       f32_3 %246 = OpLoad %243 
                                       f32_3 %249 = OpFMul %246 %248 
                                                      OpStore %243 %249 
                                       f32_3 %250 = OpLoad %243 
                                       f32_3 %251 = OpExtInst %1 29 %250 
                                                      OpStore %243 %251 
                                       f32_3 %252 = OpLoad %243 
                                       f32_3 %255 = OpFMul %252 %254 
                                       f32_3 %258 = OpFAdd %255 %257 
                                                      OpStore %243 %258 
                                       f32_3 %259 = OpLoad %243 
                                       f32_3 %260 = OpExtInst %1 40 %259 %241 
                                                      OpStore %243 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %263 = OpVectorShuffle %262 %262 1 1 1 1 
                                       f32_4 %264 = OpFNegate %263 
                              Uniform f32_4* %265 = OpAccessChain %23 %39 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpFAdd %264 %266 
                                                      OpStore %261 %267 
                                       f32_4 %269 = OpLoad %65 
                                       f32_4 %270 = OpVectorShuffle %269 %269 1 1 1 1 
                                       f32_4 %271 = OpLoad %261 
                                       f32_4 %272 = OpFMul %270 %271 
                                                      OpStore %268 %272 
                                       f32_4 %273 = OpLoad %261 
                                       f32_4 %274 = OpLoad %261 
                                       f32_4 %275 = OpFMul %273 %274 
                                                      OpStore %261 %275 
                                       f32_4 %277 = OpLoad %9 
                                       f32_4 %278 = OpVectorShuffle %277 %277 0 0 0 0 
                                       f32_4 %279 = OpFNegate %278 
                              Uniform f32_4* %280 = OpAccessChain %23 %26 
                                       f32_4 %281 = OpLoad %280 
                                       f32_4 %282 = OpFAdd %279 %281 
                                                      OpStore %276 %282 
                                       f32_4 %283 = OpLoad %9 
                                       f32_4 %284 = OpVectorShuffle %283 %283 2 2 2 2 
                                       f32_4 %285 = OpFNegate %284 
                              Uniform f32_4* %286 = OpAccessChain %23 %49 
                                       f32_4 %287 = OpLoad %286 
                                       f32_4 %288 = OpFAdd %285 %287 
                                                      OpStore %9 %288 
                                       f32_4 %289 = OpLoad %276 
                                       f32_4 %290 = OpLoad %65 
                                       f32_4 %291 = OpVectorShuffle %290 %290 0 0 0 0 
                                       f32_4 %292 = OpFMul %289 %291 
                                       f32_4 %293 = OpLoad %268 
                                       f32_4 %294 = OpFAdd %292 %293 
                                                      OpStore %268 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpLoad %65 
                                       f32_4 %297 = OpVectorShuffle %296 %296 2 2 2 2 
                                       f32_4 %298 = OpFMul %295 %297 
                                       f32_4 %299 = OpLoad %268 
                                       f32_4 %300 = OpFAdd %298 %299 
                                                      OpStore %65 %300 
                                       f32_4 %301 = OpLoad %276 
                                       f32_4 %302 = OpLoad %276 
                                       f32_4 %303 = OpFMul %301 %302 
                                       f32_4 %304 = OpLoad %261 
                                       f32_4 %305 = OpFAdd %303 %304 
                                                      OpStore %261 %305 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %307 = OpLoad %9 
                                       f32_4 %308 = OpFMul %306 %307 
                                       f32_4 %309 = OpLoad %261 
                                       f32_4 %310 = OpFAdd %308 %309 
                                                      OpStore %9 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %314 = OpExtInst %1 40 %311 %313 
                                                      OpStore %9 %314 
                                       f32_4 %315 = OpLoad %9 
                                       f32_4 %316 = OpExtInst %1 32 %315 
                                                      OpStore %261 %316 
                                       f32_4 %317 = OpLoad %9 
                              Uniform f32_4* %319 = OpAccessChain %23 %318 
                                       f32_4 %320 = OpLoad %319 
                                       f32_4 %321 = OpFMul %317 %320 
                                       f32_4 %323 = OpFAdd %321 %322 
                                                      OpStore %9 %323 
                                       f32_4 %324 = OpLoad %9 
                                       f32_4 %325 = OpFDiv %322 %324 
                                                      OpStore %9 %325 
                                       f32_4 %326 = OpLoad %65 
                                       f32_4 %327 = OpLoad %261 
                                       f32_4 %328 = OpFMul %326 %327 
                                                      OpStore %65 %328 
                                       f32_4 %329 = OpLoad %65 
                                       f32_4 %331 = OpExtInst %1 40 %329 %330 
                                                      OpStore %65 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpLoad %65 
                                       f32_4 %334 = OpFMul %332 %333 
                                                      OpStore %9 %334 
                                       f32_4 %335 = OpLoad %9 
                                       f32_3 %336 = OpVectorShuffle %335 %335 1 1 1 
                              Uniform f32_4* %338 = OpAccessChain %23 %337 %26 
                                       f32_4 %339 = OpLoad %338 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                       f32_3 %341 = OpFMul %336 %340 
                                       f32_4 %342 = OpLoad %65 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 6 3 
                                                      OpStore %65 %343 
                              Uniform f32_4* %344 = OpAccessChain %23 %337 %31 
                                       f32_4 %345 = OpLoad %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_4 %347 = OpLoad %9 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_4 %350 = OpLoad %65 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_3 %352 = OpFAdd %349 %351 
                                       f32_4 %353 = OpLoad %65 
                                       f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                      OpStore %65 %354 
                              Uniform f32_4* %355 = OpAccessChain %23 %337 %39 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 2 2 2 
                                       f32_3 %360 = OpFMul %357 %359 
                                       f32_4 %361 = OpLoad %65 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFAdd %360 %362 
                                       f32_4 %364 = OpLoad %9 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %9 %365 
                              Uniform f32_4* %366 = OpAccessChain %23 %337 %49 
                                       f32_4 %367 = OpLoad %366 
                                       f32_3 %368 = OpVectorShuffle %367 %367 0 1 2 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 3 3 3 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                                       f32_4 %377 = OpLoad %9 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpLoad %243 
                                       f32_3 %380 = OpFAdd %378 %379 
                                       f32_4 %381 = OpLoad %9 
                                       f32_4 %382 = OpVectorShuffle %381 %380 4 5 6 3 
                                                      OpStore %9 %382 
                                       f32_4 %384 = OpLoad %9 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                                      OpStore %383 %385 
                                Private f32* %386 = OpAccessChain %47 %93 
                                         f32 %387 = OpLoad %386 
                                Uniform f32* %389 = OpAccessChain %23 %31 %124 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFMul %387 %390 
                                Private f32* %392 = OpAccessChain %9 %124 
                                                      OpStore %392 %391 
                                Private f32* %393 = OpAccessChain %9 %124 
                                         f32 %394 = OpLoad %393 
                                         f32 %396 = OpFMul %394 %395 
                                Private f32* %397 = OpAccessChain %9 %215 
                                                      OpStore %397 %396 
                                       f32_4 %398 = OpLoad %47 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 3 
                                       f32_2 %401 = OpFMul %399 %400 
                                       f32_4 %402 = OpLoad %9 
                                       f32_4 %403 = OpVectorShuffle %402 %401 4 1 5 3 
                                                      OpStore %9 %403 
                                       f32_4 %405 = OpLoad %47 
                                       f32_2 %406 = OpVectorShuffle %405 %405 2 3 
                                       f32_4 %407 = OpLoad %404 
                                       f32_4 %408 = OpVectorShuffle %407 %406 0 1 4 5 
                                                      OpStore %404 %408 
                                       f32_4 %409 = OpLoad %9 
                                       f32_2 %410 = OpVectorShuffle %409 %409 2 2 
                                       f32_4 %411 = OpLoad %9 
                                       f32_2 %412 = OpVectorShuffle %411 %411 0 3 
                                       f32_2 %413 = OpFAdd %410 %412 
                                       f32_4 %414 = OpLoad %404 
                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 2 3 
                                                      OpStore %404 %415 
                                                      OpStore %416 %330 
                                 Output f32* %418 = OpAccessChain %97 %31 %93 
                                         f32 %419 = OpLoad %418 
                                         f32 %420 = OpFNegate %419 
                                 Output f32* %421 = OpAccessChain %97 %31 %93 
                                                      OpStore %421 %420 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 355
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %248 %290 %339 
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
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
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
                              Private f32_3* %302 = OpVariable Private 
                                         i32 %312 = OpConstant 10 
                              Private f32_4* %327 = OpVariable Private 
                                             %338 = OpTypePointer Output %7 
                               Output f32_4* %339 = OpVariable Output 
                                             %352 = OpTypePointer Output %6 
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
                                       f32_3 %303 = OpLoad %237 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %260 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %302 %306 
                                       f32_3 %307 = OpLoad %260 
                                       f32_3 %308 = OpFNegate %307 
                                       f32_3 %309 = OpLoad %237 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 0 0 
                                       f32_3 %311 = OpFMul %308 %310 
                              Uniform f32_4* %313 = OpAccessChain %32 %312 
                                       f32_4 %314 = OpLoad %313 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %311 %315 
                                                      OpStore %60 %316 
                              Uniform f32_4* %317 = OpAccessChain %32 %312 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 3 3 3 
                                       f32_3 %320 = OpLoad %60 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_3 %322 = OpLoad %302 
                                       f32_3 %323 = OpFAdd %321 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
                                                      OpStore %9 %325 
                                Private f32* %326 = OpAccessChain %20 %22 
                                                      OpStore %326 %47 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %327 %330 
                                       f32_4 %331 = OpLoad %327 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFNegate %332 
                              Uniform f32_4* %334 = OpAccessChain %32 %312 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %333 %336 
                                                      OpStore %237 %337 
                              Uniform f32_4* %340 = OpAccessChain %32 %312 
                                       f32_4 %341 = OpLoad %340 
                                       f32_3 %342 = OpVectorShuffle %341 %341 3 3 3 
                                       f32_3 %343 = OpLoad %237 
                                       f32_3 %344 = OpFMul %342 %343 
                                       f32_4 %345 = OpLoad %327 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFAdd %344 %346 
                                       f32_4 %348 = OpLoad %339 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                      OpStore %339 %349 
                                Private f32* %350 = OpAccessChain %327 %22 
                                         f32 %351 = OpLoad %350 
                                 Output f32* %353 = OpAccessChain %339 %22 
                                                      OpStore %353 %351 
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
  GpuProgramID 86410
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
vec3 u_xlat4;
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
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
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
; Bound: 275
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %260 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %39 RelaxedPrecision 
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
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %260 Location 260 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
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
                              Private f32_3* %230 = OpVariable Private 
                              Private f32_3* %235 = OpVariable Private 
                                         i32 %241 = OpConstant 7 
                                             %259 = OpTypePointer Output %7 
                               Output f32_4* %260 = OpVariable Output 
                                             %272 = OpTypePointer Output %6 
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
                                       f32_3 %231 = OpLoad %60 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 0 0 
                                       f32_3 %233 = OpLoad %196 
                                       f32_3 %234 = OpFMul %232 %233 
                                                      OpStore %230 %234 
                                       f32_3 %236 = OpLoad %196 
                                       f32_3 %237 = OpFNegate %236 
                                       f32_3 %238 = OpLoad %60 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
                                       f32_3 %240 = OpFMul %237 %239 
                              Uniform f32_4* %242 = OpAccessChain %32 %241 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFAdd %240 %244 
                                                      OpStore %235 %245 
                              Uniform f32_4* %246 = OpAccessChain %32 %241 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 3 3 3 
                                       f32_3 %249 = OpLoad %235 
                                       f32_3 %250 = OpFMul %248 %249 
                                       f32_3 %251 = OpLoad %230 
                                       f32_3 %252 = OpFAdd %250 %251 
                                                      OpStore %235 %252 
                                       f32_3 %253 = OpLoad %235 
                                       f32_3 %254 = OpFNegate %253 
                              Uniform f32_4* %255 = OpAccessChain %32 %241 
                                       f32_4 %256 = OpLoad %255 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpFAdd %254 %257 
                                                      OpStore %196 %258 
                              Uniform f32_4* %261 = OpAccessChain %32 %241 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpLoad %196 
                                       f32_3 %265 = OpFMul %263 %264 
                                       f32_3 %266 = OpLoad %235 
                                       f32_3 %267 = OpFAdd %265 %266 
                                       f32_4 %268 = OpLoad %260 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %260 %269 
                                Private f32* %270 = OpAccessChain %9 %22 
                                         f32 %271 = OpLoad %270 
                                 Output f32* %273 = OpAccessChain %260 %22 
                                                      OpStore %273 %271 
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
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
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
; Bound: 230
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %78 %215 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %38 RelaxedPrecision 
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
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %215 Location 215 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
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
                              Private f32_3* %185 = OpVariable Private 
                              Private f32_3* %190 = OpVariable Private 
                                         i32 %196 = OpConstant 6 
                                             %214 = OpTypePointer Output %7 
                               Output f32_4* %215 = OpVariable Output 
                                             %227 = OpTypePointer Output %6 
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
                                       f32_3 %186 = OpLoad %167 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 0 0 
                                       f32_3 %188 = OpLoad %177 
                                       f32_3 %189 = OpFMul %187 %188 
                                                      OpStore %185 %189 
                                       f32_3 %191 = OpLoad %177 
                                       f32_3 %192 = OpFNegate %191 
                                       f32_3 %193 = OpLoad %167 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpFMul %192 %194 
                              Uniform f32_4* %197 = OpAccessChain %31 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_3 %200 = OpFAdd %195 %199 
                                                      OpStore %190 %200 
                              Uniform f32_4* %201 = OpAccessChain %31 %196 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 3 3 3 
                                       f32_3 %204 = OpLoad %190 
                                       f32_3 %205 = OpFMul %203 %204 
                                       f32_3 %206 = OpLoad %185 
                                       f32_3 %207 = OpFAdd %205 %206 
                                                      OpStore %190 %207 
                                       f32_3 %208 = OpLoad %190 
                                       f32_3 %209 = OpFNegate %208 
                              Uniform f32_4* %210 = OpAccessChain %31 %196 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFAdd %209 %212 
                                                      OpStore %167 %213 
                              Uniform f32_4* %216 = OpAccessChain %31 %196 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 3 3 3 
                                       f32_3 %219 = OpLoad %167 
                                       f32_3 %220 = OpFMul %218 %219 
                                       f32_3 %221 = OpLoad %190 
                                       f32_3 %222 = OpFAdd %220 %221 
                                       f32_4 %223 = OpLoad %215 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 6 3 
                                                      OpStore %215 %224 
                                Private f32* %225 = OpAccessChain %9 %22 
                                         f32 %226 = OpLoad %225 
                                 Output f32* %228 = OpAccessChain %215 %22 
                                                      OpStore %228 %226 
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
vec3 u_xlat5;
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
    u_xlat5.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
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
; Bound: 319
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %58 %304 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %97 SpecId 97 
                                                      OpDecorate %187 DescriptorSet 187 
                                                      OpDecorate %187 Binding 187 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %230 DescriptorSet 230 
                                                      OpDecorate %230 Binding 230 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %304 Location 304 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
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
                                             %169 = OpTypePointer Private %15 
                              Private f32_2* %170 = OpVariable Private 
                                         u32 %171 = OpConstant 2 
                                         f32 %174 = OpConstant 3.67402E-40 
                                             %184 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %185 = OpTypeSampledImage %184 
                                             %186 = OpTypePointer UniformConstant %185 
 UniformConstant read_only Texture3DSampled* %187 = OpVariable UniformConstant 
                              Private f32_4* %192 = OpVariable Private 
                              Private f32_3* %199 = OpVariable Private 
                               Private bool* %209 = OpVariable Private 
                              Private f32_3* %213 = OpVariable Private 
                                             %214 = OpTypePointer Function %6 
                                       f32_2 %228 = OpConstantComposite %174 %174 
 UniformConstant read_only Texture2DSampled* %230 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %269 = OpConstant 5 
                              Private f32_3* %274 = OpVariable Private 
                              Private f32_3* %279 = OpVariable Private 
                                         i32 %285 = OpConstant 7 
                                             %303 = OpTypePointer Output %7 
                               Output f32_4* %304 = OpVariable Output 
                                             %316 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %135 = OpVariable Function 
                               Function f32* %215 = OpVariable Function 
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
                                                      OpBranchConditional %97 %98 %194 
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
                                Uniform f32* %172 = OpAccessChain %32 %48 %171 
                                         f32 %173 = OpLoad %172 
                                         f32 %175 = OpFMul %173 %174 
                                         f32 %176 = OpFAdd %175 %166 
                                Private f32* %177 = OpAccessChain %170 %86 
                                                      OpStore %177 %176 
                                Private f32* %178 = OpAccessChain %105 %86 
                                         f32 %179 = OpLoad %178 
                                Private f32* %180 = OpAccessChain %170 %86 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpExtInst %1 40 %179 %181 
                                Private f32* %183 = OpAccessChain %133 %86 
                                                      OpStore %183 %182 
                  read_only Texture3DSampled %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %133 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 2 3 
                                       f32_4 %191 = OpImageSampleImplicitLod %188 %190 
                                                      OpStore %133 %191 
                                       f32_4 %193 = OpLoad %133 
                                                      OpStore %192 %193 
                                                      OpBranch %99 
                                             %194 = OpLabel 
                                Private f32* %195 = OpAccessChain %192 %86 
                                                      OpStore %195 %89 
                                Private f32* %196 = OpAccessChain %192 %100 
                                                      OpStore %196 %89 
                                Private f32* %197 = OpAccessChain %192 %171 
                                                      OpStore %197 %89 
                                Private f32* %198 = OpAccessChain %192 %23 
                                                      OpStore %198 %89 
                                                      OpBranch %99 
                                              %99 = OpLabel 
                                       f32_4 %200 = OpLoad %192 
                              Uniform f32_4* %201 = OpAccessChain %32 %47 
                                       f32_4 %202 = OpLoad %201 
                                         f32 %203 = OpDot %200 %202 
                                Private f32* %204 = OpAccessChain %199 %86 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %199 %86 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpExtInst %1 43 %206 %44 %89 
                                Private f32* %208 = OpAccessChain %199 %86 
                                                      OpStore %208 %207 
                                Private f32* %210 = OpAccessChain %56 %171 
                                         f32 %211 = OpLoad %210 
                                        bool %212 = OpFOrdLessThan %44 %211 
                                                      OpStore %209 %212 
                                        bool %216 = OpLoad %209 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %216 %217 %219 
                                             %217 = OpLabel 
                                                      OpStore %215 %89 
                                                      OpBranch %218 
                                             %219 = OpLabel 
                                                      OpStore %215 %44 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                         f32 %220 = OpLoad %215 
                                Private f32* %221 = OpAccessChain %213 %86 
                                                      OpStore %221 %220 
                                       f32_4 %222 = OpLoad %56 
                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                                       f32_4 %224 = OpLoad %56 
                                       f32_2 %225 = OpVectorShuffle %224 %224 3 3 
                                       f32_2 %226 = OpFDiv %223 %225 
                                                      OpStore %170 %226 
                                       f32_2 %227 = OpLoad %170 
                                       f32_2 %229 = OpFAdd %227 %228 
                                                      OpStore %170 %229 
                  read_only Texture2DSampled %231 = OpLoad %230 
                                       f32_2 %232 = OpLoad %170 
                                       f32_4 %233 = OpImageSampleImplicitLod %231 %232 
                                         f32 %234 = OpCompositeExtract %233 3 
                                Private f32* %235 = OpAccessChain %170 %86 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %170 %86 
                                         f32 %237 = OpLoad %236 
                                Private f32* %238 = OpAccessChain %213 %86 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFMul %237 %239 
                                Private f32* %241 = OpAccessChain %213 %86 
                                                      OpStore %241 %240 
                                       f32_4 %242 = OpLoad %56 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_4 %244 = OpLoad %56 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                         f32 %246 = OpDot %243 %245 
                                Private f32* %247 = OpAccessChain %170 %86 
                                                      OpStore %247 %246 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                       f32_2 %250 = OpLoad %170 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 0 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                Private f32* %254 = OpAccessChain %170 %86 
                                                      OpStore %254 %253 
                                Private f32* %255 = OpAccessChain %170 %86 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %213 %86 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Private f32* %260 = OpAccessChain %213 %86 
                                                      OpStore %260 %259 
                                Private f32* %261 = OpAccessChain %199 %86 
                                         f32 %262 = OpLoad %261 
                                Private f32* %263 = OpAccessChain %213 %86 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %262 %264 
                                Private f32* %266 = OpAccessChain %199 %86 
                                                      OpStore %266 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                              Uniform f32_4* %270 = OpAccessChain %32 %269 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFMul %268 %272 
                                                      OpStore %213 %273 
                                       f32_3 %275 = OpLoad %199 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 0 0 
                                       f32_3 %277 = OpLoad %213 
                                       f32_3 %278 = OpFMul %276 %277 
                                                      OpStore %274 %278 
                                       f32_3 %280 = OpLoad %213 
                                       f32_3 %281 = OpFNegate %280 
                                       f32_3 %282 = OpLoad %199 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 0 0 
                                       f32_3 %284 = OpFMul %281 %283 
                              Uniform f32_4* %286 = OpAccessChain %32 %285 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %289 = OpFAdd %284 %288 
                                                      OpStore %279 %289 
                              Uniform f32_4* %290 = OpAccessChain %32 %285 
                                       f32_4 %291 = OpLoad %290 
                                       f32_3 %292 = OpVectorShuffle %291 %291 3 3 3 
                                       f32_3 %293 = OpLoad %279 
                                       f32_3 %294 = OpFMul %292 %293 
                                       f32_3 %295 = OpLoad %274 
                                       f32_3 %296 = OpFAdd %294 %295 
                                                      OpStore %279 %296 
                                       f32_3 %297 = OpLoad %279 
                                       f32_3 %298 = OpFNegate %297 
                              Uniform f32_4* %299 = OpAccessChain %32 %285 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFAdd %298 %301 
                                                      OpStore %199 %302 
                              Uniform f32_4* %305 = OpAccessChain %32 %285 
                                       f32_4 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 3 3 3 
                                       f32_3 %308 = OpLoad %199 
                                       f32_3 %309 = OpFMul %307 %308 
                                       f32_3 %310 = OpLoad %279 
                                       f32_3 %311 = OpFAdd %309 %310 
                                       f32_4 %312 = OpLoad %304 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                                      OpStore %304 %313 
                                Private f32* %314 = OpAccessChain %9 %23 
                                         f32 %315 = OpLoad %314 
                                 Output f32* %317 = OpAccessChain %304 %23 
                                                      OpStore %317 %315 
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
vec3 u_xlat5;
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
    u_xlat5.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
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
; Bound: 287
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %272 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %39 RelaxedPrecision 
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
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %272 Location 272 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
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
                              Private f32_3* %242 = OpVariable Private 
                              Private f32_3* %247 = OpVariable Private 
                                         i32 %253 = OpConstant 7 
                                             %271 = OpTypePointer Output %7 
                               Output f32_4* %272 = OpVariable Output 
                                             %284 = OpTypePointer Output %6 
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
                                       f32_3 %243 = OpLoad %60 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 0 0 
                                       f32_3 %245 = OpLoad %196 
                                       f32_3 %246 = OpFMul %244 %245 
                                                      OpStore %242 %246 
                                       f32_3 %248 = OpLoad %196 
                                       f32_3 %249 = OpFNegate %248 
                                       f32_3 %250 = OpLoad %60 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 0 0 
                                       f32_3 %252 = OpFMul %249 %251 
                              Uniform f32_4* %254 = OpAccessChain %32 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %252 %256 
                                                      OpStore %247 %257 
                              Uniform f32_4* %258 = OpAccessChain %32 %253 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 3 3 3 
                                       f32_3 %261 = OpLoad %247 
                                       f32_3 %262 = OpFMul %260 %261 
                                       f32_3 %263 = OpLoad %242 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %247 %264 
                                       f32_3 %265 = OpLoad %247 
                                       f32_3 %266 = OpFNegate %265 
                              Uniform f32_4* %267 = OpAccessChain %32 %253 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpFAdd %266 %269 
                                                      OpStore %196 %270 
                              Uniform f32_4* %273 = OpAccessChain %32 %253 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 3 3 3 
                                       f32_3 %276 = OpLoad %196 
                                       f32_3 %277 = OpFMul %275 %276 
                                       f32_3 %278 = OpLoad %247 
                                       f32_3 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %272 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %272 %281 
                                Private f32* %282 = OpAccessChain %9 %22 
                                         f32 %283 = OpLoad %282 
                                 Output f32* %285 = OpAccessChain %272 %22 
                                                      OpStore %285 %283 
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
vec3 u_xlat4;
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
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
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
; Bound: 270
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %62 %255 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %39 RelaxedPrecision 
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
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
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
                                              %59 = OpTypePointer Private %15 
                               Private f32_2* %60 = OpVariable Private 
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
                                             %112 = OpTypePointer Private %28 
                              Private f32_3* %113 = OpVariable Private 
                                             %141 = OpTypePointer Function %28 
                                         i32 %151 = OpConstant 4 
                                             %152 = OpTypePointer Uniform %28 
                              Private f32_4* %157 = OpVariable Private 
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
                              Private f32_3* %196 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %206 = OpVariable UniformConstant 
                                         i32 %220 = OpConstant 5 
                              Private f32_3* %225 = OpVariable Private 
                              Private f32_3* %230 = OpVariable Private 
                                         i32 %236 = OpConstant 7 
                                             %254 = OpTypePointer Output %7 
                               Output f32_4* %255 = OpVariable Output 
                                             %267 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %142 = OpVariable Function 
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
                                                      OpStore %60 %70 
                               Uniform f32_4* %71 = OpAccessChain %32 %65 %50 
                                        f32_4 %72 = OpLoad %71 
                                        f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                        f32_3 %74 = OpLoad %62 
                                        f32_2 %75 = OpVectorShuffle %74 %74 0 0 
                                        f32_2 %76 = OpFMul %73 %75 
                                        f32_2 %77 = OpLoad %60 
                                        f32_2 %78 = OpFAdd %76 %77 
                                                      OpStore %60 %78 
                               Uniform f32_4* %80 = OpAccessChain %32 %65 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                        f32_3 %83 = OpLoad %62 
                                        f32_2 %84 = OpVectorShuffle %83 %83 2 2 
                                        f32_2 %85 = OpFMul %82 %84 
                                        f32_2 %86 = OpLoad %60 
                                        f32_2 %87 = OpFAdd %85 %86 
                                                      OpStore %60 %87 
                                        f32_2 %88 = OpLoad %60 
                               Uniform f32_4* %90 = OpAccessChain %32 %65 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFAdd %88 %92 
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
                                       f32_3 %114 = OpLoad %62 
                                       f32_3 %115 = OpVectorShuffle %114 %114 1 1 1 
                              Uniform f32_4* %116 = OpAccessChain %32 %79 %51 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFMul %115 %118 
                                                      OpStore %113 %119 
                              Uniform f32_4* %120 = OpAccessChain %32 %79 %50 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpLoad %62 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 0 0 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_3 %126 = OpLoad %113 
                                       f32_3 %127 = OpFAdd %125 %126 
                                                      OpStore %113 %127 
                              Uniform f32_4* %128 = OpAccessChain %32 %79 %79 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpLoad %62 
                                       f32_3 %132 = OpVectorShuffle %131 %131 2 2 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_3 %134 = OpLoad %113 
                                       f32_3 %135 = OpFAdd %133 %134 
                                                      OpStore %113 %135 
                                       f32_3 %136 = OpLoad %113 
                              Uniform f32_4* %137 = OpAccessChain %32 %79 %89 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %136 %139 
                                                      OpStore %113 %140 
                                        bool %143 = OpLoad %94 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %147 
                                             %144 = OpLabel 
                                       f32_3 %146 = OpLoad %113 
                                                      OpStore %142 %146 
                                                      OpBranch %145 
                                             %147 = OpLabel 
                                       f32_3 %148 = OpLoad %62 
                                                      OpStore %142 %148 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                       f32_3 %149 = OpLoad %142 
                                                      OpStore %113 %149 
                                       f32_3 %150 = OpLoad %113 
                              Uniform f32_3* %153 = OpAccessChain %32 %151 
                                       f32_3 %154 = OpLoad %153 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_3 %156 = OpFAdd %150 %155 
                                                      OpStore %113 %156 
                                       f32_3 %158 = OpLoad %113 
                              Uniform f32_3* %159 = OpAccessChain %32 %89 
                                       f32_3 %160 = OpLoad %159 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_4 %162 = OpLoad %157 
                                       f32_4 %163 = OpVectorShuffle %162 %161 0 4 5 6 
                                                      OpStore %157 %163 
                                Private f32* %165 = OpAccessChain %157 %108 
                                         f32 %166 = OpLoad %165 
                                         f32 %168 = OpFMul %166 %167 
                                         f32 %170 = OpFAdd %168 %169 
                                                      OpStore %164 %170 
                                Uniform f32* %173 = OpAccessChain %32 %51 %172 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %177 = OpFAdd %176 %169 
                                                      OpStore %171 %177 
                                         f32 %178 = OpLoad %171 
                                         f32 %179 = OpLoad %164 
                                         f32 %180 = OpExtInst %1 40 %178 %179 
                                Private f32* %181 = OpAccessChain %157 %40 
                                                      OpStore %181 %180 
                  read_only Texture3DSampled %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %157 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 2 3 
                                       f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                                      OpStore %157 %189 
                                       f32_4 %190 = OpLoad %157 
                                                      OpStore %20 %190 
                                                      OpBranch %107 
                                             %191 = OpLabel 
                                Private f32* %192 = OpAccessChain %20 %40 
                                                      OpStore %192 %97 
                                Private f32* %193 = OpAccessChain %20 %108 
                                                      OpStore %193 %97 
                                Private f32* %194 = OpAccessChain %20 %172 
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
                  read_only Texture2DSampled %207 = OpLoad %206 
                                       f32_2 %208 = OpLoad %60 
                                       f32_4 %209 = OpImageSampleImplicitLod %207 %208 
                                         f32 %210 = OpCompositeExtract %209 3 
                                Private f32* %211 = OpAccessChain %60 %40 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %196 %40 
                                         f32 %213 = OpLoad %212 
                                Private f32* %214 = OpAccessChain %60 %40 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFMul %213 %215 
                                Private f32* %217 = OpAccessChain %60 %40 
                                                      OpStore %217 %216 
                                       f32_4 %218 = OpLoad %9 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                              Uniform f32_4* %221 = OpAccessChain %32 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFMul %219 %223 
                                                      OpStore %196 %224 
                                       f32_2 %226 = OpLoad %60 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 0 0 
                                       f32_3 %228 = OpLoad %196 
                                       f32_3 %229 = OpFMul %227 %228 
                                                      OpStore %225 %229 
                                       f32_3 %231 = OpLoad %196 
                                       f32_3 %232 = OpFNegate %231 
                                       f32_2 %233 = OpLoad %60 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                              Uniform f32_4* %237 = OpAccessChain %32 %236 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFAdd %235 %239 
                                                      OpStore %230 %240 
                              Uniform f32_4* %241 = OpAccessChain %32 %236 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 3 3 3 
                                       f32_3 %244 = OpLoad %230 
                                       f32_3 %245 = OpFMul %243 %244 
                                       f32_3 %246 = OpLoad %225 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %230 %247 
                                       f32_3 %248 = OpLoad %230 
                                       f32_3 %249 = OpFNegate %248 
                              Uniform f32_4* %250 = OpAccessChain %32 %236 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFAdd %249 %252 
                                                      OpStore %196 %253 
                              Uniform f32_4* %256 = OpAccessChain %32 %236 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 3 3 3 
                                       f32_3 %259 = OpLoad %196 
                                       f32_3 %260 = OpFMul %258 %259 
                                       f32_3 %261 = OpLoad %230 
                                       f32_3 %262 = OpFAdd %260 %261 
                                       f32_4 %263 = OpLoad %255 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                      OpStore %255 %264 
                                Private f32* %265 = OpAccessChain %9 %22 
                                         f32 %266 = OpLoad %265 
                                 Output f32* %268 = OpAccessChain %255 %22 
                                                      OpStore %268 %266 
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
  GpuProgramID 137243
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