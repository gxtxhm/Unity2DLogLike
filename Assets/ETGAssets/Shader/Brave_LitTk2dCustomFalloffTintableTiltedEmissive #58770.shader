//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTintableTiltedEmissive" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_MaxValue ("Max Value", Float) = 1
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
  GpuProgramID 17336
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.w = u_xlat10_0.w * vs_COLOR0.w;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
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
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
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
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
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
; Bound: 163
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 %152 %155 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                               Output f32_3* %152 = OpVariable Output 
                                         f32 %153 = OpConstant 3.67402E-40 
                                       f32_3 %154 = OpConstantComposite %153 %153 %153 
                               Output f32_4* %155 = OpVariable Output 
                                       f32_4 %156 = OpConstantComposite %153 %153 %153 %153 
                                             %157 = OpTypePointer Output %6 
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
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                                      OpStore %152 %154 
                                                      OpStore %155 %156 
                                 Output f32* %158 = OpAccessChain %81 %23 %77 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                 Output f32* %161 = OpAccessChain %81 %23 %77 
                                                      OpStore %161 %160 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %53 %110 %223 %264 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %101 SpecId 101 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                                              %52 = OpTypePointer Input %7 
                                 Input f32_4* %53 = OpVariable Input 
                                          u32 %57 = OpConstant 3 
                                              %58 = OpTypePointer Private %6 
                                              %61 = OpTypePointer Input %6 
                               Private f32_3* %66 = OpVariable Private 
                                          i32 %70 = OpConstant 7 
                                              %71 = OpTypePointer Uniform %6 
                                              %86 = OpTypeBool 
                                              %87 = OpTypePointer Private %86 
                                Private bool* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 1 
                                          u32 %90 = OpConstant 0 
                                          f32 %93 = OpConstant 3.67402E-40 
                                         bool %95 = OpConstantFalse 
                                        bool %101 = OpSpecConstantFalse 
                                         u32 %104 = OpConstant 1 
                              Private f32_4* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %21 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %113 = OpConstant 2 
                                         i32 %120 = OpConstant 0 
                                         i32 %145 = OpConstant 3 
                                             %152 = OpTypePointer Function %21 
                                         i32 %166 = OpConstant 4 
                                             %167 = OpTypePointer Uniform %21 
                                Private f32* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %186 = OpConstant 3.67402E-40 
                                Private f32* %188 = OpVariable Private 
                                         u32 %189 = OpConstant 2 
                                         f32 %192 = OpConstant 3.67402E-40 
                                             %199 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %200 = OpTypeSampledImage %199 
                                             %201 = OpTypePointer UniformConstant %200 
 UniformConstant read_only Texture3DSampled* %202 = OpVariable UniformConstant 
                              Private f32_4* %207 = OpVariable Private 
                                Private f32* %214 = OpVariable Private 
                                         f32 %220 = OpConstant 3.67402E-40 
                                Input f32_3* %223 = OpVariable Input 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_3* %235 = OpVariable Private 
                              Private f32_4* %259 = OpVariable Private 
                                             %263 = OpTypePointer Output %7 
                               Output f32_4* %264 = OpVariable Output 
                                         i32 %265 = OpConstant 6 
                                             %278 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %153 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %42 = OpAccessChain %30 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 3 3 3 
                                        f32_4 %45 = OpLoad %20 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                                      OpStore %41 %50 
                                        f32_3 %51 = OpLoad %41 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFMul %51 %55 
                                                      OpStore %41 %56 
                                 Private f32* %59 = OpAccessChain %9 %57 
                                          f32 %60 = OpLoad %59 
                                   Input f32* %62 = OpAccessChain %53 %57 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %60 %63 
                                 Private f32* %65 = OpAccessChain %20 %57 
                                                      OpStore %65 %64 
                                        f32_3 %67 = OpLoad %41 
                                        f32_3 %68 = OpExtInst %1 30 %67 
                                                      OpStore %66 %68 
                                        f32_3 %69 = OpLoad %66 
                                 Uniform f32* %72 = OpAccessChain %30 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %30 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %30 %70 
                                          f32 %77 = OpLoad %76 
                                        f32_3 %78 = OpCompositeConstruct %73 %75 %77 
                                          f32 %79 = OpCompositeExtract %78 0 
                                          f32 %80 = OpCompositeExtract %78 1 
                                          f32 %81 = OpCompositeExtract %78 2 
                                        f32_3 %82 = OpCompositeConstruct %79 %80 %81 
                                        f32_3 %83 = OpFMul %69 %82 
                                                      OpStore %66 %83 
                                        f32_3 %84 = OpLoad %66 
                                        f32_3 %85 = OpExtInst %1 29 %84 
                                                      OpStore %66 %85 
                                 Uniform f32* %91 = OpAccessChain %30 %89 %90 
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
                                                      OpBranchConditional %101 %102 %209 
                                             %102 = OpLabel 
                                Uniform f32* %105 = OpAccessChain %30 %89 %104 
                                         f32 %106 = OpLoad %105 
                                        bool %107 = OpFOrdEqual %106 %93 
                                                      OpStore %88 %107 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 1 1 1 
                              Uniform f32_4* %114 = OpAccessChain %30 %113 %89 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFMul %112 %116 
                                       f32_4 %118 = OpLoad %108 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %108 %119 
                              Uniform f32_4* %121 = OpAccessChain %30 %113 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpLoad %110 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %108 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %108 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %108 %131 
                              Uniform f32_4* %132 = OpAccessChain %30 %113 %113 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpLoad %110 
                                       f32_3 %136 = OpVectorShuffle %135 %135 2 2 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %108 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %108 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %108 %142 
                                       f32_4 %143 = OpLoad %108 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %146 = OpAccessChain %30 %113 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %144 %148 
                                       f32_4 %150 = OpLoad %108 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %108 %151 
                                        bool %154 = OpLoad %88 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %159 
                                             %155 = OpLabel 
                                       f32_4 %157 = OpLoad %108 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %153 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                       f32_3 %160 = OpLoad %110 
                                                      OpStore %153 %160 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                       f32_3 %161 = OpLoad %153 
                                       f32_4 %162 = OpLoad %108 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %108 %163 
                                       f32_4 %164 = OpLoad %108 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %166 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFNegate %169 
                                       f32_3 %171 = OpFAdd %165 %170 
                                       f32_4 %172 = OpLoad %108 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %108 %173 
                                       f32_4 %174 = OpLoad %108 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %30 %145 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %108 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 4 5 6 
                                                      OpStore %108 %180 
                                Private f32* %182 = OpAccessChain %108 %104 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %181 %187 
                                Uniform f32* %190 = OpAccessChain %30 %89 %189 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %194 = OpFAdd %193 %186 
                                                      OpStore %188 %194 
                                         f32 %195 = OpLoad %181 
                                         f32 %196 = OpLoad %188 
                                         f32 %197 = OpExtInst %1 40 %195 %196 
                                Private f32* %198 = OpAccessChain %108 %90 
                                                      OpStore %198 %197 
                  read_only Texture3DSampled %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %108 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 2 3 
                                       f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                                      OpStore %108 %206 
                                       f32_4 %208 = OpLoad %108 
                                                      OpStore %207 %208 
                                                      OpBranch %103 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %207 %90 
                                                      OpStore %210 %93 
                                Private f32* %211 = OpAccessChain %207 %104 
                                                      OpStore %211 %93 
                                Private f32* %212 = OpAccessChain %207 %189 
                                                      OpStore %212 %93 
                                Private f32* %213 = OpAccessChain %207 %57 
                                                      OpStore %213 %93 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %215 = OpLoad %207 
                              Uniform f32_4* %216 = OpAccessChain %30 %120 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                                      OpStore %214 %218 
                                         f32 %219 = OpLoad %214 
                                         f32 %221 = OpExtInst %1 43 %219 %220 %93 
                                                      OpStore %214 %221 
                                       f32_3 %222 = OpLoad %41 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFMul %222 %224 
                                       f32_4 %226 = OpLoad %207 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %207 %227 
                                       f32_3 %229 = OpLoad %41 
                              Uniform f32_4* %231 = OpAccessChain %30 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFMul %229 %233 
                                                      OpStore %228 %234 
                                         f32 %236 = OpLoad %214 
                                       f32_3 %237 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %238 = OpLoad %228 
                                       f32_3 %239 = OpFMul %237 %238 
                                                      OpStore %235 %239 
                                       f32_3 %240 = OpLoad %228 
                                       f32_3 %241 = OpFNegate %240 
                                         f32 %242 = OpLoad %214 
                                       f32_3 %243 = OpCompositeConstruct %242 %242 %242 
                                       f32_3 %244 = OpFMul %241 %243 
                              Uniform f32_4* %245 = OpAccessChain %30 %32 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %248 = OpFAdd %244 %247 
                                                      OpStore %41 %248 
                              Uniform f32_4* %249 = OpAccessChain %30 %32 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 3 3 3 
                                       f32_3 %252 = OpLoad %41 
                                       f32_3 %253 = OpFMul %251 %252 
                                       f32_3 %254 = OpLoad %235 
                                       f32_3 %255 = OpFAdd %253 %254 
                                       f32_4 %256 = OpLoad %20 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %20 %257 
                                Private f32* %258 = OpAccessChain %207 %57 
                                                      OpStore %258 %220 
                                       f32_4 %260 = OpLoad %20 
                                       f32_4 %261 = OpLoad %207 
                                       f32_4 %262 = OpFAdd %260 %261 
                                                      OpStore %259 %262 
                                Uniform f32* %266 = OpAccessChain %30 %265 
                                         f32 %267 = OpLoad %266 
                                       f32_3 %268 = OpCompositeConstruct %267 %267 %267 
                                       f32_3 %269 = OpLoad %66 
                                       f32_3 %270 = OpFMul %268 %269 
                                       f32_4 %271 = OpLoad %259 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %270 %272 
                                       f32_4 %274 = OpLoad %264 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %264 %275 
                                Private f32* %276 = OpAccessChain %259 %57 
                                         f32 %277 = OpLoad %276 
                                 Output f32* %279 = OpAccessChain %264 %57 
                                                      OpStore %279 %277 
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
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
    vs_COLOR0 = in_COLOR0;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.w = u_xlat10_0.w * vs_COLOR0.w;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
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
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
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
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
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
; Bound: 278
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %83 %95 %96 %110 %149 %152 %155 %157 %158 %267 %270 
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
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
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
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %267 Location 267 
                                                      OpDecorate %270 Location 270 
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
                               Output f32_4* %157 = OpVariable Output 
                                Input f32_4* %158 = OpVariable Input 
                                             %160 = OpTypePointer Private %108 
                              Private f32_3* %161 = OpVariable Private 
                              Private f32_4* %178 = OpVariable Private 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %190 = OpConstant 4 
                                         i32 %196 = OpConstant 5 
                                         i32 %202 = OpConstant 6 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         u32 %212 = OpConstant 3 
                                         f32 %233 = OpConstant 3.67402E-40 
                                       f32_3 %234 = OpConstantComposite %233 %233 %233 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %242 %242 %242 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                                         f32 %257 = OpConstant 3.67402E-40 
                                       f32_3 %258 = OpConstantComposite %257 %257 %257 
                               Output f32_3* %267 = OpVariable Output 
                               Output f32_4* %270 = OpVariable Output 
                                       f32_4 %271 = OpConstantComposite %233 %233 %233 %233 
                                             %272 = OpTypePointer Output %6 
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
                                       f32_4 %159 = OpLoad %158 
                                                      OpStore %157 %159 
                                Private f32* %162 = OpAccessChain %45 %79 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %45 %79 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %163 %165 
                                Private f32* %167 = OpAccessChain %161 %117 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %45 %117 
                                         f32 %169 = OpLoad %168 
                                Private f32* %170 = OpAccessChain %45 %117 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %169 %171 
                                Private f32* %173 = OpAccessChain %161 %117 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                         f32 %176 = OpFAdd %172 %175 
                                Private f32* %177 = OpAccessChain %161 %117 
                                                      OpStore %177 %176 
                                       f32_4 %179 = OpLoad %45 
                                       f32_4 %180 = OpVectorShuffle %179 %179 1 2 2 0 
                                       f32_4 %181 = OpLoad %45 
                                       f32_4 %182 = OpVectorShuffle %181 %181 0 1 2 2 
                                       f32_4 %183 = OpFMul %180 %182 
                                                      OpStore %178 %183 
                              Uniform f32_4* %185 = OpAccessChain %21 %47 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %178 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %184 %117 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %21 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %178 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %184 %79 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %21 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %178 
                                         f32 %200 = OpDot %198 %199 
                                Private f32* %201 = OpAccessChain %184 %131 
                                                      OpStore %201 %200 
                              Uniform f32_4* %203 = OpAccessChain %21 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %161 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_3 %209 = OpLoad %184 
                                       f32_3 %210 = OpFAdd %208 %209 
                                                      OpStore %161 %210 
                                Private f32* %213 = OpAccessChain %45 %212 
                                                      OpStore %213 %211 
                              Uniform f32_4* %214 = OpAccessChain %21 %29 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %45 
                                         f32 %217 = OpDot %215 %216 
                                Private f32* %218 = OpAccessChain %184 %117 
                                                      OpStore %218 %217 
                              Uniform f32_4* %219 = OpAccessChain %21 %24 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %45 
                                         f32 %222 = OpDot %220 %221 
                                Private f32* %223 = OpAccessChain %184 %79 
                                                      OpStore %223 %222 
                              Uniform f32_4* %224 = OpAccessChain %21 %37 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %45 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %184 %131 
                                                      OpStore %228 %227 
                                       f32_3 %229 = OpLoad %161 
                                       f32_3 %230 = OpLoad %184 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %161 %231 
                                       f32_3 %232 = OpLoad %161 
                                       f32_3 %235 = OpExtInst %1 40 %232 %234 
                                                      OpStore %161 %235 
                                       f32_3 %236 = OpLoad %161 
                                       f32_3 %237 = OpExtInst %1 30 %236 
                                       f32_4 %238 = OpLoad %45 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %45 %239 
                                       f32_4 %240 = OpLoad %45 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %244 = OpFMul %241 %243 
                                       f32_4 %245 = OpLoad %45 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %45 %246 
                                       f32_4 %247 = OpLoad %45 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpExtInst %1 29 %248 
                                       f32_4 %250 = OpLoad %45 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %45 %251 
                                       f32_4 %252 = OpLoad %45 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %256 = OpFMul %253 %255 
                                       f32_3 %259 = OpFAdd %256 %258 
                                       f32_4 %260 = OpLoad %45 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %45 %261 
                                       f32_4 %262 = OpLoad %45 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpExtInst %1 40 %263 %234 
                                       f32_4 %265 = OpLoad %45 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %45 %266 
                                       f32_4 %268 = OpLoad %45 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                                      OpStore %267 %269 
                                                      OpStore %270 %271 
                                 Output f32* %273 = OpAccessChain %83 %29 %79 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFNegate %274 
                                 Output f32* %276 = OpAccessChain %83 %29 %79 
                                                      OpStore %276 %275 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %53 %110 %223 %264 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %101 SpecId 101 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                                              %52 = OpTypePointer Input %7 
                                 Input f32_4* %53 = OpVariable Input 
                                          u32 %57 = OpConstant 3 
                                              %58 = OpTypePointer Private %6 
                                              %61 = OpTypePointer Input %6 
                               Private f32_3* %66 = OpVariable Private 
                                          i32 %70 = OpConstant 7 
                                              %71 = OpTypePointer Uniform %6 
                                              %86 = OpTypeBool 
                                              %87 = OpTypePointer Private %86 
                                Private bool* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 1 
                                          u32 %90 = OpConstant 0 
                                          f32 %93 = OpConstant 3.67402E-40 
                                         bool %95 = OpConstantFalse 
                                        bool %101 = OpSpecConstantFalse 
                                         u32 %104 = OpConstant 1 
                              Private f32_4* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %21 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %113 = OpConstant 2 
                                         i32 %120 = OpConstant 0 
                                         i32 %145 = OpConstant 3 
                                             %152 = OpTypePointer Function %21 
                                         i32 %166 = OpConstant 4 
                                             %167 = OpTypePointer Uniform %21 
                                Private f32* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %186 = OpConstant 3.67402E-40 
                                Private f32* %188 = OpVariable Private 
                                         u32 %189 = OpConstant 2 
                                         f32 %192 = OpConstant 3.67402E-40 
                                             %199 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %200 = OpTypeSampledImage %199 
                                             %201 = OpTypePointer UniformConstant %200 
 UniformConstant read_only Texture3DSampled* %202 = OpVariable UniformConstant 
                              Private f32_4* %207 = OpVariable Private 
                                Private f32* %214 = OpVariable Private 
                                         f32 %220 = OpConstant 3.67402E-40 
                                Input f32_3* %223 = OpVariable Input 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_3* %235 = OpVariable Private 
                              Private f32_4* %259 = OpVariable Private 
                                             %263 = OpTypePointer Output %7 
                               Output f32_4* %264 = OpVariable Output 
                                         i32 %265 = OpConstant 6 
                                             %278 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %153 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %42 = OpAccessChain %30 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 3 3 3 
                                        f32_4 %45 = OpLoad %20 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                                      OpStore %41 %50 
                                        f32_3 %51 = OpLoad %41 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFMul %51 %55 
                                                      OpStore %41 %56 
                                 Private f32* %59 = OpAccessChain %9 %57 
                                          f32 %60 = OpLoad %59 
                                   Input f32* %62 = OpAccessChain %53 %57 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %60 %63 
                                 Private f32* %65 = OpAccessChain %20 %57 
                                                      OpStore %65 %64 
                                        f32_3 %67 = OpLoad %41 
                                        f32_3 %68 = OpExtInst %1 30 %67 
                                                      OpStore %66 %68 
                                        f32_3 %69 = OpLoad %66 
                                 Uniform f32* %72 = OpAccessChain %30 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %30 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %30 %70 
                                          f32 %77 = OpLoad %76 
                                        f32_3 %78 = OpCompositeConstruct %73 %75 %77 
                                          f32 %79 = OpCompositeExtract %78 0 
                                          f32 %80 = OpCompositeExtract %78 1 
                                          f32 %81 = OpCompositeExtract %78 2 
                                        f32_3 %82 = OpCompositeConstruct %79 %80 %81 
                                        f32_3 %83 = OpFMul %69 %82 
                                                      OpStore %66 %83 
                                        f32_3 %84 = OpLoad %66 
                                        f32_3 %85 = OpExtInst %1 29 %84 
                                                      OpStore %66 %85 
                                 Uniform f32* %91 = OpAccessChain %30 %89 %90 
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
                                                      OpBranchConditional %101 %102 %209 
                                             %102 = OpLabel 
                                Uniform f32* %105 = OpAccessChain %30 %89 %104 
                                         f32 %106 = OpLoad %105 
                                        bool %107 = OpFOrdEqual %106 %93 
                                                      OpStore %88 %107 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 1 1 1 
                              Uniform f32_4* %114 = OpAccessChain %30 %113 %89 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFMul %112 %116 
                                       f32_4 %118 = OpLoad %108 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %108 %119 
                              Uniform f32_4* %121 = OpAccessChain %30 %113 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpLoad %110 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %108 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %108 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %108 %131 
                              Uniform f32_4* %132 = OpAccessChain %30 %113 %113 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpLoad %110 
                                       f32_3 %136 = OpVectorShuffle %135 %135 2 2 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %108 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %108 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %108 %142 
                                       f32_4 %143 = OpLoad %108 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %146 = OpAccessChain %30 %113 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %144 %148 
                                       f32_4 %150 = OpLoad %108 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %108 %151 
                                        bool %154 = OpLoad %88 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %159 
                                             %155 = OpLabel 
                                       f32_4 %157 = OpLoad %108 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %153 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                       f32_3 %160 = OpLoad %110 
                                                      OpStore %153 %160 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                       f32_3 %161 = OpLoad %153 
                                       f32_4 %162 = OpLoad %108 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %108 %163 
                                       f32_4 %164 = OpLoad %108 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %166 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFNegate %169 
                                       f32_3 %171 = OpFAdd %165 %170 
                                       f32_4 %172 = OpLoad %108 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %108 %173 
                                       f32_4 %174 = OpLoad %108 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %30 %145 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %108 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 4 5 6 
                                                      OpStore %108 %180 
                                Private f32* %182 = OpAccessChain %108 %104 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %181 %187 
                                Uniform f32* %190 = OpAccessChain %30 %89 %189 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %194 = OpFAdd %193 %186 
                                                      OpStore %188 %194 
                                         f32 %195 = OpLoad %181 
                                         f32 %196 = OpLoad %188 
                                         f32 %197 = OpExtInst %1 40 %195 %196 
                                Private f32* %198 = OpAccessChain %108 %90 
                                                      OpStore %198 %197 
                  read_only Texture3DSampled %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %108 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 2 3 
                                       f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                                      OpStore %108 %206 
                                       f32_4 %208 = OpLoad %108 
                                                      OpStore %207 %208 
                                                      OpBranch %103 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %207 %90 
                                                      OpStore %210 %93 
                                Private f32* %211 = OpAccessChain %207 %104 
                                                      OpStore %211 %93 
                                Private f32* %212 = OpAccessChain %207 %189 
                                                      OpStore %212 %93 
                                Private f32* %213 = OpAccessChain %207 %57 
                                                      OpStore %213 %93 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %215 = OpLoad %207 
                              Uniform f32_4* %216 = OpAccessChain %30 %120 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                                      OpStore %214 %218 
                                         f32 %219 = OpLoad %214 
                                         f32 %221 = OpExtInst %1 43 %219 %220 %93 
                                                      OpStore %214 %221 
                                       f32_3 %222 = OpLoad %41 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFMul %222 %224 
                                       f32_4 %226 = OpLoad %207 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %207 %227 
                                       f32_3 %229 = OpLoad %41 
                              Uniform f32_4* %231 = OpAccessChain %30 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFMul %229 %233 
                                                      OpStore %228 %234 
                                         f32 %236 = OpLoad %214 
                                       f32_3 %237 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %238 = OpLoad %228 
                                       f32_3 %239 = OpFMul %237 %238 
                                                      OpStore %235 %239 
                                       f32_3 %240 = OpLoad %228 
                                       f32_3 %241 = OpFNegate %240 
                                         f32 %242 = OpLoad %214 
                                       f32_3 %243 = OpCompositeConstruct %242 %242 %242 
                                       f32_3 %244 = OpFMul %241 %243 
                              Uniform f32_4* %245 = OpAccessChain %30 %32 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %248 = OpFAdd %244 %247 
                                                      OpStore %41 %248 
                              Uniform f32_4* %249 = OpAccessChain %30 %32 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 3 3 3 
                                       f32_3 %252 = OpLoad %41 
                                       f32_3 %253 = OpFMul %251 %252 
                                       f32_3 %254 = OpLoad %235 
                                       f32_3 %255 = OpFAdd %253 %254 
                                       f32_4 %256 = OpLoad %20 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %20 %257 
                                Private f32* %258 = OpAccessChain %207 %57 
                                                      OpStore %258 %220 
                                       f32_4 %260 = OpLoad %20 
                                       f32_4 %261 = OpLoad %207 
                                       f32_4 %262 = OpFAdd %260 %261 
                                                      OpStore %259 %262 
                                Uniform f32* %266 = OpAccessChain %30 %265 
                                         f32 %267 = OpLoad %266 
                                       f32_3 %268 = OpCompositeConstruct %267 %267 %267 
                                       f32_3 %269 = OpLoad %66 
                                       f32_3 %270 = OpFMul %268 %269 
                                       f32_4 %271 = OpLoad %259 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %270 %272 
                                       f32_4 %274 = OpLoad %264 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %264 %275 
                                Private f32* %276 = OpAccessChain %259 %57 
                                         f32 %277 = OpLoad %276 
                                 Output f32* %279 = OpAccessChain %264 %57 
                                                      OpStore %279 %277 
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
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
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
    vs_COLOR0 = in_COLOR0;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.w = u_xlat10_0.w * vs_COLOR0.w;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
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
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
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
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
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
; Bound: 390
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %158 %160 %380 %383 
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
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 Location 160 
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
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %380 Location 380 
                                                      OpDecorate %383 Location 383 
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
                                Input f32_4* %158 = OpVariable Input 
                               Output f32_4* %160 = OpVariable Output 
                                             %162 = OpTypePointer Private %110 
                              Private f32_3* %163 = OpVariable Private 
                              Private f32_4* %180 = OpVariable Private 
                              Private f32_3* %186 = OpVariable Private 
                                         i32 %187 = OpConstant 8 
                                         i32 %193 = OpConstant 9 
                                         i32 %199 = OpConstant 10 
                                         i32 %205 = OpConstant 11 
                                         f32 %214 = OpConstant 3.67402E-40 
                                         u32 %215 = OpConstant 3 
                                         i32 %217 = OpConstant 5 
                                         i32 %223 = OpConstant 6 
                                         i32 %229 = OpConstant 7 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                              Private f32_3* %242 = OpVariable Private 
                                         f32 %246 = OpConstant 3.67402E-40 
                                       f32_3 %247 = OpConstantComposite %246 %246 %246 
                                         f32 %252 = OpConstant 3.67402E-40 
                                       f32_3 %253 = OpConstantComposite %252 %252 %252 
                                         f32 %255 = OpConstant 3.67402E-40 
                                       f32_3 %256 = OpConstantComposite %255 %255 %255 
                              Private f32_4* %266 = OpVariable Private 
                              Private f32_4* %274 = OpVariable Private 
                                         f32 %310 = OpConstant 3.67402E-40 
                                       f32_4 %311 = OpConstantComposite %310 %310 %310 %310 
                                       f32_4 %319 = OpConstantComposite %214 %214 %214 %214 
                                       f32_4 %327 = OpConstantComposite %239 %239 %239 %239 
                                         i32 %334 = OpConstant 4 
                               Output f32_3* %380 = OpVariable Output 
                               Output f32_4* %383 = OpVariable Output 
                                             %384 = OpTypePointer Output %6 
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
                                       f32_4 %159 = OpLoad %158 
                                                      OpStore %157 %159 
                                       f32_4 %161 = OpLoad %9 
                                                      OpStore %160 %161 
                                Private f32* %164 = OpAccessChain %47 %81 
                                         f32 %165 = OpLoad %164 
                                Private f32* %166 = OpAccessChain %47 %81 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFMul %165 %167 
                                Private f32* %169 = OpAccessChain %163 %119 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %47 %119 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %47 %119 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %171 %173 
                                Private f32* %175 = OpAccessChain %163 %119 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                         f32 %178 = OpFAdd %174 %177 
                                Private f32* %179 = OpAccessChain %163 %119 
                                                      OpStore %179 %178 
                                       f32_4 %181 = OpLoad %47 
                                       f32_4 %182 = OpVectorShuffle %181 %181 1 2 2 0 
                                       f32_4 %183 = OpLoad %47 
                                       f32_4 %184 = OpVectorShuffle %183 %183 0 1 2 2 
                                       f32_4 %185 = OpFMul %182 %184 
                                                      OpStore %180 %185 
                              Uniform f32_4* %188 = OpAccessChain %23 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %180 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %186 %119 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %23 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %180 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %186 %81 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %23 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %180 
                                         f32 %203 = OpDot %201 %202 
                                Private f32* %204 = OpAccessChain %186 %133 
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
                                Private f32* %216 = OpAccessChain %47 %215 
                                                      OpStore %216 %214 
                              Uniform f32_4* %218 = OpAccessChain %23 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %47 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %186 %119 
                                                      OpStore %222 %221 
                              Uniform f32_4* %224 = OpAccessChain %23 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %47 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %186 %81 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %23 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %47 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %186 %133 
                                                      OpStore %234 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpLoad %186 
                                       f32_3 %237 = OpFAdd %235 %236 
                                                      OpStore %163 %237 
                                       f32_3 %238 = OpLoad %163 
                                       f32_3 %241 = OpExtInst %1 40 %238 %240 
                                                      OpStore %163 %241 
                                       f32_3 %243 = OpLoad %163 
                                       f32_3 %244 = OpExtInst %1 30 %243 
                                                      OpStore %242 %244 
                                       f32_3 %245 = OpLoad %242 
                                       f32_3 %248 = OpFMul %245 %247 
                                                      OpStore %242 %248 
                                       f32_3 %249 = OpLoad %242 
                                       f32_3 %250 = OpExtInst %1 29 %249 
                                                      OpStore %242 %250 
                                       f32_3 %251 = OpLoad %242 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %257 = OpFAdd %254 %256 
                                                      OpStore %242 %257 
                                       f32_3 %258 = OpLoad %242 
                                       f32_3 %259 = OpExtInst %1 40 %258 %240 
                                                      OpStore %242 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                                       f32_4 %262 = OpFNegate %261 
                              Uniform f32_4* %263 = OpAccessChain %23 %26 
                                       f32_4 %264 = OpLoad %263 
                                       f32_4 %265 = OpFAdd %262 %264 
                                                      OpStore %60 %265 
                                       f32_4 %267 = OpLoad %47 
                                       f32_4 %268 = OpVectorShuffle %267 %267 1 1 1 1 
                                       f32_4 %269 = OpLoad %60 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %266 %270 
                                       f32_4 %271 = OpLoad %60 
                                       f32_4 %272 = OpLoad %60 
                                       f32_4 %273 = OpFMul %271 %272 
                                                      OpStore %60 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_4 %276 = OpVectorShuffle %275 %275 0 0 0 0 
                                       f32_4 %277 = OpFNegate %276 
                              Uniform f32_4* %278 = OpAccessChain %23 %31 
                                       f32_4 %279 = OpLoad %278 
                                       f32_4 %280 = OpFAdd %277 %279 
                                                      OpStore %274 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %281 2 2 2 2 
                                       f32_4 %283 = OpFNegate %282 
                              Uniform f32_4* %284 = OpAccessChain %23 %39 
                                       f32_4 %285 = OpLoad %284 
                                       f32_4 %286 = OpFAdd %283 %285 
                                                      OpStore %9 %286 
                                       f32_4 %287 = OpLoad %274 
                                       f32_4 %288 = OpLoad %47 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpFMul %287 %289 
                                       f32_4 %291 = OpLoad %266 
                                       f32_4 %292 = OpFAdd %290 %291 
                                                      OpStore %266 %292 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpLoad %47 
                                       f32_4 %295 = OpVectorShuffle %294 %294 2 2 2 2 
                                       f32_4 %296 = OpFMul %293 %295 
                                       f32_4 %297 = OpLoad %266 
                                       f32_4 %298 = OpFAdd %296 %297 
                                                      OpStore %47 %298 
                                       f32_4 %299 = OpLoad %274 
                                       f32_4 %300 = OpLoad %274 
                                       f32_4 %301 = OpFMul %299 %300 
                                       f32_4 %302 = OpLoad %60 
                                       f32_4 %303 = OpFAdd %301 %302 
                                                      OpStore %60 %303 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpFMul %304 %305 
                                       f32_4 %307 = OpLoad %60 
                                       f32_4 %308 = OpFAdd %306 %307 
                                                      OpStore %9 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %312 = OpExtInst %1 40 %309 %311 
                                                      OpStore %9 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_4 %314 = OpExtInst %1 32 %313 
                                                      OpStore %60 %314 
                                       f32_4 %315 = OpLoad %9 
                              Uniform f32_4* %316 = OpAccessChain %23 %49 
                                       f32_4 %317 = OpLoad %316 
                                       f32_4 %318 = OpFMul %315 %317 
                                       f32_4 %320 = OpFAdd %318 %319 
                                                      OpStore %9 %320 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpFDiv %319 %321 
                                                      OpStore %9 %322 
                                       f32_4 %323 = OpLoad %47 
                                       f32_4 %324 = OpLoad %60 
                                       f32_4 %325 = OpFMul %323 %324 
                                                      OpStore %47 %325 
                                       f32_4 %326 = OpLoad %47 
                                       f32_4 %328 = OpExtInst %1 40 %326 %327 
                                                      OpStore %47 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpLoad %47 
                                       f32_4 %331 = OpFMul %329 %330 
                                                      OpStore %9 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_3 %333 = OpVectorShuffle %332 %332 1 1 1 
                              Uniform f32_4* %335 = OpAccessChain %23 %334 %26 
                                       f32_4 %336 = OpLoad %335 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFMul %333 %337 
                                       f32_4 %339 = OpLoad %47 
                                       f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
                                                      OpStore %47 %340 
                              Uniform f32_4* %341 = OpAccessChain %23 %334 %31 
                                       f32_4 %342 = OpLoad %341 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_4 %344 = OpLoad %9 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 0 0 
                                       f32_3 %346 = OpFMul %343 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                                       f32_3 %349 = OpFAdd %346 %348 
                                       f32_4 %350 = OpLoad %47 
                                       f32_4 %351 = OpVectorShuffle %350 %349 4 5 6 3 
                                                      OpStore %47 %351 
                              Uniform f32_4* %352 = OpAccessChain %23 %334 %39 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                                       f32_4 %355 = OpLoad %9 
                                       f32_3 %356 = OpVectorShuffle %355 %355 2 2 2 
                                       f32_3 %357 = OpFMul %354 %356 
                                       f32_4 %358 = OpLoad %47 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %360 = OpFAdd %357 %359 
                                       f32_4 %361 = OpLoad %9 
                                       f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
                                                      OpStore %9 %362 
                              Uniform f32_4* %363 = OpAccessChain %23 %334 %49 
                                       f32_4 %364 = OpLoad %363 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 3 3 3 
                                       f32_3 %368 = OpFMul %365 %367 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %9 %373 
                                       f32_4 %374 = OpLoad %9 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
                                       f32_3 %376 = OpLoad %242 
                                       f32_3 %377 = OpFAdd %375 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %9 %379 
                                       f32_4 %381 = OpLoad %9 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                                      OpStore %380 %382 
                                                      OpStore %383 %327 
                                 Output f32* %385 = OpAccessChain %85 %31 %81 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFNegate %386 
                                 Output f32* %388 = OpAccessChain %85 %31 %81 
                                                      OpStore %388 %387 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %53 %110 %223 %264 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %101 SpecId 101 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 8 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                                              %52 = OpTypePointer Input %7 
                                 Input f32_4* %53 = OpVariable Input 
                                          u32 %57 = OpConstant 3 
                                              %58 = OpTypePointer Private %6 
                                              %61 = OpTypePointer Input %6 
                               Private f32_3* %66 = OpVariable Private 
                                          i32 %70 = OpConstant 7 
                                              %71 = OpTypePointer Uniform %6 
                                              %86 = OpTypeBool 
                                              %87 = OpTypePointer Private %86 
                                Private bool* %88 = OpVariable Private 
                                          i32 %89 = OpConstant 1 
                                          u32 %90 = OpConstant 0 
                                          f32 %93 = OpConstant 3.67402E-40 
                                         bool %95 = OpConstantFalse 
                                        bool %101 = OpSpecConstantFalse 
                                         u32 %104 = OpConstant 1 
                              Private f32_4* %108 = OpVariable Private 
                                             %109 = OpTypePointer Input %21 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %113 = OpConstant 2 
                                         i32 %120 = OpConstant 0 
                                         i32 %145 = OpConstant 3 
                                             %152 = OpTypePointer Function %21 
                                         i32 %166 = OpConstant 4 
                                             %167 = OpTypePointer Uniform %21 
                                Private f32* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %186 = OpConstant 3.67402E-40 
                                Private f32* %188 = OpVariable Private 
                                         u32 %189 = OpConstant 2 
                                         f32 %192 = OpConstant 3.67402E-40 
                                             %199 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %200 = OpTypeSampledImage %199 
                                             %201 = OpTypePointer UniformConstant %200 
 UniformConstant read_only Texture3DSampled* %202 = OpVariable UniformConstant 
                              Private f32_4* %207 = OpVariable Private 
                                Private f32* %214 = OpVariable Private 
                                         f32 %220 = OpConstant 3.67402E-40 
                                Input f32_3* %223 = OpVariable Input 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_3* %235 = OpVariable Private 
                              Private f32_4* %259 = OpVariable Private 
                                             %263 = OpTypePointer Output %7 
                               Output f32_4* %264 = OpVariable Output 
                                         i32 %265 = OpConstant 6 
                                             %278 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %153 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %42 = OpAccessChain %30 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 3 3 3 
                                        f32_4 %45 = OpLoad %20 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                                      OpStore %41 %50 
                                        f32_3 %51 = OpLoad %41 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFMul %51 %55 
                                                      OpStore %41 %56 
                                 Private f32* %59 = OpAccessChain %9 %57 
                                          f32 %60 = OpLoad %59 
                                   Input f32* %62 = OpAccessChain %53 %57 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %60 %63 
                                 Private f32* %65 = OpAccessChain %20 %57 
                                                      OpStore %65 %64 
                                        f32_3 %67 = OpLoad %41 
                                        f32_3 %68 = OpExtInst %1 30 %67 
                                                      OpStore %66 %68 
                                        f32_3 %69 = OpLoad %66 
                                 Uniform f32* %72 = OpAccessChain %30 %70 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %30 %70 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %76 = OpAccessChain %30 %70 
                                          f32 %77 = OpLoad %76 
                                        f32_3 %78 = OpCompositeConstruct %73 %75 %77 
                                          f32 %79 = OpCompositeExtract %78 0 
                                          f32 %80 = OpCompositeExtract %78 1 
                                          f32 %81 = OpCompositeExtract %78 2 
                                        f32_3 %82 = OpCompositeConstruct %79 %80 %81 
                                        f32_3 %83 = OpFMul %69 %82 
                                                      OpStore %66 %83 
                                        f32_3 %84 = OpLoad %66 
                                        f32_3 %85 = OpExtInst %1 29 %84 
                                                      OpStore %66 %85 
                                 Uniform f32* %91 = OpAccessChain %30 %89 %90 
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
                                                      OpBranchConditional %101 %102 %209 
                                             %102 = OpLabel 
                                Uniform f32* %105 = OpAccessChain %30 %89 %104 
                                         f32 %106 = OpLoad %105 
                                        bool %107 = OpFOrdEqual %106 %93 
                                                      OpStore %88 %107 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 1 1 1 
                              Uniform f32_4* %114 = OpAccessChain %30 %113 %89 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFMul %112 %116 
                                       f32_4 %118 = OpLoad %108 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %108 %119 
                              Uniform f32_4* %121 = OpAccessChain %30 %113 %120 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpLoad %110 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 0 0 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %108 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %108 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %108 %131 
                              Uniform f32_4* %132 = OpAccessChain %30 %113 %113 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpLoad %110 
                                       f32_3 %136 = OpVectorShuffle %135 %135 2 2 2 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %108 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %108 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %108 %142 
                                       f32_4 %143 = OpLoad %108 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %146 = OpAccessChain %30 %113 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %144 %148 
                                       f32_4 %150 = OpLoad %108 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %108 %151 
                                        bool %154 = OpLoad %88 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %159 
                                             %155 = OpLabel 
                                       f32_4 %157 = OpLoad %108 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %153 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                       f32_3 %160 = OpLoad %110 
                                                      OpStore %153 %160 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                       f32_3 %161 = OpLoad %153 
                                       f32_4 %162 = OpLoad %108 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %108 %163 
                                       f32_4 %164 = OpLoad %108 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %166 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFNegate %169 
                                       f32_3 %171 = OpFAdd %165 %170 
                                       f32_4 %172 = OpLoad %108 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %108 %173 
                                       f32_4 %174 = OpLoad %108 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %30 %145 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %108 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 4 5 6 
                                                      OpStore %108 %180 
                                Private f32* %182 = OpAccessChain %108 %104 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %181 %187 
                                Uniform f32* %190 = OpAccessChain %30 %89 %189 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %194 = OpFAdd %193 %186 
                                                      OpStore %188 %194 
                                         f32 %195 = OpLoad %181 
                                         f32 %196 = OpLoad %188 
                                         f32 %197 = OpExtInst %1 40 %195 %196 
                                Private f32* %198 = OpAccessChain %108 %90 
                                                      OpStore %198 %197 
                  read_only Texture3DSampled %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %108 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 2 3 
                                       f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                                      OpStore %108 %206 
                                       f32_4 %208 = OpLoad %108 
                                                      OpStore %207 %208 
                                                      OpBranch %103 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %207 %90 
                                                      OpStore %210 %93 
                                Private f32* %211 = OpAccessChain %207 %104 
                                                      OpStore %211 %93 
                                Private f32* %212 = OpAccessChain %207 %189 
                                                      OpStore %212 %93 
                                Private f32* %213 = OpAccessChain %207 %57 
                                                      OpStore %213 %93 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %215 = OpLoad %207 
                              Uniform f32_4* %216 = OpAccessChain %30 %120 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                                      OpStore %214 %218 
                                         f32 %219 = OpLoad %214 
                                         f32 %221 = OpExtInst %1 43 %219 %220 %93 
                                                      OpStore %214 %221 
                                       f32_3 %222 = OpLoad %41 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFMul %222 %224 
                                       f32_4 %226 = OpLoad %207 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %207 %227 
                                       f32_3 %229 = OpLoad %41 
                              Uniform f32_4* %231 = OpAccessChain %30 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                       f32_3 %234 = OpFMul %229 %233 
                                                      OpStore %228 %234 
                                         f32 %236 = OpLoad %214 
                                       f32_3 %237 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %238 = OpLoad %228 
                                       f32_3 %239 = OpFMul %237 %238 
                                                      OpStore %235 %239 
                                       f32_3 %240 = OpLoad %228 
                                       f32_3 %241 = OpFNegate %240 
                                         f32 %242 = OpLoad %214 
                                       f32_3 %243 = OpCompositeConstruct %242 %242 %242 
                                       f32_3 %244 = OpFMul %241 %243 
                              Uniform f32_4* %245 = OpAccessChain %30 %32 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %248 = OpFAdd %244 %247 
                                                      OpStore %41 %248 
                              Uniform f32_4* %249 = OpAccessChain %30 %32 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 3 3 3 
                                       f32_3 %252 = OpLoad %41 
                                       f32_3 %253 = OpFMul %251 %252 
                                       f32_3 %254 = OpLoad %235 
                                       f32_3 %255 = OpFAdd %253 %254 
                                       f32_4 %256 = OpLoad %20 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %20 %257 
                                Private f32* %258 = OpAccessChain %207 %57 
                                                      OpStore %258 %220 
                                       f32_4 %260 = OpLoad %20 
                                       f32_4 %261 = OpLoad %207 
                                       f32_4 %262 = OpFAdd %260 %261 
                                                      OpStore %259 %262 
                                Uniform f32* %266 = OpAccessChain %30 %265 
                                         f32 %267 = OpLoad %266 
                                       f32_3 %268 = OpCompositeConstruct %267 %267 %267 
                                       f32_3 %269 = OpLoad %66 
                                       f32_3 %270 = OpFMul %268 %269 
                                       f32_4 %271 = OpLoad %259 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %270 %272 
                                       f32_4 %274 = OpLoad %264 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %264 %275 
                                Private f32* %276 = OpAccessChain %259 %57 
                                         f32 %277 = OpLoad %276 
                                 Output f32* %279 = OpAccessChain %264 %57 
                                                      OpStore %279 %277 
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
  GpuProgramID 110139
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
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
                                       f32_4 %151 = OpLoad %150 
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
; Bound: 282
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %69 %279 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %117 SpecId 117 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %239 DescriptorSet 239 
                                                      OpDecorate %239 Binding 239 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %279 Location 279 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %7 
                                              %41 = OpTypePointer Private %21 
                               Private f32_3* %42 = OpVariable Private 
                                              %53 = OpTypePointer Input %7 
                                 Input f32_4* %54 = OpVariable Input 
                                          u32 %58 = OpConstant 3 
                                              %59 = OpTypePointer Private %6 
                                              %62 = OpTypePointer Input %6 
                               Private f32_3* %67 = OpVariable Private 
                                              %68 = OpTypePointer Input %21 
                                 Input f32_3* %69 = OpVariable Input 
                                          i32 %72 = OpConstant 6 
                                          i32 %73 = OpConstant 1 
                                          i32 %78 = OpConstant 0 
                                          i32 %87 = OpConstant 2 
                                          i32 %97 = OpConstant 3 
                                             %102 = OpTypeBool 
                                             %103 = OpTypePointer Private %102 
                               Private bool* %104 = OpVariable Private 
                                         u32 %105 = OpConstant 0 
                                             %106 = OpTypePointer Uniform %6 
                                         f32 %109 = OpConstant 3.67402E-40 
                                        bool %111 = OpConstantFalse 
                                        bool %117 = OpSpecConstantFalse 
                                         u32 %120 = OpConstant 1 
                              Private f32_4* %124 = OpVariable Private 
                                             %163 = OpTypePointer Function %21 
                                         i32 %177 = OpConstant 4 
                                             %178 = OpTypePointer Uniform %21 
                                Private f32* %192 = OpVariable Private 
                                         f32 %195 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                Private f32* %199 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                         f32 %203 = OpConstant 3.67402E-40 
                                             %210 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %211 = OpTypeSampledImage %210 
                                             %212 = OpTypePointer UniformConstant %211 
 UniformConstant read_only Texture3DSampled* %213 = OpVariable UniformConstant 
                              Private f32_4* %218 = OpVariable Private 
                              Private f32_3* %225 = OpVariable Private 
                                         f32 %233 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %239 = OpVariable UniformConstant 
                                         i32 %250 = OpConstant 5 
                              Private f32_3* %255 = OpVariable Private 
                                             %278 = OpTypePointer Output %7 
                               Output f32_4* %279 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %43 = OpAccessChain %31 %33 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 3 3 3 
                                        f32_4 %46 = OpLoad %20 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                                      OpStore %42 %51 
                                        f32_3 %52 = OpLoad %42 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFMul %52 %56 
                                                      OpStore %42 %57 
                                 Private f32* %60 = OpAccessChain %9 %58 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %63 = OpAccessChain %54 %58 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %61 %64 
                                 Private f32* %66 = OpAccessChain %20 %58 
                                                      OpStore %66 %65 
                                        f32_3 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 1 1 1 
                               Uniform f32_4* %74 = OpAccessChain %31 %72 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFMul %71 %76 
                                                      OpStore %67 %77 
                               Uniform f32_4* %79 = OpAccessChain %31 %72 %78 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %69 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %67 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %67 %86 
                               Uniform f32_4* %88 = OpAccessChain %31 %72 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpLoad %69 
                                        f32_3 %92 = OpVectorShuffle %91 %91 2 2 2 
                                        f32_3 %93 = OpFMul %90 %92 
                                        f32_3 %94 = OpLoad %67 
                                        f32_3 %95 = OpFAdd %93 %94 
                                                      OpStore %67 %95 
                                        f32_3 %96 = OpLoad %67 
                               Uniform f32_4* %98 = OpAccessChain %31 %72 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %96 %100 
                                                      OpStore %67 %101 
                                Uniform f32* %107 = OpAccessChain %31 %73 %105 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdEqual %108 %109 
                                                      OpStore %104 %110 
                                                      OpSelectionMerge %113 None 
                                                      OpBranchConditional %111 %112 %113 
                                             %112 = OpLabel 
                                        bool %114 = OpLoad %104 
                                                      OpSelectionMerge %116 None 
                                                      OpBranchConditional %114 %115 %116 
                                             %115 = OpLabel 
                                                      OpBranch %116 
                                             %116 = OpLabel 
                                                      OpBranch %113 
                                             %113 = OpLabel 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %220 
                                             %118 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %31 %73 %120 
                                         f32 %122 = OpLoad %121 
                                        bool %123 = OpFOrdEqual %122 %109 
                                                      OpStore %104 %123 
                                       f32_3 %125 = OpLoad %69 
                                       f32_3 %126 = OpVectorShuffle %125 %125 1 1 1 
                              Uniform f32_4* %127 = OpAccessChain %31 %87 %73 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %126 %129 
                                       f32_4 %131 = OpLoad %124 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %124 %132 
                              Uniform f32_4* %133 = OpAccessChain %31 %87 %78 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpLoad %69 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 0 0 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %124 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFAdd %138 %140 
                                       f32_4 %142 = OpLoad %124 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                      OpStore %124 %143 
                              Uniform f32_4* %144 = OpAccessChain %31 %87 %87 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpLoad %69 
                                       f32_3 %148 = OpVectorShuffle %147 %147 2 2 2 
                                       f32_3 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %124 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFAdd %149 %151 
                                       f32_4 %153 = OpLoad %124 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %124 %154 
                                       f32_4 %155 = OpLoad %124 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_4* %157 = OpAccessChain %31 %87 %97 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %156 %159 
                                       f32_4 %161 = OpLoad %124 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %124 %162 
                                        bool %165 = OpLoad %104 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %170 
                                             %166 = OpLabel 
                                       f32_4 %168 = OpLoad %124 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                                      OpStore %164 %169 
                                                      OpBranch %167 
                                             %170 = OpLabel 
                                       f32_3 %171 = OpLoad %69 
                                                      OpStore %164 %171 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %172 = OpLoad %164 
                                       f32_4 %173 = OpLoad %124 
                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
                                                      OpStore %124 %174 
                                       f32_4 %175 = OpLoad %124 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                              Uniform f32_3* %179 = OpAccessChain %31 %177 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFNegate %180 
                                       f32_3 %182 = OpFAdd %176 %181 
                                       f32_4 %183 = OpLoad %124 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %124 %184 
                                       f32_4 %185 = OpLoad %124 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_3* %187 = OpAccessChain %31 %97 
                                       f32_3 %188 = OpLoad %187 
                                       f32_3 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %124 
                                       f32_4 %191 = OpVectorShuffle %190 %189 0 4 5 6 
                                                      OpStore %124 %191 
                                Private f32* %193 = OpAccessChain %124 %120 
                                         f32 %194 = OpLoad %193 
                                         f32 %196 = OpFMul %194 %195 
                                         f32 %198 = OpFAdd %196 %197 
                                                      OpStore %192 %198 
                                Uniform f32* %201 = OpAccessChain %31 %73 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %204 = OpFMul %202 %203 
                                         f32 %205 = OpFAdd %204 %197 
                                                      OpStore %199 %205 
                                         f32 %206 = OpLoad %192 
                                         f32 %207 = OpLoad %199 
                                         f32 %208 = OpExtInst %1 40 %206 %207 
                                Private f32* %209 = OpAccessChain %124 %105 
                                                      OpStore %209 %208 
                  read_only Texture3DSampled %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %124 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 2 3 
                                       f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                      OpStore %124 %217 
                                       f32_4 %219 = OpLoad %124 
                                                      OpStore %218 %219 
                                                      OpBranch %119 
                                             %220 = OpLabel 
                                Private f32* %221 = OpAccessChain %218 %105 
                                                      OpStore %221 %109 
                                Private f32* %222 = OpAccessChain %218 %120 
                                                      OpStore %222 %109 
                                Private f32* %223 = OpAccessChain %218 %200 
                                                      OpStore %223 %109 
                                Private f32* %224 = OpAccessChain %218 %58 
                                                      OpStore %224 %109 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                       f32_4 %226 = OpLoad %218 
                              Uniform f32_4* %227 = OpAccessChain %31 %78 
                                       f32_4 %228 = OpLoad %227 
                                         f32 %229 = OpDot %226 %228 
                                Private f32* %230 = OpAccessChain %225 %105 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %225 %105 
                                         f32 %232 = OpLoad %231 
                                         f32 %234 = OpExtInst %1 43 %232 %233 %109 
                                Private f32* %235 = OpAccessChain %225 %105 
                                                      OpStore %235 %234 
                                       f32_3 %236 = OpLoad %67 
                                       f32_3 %237 = OpLoad %67 
                                         f32 %238 = OpDot %236 %237 
                                                      OpStore %192 %238 
                  read_only Texture2DSampled %240 = OpLoad %239 
                                         f32 %241 = OpLoad %192 
                                       f32_2 %242 = OpCompositeConstruct %241 %241 
                                       f32_4 %243 = OpImageSampleImplicitLod %240 %242 
                                         f32 %244 = OpCompositeExtract %243 3 
                                                      OpStore %192 %244 
                                Private f32* %245 = OpAccessChain %225 %105 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpLoad %192 
                                         f32 %248 = OpFMul %246 %247 
                                                      OpStore %192 %248 
                                       f32_3 %249 = OpLoad %42 
                              Uniform f32_4* %251 = OpAccessChain %31 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpFMul %249 %253 
                                                      OpStore %225 %254 
                                         f32 %256 = OpLoad %192 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %225 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %255 %259 
                                       f32_3 %260 = OpLoad %225 
                                       f32_3 %261 = OpFNegate %260 
                                         f32 %262 = OpLoad %192 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpFMul %261 %263 
                              Uniform f32_4* %265 = OpAccessChain %31 %33 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %264 %267 
                                                      OpStore %42 %268 
                              Uniform f32_4* %269 = OpAccessChain %31 %33 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpLoad %42 
                                       f32_3 %273 = OpFMul %271 %272 
                                       f32_3 %274 = OpLoad %255 
                                       f32_3 %275 = OpFAdd %273 %274 
                                       f32_4 %276 = OpLoad %20 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %20 %277 
                                       f32_4 %280 = OpLoad %20 
                                                      OpStore %279 %280 
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
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
                                       f32_4 %151 = OpLoad %150 
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
; Bound: 237
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %53 %91 %234 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %82 SpecId 82 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %183 DescriptorSet 183 
                                                      OpDecorate %183 Binding 183 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %234 Location 234 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                                              %52 = OpTypePointer Input %7 
                                 Input f32_4* %53 = OpVariable Input 
                                          u32 %57 = OpConstant 3 
                                              %58 = OpTypePointer Private %6 
                                              %61 = OpTypePointer Input %6 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          i32 %69 = OpConstant 1 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                                         bool %76 = OpConstantFalse 
                                         bool %82 = OpSpecConstantFalse 
                                          u32 %85 = OpConstant 1 
                               Private f32_4* %89 = OpVariable Private 
                                              %90 = OpTypePointer Input %21 
                                 Input f32_3* %91 = OpVariable Input 
                                          i32 %94 = OpConstant 2 
                                         i32 %101 = OpConstant 0 
                                         i32 %126 = OpConstant 3 
                                             %133 = OpTypePointer Function %21 
                                         i32 %147 = OpConstant 4 
                                             %148 = OpTypePointer Uniform %21 
                                Private f32* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                                         f32 %167 = OpConstant 3.67402E-40 
                                Private f32* %169 = OpVariable Private 
                                         u32 %170 = OpConstant 2 
                                         f32 %173 = OpConstant 3.67402E-40 
                                             %180 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %181 = OpTypeSampledImage %180 
                                             %182 = OpTypePointer UniformConstant %181 
 UniformConstant read_only Texture3DSampled* %183 = OpVariable UniformConstant 
                              Private f32_4* %188 = OpVariable Private 
                                Private f32* %195 = OpVariable Private 
                                         f32 %201 = OpConstant 3.67402E-40 
                              Private f32_3* %203 = OpVariable Private 
                                         i32 %205 = OpConstant 5 
                              Private f32_3* %210 = OpVariable Private 
                                             %233 = OpTypePointer Output %7 
                               Output f32_4* %234 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %134 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %42 = OpAccessChain %30 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 3 3 3 
                                        f32_4 %45 = OpLoad %20 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                                      OpStore %41 %50 
                                        f32_3 %51 = OpLoad %41 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFMul %51 %55 
                                                      OpStore %41 %56 
                                 Private f32* %59 = OpAccessChain %9 %57 
                                          f32 %60 = OpLoad %59 
                                   Input f32* %62 = OpAccessChain %53 %57 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %60 %63 
                                 Private f32* %65 = OpAccessChain %20 %57 
                                                      OpStore %65 %64 
                                 Uniform f32* %72 = OpAccessChain %30 %69 %70 
                                          f32 %73 = OpLoad %72 
                                         bool %75 = OpFOrdEqual %73 %74 
                                                      OpStore %68 %75 
                                                      OpSelectionMerge %78 None 
                                                      OpBranchConditional %76 %77 %78 
                                              %77 = OpLabel 
                                         bool %79 = OpLoad %68 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpBranch %81 
                                              %81 = OpLabel 
                                                      OpBranch %78 
                                              %78 = OpLabel 
                                                      OpSelectionMerge %84 None 
                                                      OpBranchConditional %82 %83 %190 
                                              %83 = OpLabel 
                                 Uniform f32* %86 = OpAccessChain %30 %69 %85 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdEqual %87 %74 
                                                      OpStore %68 %88 
                                        f32_3 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 1 1 1 
                               Uniform f32_4* %95 = OpAccessChain %30 %94 %69 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFMul %93 %97 
                                        f32_4 %99 = OpLoad %89 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                      OpStore %89 %100 
                              Uniform f32_4* %102 = OpAccessChain %30 %94 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %91 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %89 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %89 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %89 %112 
                              Uniform f32_4* %113 = OpAccessChain %30 %94 %94 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpVectorShuffle %116 %116 2 2 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %89 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %89 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %89 %123 
                                       f32_4 %124 = OpLoad %89 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %30 %94 %126 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFAdd %125 %129 
                                       f32_4 %131 = OpLoad %89 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %89 %132 
                                        bool %135 = OpLoad %68 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %140 
                                             %136 = OpLabel 
                                       f32_4 %138 = OpLoad %89 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                                      OpStore %134 %139 
                                                      OpBranch %137 
                                             %140 = OpLabel 
                                       f32_3 %141 = OpLoad %91 
                                                      OpStore %134 %141 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                       f32_3 %142 = OpLoad %134 
                                       f32_4 %143 = OpLoad %89 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %89 %144 
                                       f32_4 %145 = OpLoad %89 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_3* %149 = OpAccessChain %30 %147 
                                       f32_3 %150 = OpLoad %149 
                                       f32_3 %151 = OpFNegate %150 
                                       f32_3 %152 = OpFAdd %146 %151 
                                       f32_4 %153 = OpLoad %89 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %89 %154 
                                       f32_4 %155 = OpLoad %89 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_3* %157 = OpAccessChain %30 %126 
                                       f32_3 %158 = OpLoad %157 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %89 
                                       f32_4 %161 = OpVectorShuffle %160 %159 0 4 5 6 
                                                      OpStore %89 %161 
                                Private f32* %163 = OpAccessChain %89 %85 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpFMul %164 %165 
                                         f32 %168 = OpFAdd %166 %167 
                                                      OpStore %162 %168 
                                Uniform f32* %171 = OpAccessChain %30 %69 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %174 = OpFMul %172 %173 
                                         f32 %175 = OpFAdd %174 %167 
                                                      OpStore %169 %175 
                                         f32 %176 = OpLoad %162 
                                         f32 %177 = OpLoad %169 
                                         f32 %178 = OpExtInst %1 40 %176 %177 
                                Private f32* %179 = OpAccessChain %89 %70 
                                                      OpStore %179 %178 
                  read_only Texture3DSampled %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %89 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 2 3 
                                       f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                                      OpStore %89 %187 
                                       f32_4 %189 = OpLoad %89 
                                                      OpStore %188 %189 
                                                      OpBranch %84 
                                             %190 = OpLabel 
                                Private f32* %191 = OpAccessChain %188 %70 
                                                      OpStore %191 %74 
                                Private f32* %192 = OpAccessChain %188 %85 
                                                      OpStore %192 %74 
                                Private f32* %193 = OpAccessChain %188 %170 
                                                      OpStore %193 %74 
                                Private f32* %194 = OpAccessChain %188 %57 
                                                      OpStore %194 %74 
                                                      OpBranch %84 
                                              %84 = OpLabel 
                                       f32_4 %196 = OpLoad %188 
                              Uniform f32_4* %197 = OpAccessChain %30 %101 
                                       f32_4 %198 = OpLoad %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %195 %199 
                                         f32 %200 = OpLoad %195 
                                         f32 %202 = OpExtInst %1 43 %200 %201 %74 
                                                      OpStore %195 %202 
                                       f32_3 %204 = OpLoad %41 
                              Uniform f32_4* %206 = OpAccessChain %30 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFMul %204 %208 
                                                      OpStore %203 %209 
                                         f32 %211 = OpLoad %195 
                                       f32_3 %212 = OpCompositeConstruct %211 %211 %211 
                                       f32_3 %213 = OpLoad %203 
                                       f32_3 %214 = OpFMul %212 %213 
                                                      OpStore %210 %214 
                                       f32_3 %215 = OpLoad %203 
                                       f32_3 %216 = OpFNegate %215 
                                         f32 %217 = OpLoad %195 
                                       f32_3 %218 = OpCompositeConstruct %217 %217 %217 
                                       f32_3 %219 = OpFMul %216 %218 
                              Uniform f32_4* %220 = OpAccessChain %30 %32 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFAdd %219 %222 
                                                      OpStore %41 %223 
                              Uniform f32_4* %224 = OpAccessChain %30 %32 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpLoad %41 
                                       f32_3 %228 = OpFMul %226 %227 
                                       f32_3 %229 = OpLoad %210 
                                       f32_3 %230 = OpFAdd %228 %229 
                                       f32_4 %231 = OpLoad %20 
                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 6 3 
                                                      OpStore %20 %232 
                                       f32_4 %235 = OpLoad %20 
                                                      OpStore %234 %235 
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat10_3;
vec2 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
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
                                       f32_4 %151 = OpLoad %150 
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
; Bound: 314
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %69 %311 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %113 SpecId 113 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %251 DescriptorSet 251 
                                                      OpDecorate %251 Binding 251 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %266 DescriptorSet 266 
                                                      OpDecorate %266 Binding 266 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %7 
                                              %41 = OpTypePointer Private %21 
                               Private f32_3* %42 = OpVariable Private 
                                              %53 = OpTypePointer Input %7 
                                 Input f32_4* %54 = OpVariable Input 
                                          u32 %58 = OpConstant 3 
                                              %59 = OpTypePointer Private %6 
                                              %62 = OpTypePointer Input %6 
                               Private f32_4* %67 = OpVariable Private 
                                              %68 = OpTypePointer Input %21 
                                 Input f32_3* %69 = OpVariable Input 
                                          i32 %72 = OpConstant 6 
                                          i32 %73 = OpConstant 1 
                                          i32 %77 = OpConstant 0 
                                          i32 %85 = OpConstant 2 
                                          i32 %94 = OpConstant 3 
                                              %98 = OpTypeBool 
                                              %99 = OpTypePointer Private %98 
                               Private bool* %100 = OpVariable Private 
                                         u32 %101 = OpConstant 0 
                                             %102 = OpTypePointer Uniform %6 
                                         f32 %105 = OpConstant 3.67402E-40 
                                        bool %107 = OpConstantFalse 
                                        bool %113 = OpSpecConstantFalse 
                                         u32 %116 = OpConstant 1 
                              Private f32_4* %120 = OpVariable Private 
                                             %159 = OpTypePointer Function %21 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %21 
                                Private f32* %188 = OpVariable Private 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                Private f32* %195 = OpVariable Private 
                                         u32 %196 = OpConstant 2 
                                         f32 %199 = OpConstant 3.67402E-40 
                                             %206 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %207 = OpTypeSampledImage %206 
                                             %208 = OpTypePointer UniformConstant %207 
 UniformConstant read_only Texture3DSampled* %209 = OpVariable UniformConstant 
                              Private f32_4* %214 = OpVariable Private 
                                Private f32* %221 = OpVariable Private 
                                         f32 %227 = OpConstant 3.67402E-40 
                              Private f32_3* %232 = OpVariable Private 
                                             %233 = OpTypePointer Function %6 
                                             %241 = OpTypePointer Private %15 
                              Private f32_2* %242 = OpVariable Private 
                                       f32_2 %249 = OpConstantComposite %199 %199 
 UniformConstant read_only Texture2DSampled* %251 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %266 = OpVariable UniformConstant 
                                         i32 %282 = OpConstant 5 
                              Private f32_3* %287 = OpVariable Private 
                                             %310 = OpTypePointer Output %7 
                               Output f32_4* %311 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %160 = OpVariable Function 
                               Function f32* %234 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %43 = OpAccessChain %31 %33 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 3 3 3 
                                        f32_4 %46 = OpLoad %20 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                                      OpStore %42 %51 
                                        f32_3 %52 = OpLoad %42 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFMul %52 %56 
                                                      OpStore %42 %57 
                                 Private f32* %60 = OpAccessChain %9 %58 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %63 = OpAccessChain %54 %58 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %61 %64 
                                 Private f32* %66 = OpAccessChain %20 %58 
                                                      OpStore %66 %65 
                                        f32_3 %70 = OpLoad %69 
                                        f32_4 %71 = OpVectorShuffle %70 %70 1 1 1 1 
                               Uniform f32_4* %74 = OpAccessChain %31 %72 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpFMul %71 %75 
                                                      OpStore %67 %76 
                               Uniform f32_4* %78 = OpAccessChain %31 %72 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpLoad %69 
                                        f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %67 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %67 %84 
                               Uniform f32_4* %86 = OpAccessChain %31 %72 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpLoad %69 
                                        f32_4 %89 = OpVectorShuffle %88 %88 2 2 2 2 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %67 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %67 %92 
                                        f32_4 %93 = OpLoad %67 
                               Uniform f32_4* %95 = OpAccessChain %31 %72 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpFAdd %93 %96 
                                                      OpStore %67 %97 
                                Uniform f32* %103 = OpAccessChain %31 %73 %101 
                                         f32 %104 = OpLoad %103 
                                        bool %106 = OpFOrdEqual %104 %105 
                                                      OpStore %100 %106 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %109 
                                             %108 = OpLabel 
                                        bool %110 = OpLoad %100 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %216 
                                             %114 = OpLabel 
                                Uniform f32* %117 = OpAccessChain %31 %73 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %119 = OpFOrdEqual %118 %105 
                                                      OpStore %100 %119 
                                       f32_3 %121 = OpLoad %69 
                                       f32_3 %122 = OpVectorShuffle %121 %121 1 1 1 
                              Uniform f32_4* %123 = OpAccessChain %31 %85 %73 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %120 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %120 %128 
                              Uniform f32_4* %129 = OpAccessChain %31 %85 %77 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %69 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %120 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %120 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %120 %139 
                              Uniform f32_4* %140 = OpAccessChain %31 %85 %85 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %69 
                                       f32_3 %144 = OpVectorShuffle %143 %143 2 2 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %120 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %145 %147 
                                       f32_4 %149 = OpLoad %120 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %120 %150 
                                       f32_4 %151 = OpLoad %120 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %31 %85 %94 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %152 %155 
                                       f32_4 %157 = OpLoad %120 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %120 %158 
                                        bool %161 = OpLoad %100 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %161 %162 %166 
                                             %162 = OpLabel 
                                       f32_4 %164 = OpLoad %120 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                                      OpStore %160 %165 
                                                      OpBranch %163 
                                             %166 = OpLabel 
                                       f32_3 %167 = OpLoad %69 
                                                      OpStore %160 %167 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_3 %168 = OpLoad %160 
                                       f32_4 %169 = OpLoad %120 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %120 %170 
                                       f32_4 %171 = OpLoad %120 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_3* %175 = OpAccessChain %31 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                       f32_4 %179 = OpLoad %120 
                                       f32_4 %180 = OpVectorShuffle %179 %178 4 5 6 3 
                                                      OpStore %120 %180 
                                       f32_4 %181 = OpLoad %120 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_3* %183 = OpAccessChain %31 %94 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %120 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 4 5 6 
                                                      OpStore %120 %187 
                                Private f32* %189 = OpAccessChain %120 %116 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %194 = OpFAdd %192 %193 
                                                      OpStore %188 %194 
                                Uniform f32* %197 = OpAccessChain %31 %73 %196 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %193 
                                                      OpStore %195 %201 
                                         f32 %202 = OpLoad %188 
                                         f32 %203 = OpLoad %195 
                                         f32 %204 = OpExtInst %1 40 %202 %203 
                                Private f32* %205 = OpAccessChain %120 %101 
                                                      OpStore %205 %204 
                  read_only Texture3DSampled %210 = OpLoad %209 
                                       f32_4 %211 = OpLoad %120 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 2 3 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                                      OpStore %120 %213 
                                       f32_4 %215 = OpLoad %120 
                                                      OpStore %214 %215 
                                                      OpBranch %115 
                                             %216 = OpLabel 
                                Private f32* %217 = OpAccessChain %214 %101 
                                                      OpStore %217 %105 
                                Private f32* %218 = OpAccessChain %214 %116 
                                                      OpStore %218 %105 
                                Private f32* %219 = OpAccessChain %214 %196 
                                                      OpStore %219 %105 
                                Private f32* %220 = OpAccessChain %214 %58 
                                                      OpStore %220 %105 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                       f32_4 %222 = OpLoad %214 
                              Uniform f32_4* %223 = OpAccessChain %31 %77 
                                       f32_4 %224 = OpLoad %223 
                                         f32 %225 = OpDot %222 %224 
                                                      OpStore %221 %225 
                                         f32 %226 = OpLoad %221 
                                         f32 %228 = OpExtInst %1 43 %226 %227 %105 
                                                      OpStore %221 %228 
                                Private f32* %229 = OpAccessChain %67 %196 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdLessThan %227 %230 
                                                      OpStore %100 %231 
                                        bool %235 = OpLoad %100 
                                                      OpSelectionMerge %237 None 
                                                      OpBranchConditional %235 %236 %238 
                                             %236 = OpLabel 
                                                      OpStore %234 %105 
                                                      OpBranch %237 
                                             %238 = OpLabel 
                                                      OpStore %234 %227 
                                                      OpBranch %237 
                                             %237 = OpLabel 
                                         f32 %239 = OpLoad %234 
                                Private f32* %240 = OpAccessChain %232 %101 
                                                      OpStore %240 %239 
                                       f32_4 %243 = OpLoad %67 
                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
                                       f32_4 %245 = OpLoad %67 
                                       f32_2 %246 = OpVectorShuffle %245 %245 3 3 
                                       f32_2 %247 = OpFDiv %244 %246 
                                                      OpStore %242 %247 
                                       f32_2 %248 = OpLoad %242 
                                       f32_2 %250 = OpFAdd %248 %249 
                                                      OpStore %242 %250 
                  read_only Texture2DSampled %252 = OpLoad %251 
                                       f32_2 %253 = OpLoad %242 
                                       f32_4 %254 = OpImageSampleImplicitLod %252 %253 
                                         f32 %255 = OpCompositeExtract %254 3 
                                                      OpStore %188 %255 
                                         f32 %256 = OpLoad %188 
                                Private f32* %257 = OpAccessChain %232 %101 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Private f32* %260 = OpAccessChain %232 %101 
                                                      OpStore %260 %259 
                                       f32_4 %261 = OpLoad %67 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_4 %263 = OpLoad %67 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                         f32 %265 = OpDot %262 %264 
                                                      OpStore %188 %265 
                  read_only Texture2DSampled %267 = OpLoad %266 
                                         f32 %268 = OpLoad %188 
                                       f32_2 %269 = OpCompositeConstruct %268 %268 
                                       f32_4 %270 = OpImageSampleImplicitLod %267 %269 
                                         f32 %271 = OpCompositeExtract %270 3 
                                                      OpStore %188 %271 
                                         f32 %272 = OpLoad %188 
                                Private f32* %273 = OpAccessChain %232 %101 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %272 %274 
                                Private f32* %276 = OpAccessChain %232 %101 
                                                      OpStore %276 %275 
                                         f32 %277 = OpLoad %221 
                                Private f32* %278 = OpAccessChain %232 %101 
                                         f32 %279 = OpLoad %278 
                                         f32 %280 = OpFMul %277 %279 
                                                      OpStore %221 %280 
                                       f32_3 %281 = OpLoad %42 
                              Uniform f32_4* %283 = OpAccessChain %31 %282 
                                       f32_4 %284 = OpLoad %283 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFMul %281 %285 
                                                      OpStore %232 %286 
                                         f32 %288 = OpLoad %221 
                                       f32_3 %289 = OpCompositeConstruct %288 %288 %288 
                                       f32_3 %290 = OpLoad %232 
                                       f32_3 %291 = OpFMul %289 %290 
                                                      OpStore %287 %291 
                                       f32_3 %292 = OpLoad %232 
                                       f32_3 %293 = OpFNegate %292 
                                         f32 %294 = OpLoad %221 
                                       f32_3 %295 = OpCompositeConstruct %294 %294 %294 
                                       f32_3 %296 = OpFMul %293 %295 
                              Uniform f32_4* %297 = OpAccessChain %31 %33 
                                       f32_4 %298 = OpLoad %297 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_3 %300 = OpFAdd %296 %299 
                                                      OpStore %42 %300 
                              Uniform f32_4* %301 = OpAccessChain %31 %33 
                                       f32_4 %302 = OpLoad %301 
                                       f32_3 %303 = OpVectorShuffle %302 %302 3 3 3 
                                       f32_3 %304 = OpLoad %42 
                                       f32_3 %305 = OpFMul %303 %304 
                                       f32_3 %306 = OpLoad %287 
                                       f32_3 %307 = OpFAdd %305 %306 
                                       f32_4 %308 = OpLoad %20 
                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 6 3 
                                                      OpStore %20 %309 
                                       f32_4 %312 = OpLoad %20 
                                                      OpStore %311 %312 
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
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
                                       f32_4 %151 = OpLoad %150 
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
; Bound: 295
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %69 %292 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %117 SpecId 117 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %239 DescriptorSet 239 
                                                      OpDecorate %239 Binding 239 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %7 
                                              %41 = OpTypePointer Private %21 
                               Private f32_3* %42 = OpVariable Private 
                                              %53 = OpTypePointer Input %7 
                                 Input f32_4* %54 = OpVariable Input 
                                          u32 %58 = OpConstant 3 
                                              %59 = OpTypePointer Private %6 
                                              %62 = OpTypePointer Input %6 
                               Private f32_3* %67 = OpVariable Private 
                                              %68 = OpTypePointer Input %21 
                                 Input f32_3* %69 = OpVariable Input 
                                          i32 %72 = OpConstant 6 
                                          i32 %73 = OpConstant 1 
                                          i32 %78 = OpConstant 0 
                                          i32 %87 = OpConstant 2 
                                          i32 %97 = OpConstant 3 
                                             %102 = OpTypeBool 
                                             %103 = OpTypePointer Private %102 
                               Private bool* %104 = OpVariable Private 
                                         u32 %105 = OpConstant 0 
                                             %106 = OpTypePointer Uniform %6 
                                         f32 %109 = OpConstant 3.67402E-40 
                                        bool %111 = OpConstantFalse 
                                        bool %117 = OpSpecConstantFalse 
                                         u32 %120 = OpConstant 1 
                              Private f32_4* %124 = OpVariable Private 
                                             %163 = OpTypePointer Function %21 
                                         i32 %177 = OpConstant 4 
                                             %178 = OpTypePointer Uniform %21 
                                Private f32* %192 = OpVariable Private 
                                         f32 %195 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                Private f32* %199 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                         f32 %203 = OpConstant 3.67402E-40 
                                             %210 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %211 = OpTypeSampledImage %210 
                                             %212 = OpTypePointer UniformConstant %211 
 UniformConstant read_only Texture3DSampled* %213 = OpVariable UniformConstant 
                              Private f32_4* %218 = OpVariable Private 
                              Private f32_3* %225 = OpVariable Private 
                                         f32 %233 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %239 = OpVariable UniformConstant 
                                             %245 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %246 = OpTypeSampledImage %245 
                                             %247 = OpTypePointer UniformConstant %246 
