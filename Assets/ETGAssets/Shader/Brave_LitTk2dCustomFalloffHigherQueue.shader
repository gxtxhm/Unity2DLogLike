//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffHigherQueue" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+5" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+5" "RenderType" = "TransparentCutout" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 16417
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
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
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
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
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
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
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent+5" "RenderType" = "TransparentCutout" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 127586
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 239
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %227 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %227 Location 227 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
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
                                              %23 = OpTypePointer Input %20 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %20 %20 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %20 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %20 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_3* %191 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %206 = OpVariable UniformConstant 
                                         i32 %221 = OpConstant 5 
                                             %226 = OpTypePointer Output %7 
                               Output f32_4* %227 = OpVariable Output 
                                             %236 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpVectorShuffle %25 %25 1 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                        f32_3 %41 = OpFMul %26 %40 
                                                      OpStore %22 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpLoad %24 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_3 %49 = OpLoad %22 
                                        f32_3 %50 = OpFAdd %48 %49 
                                                      OpStore %22 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpLoad %24 
                                        f32_3 %56 = OpVectorShuffle %55 %55 2 2 2 
                                        f32_3 %57 = OpFMul %54 %56 
                                        f32_3 %58 = OpLoad %22 
                                        f32_3 %59 = OpFAdd %57 %58 
                                                      OpStore %22 %59 
                                        f32_3 %60 = OpLoad %22 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %22 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %157 
                                         f32 %172 = OpLoad %164 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %192 = OpLoad %183 
                              Uniform f32_4* %193 = OpAccessChain %33 %42 
                                       f32_4 %194 = OpLoad %193 
                                         f32 %195 = OpDot %192 %194 
                                Private f32* %196 = OpAccessChain %191 %69 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %191 %69 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpExtInst %1 43 %198 %199 %73 
                                Private f32* %201 = OpAccessChain %191 %69 
                                                      OpStore %201 %200 
                                       f32_3 %202 = OpLoad %22 
                                       f32_3 %203 = OpLoad %22 
                                         f32 %204 = OpDot %202 %203 
                                Private f32* %205 = OpAccessChain %22 %69 
                                                      OpStore %205 %204 
                  read_only Texture2DSampled %207 = OpLoad %206 
                                       f32_3 %208 = OpLoad %22 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 0 
                                       f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                                         f32 %211 = OpCompositeExtract %210 3 
                                Private f32* %212 = OpAccessChain %22 %69 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %191 %69 
                                         f32 %214 = OpLoad %213 
                                Private f32* %215 = OpAccessChain %22 %69 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                Private f32* %218 = OpAccessChain %22 %69 
                                                      OpStore %218 %217 
                                       f32_4 %219 = OpLoad %9 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_4* %222 = OpAccessChain %33 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFMul %220 %224 
                                                      OpStore %191 %225 
                                       f32_3 %228 = OpLoad %22 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 0 0 
                                       f32_3 %230 = OpLoad %191 
                                       f32_3 %231 = OpFMul %229 %230 
                                       f32_4 %232 = OpLoad %227 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %227 %233 
                                Private f32* %234 = OpAccessChain %9 %189 
                                         f32 %235 = OpLoad %234 
                                 Output f32* %237 = OpAccessChain %227 %189 
                                                      OpStore %237 %235 
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
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 180
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %168 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %168 Location 168 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                                Private f32* %151 = OpVariable Private 
                                         f32 %157 = OpConstant 3.67402E-40 
                              Private f32_3* %159 = OpVariable Private 
                                         i32 %162 = OpConstant 5 
                                             %167 = OpTypePointer Output %7 
                               Output f32_4* %168 = OpVariable Output 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                                      OpStore %151 %155 
                                         f32 %156 = OpLoad %151 
                                         f32 %158 = OpExtInst %1 43 %156 %157 %36 
                                                      OpStore %151 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              Uniform f32_4* %163 = OpAccessChain %29 %162 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %161 %165 
                                                      OpStore %159 %166 
                                         f32 %169 = OpLoad %151 
                                       f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                       f32_3 %171 = OpLoad %159 
                                       f32_3 %172 = OpFMul %170 %171 
                                       f32_4 %173 = OpLoad %168 
                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
                                                      OpStore %168 %174 
                                Private f32* %175 = OpAccessChain %9 %149 
                                         f32 %176 = OpLoad %175 
                                 Output f32* %178 = OpAccessChain %168 %149 
                                                      OpStore %178 %176 
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
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 263
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %251 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %28 ArrayStride 28 
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
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %76 SpecId 76 
                                                      OpDecorate %167 DescriptorSet 167 
                                                      OpDecorate %167 Binding 167 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %251 Location 251 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
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
                                              %22 = OpTypePointer Input %21 
                                 Input f32_3* %23 = OpVariable Input 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %7 %7 %28 %21 %21 %7 %29 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 6 
                                          i32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Uniform %7 
                                          i32 %40 = OpConstant 0 
                                          i32 %48 = OpConstant 2 
                                          i32 %57 = OpConstant 3 
                                              %61 = OpTypeBool 
                                              %62 = OpTypePointer Private %61 
                                Private bool* %63 = OpVariable Private 
                                          u32 %64 = OpConstant 0 
                                              %65 = OpTypePointer Uniform %6 
                                          f32 %68 = OpConstant 3.67402E-40 
                                         bool %70 = OpConstantFalse 
                                         bool %76 = OpSpecConstantFalse 
                                          u32 %79 = OpConstant 1 
                                              %83 = OpTypePointer Private %21 
                               Private f32_3* %84 = OpVariable Private 
                              Private f32_4* %112 = OpVariable Private 
                                             %113 = OpTypePointer Function %21 
                                         i32 %126 = OpConstant 4 
                                             %127 = OpTypePointer Uniform %21 
                                             %141 = OpTypePointer Private %6 
                                         f32 %144 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                             %149 = OpTypePointer Private %15 
                              Private f32_2* %150 = OpVariable Private 
                                         u32 %151 = OpConstant 2 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %164 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %165 = OpTypeSampledImage %164 
                                             %166 = OpTypePointer UniformConstant %165 
 UniformConstant read_only Texture3DSampled* %167 = OpVariable UniformConstant 
                              Private f32_4* %172 = OpVariable Private 
                                         u32 %178 = OpConstant 3 
                                Private f32* %180 = OpVariable Private 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                             %193 = OpTypePointer Function %6 
                                       f32_2 %207 = OpConstantComposite %154 %154 
                                Private f32* %209 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %210 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %226 = OpVariable UniformConstant 
                                         i32 %245 = OpConstant 5 
                                             %250 = OpTypePointer Output %7 
                               Output f32_4* %251 = OpVariable Output 
                                             %260 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %114 = OpVariable Function 
                               Function f32* %194 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %24 = OpLoad %23 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %32 %34 %35 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpFMul %25 %38 
                                                      OpStore %20 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 %40 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpLoad %23 
                                        f32_4 %44 = OpVectorShuffle %43 %43 0 0 0 0 
                                        f32_4 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %20 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %20 %47 
                               Uniform f32_4* %49 = OpAccessChain %32 %34 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %23 
                                        f32_4 %52 = OpVectorShuffle %51 %51 2 2 2 2 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %20 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %20 %55 
                                        f32_4 %56 = OpLoad %20 
                               Uniform f32_4* %58 = OpAccessChain %32 %34 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %20 %60 
                                 Uniform f32* %66 = OpAccessChain %32 %35 %64 
                                          f32 %67 = OpLoad %66 
                                         bool %69 = OpFOrdEqual %67 %68 
                                                      OpStore %63 %69 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                         bool %73 = OpLoad %63 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpBranch %75 
                                              %75 = OpLabel 
                                                      OpBranch %72 
                                              %72 = OpLabel 
                                                      OpSelectionMerge %78 None 
                                                      OpBranchConditional %76 %77 %174 
                                              %77 = OpLabel 
                                 Uniform f32* %80 = OpAccessChain %32 %35 %79 
                                          f32 %81 = OpLoad %80 
                                         bool %82 = OpFOrdEqual %81 %68 
                                                      OpStore %63 %82 
                                        f32_3 %85 = OpLoad %23 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %32 %48 %35 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                               Uniform f32_4* %91 = OpAccessChain %32 %48 %40 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpLoad %23 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %84 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %84 %98 
                               Uniform f32_4* %99 = OpAccessChain %32 %48 %48 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpLoad %23 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %101 %103 
                                       f32_3 %105 = OpLoad %84 
                                       f32_3 %106 = OpFAdd %104 %105 
                                                      OpStore %84 %106 
                                       f32_3 %107 = OpLoad %84 
                              Uniform f32_4* %108 = OpAccessChain %32 %48 %57 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %107 %110 
                                                      OpStore %84 %111 
                                        bool %115 = OpLoad %63 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %119 
                                             %116 = OpLabel 
                                       f32_3 %118 = OpLoad %84 
                                                      OpStore %114 %118 
                                                      OpBranch %117 
                                             %119 = OpLabel 
                                       f32_3 %120 = OpLoad %23 
                                                      OpStore %114 %120 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                       f32_3 %121 = OpLoad %114 
                                       f32_4 %122 = OpLoad %112 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %112 %123 
                                       f32_4 %124 = OpLoad %112 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                              Uniform f32_3* %128 = OpAccessChain %32 %126 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFNegate %129 
                                       f32_3 %131 = OpFAdd %125 %130 
                                       f32_4 %132 = OpLoad %112 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %112 %133 
                                       f32_4 %134 = OpLoad %112 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_3* %136 = OpAccessChain %32 %57 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %112 
                                       f32_4 %140 = OpVectorShuffle %139 %138 0 4 5 6 
                                                      OpStore %112 %140 
                                Private f32* %142 = OpAccessChain %112 %79 
                                         f32 %143 = OpLoad %142 
                                         f32 %145 = OpFMul %143 %144 
                                         f32 %147 = OpFAdd %145 %146 
                                Private f32* %148 = OpAccessChain %84 %64 
                                                      OpStore %148 %147 
                                Uniform f32* %152 = OpAccessChain %32 %35 %151 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFMul %153 %154 
                                         f32 %156 = OpFAdd %155 %146 
                                Private f32* %157 = OpAccessChain %150 %64 
                                                      OpStore %157 %156 
                                Private f32* %158 = OpAccessChain %84 %64 
                                         f32 %159 = OpLoad %158 
                                Private f32* %160 = OpAccessChain %150 %64 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 40 %159 %161 
                                Private f32* %163 = OpAccessChain %112 %64 
                                                      OpStore %163 %162 
                  read_only Texture3DSampled %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %112 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 2 3 
                                       f32_4 %171 = OpImageSampleImplicitLod %168 %170 
                                                      OpStore %112 %171 
                                       f32_4 %173 = OpLoad %112 
                                                      OpStore %172 %173 
                                                      OpBranch %78 
                                             %174 = OpLabel 
                                Private f32* %175 = OpAccessChain %172 %64 
                                                      OpStore %175 %68 
                                Private f32* %176 = OpAccessChain %172 %79 
                                                      OpStore %176 %68 
                                Private f32* %177 = OpAccessChain %172 %151 
                                                      OpStore %177 %68 
                                Private f32* %179 = OpAccessChain %172 %178 
                                                      OpStore %179 %68 
                                                      OpBranch %78 
                                              %78 = OpLabel 
                                       f32_4 %181 = OpLoad %172 
                              Uniform f32_4* %182 = OpAccessChain %32 %40 
                                       f32_4 %183 = OpLoad %182 
                                         f32 %184 = OpDot %181 %183 
                                                      OpStore %180 %184 
                                         f32 %185 = OpLoad %180 
                                         f32 %187 = OpExtInst %1 43 %185 %186 %68 
                                                      OpStore %180 %187 
                                Private f32* %189 = OpAccessChain %20 %151 
                                         f32 %190 = OpLoad %189 
                                        bool %191 = OpFOrdLessThan %186 %190 
                                                      OpStore %188 %191 
                                        bool %195 = OpLoad %188 
                                                      OpSelectionMerge %197 None 
                                                      OpBranchConditional %195 %196 %198 
                                             %196 = OpLabel 
                                                      OpStore %194 %68 
                                                      OpBranch %197 
                                             %198 = OpLabel 
                                                      OpStore %194 %186 
                                                      OpBranch %197 
                                             %197 = OpLabel 
                                         f32 %199 = OpLoad %194 
                                Private f32* %200 = OpAccessChain %192 %64 
                                                      OpStore %200 %199 
                                       f32_4 %201 = OpLoad %20 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpLoad %20 
                                       f32_2 %204 = OpVectorShuffle %203 %203 3 3 
                                       f32_2 %205 = OpFDiv %202 %204 
                                                      OpStore %150 %205 
                                       f32_2 %206 = OpLoad %150 
                                       f32_2 %208 = OpFAdd %206 %207 
                                                      OpStore %150 %208 
                  read_only Texture2DSampled %211 = OpLoad %210 
                                       f32_2 %212 = OpLoad %150 
                                       f32_4 %213 = OpImageSampleImplicitLod %211 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                                      OpStore %209 %214 
                                         f32 %215 = OpLoad %209 
                                Private f32* %216 = OpAccessChain %192 %64 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %215 %217 
                                Private f32* %219 = OpAccessChain %192 %64 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %20 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_4 %222 = OpLoad %20 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %221 %223 
                                Private f32* %225 = OpAccessChain %20 %64 
                                                      OpStore %225 %224 
                  read_only Texture2DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %20 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 0 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                         f32 %231 = OpCompositeExtract %230 3 
                                Private f32* %232 = OpAccessChain %20 %64 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %20 %64 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %192 %64 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %192 %64 
                                                      OpStore %238 %237 
                                         f32 %239 = OpLoad %180 
                                Private f32* %240 = OpAccessChain %192 %64 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                                      OpStore %180 %242 
                                       f32_4 %243 = OpLoad %9 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %246 = OpAccessChain %32 %245 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFMul %244 %248 
                                                      OpStore %192 %249 
                                         f32 %252 = OpLoad %180 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpLoad %192 
                                       f32_3 %255 = OpFMul %253 %254 
                                       f32_4 %256 = OpLoad %251 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %251 %257 
                                Private f32* %258 = OpAccessChain %9 %178 
                                         f32 %259 = OpLoad %258 
                                 Output f32* %261 = OpAccessChain %251 %178 
                                                      OpStore %261 %259 
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
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 251
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %239 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %214 DescriptorSet 214 
                                                      OpDecorate %214 Binding 214 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
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
                                              %23 = OpTypePointer Input %20 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %20 %20 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %20 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %20 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_3* %191 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %205 = OpVariable UniformConstant 
                                             %211 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %212 = OpTypeSampledImage %211 
                                             %213 = OpTypePointer UniformConstant %212 
UniformConstant read_only TextureCubeSampled* %214 = OpVariable UniformConstant 
                                         i32 %233 = OpConstant 5 
                                             %238 = OpTypePointer Output %7 
                               Output f32_4* %239 = OpVariable Output 
                                             %248 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpVectorShuffle %25 %25 1 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                        f32_3 %41 = OpFMul %26 %40 
                                                      OpStore %22 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpLoad %24 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_3 %49 = OpLoad %22 
                                        f32_3 %50 = OpFAdd %48 %49 
                                                      OpStore %22 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpLoad %24 
                                        f32_3 %56 = OpVectorShuffle %55 %55 2 2 2 
                                        f32_3 %57 = OpFMul %54 %56 
                                        f32_3 %58 = OpLoad %22 
                                        f32_3 %59 = OpFAdd %57 %58 
                                                      OpStore %22 %59 
                                        f32_3 %60 = OpLoad %22 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %22 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %157 
                                         f32 %172 = OpLoad %164 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %192 = OpLoad %183 
                              Uniform f32_4* %193 = OpAccessChain %33 %42 
                                       f32_4 %194 = OpLoad %193 
                                         f32 %195 = OpDot %192 %194 
                                Private f32* %196 = OpAccessChain %191 %69 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %191 %69 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpExtInst %1 43 %198 %199 %73 
                                Private f32* %201 = OpAccessChain %191 %69 
                                                      OpStore %201 %200 
                                       f32_3 %202 = OpLoad %22 
                                       f32_3 %203 = OpLoad %22 
                                         f32 %204 = OpDot %202 %203 
                                                      OpStore %157 %204 
                  read_only Texture2DSampled %206 = OpLoad %205 
                                         f32 %207 = OpLoad %157 
                                       f32_2 %208 = OpCompositeConstruct %207 %207 
                                       f32_4 %209 = OpImageSampleImplicitLod %206 %208 
                                         f32 %210 = OpCompositeExtract %209 3 
                                                      OpStore %157 %210 
                read_only TextureCubeSampled %215 = OpLoad %214 
                                       f32_3 %216 = OpLoad %22 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                         f32 %218 = OpCompositeExtract %217 3 
                                Private f32* %219 = OpAccessChain %22 %69 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %22 %69 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpLoad %157 
                                         f32 %223 = OpFMul %221 %222 
                                Private f32* %224 = OpAccessChain %22 %69 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %191 %69 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %22 %69 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFMul %226 %228 
                                Private f32* %230 = OpAccessChain %22 %69 
                                                      OpStore %230 %229 
                                       f32_4 %231 = OpLoad %9 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %33 %233 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFMul %232 %236 
                                                      OpStore %191 %237 
                                       f32_3 %240 = OpLoad %22 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                       f32_3 %242 = OpLoad %191 
                                       f32_3 %243 = OpFMul %241 %242 
                                       f32_4 %244 = OpLoad %239 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %239 %245 
                                Private f32* %246 = OpAccessChain %9 %189 
                                         f32 %247 = OpLoad %246 
                                 Output f32* %249 = OpAccessChain %239 %189 
                                                      OpStore %249 %247 
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 235
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %223 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
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
                                              %20 = OpTypePointer Private %15 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                              %23 = OpTypePointer Input %22 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %22 %22 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %22 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %22 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                                             %191 = OpTypePointer Private %22 
                              Private f32_3* %192 = OpVariable Private 
                                         f32 %200 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %203 = OpVariable UniformConstant 
                                         i32 %217 = OpConstant 5 
                                             %222 = OpTypePointer Output %7 
                               Output f32_4* %223 = OpVariable Output 
                                             %232 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_2 %26 = OpVectorShuffle %25 %25 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32_2 %41 = OpFMul %26 %40 
                                                      OpStore %21 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                                        f32_3 %46 = OpLoad %24 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 0 
                                        f32_2 %48 = OpFMul %45 %47 
                                        f32_2 %49 = OpLoad %21 
                                        f32_2 %50 = OpFAdd %48 %49 
                                                      OpStore %21 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_3 %55 = OpLoad %24 
                                        f32_2 %56 = OpVectorShuffle %55 %55 2 2 
                                        f32_2 %57 = OpFMul %54 %56 
                                        f32_2 %58 = OpLoad %21 
                                        f32_2 %59 = OpFAdd %57 %58 
                                                      OpStore %21 %59 
                                        f32_2 %60 = OpLoad %21 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                        f32_2 %65 = OpFAdd %60 %64 
                                                      OpStore %21 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %164 
                                         f32 %172 = OpLoad %157 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %193 = OpLoad %183 
                              Uniform f32_4* %194 = OpAccessChain %33 %42 
                                       f32_4 %195 = OpLoad %194 
                                         f32 %196 = OpDot %193 %195 
                                Private f32* %197 = OpAccessChain %192 %69 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %192 %69 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpExtInst %1 43 %199 %200 %73 
                                Private f32* %202 = OpAccessChain %192 %69 
                                                      OpStore %202 %201 
                  read_only Texture2DSampled %204 = OpLoad %203 
                                       f32_2 %205 = OpLoad %21 
                                       f32_4 %206 = OpImageSampleImplicitLod %204 %205 
                                         f32 %207 = OpCompositeExtract %206 3 
                                Private f32* %208 = OpAccessChain %21 %69 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %192 %69 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %21 %69 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                Private f32* %214 = OpAccessChain %21 %69 
                                                      OpStore %214 %213 
                                       f32_4 %215 = OpLoad %9 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %218 = OpAccessChain %33 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                       f32_3 %221 = OpFMul %216 %220 
                                                      OpStore %192 %221 
                                       f32_2 %224 = OpLoad %21 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 0 0 
                                       f32_3 %226 = OpLoad %192 
                                       f32_3 %227 = OpFMul %225 %226 
                                       f32_4 %228 = OpLoad %223 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %223 %229 
                                Private f32* %230 = OpAccessChain %9 %189 
                                         f32 %231 = OpLoad %230 
                                 Output f32* %233 = OpAccessChain %223 %189 
                                                      OpStore %233 %231 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent+5" "RenderType" = "TransparentCutout" }
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 142331
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
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
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
; Bound: 112
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %98 
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
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpMemberDecorate %32 0 Offset 32 
                                                    OpMemberDecorate %32 1 Offset 32 
                                                    OpMemberDecorate %32 2 Offset 32 
                                                    OpDecorate %32 Block 
                                                    OpDecorate %34 DescriptorSet 34 
                                                    OpDecorate %34 Binding 34 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %98 Location 98 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
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
                                            %28 = OpTypePointer Private %6 
                               Private f32* %29 = OpVariable Private 
                                            %30 = OpTypeInt 32 0 
                                            %31 = OpTypeVector %30 4 
                                            %32 = OpTypeStruct %31 %6 %6 
                                            %33 = OpTypePointer Uniform %32 
         Uniform struct {u32_4; f32; f32;}* %34 = OpVariable Uniform 
                                            %35 = OpTypeInt 32 1 
                                        i32 %36 = OpConstant 1 
                                            %37 = OpTypePointer Uniform %6 
                                        f32 %41 = OpConstant 3.67402E-40 
                                        f32 %42 = OpConstant 3.67402E-40 
                             Private f32_3* %44 = OpVariable Private 
                                        i32 %53 = OpConstant 2 
                                            %66 = OpTypePointer Function %7 
                                        i32 %68 = OpConstant 0 
                                            %69 = OpTypeBool 
                                            %70 = OpTypeVector %69 4 
                                            %71 = OpTypePointer Uniform %31 
                                        u32 %75 = OpConstant 0 
                                      f32_3 %81 = OpConstantComposite %41 %41 %41 
                                            %85 = OpTypePointer Function %6 
                                        u32 %95 = OpConstant 3 
                                            %97 = OpTypePointer Output %19 
                              Output f32_4* %98 = OpVariable Output 
                                            %99 = OpTypePointer Function %19 
                                     f32_4 %107 = OpConstantComposite %41 %41 %41 %42 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %67 = OpVariable Function 
                              Function f32* %86 = OpVariable Function 
                           Function f32_4* %100 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                                      f32_3 %25 = OpExtInst %1 30 %24 
                                      f32_4 %26 = OpLoad %23 
                                      f32_4 %27 = OpVectorShuffle %26 %25 4 5 6 3 
                                                    OpStore %23 %27 
                               Uniform f32* %38 = OpAccessChain %34 %36 
                                        f32 %39 = OpLoad %38 
                                                    OpStore %29 %39 
                                        f32 %40 = OpLoad %29 
                                        f32 %43 = OpExtInst %1 43 %40 %41 %42 
                                                    OpStore %29 %43 
                                      f32_4 %45 = OpLoad %23 
                                      f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32 %47 = OpLoad %29 
                                      f32_3 %48 = OpCompositeConstruct %47 %47 %47 
                                      f32_3 %49 = OpFMul %46 %48 
                                                    OpStore %44 %49 
                                      f32_3 %50 = OpLoad %44 
                                      f32_3 %51 = OpExtInst %1 29 %50 
                                                    OpStore %44 %51 
                                      f32_3 %52 = OpLoad %44 
                               Uniform f32* %54 = OpAccessChain %34 %53 
                                        f32 %55 = OpLoad %54 
                               Uniform f32* %56 = OpAccessChain %34 %53 
                                        f32 %57 = OpLoad %56 
                               Uniform f32* %58 = OpAccessChain %34 %53 
                                        f32 %59 = OpLoad %58 
                                      f32_3 %60 = OpCompositeConstruct %55 %57 %59 
                                        f32 %61 = OpCompositeExtract %60 0 
                                        f32 %62 = OpCompositeExtract %60 1 
                                        f32 %63 = OpCompositeExtract %60 2 
                                      f32_3 %64 = OpCompositeConstruct %61 %62 %63 
                                      f32_3 %65 = OpExtInst %1 37 %52 %64 
                                                    OpStore %44 %65 
                             Uniform u32_4* %72 = OpAccessChain %34 %68 
                                      u32_4 %73 = OpLoad %72 
                                        u32 %74 = OpCompositeExtract %73 0 
                                       bool %76 = OpINotEqual %74 %75 
                                                    OpSelectionMerge %78 None 
                                                    OpBranchConditional %76 %77 %80 
                                            %77 = OpLabel 
                                      f32_3 %79 = OpLoad %44 
                                                    OpStore %67 %79 
                                                    OpBranch %78 
                                            %80 = OpLabel 
                                                    OpStore %67 %81 
                                                    OpBranch %78 
                                            %78 = OpLabel 
                                      f32_3 %82 = OpLoad %67 
                                      f32_4 %83 = OpLoad %23 
                                      f32_4 %84 = OpVectorShuffle %83 %82 4 5 6 3 
                                                    OpStore %23 %84 
                             Uniform u32_4* %87 = OpAccessChain %34 %68 
                                      u32_4 %88 = OpLoad %87 
                                        u32 %89 = OpCompositeExtract %88 0 
                                       bool %90 = OpINotEqual %89 %75 
                                                    OpSelectionMerge %92 None 
                                                    OpBranchConditional %90 %91 %93 
                                            %91 = OpLabel 
                                                    OpStore %86 %42 
                                                    OpBranch %92 
                                            %93 = OpLabel 
                                                    OpStore %86 %41 
                                                    OpBranch %92 
                                            %92 = OpLabel 
                                        f32 %94 = OpLoad %86 
                               Private f32* %96 = OpAccessChain %23 %95 
                                                    OpStore %96 %94 
                            Uniform u32_4* %101 = OpAccessChain %34 %68 
                                     u32_4 %102 = OpLoad %101 
                                       u32 %103 = OpCompositeExtract %102 1 
                                      bool %104 = OpINotEqual %103 %75 
                                                    OpSelectionMerge %106 None 
                                                    OpBranchConditional %104 %105 %108 
                                           %105 = OpLabel 
                                                    OpStore %100 %107 
                                                    OpBranch %106 
                                           %108 = OpLabel 
                                     f32_4 %109 = OpLoad %23 
                                                    OpStore %100 %109 
                                                    OpBranch %106 
                                           %106 = OpLabel 
                                     f32_4 %110 = OpLoad %100 
                                                    OpStore %98 %110 
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
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
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