UniformConstant read_only TextureCubeSampled* %248 = OpVariable UniformConstant 
                                         i32 %263 = OpConstant 5 
                              Private f32_3* %268 = OpVariable Private 
                                             %291 = OpTypePointer Output %7 
                               Output f32_4* %292 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %43 = OpAccessChain %31 %33 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 3 3 3 
                                        f32_4 %46 = OpLoad %20 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                                      OpStore %42 %51 
                                        f32_3 %52 = OpLoad %42 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFMul %52 %56 
                                                      OpStore %42 %57 
                                 Private f32* %60 = OpAccessChain %9 %58 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %63 = OpAccessChain %54 %58 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %61 %64 
                                 Private f32* %66 = OpAccessChain %20 %58 
                                                      OpStore %66 %65 
                                        f32_3 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 1 1 1 
                               Uniform f32_4* %74 = OpAccessChain %31 %72 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFMul %71 %76 
                                                      OpStore %67 %77 
                               Uniform f32_4* %79 = OpAccessChain %31 %72 %78 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %69 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_3 %85 = OpLoad %67 
                                        f32_3 %86 = OpFAdd %84 %85 
                                                      OpStore %67 %86 
                               Uniform f32_4* %88 = OpAccessChain %31 %72 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpLoad %69 
                                        f32_3 %92 = OpVectorShuffle %91 %91 2 2 2 
                                        f32_3 %93 = OpFMul %90 %92 
                                        f32_3 %94 = OpLoad %67 
                                        f32_3 %95 = OpFAdd %93 %94 
                                                      OpStore %67 %95 
                                        f32_3 %96 = OpLoad %67 
                               Uniform f32_4* %98 = OpAccessChain %31 %72 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %96 %100 
                                                      OpStore %67 %101 
                                Uniform f32* %107 = OpAccessChain %31 %73 %105 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdEqual %108 %109 
                                                      OpStore %104 %110 
                                                      OpSelectionMerge %113 None 
                                                      OpBranchConditional %111 %112 %113 
                                             %112 = OpLabel 
                                        bool %114 = OpLoad %104 
                                                      OpSelectionMerge %116 None 
                                                      OpBranchConditional %114 %115 %116 
                                             %115 = OpLabel 
                                                      OpBranch %116 
                                             %116 = OpLabel 
                                                      OpBranch %113 
                                             %113 = OpLabel 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %220 
                                             %118 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %31 %73 %120 
                                         f32 %122 = OpLoad %121 
                                        bool %123 = OpFOrdEqual %122 %109 
                                                      OpStore %104 %123 
                                       f32_3 %125 = OpLoad %69 
                                       f32_3 %126 = OpVectorShuffle %125 %125 1 1 1 
                              Uniform f32_4* %127 = OpAccessChain %31 %87 %73 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %126 %129 
                                       f32_4 %131 = OpLoad %124 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %124 %132 
                              Uniform f32_4* %133 = OpAccessChain %31 %87 %78 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpLoad %69 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 0 0 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %124 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFAdd %138 %140 
                                       f32_4 %142 = OpLoad %124 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                      OpStore %124 %143 
                              Uniform f32_4* %144 = OpAccessChain %31 %87 %87 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpLoad %69 
                                       f32_3 %148 = OpVectorShuffle %147 %147 2 2 2 
                                       f32_3 %149 = OpFMul %146 %148 
                                       f32_4 %150 = OpLoad %124 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFAdd %149 %151 
                                       f32_4 %153 = OpLoad %124 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %124 %154 
                                       f32_4 %155 = OpLoad %124 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                              Uniform f32_4* %157 = OpAccessChain %31 %87 %97 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %156 %159 
                                       f32_4 %161 = OpLoad %124 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %124 %162 
                                        bool %165 = OpLoad %104 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %170 
                                             %166 = OpLabel 
                                       f32_4 %168 = OpLoad %124 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                                      OpStore %164 %169 
                                                      OpBranch %167 
                                             %170 = OpLabel 
                                       f32_3 %171 = OpLoad %69 
                                                      OpStore %164 %171 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %172 = OpLoad %164 
                                       f32_4 %173 = OpLoad %124 
                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
                                                      OpStore %124 %174 
                                       f32_4 %175 = OpLoad %124 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                              Uniform f32_3* %179 = OpAccessChain %31 %177 
                                       f32_3 %180 = OpLoad %179 
                                       f32_3 %181 = OpFNegate %180 
                                       f32_3 %182 = OpFAdd %176 %181 
                                       f32_4 %183 = OpLoad %124 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %124 %184 
                                       f32_4 %185 = OpLoad %124 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_3* %187 = OpAccessChain %31 %97 
                                       f32_3 %188 = OpLoad %187 
                                       f32_3 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %124 
                                       f32_4 %191 = OpVectorShuffle %190 %189 0 4 5 6 
                                                      OpStore %124 %191 
                                Private f32* %193 = OpAccessChain %124 %120 
                                         f32 %194 = OpLoad %193 
                                         f32 %196 = OpFMul %194 %195 
                                         f32 %198 = OpFAdd %196 %197 
                                                      OpStore %192 %198 
                                Uniform f32* %201 = OpAccessChain %31 %73 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %204 = OpFMul %202 %203 
                                         f32 %205 = OpFAdd %204 %197 
                                                      OpStore %199 %205 
                                         f32 %206 = OpLoad %192 
                                         f32 %207 = OpLoad %199 
                                         f32 %208 = OpExtInst %1 40 %206 %207 
                                Private f32* %209 = OpAccessChain %124 %105 
                                                      OpStore %209 %208 
                  read_only Texture3DSampled %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %124 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 2 3 
                                       f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                      OpStore %124 %217 
                                       f32_4 %219 = OpLoad %124 
                                                      OpStore %218 %219 
                                                      OpBranch %119 
                                             %220 = OpLabel 
                                Private f32* %221 = OpAccessChain %218 %105 
                                                      OpStore %221 %109 
                                Private f32* %222 = OpAccessChain %218 %120 
                                                      OpStore %222 %109 
                                Private f32* %223 = OpAccessChain %218 %200 
                                                      OpStore %223 %109 
                                Private f32* %224 = OpAccessChain %218 %58 
                                                      OpStore %224 %109 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                       f32_4 %226 = OpLoad %218 
                              Uniform f32_4* %227 = OpAccessChain %31 %78 
                                       f32_4 %228 = OpLoad %227 
                                         f32 %229 = OpDot %226 %228 
                                Private f32* %230 = OpAccessChain %225 %105 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %225 %105 
                                         f32 %232 = OpLoad %231 
                                         f32 %234 = OpExtInst %1 43 %232 %233 %109 
                                Private f32* %235 = OpAccessChain %225 %105 
                                                      OpStore %235 %234 
                                       f32_3 %236 = OpLoad %67 
                                       f32_3 %237 = OpLoad %67 
                                         f32 %238 = OpDot %236 %237 
                                                      OpStore %192 %238 
                  read_only Texture2DSampled %240 = OpLoad %239 
                                         f32 %241 = OpLoad %192 
                                       f32_2 %242 = OpCompositeConstruct %241 %241 
                                       f32_4 %243 = OpImageSampleImplicitLod %240 %242 
                                         f32 %244 = OpCompositeExtract %243 3 
                                                      OpStore %192 %244 
                read_only TextureCubeSampled %249 = OpLoad %248 
                                       f32_3 %250 = OpLoad %67 
                                       f32_4 %251 = OpImageSampleImplicitLod %249 %250 
                                         f32 %252 = OpCompositeExtract %251 3 
                                Private f32* %253 = OpAccessChain %67 %105 
                                                      OpStore %253 %252 
                                         f32 %254 = OpLoad %192 
                                Private f32* %255 = OpAccessChain %67 %105 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFMul %254 %256 
                                                      OpStore %192 %257 
                                Private f32* %258 = OpAccessChain %225 %105 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpLoad %192 
                                         f32 %261 = OpFMul %259 %260 
                                                      OpStore %192 %261 
                                       f32_3 %262 = OpLoad %42 
                              Uniform f32_4* %264 = OpAccessChain %31 %263 
                                       f32_4 %265 = OpLoad %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFMul %262 %266 
                                                      OpStore %225 %267 
                                         f32 %269 = OpLoad %192 
                                       f32_3 %270 = OpCompositeConstruct %269 %269 %269 
                                       f32_3 %271 = OpLoad %225 
                                       f32_3 %272 = OpFMul %270 %271 
                                                      OpStore %268 %272 
                                       f32_3 %273 = OpLoad %225 
                                       f32_3 %274 = OpFNegate %273 
                                         f32 %275 = OpLoad %192 
                                       f32_3 %276 = OpCompositeConstruct %275 %275 %275 
                                       f32_3 %277 = OpFMul %274 %276 
                              Uniform f32_4* %278 = OpAccessChain %31 %33 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFAdd %277 %280 
                                                      OpStore %42 %281 
                              Uniform f32_4* %282 = OpAccessChain %31 %33 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 3 3 3 
                                       f32_3 %285 = OpLoad %42 
                                       f32_3 %286 = OpFMul %284 %285 
                                       f32_3 %287 = OpLoad %268 
                                       f32_3 %288 = OpFAdd %286 %287 
                                       f32_4 %289 = OpLoad %20 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %20 %290 
                                       f32_4 %293 = OpLoad %20 
                                                      OpStore %292 %293 
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
    vs_COLOR0 = in_COLOR0;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat10_0.w * vs_COLOR0.w;
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
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
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
                                       f32_4 %151 = OpLoad %150 
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
; Bound: 279
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %70 %276 
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
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %118 SpecId 118 
                                                      OpDecorate %214 DescriptorSet 214 
                                                      OpDecorate %214 Binding 214 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 DescriptorSet 237 
                                                      OpDecorate %237 Binding 237 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
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
                                              %21 = OpTypeVector %6 3 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %7 
                                              %41 = OpTypePointer Private %21 
                               Private f32_3* %42 = OpVariable Private 
                                              %53 = OpTypePointer Input %7 
                                 Input f32_4* %54 = OpVariable Input 
                                          u32 %58 = OpConstant 3 
                                              %59 = OpTypePointer Private %6 
                                              %62 = OpTypePointer Input %6 
                                              %67 = OpTypePointer Private %15 
                               Private f32_2* %68 = OpVariable Private 
                                              %69 = OpTypePointer Input %21 
                                 Input f32_3* %70 = OpVariable Input 
                                          i32 %73 = OpConstant 6 
                                          i32 %74 = OpConstant 1 
                                          i32 %79 = OpConstant 0 
                                          i32 %88 = OpConstant 2 
                                          i32 %98 = OpConstant 3 
                                             %103 = OpTypeBool 
                                             %104 = OpTypePointer Private %103 
                               Private bool* %105 = OpVariable Private 
                                         u32 %106 = OpConstant 0 
                                             %107 = OpTypePointer Uniform %6 
                                         f32 %110 = OpConstant 3.67402E-40 
                                        bool %112 = OpConstantFalse 
                                        bool %118 = OpSpecConstantFalse 
                                         u32 %121 = OpConstant 1 
                              Private f32_4* %125 = OpVariable Private 
                                             %164 = OpTypePointer Function %21 
                                         i32 %178 = OpConstant 4 
                                             %179 = OpTypePointer Uniform %21 
                                Private f32* %193 = OpVariable Private 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %198 = OpConstant 3.67402E-40 
                                Private f32* %200 = OpVariable Private 
                                         u32 %201 = OpConstant 2 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %211 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %212 = OpTypeSampledImage %211 
                                             %213 = OpTypePointer UniformConstant %212 
 UniformConstant read_only Texture3DSampled* %214 = OpVariable UniformConstant 
                              Private f32_4* %219 = OpVariable Private 
                              Private f32_3* %226 = OpVariable Private 
                                         f32 %234 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %237 = OpVariable UniformConstant 
                                         i32 %247 = OpConstant 5 
                              Private f32_3* %252 = OpVariable Private 
                                             %275 = OpTypePointer Output %7 
                               Output f32_4* %276 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %165 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %43 = OpAccessChain %31 %33 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 3 3 3 
                                        f32_4 %46 = OpLoad %20 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                                      OpStore %42 %51 
                                        f32_3 %52 = OpLoad %42 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFMul %52 %56 
                                                      OpStore %42 %57 
                                 Private f32* %60 = OpAccessChain %9 %58 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %63 = OpAccessChain %54 %58 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %61 %64 
                                 Private f32* %66 = OpAccessChain %20 %58 
                                                      OpStore %66 %65 
                                        f32_3 %71 = OpLoad %70 
                                        f32_2 %72 = OpVectorShuffle %71 %71 1 1 
                               Uniform f32_4* %75 = OpAccessChain %31 %73 %74 
                                        f32_4 %76 = OpLoad %75 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_2 %78 = OpFMul %72 %77 
                                                      OpStore %68 %78 
                               Uniform f32_4* %80 = OpAccessChain %31 %73 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                        f32_3 %83 = OpLoad %70 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 0 
                                        f32_2 %85 = OpFMul %82 %84 
                                        f32_2 %86 = OpLoad %68 
                                        f32_2 %87 = OpFAdd %85 %86 
                                                      OpStore %68 %87 
                               Uniform f32_4* %89 = OpAccessChain %31 %73 %88 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_3 %92 = OpLoad %70 
                                        f32_2 %93 = OpVectorShuffle %92 %92 2 2 
                                        f32_2 %94 = OpFMul %91 %93 
                                        f32_2 %95 = OpLoad %68 
                                        f32_2 %96 = OpFAdd %94 %95 
                                                      OpStore %68 %96 
                                        f32_2 %97 = OpLoad %68 
                               Uniform f32_4* %99 = OpAccessChain %31 %73 %98 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFAdd %97 %101 
                                                      OpStore %68 %102 
                                Uniform f32* %108 = OpAccessChain %31 %74 %106 
                                         f32 %109 = OpLoad %108 
                                        bool %111 = OpFOrdEqual %109 %110 
                                                      OpStore %105 %111 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %114 
                                             %113 = OpLabel 
                                        bool %115 = OpLoad %105 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %117 
                                             %116 = OpLabel 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %221 
                                             %119 = OpLabel 
                                Uniform f32* %122 = OpAccessChain %31 %74 %121 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdEqual %123 %110 
                                                      OpStore %105 %124 
                                       f32_3 %126 = OpLoad %70 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %128 = OpAccessChain %31 %88 %74 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %125 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %125 %133 
                              Uniform f32_4* %134 = OpAccessChain %31 %88 %79 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpLoad %70 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %125 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %125 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %125 %144 
                              Uniform f32_4* %145 = OpAccessChain %31 %88 %88 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpLoad %70 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %125 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %125 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %125 %155 
                                       f32_4 %156 = OpLoad %125 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_4* %158 = OpAccessChain %31 %88 %98 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %157 %160 
                                       f32_4 %162 = OpLoad %125 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %125 %163 
                                        bool %166 = OpLoad %105 
                                                      OpSelectionMerge %168 None 
                                                      OpBranchConditional %166 %167 %171 
                                             %167 = OpLabel 
                                       f32_4 %169 = OpLoad %125 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                                      OpStore %165 %170 
                                                      OpBranch %168 
                                             %171 = OpLabel 
                                       f32_3 %172 = OpLoad %70 
                                                      OpStore %165 %172 
                                                      OpBranch %168 
                                             %168 = OpLabel 
                                       f32_3 %173 = OpLoad %165 
                                       f32_4 %174 = OpLoad %125 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %125 %175 
                                       f32_4 %176 = OpLoad %125 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                              Uniform f32_3* %180 = OpAccessChain %31 %178 
                                       f32_3 %181 = OpLoad %180 
                                       f32_3 %182 = OpFNegate %181 
                                       f32_3 %183 = OpFAdd %177 %182 
                                       f32_4 %184 = OpLoad %125 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %125 %185 
                                       f32_4 %186 = OpLoad %125 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %31 %98 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %125 
                                       f32_4 %192 = OpVectorShuffle %191 %190 0 4 5 6 
                                                      OpStore %125 %192 
                                Private f32* %194 = OpAccessChain %125 %121 
                                         f32 %195 = OpLoad %194 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %199 = OpFAdd %197 %198 
                                                      OpStore %193 %199 
                                Uniform f32* %202 = OpAccessChain %31 %74 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %206 = OpFAdd %205 %198 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %193 
                                         f32 %208 = OpLoad %200 
                                         f32 %209 = OpExtInst %1 40 %207 %208 
                                Private f32* %210 = OpAccessChain %125 %106 
                                                      OpStore %210 %209 
                  read_only Texture3DSampled %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %125 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 2 3 
                                       f32_4 %218 = OpImageSampleImplicitLod %215 %217 
                                                      OpStore %125 %218 
                                       f32_4 %220 = OpLoad %125 
                                                      OpStore %219 %220 
                                                      OpBranch %120 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %219 %106 
                                                      OpStore %222 %110 
                                Private f32* %223 = OpAccessChain %219 %121 
                                                      OpStore %223 %110 
                                Private f32* %224 = OpAccessChain %219 %201 
                                                      OpStore %224 %110 
                                Private f32* %225 = OpAccessChain %219 %58 
                                                      OpStore %225 %110 
                                                      OpBranch %120 
                                             %120 = OpLabel 
                                       f32_4 %227 = OpLoad %219 
                              Uniform f32_4* %228 = OpAccessChain %31 %79 
                                       f32_4 %229 = OpLoad %228 
                                         f32 %230 = OpDot %227 %229 
                                Private f32* %231 = OpAccessChain %226 %106 
                                                      OpStore %231 %230 
                                Private f32* %232 = OpAccessChain %226 %106 
                                         f32 %233 = OpLoad %232 
                                         f32 %235 = OpExtInst %1 43 %233 %234 %110 
                                Private f32* %236 = OpAccessChain %226 %106 
                                                      OpStore %236 %235 
                  read_only Texture2DSampled %238 = OpLoad %237 
                                       f32_2 %239 = OpLoad %68 
                                       f32_4 %240 = OpImageSampleImplicitLod %238 %239 
                                         f32 %241 = OpCompositeExtract %240 3 
                                                      OpStore %193 %241 
                                Private f32* %242 = OpAccessChain %226 %106 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpLoad %193 
                                         f32 %245 = OpFMul %243 %244 
                                                      OpStore %193 %245 
                                       f32_3 %246 = OpLoad %42 
                              Uniform f32_4* %248 = OpAccessChain %31 %247 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpFMul %246 %250 
                                                      OpStore %226 %251 
                                         f32 %253 = OpLoad %193 
                                       f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                                       f32_3 %255 = OpLoad %226 
                                       f32_3 %256 = OpFMul %254 %255 
                                                      OpStore %252 %256 
                                       f32_3 %257 = OpLoad %226 
                                       f32_3 %258 = OpFNegate %257 
                                         f32 %259 = OpLoad %193 
                                       f32_3 %260 = OpCompositeConstruct %259 %259 %259 
                                       f32_3 %261 = OpFMul %258 %260 
                              Uniform f32_4* %262 = OpAccessChain %31 %33 
                                       f32_4 %263 = OpLoad %262 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpFAdd %261 %264 
                                                      OpStore %42 %265 
                              Uniform f32_4* %266 = OpAccessChain %31 %33 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 3 3 3 
                                       f32_3 %269 = OpLoad %42 
                                       f32_3 %270 = OpFMul %268 %269 
                                       f32_3 %271 = OpLoad %252 
                                       f32_3 %272 = OpFAdd %270 %271 
                                       f32_4 %273 = OpLoad %20 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %20 %274 
                                       f32_4 %277 = OpLoad %20 
                                                      OpStore %276 %277 
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
  GpuProgramID 133496
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
out vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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

uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _OverrideColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float unity_UseLinearSpace;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissivePower);
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
    u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat9 = unity_OneOverOutputBoost;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.w = 1.0;
    SV_Target0 = (unity_MetaFragmentControl.y) ? u_xlat1 : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %190 %191 %212 
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
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %212 Location 212 
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
                               Output f32_4* %190 = OpVariable Output 
                                Input f32_4* %191 = OpVariable Input 
                               Output f32_4* %212 = OpVariable Output 
                                             %220 = OpTypePointer Output %9 
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
                                       f32_4 %192 = OpLoad %191 
                                                      OpStore %190 %192 
                                       f32_4 %193 = OpLoad %13 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %195 = OpAccessChain %42 %120 %121 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpFMul %194 %196 
                                                      OpStore %21 %197 
                              Uniform f32_4* %198 = OpAccessChain %42 %120 %120 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %13 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 0 0 0 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %21 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %21 %204 
                              Uniform f32_4* %205 = OpAccessChain %42 %120 %44 
                                       f32_4 %206 = OpLoad %205 
                                       f32_4 %207 = OpLoad %13 
                                       f32_4 %208 = OpVectorShuffle %207 %207 2 2 2 2 
                                       f32_4 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %21 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %21 %211 
                              Uniform f32_4* %213 = OpAccessChain %42 %120 %92 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %13 
                                       f32_4 %216 = OpVectorShuffle %215 %215 3 3 3 3 
                                       f32_4 %217 = OpFMul %214 %216 
                                       f32_4 %218 = OpLoad %21 
                                       f32_4 %219 = OpFAdd %217 %218 
                                                      OpStore %212 %219 
                                 Output f32* %221 = OpAccessChain %166 %120 %162 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                 Output f32* %224 = OpAccessChain %166 %120 %162 
                                                      OpStore %224 %223 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 191
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %47 %177 
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
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
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
                                              %25 = OpTypeInt 32 0 
                                              %26 = OpTypeVector %25 4 
                                              %27 = OpTypeStruct %6 %6 %19 %26 %6 %6 %6 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32; f32; f32_4; u32_4; f32; f32; f32;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 2 
                                              %32 = OpTypePointer Uniform %19 
                               Private f32_3* %37 = OpVariable Private 
                                              %46 = OpTypePointer Input %19 
                                 Input f32_4* %47 = OpVariable Input 
                                          i32 %54 = OpConstant 1 
                                              %55 = OpTypePointer Uniform %6 
                                          i32 %71 = OpConstant 0 
                               Private f32_3* %76 = OpVariable Private 
                                          f32 %78 = OpConstant 3.67402E-40 
                                        f32_3 %79 = OpConstantComposite %78 %78 %78 
                                          f32 %81 = OpConstant 3.67402E-40 
                                        f32_3 %82 = OpConstantComposite %81 %81 %81 
                                          f32 %87 = OpConstant 3.67402E-40 
                                        f32_3 %88 = OpConstantComposite %87 %87 %87 
                                              %93 = OpTypeBool 
                                              %94 = OpTypePointer Private %93 
                                Private bool* %95 = OpVariable Private 
                                          f32 %96 = OpConstant 3.67402E-40 
                                        f32_4 %97 = OpConstantComposite %96 %96 %96 %96 
                                          i32 %98 = OpConstant 6 
                                             %102 = OpTypeVector %93 4 
                                             %105 = OpTypePointer Private %19 
                              Private f32_4* %106 = OpVariable Private 
                                             %107 = OpTypePointer Function %7 
                                             %118 = OpTypePointer Private %6 
                                Private f32* %119 = OpVariable Private 
                                         i32 %120 = OpConstant 4 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %133 = OpConstant 5 
                              Private f32_4* %146 = OpVariable Private 
                                         i32 %148 = OpConstant 3 
                                             %149 = OpTypePointer Uniform %26 
                                         u32 %153 = OpConstant 0 
                                       f32_3 %159 = OpConstantComposite %96 %96 %96 
                                             %163 = OpTypePointer Function %6 
                                         u32 %173 = OpConstant 3 
                                             %176 = OpTypePointer Output %19 
                               Output f32_4* %177 = OpVariable Output 
                                             %178 = OpTypePointer Function %19 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %108 = OpVariable Function 
                             Function f32_3* %147 = OpVariable Function 
                               Function f32* %164 = OpVariable Function 
                             Function f32_4* %179 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                        f32_3 %36 = OpFAdd %24 %35 
                                                      OpStore %22 %36 
                               Uniform f32_4* %38 = OpAccessChain %29 %31 
                                        f32_4 %39 = OpLoad %38 
                                        f32_3 %40 = OpVectorShuffle %39 %39 3 3 3 
                                        f32_3 %41 = OpLoad %22 
                                        f32_3 %42 = OpFMul %40 %41 
                                        f32_3 %43 = OpLoad %9 
                                        f32_3 %44 = OpFAdd %42 %43 
                                                      OpStore %37 %44 
                                        f32_3 %45 = OpLoad %37 
                                        f32_4 %48 = OpLoad %47 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFMul %45 %49 
                                                      OpStore %37 %50 
                                        f32_3 %51 = OpLoad %37 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %37 %52 
                                        f32_3 %53 = OpLoad %37 
                                 Uniform f32* %56 = OpAccessChain %29 %54 
                                          f32 %57 = OpLoad %56 
                                 Uniform f32* %58 = OpAccessChain %29 %54 
                                          f32 %59 = OpLoad %58 
                                 Uniform f32* %60 = OpAccessChain %29 %54 
                                          f32 %61 = OpLoad %60 
                                        f32_3 %62 = OpCompositeConstruct %57 %59 %61 
                                          f32 %63 = OpCompositeExtract %62 0 
                                          f32 %64 = OpCompositeExtract %62 1 
                                          f32 %65 = OpCompositeExtract %62 2 
                                        f32_3 %66 = OpCompositeConstruct %63 %64 %65 
                                        f32_3 %67 = OpFMul %53 %66 
                                                      OpStore %22 %67 
                                        f32_3 %68 = OpLoad %22 
                                        f32_3 %69 = OpExtInst %1 29 %68 
                                                      OpStore %22 %69 
                                        f32_3 %70 = OpLoad %22 
                                 Uniform f32* %72 = OpAccessChain %29 %71 
                                          f32 %73 = OpLoad %72 
                                        f32_3 %74 = OpCompositeConstruct %73 %73 %73 
                                        f32_3 %75 = OpFMul %70 %74 
                                                      OpStore %22 %75 
                                        f32_3 %77 = OpLoad %22 
                                        f32_3 %80 = OpFMul %77 %79 
                                        f32_3 %83 = OpFAdd %80 %82 
                                                      OpStore %76 %83 
                                        f32_3 %84 = OpLoad %22 
                                        f32_3 %85 = OpLoad %76 
                                        f32_3 %86 = OpFMul %84 %85 
                                        f32_3 %89 = OpFAdd %86 %88 
                                                      OpStore %76 %89 
                                        f32_3 %90 = OpLoad %22 
                                        f32_3 %91 = OpLoad %76 
                                        f32_3 %92 = OpFMul %90 %91 
                                                      OpStore %76 %92 
                                 Uniform f32* %99 = OpAccessChain %29 %98 
                                         f32 %100 = OpLoad %99 
                                       f32_4 %101 = OpCompositeConstruct %100 %100 %100 %100 
                                      bool_4 %103 = OpFOrdNotEqual %97 %101 
                                        bool %104 = OpAny %103 
                                                      OpStore %95 %104 
                                        bool %109 = OpLoad %95 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %113 
                                             %110 = OpLabel 
                                       f32_3 %112 = OpLoad %22 
                                                      OpStore %108 %112 
                                                      OpBranch %111 
                                             %113 = OpLabel 
                                       f32_3 %114 = OpLoad %76 
                                                      OpStore %108 %114 
                                                      OpBranch %111 
                                             %111 = OpLabel 
                                       f32_3 %115 = OpLoad %108 
                                       f32_4 %116 = OpLoad %106 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %106 %117 
                                Uniform f32* %121 = OpAccessChain %29 %120 
                                         f32 %122 = OpLoad %121 
                                                      OpStore %119 %122 
                                         f32 %123 = OpLoad %119 
                                         f32 %125 = OpExtInst %1 43 %123 %96 %124 
                                                      OpStore %119 %125 
                                       f32_3 %126 = OpLoad %37 
                                         f32 %127 = OpLoad %119 
                                       f32_3 %128 = OpCompositeConstruct %127 %127 %127 
                                       f32_3 %129 = OpFMul %126 %128 
                                                      OpStore %37 %129 
                                       f32_3 %130 = OpLoad %37 
                                       f32_3 %131 = OpExtInst %1 29 %130 
                                                      OpStore %37 %131 
                                       f32_3 %132 = OpLoad %37 
                                Uniform f32* %134 = OpAccessChain %29 %133 
                                         f32 %135 = OpLoad %134 
                                Uniform f32* %136 = OpAccessChain %29 %133 
                                         f32 %137 = OpLoad %136 
                                Uniform f32* %138 = OpAccessChain %29 %133 
                                         f32 %139 = OpLoad %138 
                                       f32_3 %140 = OpCompositeConstruct %135 %137 %139 
                                         f32 %141 = OpCompositeExtract %140 0 
                                         f32 %142 = OpCompositeExtract %140 1 
                                         f32 %143 = OpCompositeExtract %140 2 
                                       f32_3 %144 = OpCompositeConstruct %141 %142 %143 
                                       f32_3 %145 = OpExtInst %1 37 %132 %144 
                                                      OpStore %37 %145 
                              Uniform u32_4* %150 = OpAccessChain %29 %148 
                                       u32_4 %151 = OpLoad %150 
                                         u32 %152 = OpCompositeExtract %151 0 
                                        bool %154 = OpINotEqual %152 %153 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %158 
                                             %155 = OpLabel 
                                       f32_3 %157 = OpLoad %37 
                                                      OpStore %147 %157 
                                                      OpBranch %156 
                                             %158 = OpLabel 
                                                      OpStore %147 %159 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                       f32_3 %160 = OpLoad %147 
                                       f32_4 %161 = OpLoad %146 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %146 %162 
                              Uniform u32_4* %165 = OpAccessChain %29 %148 
                                       u32_4 %166 = OpLoad %165 
                                         u32 %167 = OpCompositeExtract %166 0 
                                        bool %168 = OpINotEqual %167 %153 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %171 
                                             %169 = OpLabel 
                                                      OpStore %164 %124 
                                                      OpBranch %170 
                                             %171 = OpLabel 
                                                      OpStore %164 %96 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                         f32 %172 = OpLoad %164 
                                Private f32* %174 = OpAccessChain %146 %173 
                                                      OpStore %174 %172 
                                Private f32* %175 = OpAccessChain %106 %173 
                                                      OpStore %175 %124 
                              Uniform u32_4* %180 = OpAccessChain %29 %148 
                                       u32_4 %181 = OpLoad %180 
                                         u32 %182 = OpCompositeExtract %181 1 
                                        bool %183 = OpINotEqual %182 %153 
                                                      OpSelectionMerge %185 None 
                                                      OpBranchConditional %183 %184 %187 
                                             %184 = OpLabel 
                                       f32_4 %186 = OpLoad %106 
                                                      OpStore %179 %186 
                                                      OpBranch %185 
                                             %187 = OpLabel 
                                       f32_4 %188 = OpLoad %146 
                                                      OpStore %179 %188 
                                                      OpBranch %185 
                                             %185 = OpLabel 
                                       f32_4 %189 = OpLoad %179 
                                                      OpStore %177 %189 
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