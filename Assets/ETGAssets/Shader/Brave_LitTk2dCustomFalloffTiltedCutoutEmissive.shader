//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTiltedCutoutEmissive" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
_EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
_VertexColor ("Vertex Color", Float) = 0
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
  GpuProgramID 10285
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
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
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 195
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 %186 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                               Output f32_3* %186 = OpVariable Output 
                                         f32 %187 = OpConstant 3.67402E-40 
                                       f32_3 %188 = OpConstantComposite %187 %187 %187 
                                             %189 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                                      OpStore %186 %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFNegate %191 
                                 Output f32* %193 = OpAccessChain %116 %60 %48 
                                                      OpStore %193 %192 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 265
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %132 %243 %249 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpMemberDecorate %34 0 RelaxedPrecision 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpMemberDecorate %34 5 RelaxedPrecision 
                                                      OpMemberDecorate %34 5 Offset 34 
                                                      OpMemberDecorate %34 6 Offset 34 
                                                      OpMemberDecorate %34 7 Offset 34 
                                                      OpMemberDecorate %34 8 Offset 34 
                                                      OpMemberDecorate %34 9 RelaxedPrecision 
                                                      OpMemberDecorate %34 9 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %260 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeStruct %7 %7 %32 %33 %33 %7 %6 %6 %6 %6 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 8 
                                              %39 = OpTypePointer Uniform %6 
                               Private f32_4* %47 = OpVariable Private 
                                          u32 %48 = OpConstant 3 
                                              %49 = OpTypePointer Private %6 
                                          f32 %52 = OpConstant 3.67402E-40 
                                          u32 %54 = OpConstant 0 
                                              %56 = OpTypeBool 
                                              %57 = OpTypePointer Private %56 
                                Private bool* %58 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                                          i32 %67 = OpConstant -1 
                                              %73 = OpTypePointer Private %33 
                               Private f32_3* %74 = OpVariable Private 
                                          i32 %79 = OpConstant 7 
                                          i32 %96 = OpConstant 9 
                               Private bool* %102 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                                         u32 %126 = OpConstant 1 
                              Private f32_3* %130 = OpVariable Private 
                                             %131 = OpTypePointer Input %33 
                                Input f32_3* %132 = OpVariable Input 
                                         i32 %135 = OpConstant 2 
                                             %136 = OpTypePointer Uniform %7 
                                         i32 %158 = OpConstant 3 
                                             %163 = OpTypePointer Function %33 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %33 
                              Private f32_4* %179 = OpVariable Private 
                                Private f32* %186 = OpVariable Private 
                                         f32 %189 = OpConstant 3.67402E-40 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         u32 %193 = OpConstant 2 
                                         f32 %196 = OpConstant 3.67402E-40 
                                             %205 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %206 = OpTypeSampledImage %205 
                                             %207 = OpTypePointer UniformConstant %206 
 UniformConstant read_only Texture3DSampled* %208 = OpVariable UniformConstant 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %229 = OpVariable Private 
                                         i32 %232 = OpConstant 5 
                                Input f32_3* %243 = OpVariable Input 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %252 = OpTypePointer Output %6 
                                         i32 %254 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %40 = OpAccessChain %36 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_4 %42 = OpCompositeConstruct %41 %41 %41 %41 
                                        f32_4 %43 = OpLoad %20 
                                        f32_4 %44 = OpFMul %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %29 %46 
                                 Private f32* %50 = OpAccessChain %29 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFAdd %51 %52 
                                 Private f32* %55 = OpAccessChain %47 %54 
                                                      OpStore %55 %53 
                                 Private f32* %59 = OpAccessChain %47 %54 
                                          f32 %60 = OpLoad %59 
                                         bool %62 = OpFOrdLessThan %60 %61 
                                                      OpStore %58 %62 
                                         bool %63 = OpLoad %58 
                                          i32 %66 = OpSelect %63 %65 %64 
                                          i32 %68 = OpIMul %66 %67 
                                         bool %69 = OpINotEqual %68 %64 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                        f32_4 %75 = OpLoad %29 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpExtInst %1 30 %76 
                                                      OpStore %74 %77 
                                        f32_3 %78 = OpLoad %74 
                                 Uniform f32* %80 = OpAccessChain %36 %79 
                                          f32 %81 = OpLoad %80 
                                 Uniform f32* %82 = OpAccessChain %36 %79 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %36 %79 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                          f32 %87 = OpCompositeExtract %86 0 
                                          f32 %88 = OpCompositeExtract %86 1 
                                          f32 %89 = OpCompositeExtract %86 2 
                                        f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                        f32_3 %91 = OpFMul %78 %90 
                                                      OpStore %74 %91 
                                        f32_3 %92 = OpLoad %74 
                                        f32_3 %93 = OpExtInst %1 29 %92 
                                                      OpStore %74 %93 
                                 Private f32* %94 = OpAccessChain %29 %48 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %97 = OpAccessChain %36 %96 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %95 %99 
                                Private f32* %101 = OpAccessChain %47 %54 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %47 %54 
                                         f32 %104 = OpLoad %103 
                                        bool %105 = OpFOrdLessThan %104 %61 
                                                      OpStore %102 %105 
                                        bool %106 = OpLoad %102 
                                         i32 %107 = OpSelect %106 %65 %64 
                                         i32 %108 = OpIMul %107 %67 
                                        bool %109 = OpINotEqual %108 %64 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpKill
                                             %111 = OpLabel 
                                Uniform f32* %113 = OpAccessChain %36 %65 %54 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %102 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %102 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %214 
                                             %124 = OpLabel 
                                Uniform f32* %127 = OpAccessChain %36 %65 %126 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %115 
                                                      OpStore %102 %129 
                                       f32_3 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %137 = OpAccessChain %36 %135 %65 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFMul %134 %139 
                                                      OpStore %130 %140 
                              Uniform f32_4* %141 = OpAccessChain %36 %135 %64 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %132 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_3 %147 = OpLoad %130 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %130 %148 
                              Uniform f32_4* %149 = OpAccessChain %36 %135 %135 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %132 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %130 %156 
                                       f32_3 %157 = OpLoad %130 
                              Uniform f32_4* %159 = OpAccessChain %36 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %130 %162 
                                        bool %165 = OpLoad %102 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %169 
                                             %166 = OpLabel 
                                       f32_3 %168 = OpLoad %130 
                                                      OpStore %164 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                       f32_3 %170 = OpLoad %132 
                                                      OpStore %164 %170 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %171 = OpLoad %164 
                                                      OpStore %130 %171 
                                       f32_3 %172 = OpLoad %130 
                              Uniform f32_3* %175 = OpAccessChain %36 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                                      OpStore %130 %178 
                                       f32_3 %180 = OpLoad %130 
                              Uniform f32_3* %181 = OpAccessChain %36 %158 
                                       f32_3 %182 = OpLoad %181 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %179 
                                       f32_4 %185 = OpVectorShuffle %184 %183 0 4 5 6 
                                                      OpStore %179 %185 
                                Private f32* %187 = OpAccessChain %179 %126 
                                         f32 %188 = OpLoad %187 
                                         f32 %190 = OpFMul %188 %189 
                                         f32 %192 = OpFAdd %190 %191 
                                                      OpStore %186 %192 
                                Uniform f32* %194 = OpAccessChain %36 %65 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %198 = OpFAdd %197 %191 
                                Private f32* %199 = OpAccessChain %130 %54 
                                                      OpStore %199 %198 
                                         f32 %200 = OpLoad %186 
                                Private f32* %201 = OpAccessChain %130 %54 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpExtInst %1 40 %200 %202 
                                Private f32* %204 = OpAccessChain %179 %54 
                                                      OpStore %204 %203 
                  read_only Texture3DSampled %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %179 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 2 3 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                                      OpStore %179 %212 
                                       f32_4 %213 = OpLoad %179 
                                                      OpStore %47 %213 
                                                      OpBranch %125 
                                             %214 = OpLabel 
                                Private f32* %215 = OpAccessChain %47 %54 
                                                      OpStore %215 %115 
                                Private f32* %216 = OpAccessChain %47 %126 
                                                      OpStore %216 %115 
                                Private f32* %217 = OpAccessChain %47 %193 
                                                      OpStore %217 %115 
                                Private f32* %218 = OpAccessChain %47 %48 
                                                      OpStore %218 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %220 = OpLoad %47 
                              Uniform f32_4* %221 = OpAccessChain %36 %64 
                                       f32_4 %222 = OpLoad %221 
                                         f32 %223 = OpDot %220 %222 
                                Private f32* %224 = OpAccessChain %219 %54 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %219 %54 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 43 %226 %61 %115 
                                Private f32* %228 = OpAccessChain %219 %54 
                                                      OpStore %228 %227 
                                       f32_4 %230 = OpLoad %29 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %36 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFMul %231 %235 
                                                      OpStore %229 %236 
                                       f32_3 %237 = OpLoad %219 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpLoad %229 
                                       f32_3 %240 = OpFMul %238 %239 
                                                      OpStore %219 %240 
                                       f32_4 %241 = OpLoad %29 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_3 %246 = OpLoad %219 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %219 %247 
                                Private f32* %250 = OpAccessChain %29 %48 
                                         f32 %251 = OpLoad %250 
                                 Output f32* %253 = OpAccessChain %249 %48 
                                                      OpStore %253 %251 
                                Uniform f32* %255 = OpAccessChain %36 %254 
                                         f32 %256 = OpLoad %255 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %74 
                                       f32_3 %259 = OpFMul %257 %258 
                                       f32_3 %260 = OpLoad %219 
                                       f32_3 %261 = OpFAdd %259 %260 
                                       f32_4 %262 = OpLoad %249 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %249 %263 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat13;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat4 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
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
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 309
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %119 %131 %132 %146 %183 %186 %189 %191 %192 %300 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 RelaxedPrecision 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 RelaxedPrecision 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 RelaxedPrecision 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 RelaxedPrecision 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 RelaxedPrecision 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %117 0 BuiltIn 117 
                                                      OpMemberDecorate %117 1 BuiltIn 117 
                                                      OpMemberDecorate %117 2 BuiltIn 117 
                                                      OpDecorate %117 Block 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 10 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 11 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 7 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %66 = OpConstant 0 
                                          i32 %74 = OpConstant 2 
                               Private f32_4* %82 = OpVariable Private 
                                          i32 %84 = OpConstant 3 
                               Private f32_4* %95 = OpVariable Private 
                                          i32 %98 = OpConstant 9 
                                             %116 = OpTypeArray %6 %48 
                                             %117 = OpTypeStruct %7 %6 %116 
                                             %118 = OpTypePointer Output %117 
        Output struct {f32_4; f32; f32[1];}* %119 = OpVariable Output 
                                             %127 = OpTypePointer Output %7 
                                             %129 = OpTypeVector %6 2 
                                             %130 = OpTypePointer Output %129 
                               Output f32_2* %131 = OpVariable Output 
                                Input f32_4* %132 = OpVariable Input 
                                         i32 %135 = OpConstant 12 
                                             %144 = OpTypeVector %6 3 
                                             %145 = OpTypePointer Input %144 
                                Input f32_3* %146 = OpVariable Input 
                                         i32 %148 = OpConstant 8 
                                         u32 %165 = OpConstant 2 
                                Private f32* %167 = OpVariable Private 
                                             %182 = OpTypePointer Output %144 
                               Output f32_3* %183 = OpVariable Output 
                               Output f32_3* %186 = OpVariable Output 
                               Output f32_4* %189 = OpVariable Output 
                               Output f32_4* %191 = OpVariable Output 
                                Input f32_4* %192 = OpVariable Input 
                                             %194 = OpTypePointer Private %144 
                              Private f32_3* %195 = OpVariable Private 
                              Private f32_4* %212 = OpVariable Private 
                              Private f32_3* %218 = OpVariable Private 
                                         i32 %224 = OpConstant 4 
                                         i32 %230 = OpConstant 5 
                                         i32 %236 = OpConstant 6 
                                         u32 %245 = OpConstant 3 
                                         f32 %266 = OpConstant 3.67402E-40 
                                       f32_3 %267 = OpConstantComposite %266 %266 %266 
                                         f32 %275 = OpConstant 3.67402E-40 
                                       f32_3 %276 = OpConstantComposite %275 %275 %275 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_3 %288 = OpConstantComposite %287 %287 %287 
                                         f32 %290 = OpConstant 3.67402E-40 
                                       f32_3 %291 = OpConstantComposite %290 %290 %290 
                               Output f32_3* %300 = OpVariable Output 
                                             %303 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %67 = OpAccessChain %17 %60 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %75 = OpAccessChain %17 %60 %74 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %47 
                                        f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %9 %81 
                                        f32_4 %83 = OpLoad %9 
                               Uniform f32_4* %85 = OpAccessChain %17 %60 %84 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpFAdd %83 %86 
                                                      OpStore %82 %87 
                               Uniform f32_4* %88 = OpAccessChain %17 %60 %84 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %47 
                                        f32_4 %91 = OpVectorShuffle %90 %90 3 3 3 3 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpFAdd %92 %93 
                                                      OpStore %9 %94 
                                        f32_4 %96 = OpLoad %82 
                                        f32_4 %97 = OpVectorShuffle %96 %96 1 1 1 1 
                               Uniform f32_4* %99 = OpAccessChain %17 %98 %61 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpFMul %97 %100 
                                                      OpStore %95 %101 
                              Uniform f32_4* %102 = OpAccessChain %17 %98 %66 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %82 
                                       f32_4 %105 = OpVectorShuffle %104 %104 0 0 0 0 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %95 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %95 %108 
                              Uniform f32_4* %109 = OpAccessChain %17 %98 %74 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %82 
                                       f32_4 %112 = OpVectorShuffle %111 %111 2 2 2 2 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %95 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %95 %115 
                              Uniform f32_4* %120 = OpAccessChain %17 %98 %84 
                                       f32_4 %121 = OpLoad %120 
                                       f32_4 %122 = OpLoad %82 
                                       f32_4 %123 = OpVectorShuffle %122 %122 3 3 3 3 
                                       f32_4 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %95 
                                       f32_4 %126 = OpFAdd %124 %125 
                               Output f32_4* %128 = OpAccessChain %119 %66 
                                                      OpStore %128 %126 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                              Uniform f32_4* %136 = OpAccessChain %17 %135 
                                       f32_4 %137 = OpLoad %136 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_2 %139 = OpFMul %134 %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %135 
                                       f32_4 %141 = OpLoad %140 
                                       f32_2 %142 = OpVectorShuffle %141 %141 2 3 
                                       f32_2 %143 = OpFAdd %139 %142 
                                                      OpStore %131 %143 
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %149 = OpAccessChain %17 %148 %66 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                         f32 %152 = OpDot %147 %151 
                                Private f32* %153 = OpAccessChain %82 %25 
                                                      OpStore %153 %152 
                                       f32_3 %154 = OpLoad %146 
                              Uniform f32_4* %155 = OpAccessChain %17 %148 %61 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                         f32 %158 = OpDot %154 %157 
                                Private f32* %159 = OpAccessChain %82 %48 
                                                      OpStore %159 %158 
                                       f32_3 %160 = OpLoad %146 
                              Uniform f32_4* %161 = OpAccessChain %17 %148 %74 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                         f32 %164 = OpDot %160 %163 
                                Private f32* %166 = OpAccessChain %82 %165 
                                                      OpStore %166 %164 
                                       f32_4 %168 = OpLoad %82 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_4 %170 = OpLoad %82 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                         f32 %172 = OpDot %169 %171 
                                                      OpStore %167 %172 
                                         f32 %173 = OpLoad %167 
                                         f32 %174 = OpExtInst %1 32 %173 
                                                      OpStore %167 %174 
                                         f32 %175 = OpLoad %167 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %82 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %82 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %82 %181 
                                       f32_4 %184 = OpLoad %82 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                                      OpStore %183 %185 
                                       f32_4 %187 = OpLoad %9 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                                      OpStore %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                                      OpStore %189 %190 
                                       f32_4 %193 = OpLoad %192 
                                                      OpStore %191 %193 
                                Private f32* %196 = OpAccessChain %82 %48 
                                         f32 %197 = OpLoad %196 
                                Private f32* %198 = OpAccessChain %82 %48 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %197 %199 
                                Private f32* %201 = OpAccessChain %195 %25 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %82 %25 
                                         f32 %203 = OpLoad %202 
                                Private f32* %204 = OpAccessChain %82 %25 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                Private f32* %207 = OpAccessChain %195 %25 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFNegate %208 
                                         f32 %210 = OpFAdd %206 %209 
                                Private f32* %211 = OpAccessChain %195 %25 
                                                      OpStore %211 %210 
                                       f32_4 %213 = OpLoad %82 
                                       f32_4 %214 = OpVectorShuffle %213 %213 1 2 2 0 
                                       f32_4 %215 = OpLoad %82 
                                       f32_4 %216 = OpVectorShuffle %215 %215 0 1 2 2 
                                       f32_4 %217 = OpFMul %214 %216 
                                                      OpStore %212 %217 
                              Uniform f32_4* %219 = OpAccessChain %17 %84 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %212 
                                         f32 %222 = OpDot %220 %221 
                                Private f32* %223 = OpAccessChain %218 %25 
                                                      OpStore %223 %222 
                              Uniform f32_4* %225 = OpAccessChain %17 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %212 
                                         f32 %228 = OpDot %226 %227 
                                Private f32* %229 = OpAccessChain %218 %48 
                                                      OpStore %229 %228 
                              Uniform f32_4* %231 = OpAccessChain %17 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %212 
                                         f32 %234 = OpDot %232 %233 
                                Private f32* %235 = OpAccessChain %218 %165 
                                                      OpStore %235 %234 
                              Uniform f32_4* %237 = OpAccessChain %17 %236 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpLoad %195 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                       f32_3 %242 = OpFMul %239 %241 
                                       f32_3 %243 = OpLoad %218 
                                       f32_3 %244 = OpFAdd %242 %243 
                                                      OpStore %195 %244 
                                Private f32* %246 = OpAccessChain %82 %245 
                                                      OpStore %246 %44 
                              Uniform f32_4* %247 = OpAccessChain %17 %66 
                                       f32_4 %248 = OpLoad %247 
                                       f32_4 %249 = OpLoad %82 
                                         f32 %250 = OpDot %248 %249 
                                Private f32* %251 = OpAccessChain %218 %25 
                                                      OpStore %251 %250 
                              Uniform f32_4* %252 = OpAccessChain %17 %61 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpLoad %82 
                                         f32 %255 = OpDot %253 %254 
                                Private f32* %256 = OpAccessChain %218 %48 
                                                      OpStore %256 %255 
                              Uniform f32_4* %257 = OpAccessChain %17 %74 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpLoad %82 
                                         f32 %260 = OpDot %258 %259 
                                Private f32* %261 = OpAccessChain %218 %165 
                                                      OpStore %261 %260 
                                       f32_3 %262 = OpLoad %195 
                                       f32_3 %263 = OpLoad %218 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %195 %264 
                                       f32_3 %265 = OpLoad %195 
                                       f32_3 %268 = OpExtInst %1 40 %265 %267 
                                                      OpStore %195 %268 
                                       f32_3 %269 = OpLoad %195 
                                       f32_3 %270 = OpExtInst %1 30 %269 
                                       f32_4 %271 = OpLoad %82 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %82 %272 
                                       f32_4 %273 = OpLoad %82 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %277 = OpFMul %274 %276 
                                       f32_4 %278 = OpLoad %82 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %82 %279 
                                       f32_4 %280 = OpLoad %82 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_3 %282 = OpExtInst %1 29 %281 
                                       f32_4 %283 = OpLoad %82 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %82 %284 
                                       f32_4 %285 = OpLoad %82 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %289 = OpFMul %286 %288 
                                       f32_3 %292 = OpFAdd %289 %291 
                                       f32_4 %293 = OpLoad %82 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %82 %294 
                                       f32_4 %295 = OpLoad %82 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                                       f32_3 %297 = OpExtInst %1 40 %296 %267 
                                       f32_4 %298 = OpLoad %82 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %82 %299 
                                       f32_4 %301 = OpLoad %82 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                                      OpStore %300 %302 
                                 Output f32* %304 = OpAccessChain %119 %66 %48 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFNegate %305 
                                 Output f32* %307 = OpAccessChain %119 %66 %48 
                                                      OpStore %307 %306 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 265
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %132 %243 %249 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpMemberDecorate %34 0 RelaxedPrecision 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpMemberDecorate %34 5 RelaxedPrecision 
                                                      OpMemberDecorate %34 5 Offset 34 
                                                      OpMemberDecorate %34 6 Offset 34 
                                                      OpMemberDecorate %34 7 Offset 34 
                                                      OpMemberDecorate %34 8 Offset 34 
                                                      OpMemberDecorate %34 9 RelaxedPrecision 
                                                      OpMemberDecorate %34 9 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %260 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeStruct %7 %7 %32 %33 %33 %7 %6 %6 %6 %6 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 8 
                                              %39 = OpTypePointer Uniform %6 
                               Private f32_4* %47 = OpVariable Private 
                                          u32 %48 = OpConstant 3 
                                              %49 = OpTypePointer Private %6 
                                          f32 %52 = OpConstant 3.67402E-40 
                                          u32 %54 = OpConstant 0 
                                              %56 = OpTypeBool 
                                              %57 = OpTypePointer Private %56 
                                Private bool* %58 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                                          i32 %67 = OpConstant -1 
                                              %73 = OpTypePointer Private %33 
                               Private f32_3* %74 = OpVariable Private 
                                          i32 %79 = OpConstant 7 
                                          i32 %96 = OpConstant 9 
                               Private bool* %102 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                                         u32 %126 = OpConstant 1 
                              Private f32_3* %130 = OpVariable Private 
                                             %131 = OpTypePointer Input %33 
                                Input f32_3* %132 = OpVariable Input 
                                         i32 %135 = OpConstant 2 
                                             %136 = OpTypePointer Uniform %7 
                                         i32 %158 = OpConstant 3 
                                             %163 = OpTypePointer Function %33 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %33 
                              Private f32_4* %179 = OpVariable Private 
                                Private f32* %186 = OpVariable Private 
                                         f32 %189 = OpConstant 3.67402E-40 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         u32 %193 = OpConstant 2 
                                         f32 %196 = OpConstant 3.67402E-40 
                                             %205 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %206 = OpTypeSampledImage %205 
                                             %207 = OpTypePointer UniformConstant %206 
 UniformConstant read_only Texture3DSampled* %208 = OpVariable UniformConstant 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %229 = OpVariable Private 
                                         i32 %232 = OpConstant 5 
                                Input f32_3* %243 = OpVariable Input 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %252 = OpTypePointer Output %6 
                                         i32 %254 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %40 = OpAccessChain %36 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_4 %42 = OpCompositeConstruct %41 %41 %41 %41 
                                        f32_4 %43 = OpLoad %20 
                                        f32_4 %44 = OpFMul %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %29 %46 
                                 Private f32* %50 = OpAccessChain %29 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFAdd %51 %52 
                                 Private f32* %55 = OpAccessChain %47 %54 
                                                      OpStore %55 %53 
                                 Private f32* %59 = OpAccessChain %47 %54 
                                          f32 %60 = OpLoad %59 
                                         bool %62 = OpFOrdLessThan %60 %61 
                                                      OpStore %58 %62 
                                         bool %63 = OpLoad %58 
                                          i32 %66 = OpSelect %63 %65 %64 
                                          i32 %68 = OpIMul %66 %67 
                                         bool %69 = OpINotEqual %68 %64 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                        f32_4 %75 = OpLoad %29 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpExtInst %1 30 %76 
                                                      OpStore %74 %77 
                                        f32_3 %78 = OpLoad %74 
                                 Uniform f32* %80 = OpAccessChain %36 %79 
                                          f32 %81 = OpLoad %80 
                                 Uniform f32* %82 = OpAccessChain %36 %79 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %36 %79 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                          f32 %87 = OpCompositeExtract %86 0 
                                          f32 %88 = OpCompositeExtract %86 1 
                                          f32 %89 = OpCompositeExtract %86 2 
                                        f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                        f32_3 %91 = OpFMul %78 %90 
                                                      OpStore %74 %91 
                                        f32_3 %92 = OpLoad %74 
                                        f32_3 %93 = OpExtInst %1 29 %92 
                                                      OpStore %74 %93 
                                 Private f32* %94 = OpAccessChain %29 %48 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %97 = OpAccessChain %36 %96 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %95 %99 
                                Private f32* %101 = OpAccessChain %47 %54 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %47 %54 
                                         f32 %104 = OpLoad %103 
                                        bool %105 = OpFOrdLessThan %104 %61 
                                                      OpStore %102 %105 
                                        bool %106 = OpLoad %102 
                                         i32 %107 = OpSelect %106 %65 %64 
                                         i32 %108 = OpIMul %107 %67 
                                        bool %109 = OpINotEqual %108 %64 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpKill
                                             %111 = OpLabel 
                                Uniform f32* %113 = OpAccessChain %36 %65 %54 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %102 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %102 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %214 
                                             %124 = OpLabel 
                                Uniform f32* %127 = OpAccessChain %36 %65 %126 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %115 
                                                      OpStore %102 %129 
                                       f32_3 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %137 = OpAccessChain %36 %135 %65 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFMul %134 %139 
                                                      OpStore %130 %140 
                              Uniform f32_4* %141 = OpAccessChain %36 %135 %64 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %132 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_3 %147 = OpLoad %130 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %130 %148 
                              Uniform f32_4* %149 = OpAccessChain %36 %135 %135 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %132 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %130 %156 
                                       f32_3 %157 = OpLoad %130 
                              Uniform f32_4* %159 = OpAccessChain %36 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %130 %162 
                                        bool %165 = OpLoad %102 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %169 
                                             %166 = OpLabel 
                                       f32_3 %168 = OpLoad %130 
                                                      OpStore %164 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                       f32_3 %170 = OpLoad %132 
                                                      OpStore %164 %170 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %171 = OpLoad %164 
                                                      OpStore %130 %171 
                                       f32_3 %172 = OpLoad %130 
                              Uniform f32_3* %175 = OpAccessChain %36 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                                      OpStore %130 %178 
                                       f32_3 %180 = OpLoad %130 
                              Uniform f32_3* %181 = OpAccessChain %36 %158 
                                       f32_3 %182 = OpLoad %181 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %179 
                                       f32_4 %185 = OpVectorShuffle %184 %183 0 4 5 6 
                                                      OpStore %179 %185 
                                Private f32* %187 = OpAccessChain %179 %126 
                                         f32 %188 = OpLoad %187 
                                         f32 %190 = OpFMul %188 %189 
                                         f32 %192 = OpFAdd %190 %191 
                                                      OpStore %186 %192 
                                Uniform f32* %194 = OpAccessChain %36 %65 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %198 = OpFAdd %197 %191 
                                Private f32* %199 = OpAccessChain %130 %54 
                                                      OpStore %199 %198 
                                         f32 %200 = OpLoad %186 
                                Private f32* %201 = OpAccessChain %130 %54 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpExtInst %1 40 %200 %202 
                                Private f32* %204 = OpAccessChain %179 %54 
                                                      OpStore %204 %203 
                  read_only Texture3DSampled %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %179 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 2 3 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                                      OpStore %179 %212 
                                       f32_4 %213 = OpLoad %179 
                                                      OpStore %47 %213 
                                                      OpBranch %125 
                                             %214 = OpLabel 
                                Private f32* %215 = OpAccessChain %47 %54 
                                                      OpStore %215 %115 
                                Private f32* %216 = OpAccessChain %47 %126 
                                                      OpStore %216 %115 
                                Private f32* %217 = OpAccessChain %47 %193 
                                                      OpStore %217 %115 
                                Private f32* %218 = OpAccessChain %47 %48 
                                                      OpStore %218 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %220 = OpLoad %47 
                              Uniform f32_4* %221 = OpAccessChain %36 %64 
                                       f32_4 %222 = OpLoad %221 
                                         f32 %223 = OpDot %220 %222 
                                Private f32* %224 = OpAccessChain %219 %54 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %219 %54 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 43 %226 %61 %115 
                                Private f32* %228 = OpAccessChain %219 %54 
                                                      OpStore %228 %227 
                                       f32_4 %230 = OpLoad %29 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %36 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFMul %231 %235 
                                                      OpStore %229 %236 
                                       f32_3 %237 = OpLoad %219 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpLoad %229 
                                       f32_3 %240 = OpFMul %238 %239 
                                                      OpStore %219 %240 
                                       f32_4 %241 = OpLoad %29 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_3 %246 = OpLoad %219 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %219 %247 
                                Private f32* %250 = OpAccessChain %29 %48 
                                         f32 %251 = OpLoad %250 
                                 Output f32* %253 = OpAccessChain %249 %48 
                                                      OpStore %253 %251 
                                Uniform f32* %255 = OpAccessChain %36 %254 
                                         f32 %256 = OpLoad %255 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %74 
                                       f32_3 %259 = OpFMul %257 %258 
                                       f32_3 %260 = OpLoad %219 
                                       f32_3 %261 = OpFAdd %259 %260 
                                       f32_4 %262 = OpLoad %249 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %249 %263 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat11;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * _LightShadowData.z + _LightShadowData.w;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb6)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat10.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat10.x, u_xlat6.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat6.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat10.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat10.xy);
    u_xlat13 = u_xlat13 + u_xlat10_3.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat6.x = min(u_xlat13, u_xlat6.x);
    u_xlat13 = (u_xlatb2) ? u_xlat6.x : u_xlat13;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 228
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %124 %130 %131 %145 %174 %180 %183 %185 %186 %188 %208 %220 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %122 0 BuiltIn 122 
                                                      OpMemberDecorate %122 1 BuiltIn 122 
                                                      OpMemberDecorate %122 2 BuiltIn 122 
                                                      OpDecorate %122 Block 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate %145 Location 145 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %188 Location 188 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %220 Location 220 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 5 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %7 
                                          i32 %65 = OpConstant 0 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                                          i32 %83 = OpConstant 3 
                               Private f32_4* %94 = OpVariable Private 
                                             %121 = OpTypeArray %6 %48 
                                             %122 = OpTypeStruct %7 %6 %121 
                                             %123 = OpTypePointer Output %122 
        Output struct {f32_4; f32; f32[1];}* %124 = OpVariable Output 
                                             %126 = OpTypePointer Output %7 
                                             %128 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Output %128 
                               Output f32_2* %130 = OpVariable Output 
                                Input f32_4* %131 = OpVariable Input 
                                         i32 %134 = OpConstant 6 
                                             %143 = OpTypeVector %6 3 
                                             %144 = OpTypePointer Input %143 
                                Input f32_3* %145 = OpVariable Input 
                                         u32 %163 = OpConstant 2 
                                Private f32* %165 = OpVariable Private 
                                             %173 = OpTypePointer Output %143 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_3* %180 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                               Output f32_4* %185 = OpVariable Output 
                                Input f32_4* %186 = OpVariable Input 
                               Output f32_3* %188 = OpVariable Output 
                                         f32 %189 = OpConstant 3.67402E-40 
                                       f32_3 %190 = OpConstantComposite %189 %189 %189 
                                         u32 %200 = OpConstant 3 
                                       f32_2 %204 = OpConstantComposite %37 %37 
                               Output f32_4* %208 = OpVariable Output 
                               Output f32_4* %220 = OpVariable Output 
                                       f32_4 %221 = OpConstantComposite %189 %189 %189 %189 
                                             %222 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %62 = OpAccessChain %17 %60 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %59 %63 
                                                      OpStore %9 %64 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %84 = OpAccessChain %17 %60 %83 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFAdd %82 %85 
                                                      OpStore %81 %86 
                               Uniform f32_4* %87 = OpAccessChain %17 %60 %83 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %47 
                                        f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %9 %93 
                                        f32_4 %95 = OpLoad %81 
                                        f32_4 %96 = OpVectorShuffle %95 %95 1 1 1 1 
                               Uniform f32_4* %97 = OpAccessChain %17 %83 %60 
                                        f32_4 %98 = OpLoad %97 
                                        f32_4 %99 = OpFMul %96 %98 
                                                      OpStore %94 %99 
                              Uniform f32_4* %100 = OpAccessChain %17 %83 %65 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpLoad %81 
                                       f32_4 %103 = OpVectorShuffle %102 %102 0 0 0 0 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %94 
                                       f32_4 %106 = OpFAdd %104 %105 
                                                      OpStore %94 %106 
                              Uniform f32_4* %107 = OpAccessChain %17 %83 %73 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %81 
                                       f32_4 %110 = OpVectorShuffle %109 %109 2 2 2 2 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %94 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %94 %113 
                              Uniform f32_4* %114 = OpAccessChain %17 %83 %83 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %81 
                                       f32_4 %117 = OpVectorShuffle %116 %116 3 3 3 3 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %94 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %81 %120 
                                       f32_4 %125 = OpLoad %81 
                               Output f32_4* %127 = OpAccessChain %124 %65 
                                                      OpStore %127 %125 
                                       f32_4 %132 = OpLoad %131 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                              Uniform f32_4* %135 = OpAccessChain %17 %134 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                                       f32_2 %138 = OpFMul %133 %137 
                              Uniform f32_4* %139 = OpAccessChain %17 %134 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 2 3 
                                       f32_2 %142 = OpFAdd %138 %141 
                                                      OpStore %130 %142 
                                       f32_3 %146 = OpLoad %145 
                              Uniform f32_4* %147 = OpAccessChain %17 %73 %65 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %150 = OpDot %146 %149 
                                Private f32* %151 = OpAccessChain %94 %25 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %145 
                              Uniform f32_4* %153 = OpAccessChain %17 %73 %60 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %152 %155 
                                Private f32* %157 = OpAccessChain %94 %48 
                                                      OpStore %157 %156 
                                       f32_3 %158 = OpLoad %145 
                              Uniform f32_4* %159 = OpAccessChain %17 %73 %73 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                         f32 %162 = OpDot %158 %161 
                                Private f32* %164 = OpAccessChain %94 %163 
                                                      OpStore %164 %162 
                                       f32_4 %166 = OpLoad %94 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %94 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %175 = OpLoad %165 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %94 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                                      OpStore %180 %182 
                                       f32_4 %184 = OpLoad %9 
                                                      OpStore %183 %184 
                                       f32_4 %187 = OpLoad %186 
                                                      OpStore %185 %187 
                                                      OpStore %188 %190 
                                Private f32* %191 = OpAccessChain %81 %48 
                                         f32 %192 = OpLoad %191 
                                Uniform f32* %193 = OpAccessChain %17 %65 %25 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFMul %192 %194 
                                Private f32* %196 = OpAccessChain %9 %25 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %9 %25 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %198 %37 
                                Private f32* %201 = OpAccessChain %9 %200 
                                                      OpStore %201 %199 
                                       f32_4 %202 = OpLoad %81 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 3 
                                       f32_2 %205 = OpFMul %203 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 1 5 3 
                                                      OpStore %9 %207 
                                       f32_4 %209 = OpLoad %81 
                                       f32_2 %210 = OpVectorShuffle %209 %209 2 3 
                                       f32_4 %211 = OpLoad %208 
                                       f32_4 %212 = OpVectorShuffle %211 %210 0 1 4 5 
                                                      OpStore %208 %212 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 2 2 
                                       f32_4 %215 = OpLoad %9 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 3 
                                       f32_2 %217 = OpFAdd %214 %216 
                                       f32_4 %218 = OpLoad %208 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                                      OpStore %208 %219 
                                                      OpStore %220 %221 
                                 Output f32* %223 = OpAccessChain %124 %65 %48 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFNegate %224 
                                 Output f32* %226 = OpAccessChain %124 %65 %48 
                                                      OpStore %226 %225 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %116 %292 %347 %353 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 RelaxedPrecision 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 RelaxedPrecision 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpMemberDecorate %35 9 RelaxedPrecision 
                                                      OpMemberDecorate %35 9 Offset 35 
                                                      OpMemberDecorate %35 10 Offset 35 
                                                      OpMemberDecorate %35 11 Offset 35 
                                                      OpMemberDecorate %35 12 Offset 35 
                                                      OpMemberDecorate %35 13 RelaxedPrecision 
                                                      OpMemberDecorate %35 13 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %191 SpecId 191 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 DescriptorSet 301 
                                                      OpDecorate %301 Binding 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %347 Location 347 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %364 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 4 
                                              %33 = OpTypeArray %7 %32 
                                              %34 = OpTypeArray %7 %32 
                                              %35 = OpTypeStruct %30 %7 %7 %7 %33 %7 %34 %30 %30 %7 %6 %6 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 12 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                              %74 = OpTypePointer Private %30 
                               Private f32_3* %75 = OpVariable Private 
                                          i32 %80 = OpConstant 11 
                                          i32 %97 = OpConstant 13 
                               Private bool* %103 = OpVariable Private 
                              Private f32_3* %114 = OpVariable Private 
                                             %115 = OpTypePointer Input %30 
                                Input f32_3* %116 = OpVariable Input 
                                             %119 = OpTypePointer Uniform %30 
                              Private f32_3* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 4 
                                         u32 %125 = OpConstant 2 
                                         u32 %131 = OpConstant 1 
                                         i32 %133 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                                         i32 %142 = OpConstant 3 
                                             %143 = OpTypePointer Uniform %7 
                                         f32 %178 = OpConstant 3.67402E-40 
                               Private bool* %180 = OpVariable Private 
                                         i32 %181 = OpConstant 5 
                                        bool %185 = OpConstantFalse 
                                        bool %191 = OpSpecConstantFalse 
                               Private bool* %194 = OpVariable Private 
                                         i32 %200 = OpConstant 6 
                              Private f32_3* %226 = OpVariable Private 
                                             %227 = OpTypePointer Function %30 
                                         i32 %237 = OpConstant 8 
                              Private f32_4* %242 = OpVariable Private 
                                         i32 %244 = OpConstant 7 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %254 = OpConstant 3.67402E-40 
                                Private f32* %257 = OpVariable Private 
                                         f32 %260 = OpConstant 3.67402E-40 
                                             %268 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %269 = OpTypeSampledImage %268 
                                             %270 = OpTypePointer UniformConstant %269 
 UniformConstant read_only Texture3DSampled* %271 = OpVariable UniformConstant 
                              Private f32_3* %282 = OpVariable Private 
                                Input f32_4* %292 = OpVariable Input 
                                Private f32* %300 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %301 = OpVariable UniformConstant 
                              Private f32_3* %307 = OpVariable Private 
                                             %322 = OpTypePointer Function %6 
                                         i32 %336 = OpConstant 9 
                                Input f32_3* %347 = OpVariable Input 
                                             %352 = OpTypePointer Output %7 
                               Output f32_4* %353 = OpVariable Output 
                                             %356 = OpTypePointer Output %6 
                                         i32 %358 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %228 = OpVariable Function 
                               Function f32* %323 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_4 %76 = OpLoad %29 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpExtInst %1 30 %77 
                                                      OpStore %75 %78 
                                        f32_3 %79 = OpLoad %75 
                                 Uniform f32* %81 = OpAccessChain %37 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %37 %80 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %37 %80 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %79 %91 
                                                      OpStore %75 %92 
                                        f32_3 %93 = OpLoad %75 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %75 %94 
                                 Private f32* %95 = OpAccessChain %29 %49 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %98 = OpAccessChain %37 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %101 = OpFAdd %96 %100 
                                Private f32* %102 = OpAccessChain %48 %55 
                                                      OpStore %102 %101 
                                Private f32* %104 = OpAccessChain %48 %55 
                                         f32 %105 = OpLoad %104 
                                        bool %106 = OpFOrdLessThan %105 %62 
                                                      OpStore %103 %106 
                                        bool %107 = OpLoad %103 
                                         i32 %108 = OpSelect %107 %66 %65 
                                         i32 %109 = OpIMul %108 %68 
                                        bool %110 = OpINotEqual %109 %65 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                       f32_3 %117 = OpLoad %116 
                                       f32_3 %118 = OpFNegate %117 
                              Uniform f32_3* %120 = OpAccessChain %37 %65 
                                       f32_3 %121 = OpLoad %120 
                                       f32_3 %122 = OpFAdd %118 %121 
                                                      OpStore %114 %122 
                                Uniform f32* %126 = OpAccessChain %37 %124 %65 %125 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %123 %55 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %37 %124 %66 %125 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %123 %131 
                                                      OpStore %132 %130 
                                Uniform f32* %134 = OpAccessChain %37 %124 %133 %125 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %123 %125 
                                                      OpStore %136 %135 
                                       f32_3 %138 = OpLoad %114 
                                       f32_3 %139 = OpLoad %123 
                                         f32 %140 = OpDot %138 %139 
                                                      OpStore %137 %140 
                                       f32_3 %141 = OpLoad %116 
                              Uniform f32_4* %144 = OpAccessChain %37 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFNegate %146 
                                       f32_3 %148 = OpFAdd %141 %147 
                                                      OpStore %114 %148 
                                       f32_3 %149 = OpLoad %114 
                                       f32_3 %150 = OpLoad %114 
                                         f32 %151 = OpDot %149 %150 
                                Private f32* %152 = OpAccessChain %114 %55 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %114 %55 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpExtInst %1 31 %154 
                                Private f32* %156 = OpAccessChain %114 %55 
                                                      OpStore %156 %155 
                                         f32 %157 = OpLoad %137 
                                         f32 %158 = OpFNegate %157 
                                Private f32* %159 = OpAccessChain %114 %55 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFAdd %158 %160 
                                Private f32* %162 = OpAccessChain %114 %55 
                                                      OpStore %162 %161 
                                Uniform f32* %163 = OpAccessChain %37 %142 %49 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %114 %55 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                         f32 %168 = OpLoad %137 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %137 %169 
                                         f32 %170 = OpLoad %137 
                                Uniform f32* %171 = OpAccessChain %37 %133 %125 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Uniform f32* %174 = OpAccessChain %37 %133 %49 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                                      OpStore %137 %176 
                                         f32 %177 = OpLoad %137 
                                         f32 %179 = OpExtInst %1 43 %177 %62 %178 
                                                      OpStore %137 %179 
                                Uniform f32* %182 = OpAccessChain %37 %181 %55 
                                         f32 %183 = OpLoad %182 
                                        bool %184 = OpFOrdEqual %183 %178 
                                                      OpStore %180 %184 
                                                      OpSelectionMerge %187 None 
                                                      OpBranchConditional %185 %186 %187 
                                             %186 = OpLabel 
                                        bool %188 = OpLoad %180 
                                                      OpSelectionMerge %190 None 
                                                      OpBranchConditional %188 %189 %190 
                                             %189 = OpLabel 
                                                      OpBranch %190 
                                             %190 = OpLabel 
                                                      OpBranch %187 
                                             %187 = OpLabel 
                                                      OpSelectionMerge %193 None 
                                                      OpBranchConditional %191 %192 %277 
                                             %192 = OpLabel 
                                Uniform f32* %195 = OpAccessChain %37 %181 %131 
                                         f32 %196 = OpLoad %195 
                                        bool %197 = OpFOrdEqual %196 %178 
                                                      OpStore %194 %197 
                                       f32_3 %198 = OpLoad %116 
                                       f32_3 %199 = OpVectorShuffle %198 %198 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %37 %200 %66 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %123 %204 
                              Uniform f32_4* %205 = OpAccessChain %37 %200 %65 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %116 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %123 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %123 %212 
                              Uniform f32_4* %213 = OpAccessChain %37 %200 %133 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %116 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %123 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %123 %220 
                                       f32_3 %221 = OpLoad %123 
                              Uniform f32_4* %222 = OpAccessChain %37 %200 %142 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFAdd %221 %224 
                                                      OpStore %123 %225 
                                        bool %229 = OpLoad %194 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %233 
                                             %230 = OpLabel 
                                       f32_3 %232 = OpLoad %123 
                                                      OpStore %228 %232 
                                                      OpBranch %231 
                                             %233 = OpLabel 
                                       f32_3 %234 = OpLoad %116 
                                                      OpStore %228 %234 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                       f32_3 %235 = OpLoad %228 
                                                      OpStore %226 %235 
                                       f32_3 %236 = OpLoad %226 
                              Uniform f32_3* %238 = OpAccessChain %37 %237 
                                       f32_3 %239 = OpLoad %238 
                                       f32_3 %240 = OpFNegate %239 
                                       f32_3 %241 = OpFAdd %236 %240 
                                                      OpStore %226 %241 
                                       f32_3 %243 = OpLoad %226 
                              Uniform f32_3* %245 = OpAccessChain %37 %244 
                                       f32_3 %246 = OpLoad %245 
                                       f32_3 %247 = OpFMul %243 %246 
                                       f32_4 %248 = OpLoad %242 
                                       f32_4 %249 = OpVectorShuffle %248 %247 0 4 5 6 
                                                      OpStore %242 %249 
                                Private f32* %250 = OpAccessChain %242 %131 
                                         f32 %251 = OpLoad %250 
                                         f32 %253 = OpFMul %251 %252 
                                         f32 %255 = OpFAdd %253 %254 
                                Private f32* %256 = OpAccessChain %226 %55 
                                                      OpStore %256 %255 
                                Uniform f32* %258 = OpAccessChain %37 %181 %125 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %254 
                                                      OpStore %257 %262 
                                         f32 %263 = OpLoad %257 
                                Private f32* %264 = OpAccessChain %226 %55 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 40 %263 %265 
                                Private f32* %267 = OpAccessChain %242 %55 
                                                      OpStore %267 %266 
                  read_only Texture3DSampled %272 = OpLoad %271 
                                       f32_4 %273 = OpLoad %242 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 2 3 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                                      OpStore %242 %275 
                                       f32_4 %276 = OpLoad %242 
                                                      OpStore %48 %276 
                                                      OpBranch %193 
                                             %277 = OpLabel 
                                Private f32* %278 = OpAccessChain %48 %55 
                                                      OpStore %278 %178 
                                Private f32* %279 = OpAccessChain %48 %131 
                                                      OpStore %279 %178 
                                Private f32* %280 = OpAccessChain %48 %125 
                                                      OpStore %280 %178 
                                Private f32* %281 = OpAccessChain %48 %49 
                                                      OpStore %281 %178 
                                                      OpBranch %193 
                                             %193 = OpLabel 
                                       f32_4 %283 = OpLoad %48 
                              Uniform f32_4* %284 = OpAccessChain %37 %66 
                                       f32_4 %285 = OpLoad %284 
                                         f32 %286 = OpDot %283 %285 
                                Private f32* %287 = OpAccessChain %282 %55 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %282 %55 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpExtInst %1 43 %289 %62 %178 
                                Private f32* %291 = OpAccessChain %282 %55 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %292 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpLoad %292 
                                       f32_2 %296 = OpVectorShuffle %295 %295 3 3 
                                       f32_2 %297 = OpFDiv %294 %296 
                                       f32_3 %298 = OpLoad %226 
                                       f32_3 %299 = OpVectorShuffle %298 %297 3 4 2 
                                                      OpStore %226 %299 
                  read_only Texture2DSampled %302 = OpLoad %301 
                                       f32_3 %303 = OpLoad %226 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_4 %305 = OpImageSampleImplicitLod %302 %304 
                                         f32 %306 = OpCompositeExtract %305 0 
                                                      OpStore %300 %306 
                                         f32 %308 = OpLoad %137 
                                         f32 %309 = OpLoad %300 
                                         f32 %310 = OpFAdd %308 %309 
                                Private f32* %311 = OpAccessChain %307 %55 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %307 %55 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 43 %313 %62 %178 
                                Private f32* %315 = OpAccessChain %307 %55 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %307 %55 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %282 %55 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpExtInst %1 37 %317 %319 
                                Private f32* %321 = OpAccessChain %282 %55 
                                                      OpStore %321 %320 
                                        bool %324 = OpLoad %180 
                                                      OpSelectionMerge %326 None 
                                                      OpBranchConditional %324 %325 %329 
                                             %325 = OpLabel 
                                Private f32* %327 = OpAccessChain %282 %55 
                                         f32 %328 = OpLoad %327 
                                                      OpStore %323 %328 
                                                      OpBranch %326 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %307 %55 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %323 %331 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         f32 %332 = OpLoad %323 
                                Private f32* %333 = OpAccessChain %282 %55 
                                                      OpStore %333 %332 
                                       f32_4 %334 = OpLoad %29 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                              Uniform f32_4* %337 = OpAccessChain %37 %336 
                                       f32_4 %338 = OpLoad %337 
                                       f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                       f32_3 %340 = OpFMul %335 %339 
                                                      OpStore %307 %340 
                                       f32_3 %341 = OpLoad %282 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpLoad %307 
                                       f32_3 %344 = OpFMul %342 %343 
                                                      OpStore %282 %344 
                                       f32_4 %345 = OpLoad %29 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %348 = OpLoad %347 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_3 %350 = OpLoad %282 
                                       f32_3 %351 = OpFAdd %349 %350 
                                                      OpStore %282 %351 
                                Private f32* %354 = OpAccessChain %29 %49 
                                         f32 %355 = OpLoad %354 
                                 Output f32* %357 = OpAccessChain %353 %49 
                                                      OpStore %357 %355 
                                Uniform f32* %359 = OpAccessChain %37 %358 
                                         f32 %360 = OpLoad %359 
                                       f32_3 %361 = OpCompositeConstruct %360 %360 %360 
                                       f32_3 %362 = OpLoad %75 
                                       f32_3 %363 = OpFMul %361 %362 
                                       f32_3 %364 = OpLoad %282 
                                       f32_3 %365 = OpFAdd %363 %364 
                                       f32_4 %366 = OpLoad %353 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %353 %367 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat17;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat5 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat5 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * _LightShadowData.z + _LightShadowData.w;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb6)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat10.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat10.x, u_xlat6.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat6.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat10.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat10.xy);
    u_xlat13 = u_xlat13 + u_xlat10_3.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat6.x = min(u_xlat13, u_xlat6.x);
    u_xlat13 = (u_xlatb2) ? u_xlat6.x : u_xlat13;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 337
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %126 %132 %133 %147 %184 %187 %190 %192 %193 %302 %317 %329 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 RelaxedPrecision 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 RelaxedPrecision 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 RelaxedPrecision 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 RelaxedPrecision 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 RelaxedPrecision 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %124 0 BuiltIn 124 
                                                      OpMemberDecorate %124 1 BuiltIn 124 
                                                      OpMemberDecorate %124 2 BuiltIn 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %187 Location 187 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %302 Location 302 
                                                      OpDecorate %317 Location 317 
                                                      OpDecorate %329 Location 329 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 12 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 8 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %66 = OpConstant 0 
                                          i32 %74 = OpConstant 2 
                               Private f32_4* %82 = OpVariable Private 
                                          i32 %84 = OpConstant 3 
                               Private f32_4* %95 = OpVariable Private 
                                          i32 %98 = OpConstant 10 
                                             %123 = OpTypeArray %6 %48 
                                             %124 = OpTypeStruct %7 %6 %123 
                                             %125 = OpTypePointer Output %124 
        Output struct {f32_4; f32; f32[1];}* %126 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 13 
                                             %145 = OpTypeVector %6 3 
                                             %146 = OpTypePointer Input %145 
                                Input f32_3* %147 = OpVariable Input 
                                         i32 %149 = OpConstant 9 
                                         u32 %166 = OpConstant 2 
                                Private f32* %168 = OpVariable Private 
                                             %183 = OpTypePointer Output %145 
                               Output f32_3* %184 = OpVariable Output 
                               Output f32_3* %187 = OpVariable Output 
                               Output f32_4* %190 = OpVariable Output 
                               Output f32_4* %192 = OpVariable Output 
                                Input f32_4* %193 = OpVariable Input 
                                             %195 = OpTypePointer Private %145 
                              Private f32_3* %196 = OpVariable Private 
                              Private f32_4* %213 = OpVariable Private 
                              Private f32_3* %219 = OpVariable Private 
                                         i32 %220 = OpConstant 4 
                                         i32 %226 = OpConstant 5 
                                         i32 %232 = OpConstant 6 
                                         i32 %238 = OpConstant 7 
                                         u32 %247 = OpConstant 3 
                                         f32 %268 = OpConstant 3.67402E-40 
                                       f32_3 %269 = OpConstantComposite %268 %268 %268 
                                         f32 %277 = OpConstant 3.67402E-40 
                                       f32_3 %278 = OpConstantComposite %277 %277 %277 
                                         f32 %289 = OpConstant 3.67402E-40 
                                       f32_3 %290 = OpConstantComposite %289 %289 %289 
                                         f32 %292 = OpConstant 3.67402E-40 
                                       f32_3 %293 = OpConstantComposite %292 %292 %292 
                               Output f32_3* %302 = OpVariable Output 
                                       f32_3 %313 = OpConstantComposite %37 %37 %37 
                               Output f32_4* %317 = OpVariable Output 
                               Output f32_4* %329 = OpVariable Output 
                                       f32_4 %330 = OpConstantComposite %268 %268 %268 %268 
                                             %331 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %67 = OpAccessChain %17 %60 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %75 = OpAccessChain %17 %60 %74 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %47 
                                        f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %9 %81 
                                        f32_4 %83 = OpLoad %9 
                               Uniform f32_4* %85 = OpAccessChain %17 %60 %84 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpFAdd %83 %86 
                                                      OpStore %82 %87 
                               Uniform f32_4* %88 = OpAccessChain %17 %60 %84 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %47 
                                        f32_4 %91 = OpVectorShuffle %90 %90 3 3 3 3 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpFAdd %92 %93 
                                                      OpStore %9 %94 
                                        f32_4 %96 = OpLoad %82 
                                        f32_4 %97 = OpVectorShuffle %96 %96 1 1 1 1 
                               Uniform f32_4* %99 = OpAccessChain %17 %98 %61 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpFMul %97 %100 
                                                      OpStore %95 %101 
                              Uniform f32_4* %102 = OpAccessChain %17 %98 %66 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %82 
                                       f32_4 %105 = OpVectorShuffle %104 %104 0 0 0 0 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %95 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %95 %108 
                              Uniform f32_4* %109 = OpAccessChain %17 %98 %74 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %82 
                                       f32_4 %112 = OpVectorShuffle %111 %111 2 2 2 2 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %95 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %95 %115 
                              Uniform f32_4* %116 = OpAccessChain %17 %98 %84 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %82 
                                       f32_4 %119 = OpVectorShuffle %118 %118 3 3 3 3 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %95 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %82 %122 
                                       f32_4 %127 = OpLoad %82 
                               Output f32_4* %129 = OpAccessChain %126 %66 
                                                      OpStore %129 %127 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                              Uniform f32_4* %137 = OpAccessChain %17 %136 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                                       f32_2 %140 = OpFMul %135 %139 
                              Uniform f32_4* %141 = OpAccessChain %17 %136 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 2 3 
                                       f32_2 %144 = OpFAdd %140 %143 
                                                      OpStore %132 %144 
                                       f32_3 %148 = OpLoad %147 
                              Uniform f32_4* %150 = OpAccessChain %17 %149 %66 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                         f32 %153 = OpDot %148 %152 
                                Private f32* %154 = OpAccessChain %95 %25 
                                                      OpStore %154 %153 
                                       f32_3 %155 = OpLoad %147 
                              Uniform f32_4* %156 = OpAccessChain %17 %149 %61 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpDot %155 %158 
                                Private f32* %160 = OpAccessChain %95 %48 
                                                      OpStore %160 %159 
                                       f32_3 %161 = OpLoad %147 
                              Uniform f32_4* %162 = OpAccessChain %17 %149 %74 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %161 %164 
                                Private f32* %167 = OpAccessChain %95 %166 
                                                      OpStore %167 %165 
                                       f32_4 %169 = OpLoad %95 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_4 %171 = OpLoad %95 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                         f32 %173 = OpDot %170 %172 
                                                      OpStore %168 %173 
                                         f32 %174 = OpLoad %168 
                                         f32 %175 = OpExtInst %1 32 %174 
                                                      OpStore %168 %175 
                                         f32 %176 = OpLoad %168 
                                       f32_3 %177 = OpCompositeConstruct %176 %176 %176 
                                       f32_4 %178 = OpLoad %95 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %95 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                                      OpStore %95 %182 
                                       f32_4 %185 = OpLoad %95 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                                      OpStore %184 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                                      OpStore %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                                      OpStore %190 %191 
                                       f32_4 %194 = OpLoad %193 
                                                      OpStore %192 %194 
                                Private f32* %197 = OpAccessChain %95 %48 
                                         f32 %198 = OpLoad %197 
                                Private f32* %199 = OpAccessChain %95 %48 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %202 = OpAccessChain %196 %25 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %95 %25 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %95 %25 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFMul %204 %206 
                                Private f32* %208 = OpAccessChain %196 %25 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFNegate %209 
                                         f32 %211 = OpFAdd %207 %210 
                                Private f32* %212 = OpAccessChain %196 %25 
                                                      OpStore %212 %211 
                                       f32_4 %214 = OpLoad %95 
                                       f32_4 %215 = OpVectorShuffle %214 %214 1 2 2 0 
                                       f32_4 %216 = OpLoad %95 
                                       f32_4 %217 = OpVectorShuffle %216 %216 0 1 2 2 
                                       f32_4 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                              Uniform f32_4* %221 = OpAccessChain %17 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %213 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %219 %25 
                                                      OpStore %225 %224 
                              Uniform f32_4* %227 = OpAccessChain %17 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %213 
                                         f32 %230 = OpDot %228 %229 
                                Private f32* %231 = OpAccessChain %219 %48 
                                                      OpStore %231 %230 
                              Uniform f32_4* %233 = OpAccessChain %17 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_4 %235 = OpLoad %213 
                                         f32 %236 = OpDot %234 %235 
                                Private f32* %237 = OpAccessChain %219 %166 
                                                      OpStore %237 %236 
                              Uniform f32_4* %239 = OpAccessChain %17 %238 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpLoad %196 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpFMul %241 %243 
                                       f32_3 %245 = OpLoad %219 
                                       f32_3 %246 = OpFAdd %244 %245 
                                                      OpStore %196 %246 
                                Private f32* %248 = OpAccessChain %95 %247 
                                                      OpStore %248 %44 
                              Uniform f32_4* %249 = OpAccessChain %17 %61 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %95 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %219 %25 
                                                      OpStore %253 %252 
                              Uniform f32_4* %254 = OpAccessChain %17 %74 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %95 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %219 %48 
                                                      OpStore %258 %257 
                              Uniform f32_4* %259 = OpAccessChain %17 %84 
                                       f32_4 %260 = OpLoad %259 
                                       f32_4 %261 = OpLoad %95 
                                         f32 %262 = OpDot %260 %261 
                                Private f32* %263 = OpAccessChain %219 %166 
                                                      OpStore %263 %262 
                                       f32_3 %264 = OpLoad %196 
                                       f32_3 %265 = OpLoad %219 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %196 %266 
                                       f32_3 %267 = OpLoad %196 
                                       f32_3 %270 = OpExtInst %1 40 %267 %269 
                                                      OpStore %196 %270 
                                       f32_3 %271 = OpLoad %196 
                                       f32_3 %272 = OpExtInst %1 30 %271 
                                       f32_4 %273 = OpLoad %95 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %95 %274 
                                       f32_4 %275 = OpLoad %95 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %279 = OpFMul %276 %278 
                                       f32_4 %280 = OpLoad %95 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %95 %281 
                                       f32_4 %282 = OpLoad %95 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpExtInst %1 29 %283 
                                       f32_4 %285 = OpLoad %95 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %95 %286 
                                       f32_4 %287 = OpLoad %95 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %291 = OpFMul %288 %290 
                                       f32_3 %294 = OpFAdd %291 %293 
                                       f32_4 %295 = OpLoad %95 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %95 %296 
                                       f32_4 %297 = OpLoad %95 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpExtInst %1 40 %298 %269 
                                       f32_4 %300 = OpLoad %95 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %95 %301 
                                       f32_4 %303 = OpLoad %95 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                                      OpStore %302 %304 
                                Private f32* %305 = OpAccessChain %82 %48 
                                         f32 %306 = OpLoad %305 
                                Uniform f32* %307 = OpAccessChain %17 %66 %25 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFMul %306 %308 
                                Private f32* %310 = OpAccessChain %82 %48 
                                                      OpStore %310 %309 
                                       f32_4 %311 = OpLoad %82 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 3 1 
                                       f32_3 %314 = OpFMul %312 %313 
                                       f32_4 %315 = OpLoad %95 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 1 5 6 
                                                      OpStore %95 %316 
                                       f32_4 %318 = OpLoad %82 
                                       f32_2 %319 = OpVectorShuffle %318 %318 2 3 
                                       f32_4 %320 = OpLoad %317 
                                       f32_4 %321 = OpVectorShuffle %320 %319 0 1 4 5 
                                                      OpStore %317 %321 
                                       f32_4 %322 = OpLoad %95 
                                       f32_2 %323 = OpVectorShuffle %322 %322 2 2 
                                       f32_4 %324 = OpLoad %95 
                                       f32_2 %325 = OpVectorShuffle %324 %324 0 3 
                                       f32_2 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %317 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %317 %328 
                                                      OpStore %329 %330 
                                 Output f32* %332 = OpAccessChain %126 %66 %48 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFNegate %333 
                                 Output f32* %335 = OpAccessChain %126 %66 %48 
                                                      OpStore %335 %334 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %116 %292 %347 %353 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 RelaxedPrecision 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 RelaxedPrecision 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpMemberDecorate %35 9 RelaxedPrecision 
                                                      OpMemberDecorate %35 9 Offset 35 
                                                      OpMemberDecorate %35 10 Offset 35 
                                                      OpMemberDecorate %35 11 Offset 35 
                                                      OpMemberDecorate %35 12 Offset 35 
                                                      OpMemberDecorate %35 13 RelaxedPrecision 
                                                      OpMemberDecorate %35 13 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %191 SpecId 191 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 DescriptorSet 301 
                                                      OpDecorate %301 Binding 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %347 Location 347 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %364 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 4 
                                              %33 = OpTypeArray %7 %32 
                                              %34 = OpTypeArray %7 %32 
                                              %35 = OpTypeStruct %30 %7 %7 %7 %33 %7 %34 %30 %30 %7 %6 %6 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 12 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                              %74 = OpTypePointer Private %30 
                               Private f32_3* %75 = OpVariable Private 
                                          i32 %80 = OpConstant 11 
                                          i32 %97 = OpConstant 13 
                               Private bool* %103 = OpVariable Private 
                              Private f32_3* %114 = OpVariable Private 
                                             %115 = OpTypePointer Input %30 
                                Input f32_3* %116 = OpVariable Input 
                                             %119 = OpTypePointer Uniform %30 
                              Private f32_3* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 4 
                                         u32 %125 = OpConstant 2 
                                         u32 %131 = OpConstant 1 
                                         i32 %133 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                                         i32 %142 = OpConstant 3 
                                             %143 = OpTypePointer Uniform %7 
                                         f32 %178 = OpConstant 3.67402E-40 
                               Private bool* %180 = OpVariable Private 
                                         i32 %181 = OpConstant 5 
                                        bool %185 = OpConstantFalse 
                                        bool %191 = OpSpecConstantFalse 
                               Private bool* %194 = OpVariable Private 
                                         i32 %200 = OpConstant 6 
                              Private f32_3* %226 = OpVariable Private 
                                             %227 = OpTypePointer Function %30 
                                         i32 %237 = OpConstant 8 
                              Private f32_4* %242 = OpVariable Private 
                                         i32 %244 = OpConstant 7 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %254 = OpConstant 3.67402E-40 
                                Private f32* %257 = OpVariable Private 
                                         f32 %260 = OpConstant 3.67402E-40 
                                             %268 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %269 = OpTypeSampledImage %268 
                                             %270 = OpTypePointer UniformConstant %269 
 UniformConstant read_only Texture3DSampled* %271 = OpVariable UniformConstant 
                              Private f32_3* %282 = OpVariable Private 
                                Input f32_4* %292 = OpVariable Input 
                                Private f32* %300 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %301 = OpVariable UniformConstant 
                              Private f32_3* %307 = OpVariable Private 
                                             %322 = OpTypePointer Function %6 
                                         i32 %336 = OpConstant 9 
                                Input f32_3* %347 = OpVariable Input 
                                             %352 = OpTypePointer Output %7 
                               Output f32_4* %353 = OpVariable Output 
                                             %356 = OpTypePointer Output %6 
                                         i32 %358 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %228 = OpVariable Function 
                               Function f32* %323 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_4 %76 = OpLoad %29 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpExtInst %1 30 %77 
                                                      OpStore %75 %78 
                                        f32_3 %79 = OpLoad %75 
                                 Uniform f32* %81 = OpAccessChain %37 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %37 %80 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %37 %80 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %79 %91 
                                                      OpStore %75 %92 
                                        f32_3 %93 = OpLoad %75 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %75 %94 
                                 Private f32* %95 = OpAccessChain %29 %49 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %98 = OpAccessChain %37 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %101 = OpFAdd %96 %100 
                                Private f32* %102 = OpAccessChain %48 %55 
                                                      OpStore %102 %101 
                                Private f32* %104 = OpAccessChain %48 %55 
                                         f32 %105 = OpLoad %104 
                                        bool %106 = OpFOrdLessThan %105 %62 
                                                      OpStore %103 %106 
                                        bool %107 = OpLoad %103 
                                         i32 %108 = OpSelect %107 %66 %65 
                                         i32 %109 = OpIMul %108 %68 
                                        bool %110 = OpINotEqual %109 %65 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                       f32_3 %117 = OpLoad %116 
                                       f32_3 %118 = OpFNegate %117 
                              Uniform f32_3* %120 = OpAccessChain %37 %65 
                                       f32_3 %121 = OpLoad %120 
                                       f32_3 %122 = OpFAdd %118 %121 
                                                      OpStore %114 %122 
                                Uniform f32* %126 = OpAccessChain %37 %124 %65 %125 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %123 %55 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %37 %124 %66 %125 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %123 %131 
                                                      OpStore %132 %130 
                                Uniform f32* %134 = OpAccessChain %37 %124 %133 %125 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %123 %125 
                                                      OpStore %136 %135 
                                       f32_3 %138 = OpLoad %114 
                                       f32_3 %139 = OpLoad %123 
                                         f32 %140 = OpDot %138 %139 
                                                      OpStore %137 %140 
                                       f32_3 %141 = OpLoad %116 
                              Uniform f32_4* %144 = OpAccessChain %37 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFNegate %146 
                                       f32_3 %148 = OpFAdd %141 %147 
                                                      OpStore %114 %148 
                                       f32_3 %149 = OpLoad %114 
                                       f32_3 %150 = OpLoad %114 
                                         f32 %151 = OpDot %149 %150 
                                Private f32* %152 = OpAccessChain %114 %55 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %114 %55 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpExtInst %1 31 %154 
                                Private f32* %156 = OpAccessChain %114 %55 
                                                      OpStore %156 %155 
                                         f32 %157 = OpLoad %137 
                                         f32 %158 = OpFNegate %157 
                                Private f32* %159 = OpAccessChain %114 %55 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFAdd %158 %160 
                                Private f32* %162 = OpAccessChain %114 %55 
                                                      OpStore %162 %161 
                                Uniform f32* %163 = OpAccessChain %37 %142 %49 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %114 %55 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                         f32 %168 = OpLoad %137 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %137 %169 
                                         f32 %170 = OpLoad %137 
                                Uniform f32* %171 = OpAccessChain %37 %133 %125 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Uniform f32* %174 = OpAccessChain %37 %133 %49 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                                      OpStore %137 %176 
                                         f32 %177 = OpLoad %137 
                                         f32 %179 = OpExtInst %1 43 %177 %62 %178 
                                                      OpStore %137 %179 
                                Uniform f32* %182 = OpAccessChain %37 %181 %55 
                                         f32 %183 = OpLoad %182 
                                        bool %184 = OpFOrdEqual %183 %178 
                                                      OpStore %180 %184 
                                                      OpSelectionMerge %187 None 
                                                      OpBranchConditional %185 %186 %187 
                                             %186 = OpLabel 
                                        bool %188 = OpLoad %180 
                                                      OpSelectionMerge %190 None 
                                                      OpBranchConditional %188 %189 %190 
                                             %189 = OpLabel 
                                                      OpBranch %190 
                                             %190 = OpLabel 
                                                      OpBranch %187 
                                             %187 = OpLabel 
                                                      OpSelectionMerge %193 None 
                                                      OpBranchConditional %191 %192 %277 
                                             %192 = OpLabel 
                                Uniform f32* %195 = OpAccessChain %37 %181 %131 
                                         f32 %196 = OpLoad %195 
                                        bool %197 = OpFOrdEqual %196 %178 
                                                      OpStore %194 %197 
                                       f32_3 %198 = OpLoad %116 
                                       f32_3 %199 = OpVectorShuffle %198 %198 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %37 %200 %66 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %123 %204 
                              Uniform f32_4* %205 = OpAccessChain %37 %200 %65 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %116 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %123 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %123 %212 
                              Uniform f32_4* %213 = OpAccessChain %37 %200 %133 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %116 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %123 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %123 %220 
                                       f32_3 %221 = OpLoad %123 
                              Uniform f32_4* %222 = OpAccessChain %37 %200 %142 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFAdd %221 %224 
                                                      OpStore %123 %225 
                                        bool %229 = OpLoad %194 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %233 
                                             %230 = OpLabel 
                                       f32_3 %232 = OpLoad %123 
                                                      OpStore %228 %232 
                                                      OpBranch %231 
                                             %233 = OpLabel 
                                       f32_3 %234 = OpLoad %116 
                                                      OpStore %228 %234 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                       f32_3 %235 = OpLoad %228 
                                                      OpStore %226 %235 
                                       f32_3 %236 = OpLoad %226 
                              Uniform f32_3* %238 = OpAccessChain %37 %237 
                                       f32_3 %239 = OpLoad %238 
                                       f32_3 %240 = OpFNegate %239 
                                       f32_3 %241 = OpFAdd %236 %240 
                                                      OpStore %226 %241 
                                       f32_3 %243 = OpLoad %226 
                              Uniform f32_3* %245 = OpAccessChain %37 %244 
                                       f32_3 %246 = OpLoad %245 
                                       f32_3 %247 = OpFMul %243 %246 
                                       f32_4 %248 = OpLoad %242 
                                       f32_4 %249 = OpVectorShuffle %248 %247 0 4 5 6 
                                                      OpStore %242 %249 
                                Private f32* %250 = OpAccessChain %242 %131 
                                         f32 %251 = OpLoad %250 
                                         f32 %253 = OpFMul %251 %252 
                                         f32 %255 = OpFAdd %253 %254 
                                Private f32* %256 = OpAccessChain %226 %55 
                                                      OpStore %256 %255 
                                Uniform f32* %258 = OpAccessChain %37 %181 %125 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %254 
                                                      OpStore %257 %262 
                                         f32 %263 = OpLoad %257 
                                Private f32* %264 = OpAccessChain %226 %55 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 40 %263 %265 
                                Private f32* %267 = OpAccessChain %242 %55 
                                                      OpStore %267 %266 
                  read_only Texture3DSampled %272 = OpLoad %271 
                                       f32_4 %273 = OpLoad %242 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 2 3 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                                      OpStore %242 %275 
                                       f32_4 %276 = OpLoad %242 
                                                      OpStore %48 %276 
                                                      OpBranch %193 
                                             %277 = OpLabel 
                                Private f32* %278 = OpAccessChain %48 %55 
                                                      OpStore %278 %178 
                                Private f32* %279 = OpAccessChain %48 %131 
                                                      OpStore %279 %178 
                                Private f32* %280 = OpAccessChain %48 %125 
                                                      OpStore %280 %178 
                                Private f32* %281 = OpAccessChain %48 %49 
                                                      OpStore %281 %178 
                                                      OpBranch %193 
                                             %193 = OpLabel 
                                       f32_4 %283 = OpLoad %48 
                              Uniform f32_4* %284 = OpAccessChain %37 %66 
                                       f32_4 %285 = OpLoad %284 
                                         f32 %286 = OpDot %283 %285 
                                Private f32* %287 = OpAccessChain %282 %55 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %282 %55 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpExtInst %1 43 %289 %62 %178 
                                Private f32* %291 = OpAccessChain %282 %55 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %292 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpLoad %292 
                                       f32_2 %296 = OpVectorShuffle %295 %295 3 3 
                                       f32_2 %297 = OpFDiv %294 %296 
                                       f32_3 %298 = OpLoad %226 
                                       f32_3 %299 = OpVectorShuffle %298 %297 3 4 2 
                                                      OpStore %226 %299 
                  read_only Texture2DSampled %302 = OpLoad %301 
                                       f32_3 %303 = OpLoad %226 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_4 %305 = OpImageSampleImplicitLod %302 %304 
                                         f32 %306 = OpCompositeExtract %305 0 
                                                      OpStore %300 %306 
                                         f32 %308 = OpLoad %137 
                                         f32 %309 = OpLoad %300 
                                         f32 %310 = OpFAdd %308 %309 
                                Private f32* %311 = OpAccessChain %307 %55 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %307 %55 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 43 %313 %62 %178 
                                Private f32* %315 = OpAccessChain %307 %55 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %307 %55 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %282 %55 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpExtInst %1 37 %317 %319 
                                Private f32* %321 = OpAccessChain %282 %55 
                                                      OpStore %321 %320 
                                        bool %324 = OpLoad %180 
                                                      OpSelectionMerge %326 None 
                                                      OpBranchConditional %324 %325 %329 
                                             %325 = OpLabel 
                                Private f32* %327 = OpAccessChain %282 %55 
                                         f32 %328 = OpLoad %327 
                                                      OpStore %323 %328 
                                                      OpBranch %326 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %307 %55 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %323 %331 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         f32 %332 = OpLoad %323 
                                Private f32* %333 = OpAccessChain %282 %55 
                                                      OpStore %333 %332 
                                       f32_4 %334 = OpLoad %29 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                              Uniform f32_4* %337 = OpAccessChain %37 %336 
                                       f32_4 %338 = OpLoad %337 
                                       f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                       f32_3 %340 = OpFMul %335 %339 
                                                      OpStore %307 %340 
                                       f32_3 %341 = OpLoad %282 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpLoad %307 
                                       f32_3 %344 = OpFMul %342 %343 
                                                      OpStore %282 %344 
                                       f32_4 %345 = OpLoad %29 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %348 = OpLoad %347 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_3 %350 = OpLoad %282 
                                       f32_3 %351 = OpFAdd %349 %350 
                                                      OpStore %282 %351 
                                Private f32* %354 = OpAccessChain %29 %49 
                                         f32 %355 = OpLoad %354 
                                 Output f32* %357 = OpAccessChain %353 %49 
                                                      OpStore %357 %355 
                                Uniform f32* %359 = OpAccessChain %37 %358 
                                         f32 %360 = OpLoad %359 
                                       f32_3 %361 = OpCompositeConstruct %360 %360 %360 
                                       f32_3 %362 = OpLoad %75 
                                       f32_3 %363 = OpFMul %361 %362 
                                       f32_3 %364 = OpLoad %282 
                                       f32_3 %365 = OpFAdd %363 %364 
                                       f32_4 %366 = OpLoad %353 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %353 %367 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat5 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat5 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat1 = max(u_xlat2, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat2 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
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
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 320
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %121 %133 %134 %148 %185 %188 %191 %192 %194 %311 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 RelaxedPrecision 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %134 Location 134 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %188 Location 188 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 Location 194 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %311 Location 311 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %12 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 8 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 9 
                                          f32 %39 = OpConstant 3.67402E-40 
                                 Private f32* %42 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                              %48 = OpTypePointer Input %7 
                                 Input f32_4* %49 = OpVariable Input 
                                          u32 %50 = OpConstant 1 
                                              %51 = OpTypePointer Input %6 
                                          i32 %62 = OpConstant 5 
                                          i32 %63 = OpConstant 1 
                                              %64 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 0 
                                          i32 %76 = OpConstant 2 
                               Private f32_4* %84 = OpVariable Private 
                                          i32 %86 = OpConstant 3 
                               Private f32_4* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 7 
                                             %118 = OpTypeArray %6 %50 
                                             %119 = OpTypeStruct %7 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                             %131 = OpTypeVector %6 2 
                                             %132 = OpTypePointer Output %131 
                               Output f32_2* %133 = OpVariable Output 
                                Input f32_4* %134 = OpVariable Input 
                                         i32 %137 = OpConstant 10 
                                             %146 = OpTypeVector %6 3 
                                             %147 = OpTypePointer Input %146 
                                Input f32_3* %148 = OpVariable Input 
                                         i32 %150 = OpConstant 6 
                                         u32 %167 = OpConstant 2 
                                Private f32* %169 = OpVariable Private 
                                             %184 = OpTypePointer Output %146 
                               Output f32_3* %185 = OpVariable Output 
                               Output f32_3* %188 = OpVariable Output 
                               Output f32_4* %191 = OpVariable Output 
                                Input f32_4* %192 = OpVariable Input 
                               Output f32_4* %194 = OpVariable Output 
                              Private f32_4* %202 = OpVariable Private 
                              Private f32_4* %210 = OpVariable Private 
                                         f32 %246 = OpConstant 3.67402E-40 
                                       f32_4 %247 = OpConstantComposite %246 %246 %246 %246 
                                       f32_4 %255 = OpConstantComposite %46 %46 %46 %46 
                                         f32 %263 = OpConstant 3.67402E-40 
                                       f32_4 %264 = OpConstantComposite %263 %263 %263 %263 
                                         i32 %271 = OpConstant 4 
                               Output f32_3* %311 = OpVariable Output 
                                             %314 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                 Uniform f32* %33 = OpAccessChain %19 %32 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpFMul %31 %34 
                                 Private f32* %36 = OpAccessChain %9 %27 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %27 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFMul %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %27 
                                                      OpStore %41 %40 
                                 Uniform f32* %43 = OpAccessChain %19 %32 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFNegate %44 
                                          f32 %47 = OpFAdd %45 %46 
                                                      OpStore %42 %47 
                                   Input f32* %52 = OpAccessChain %49 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpLoad %42 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %9 %27 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFAdd %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %27 
                                                      OpStore %59 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                               Uniform f32_4* %65 = OpAccessChain %19 %62 %63 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFMul %61 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %19 %62 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %49 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %19 %62 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpVectorShuffle %79 %79 2 2 2 2 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %19 %62 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %84 %89 
                               Uniform f32_4* %90 = OpAccessChain %19 %62 %86 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %49 
                                        f32_4 %93 = OpVectorShuffle %92 %92 3 3 3 3 
                                        f32_4 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpFAdd %94 %95 
                                                      OpStore %9 %96 
                                        f32_4 %98 = OpLoad %84 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %101 = OpAccessChain %19 %100 %63 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %97 %103 
                              Uniform f32_4* %104 = OpAccessChain %19 %100 %68 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %84 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %97 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %97 %110 
                              Uniform f32_4* %111 = OpAccessChain %19 %100 %76 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %84 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 2 2 2 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %97 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %97 %117 
                              Uniform f32_4* %122 = OpAccessChain %19 %100 %86 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpLoad %84 
                                       f32_4 %125 = OpVectorShuffle %124 %124 3 3 3 3 
                                       f32_4 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %97 
                                       f32_4 %128 = OpFAdd %126 %127 
                               Output f32_4* %130 = OpAccessChain %121 %68 
                                                      OpStore %130 %128 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                              Uniform f32_4* %138 = OpAccessChain %19 %137 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                              Uniform f32_4* %142 = OpAccessChain %19 %137 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %145 = OpFAdd %141 %144 
                                                      OpStore %133 %145 
                                       f32_3 %149 = OpLoad %148 
                              Uniform f32_4* %151 = OpAccessChain %19 %150 %68 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %149 %153 
                                Private f32* %155 = OpAccessChain %84 %27 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %148 
                              Uniform f32_4* %157 = OpAccessChain %19 %150 %63 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %161 = OpAccessChain %84 %50 
                                                      OpStore %161 %160 
                                       f32_3 %162 = OpLoad %148 
                              Uniform f32_4* %163 = OpAccessChain %19 %150 %76 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                         f32 %166 = OpDot %162 %165 
                                Private f32* %168 = OpAccessChain %84 %167 
                                                      OpStore %168 %166 
                                       f32_4 %170 = OpLoad %84 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_4 %172 = OpLoad %84 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                         f32 %174 = OpDot %171 %173 
                                                      OpStore %169 %174 
                                         f32 %175 = OpLoad %169 
                                         f32 %176 = OpExtInst %1 32 %175 
                                                      OpStore %169 %176 
                                         f32 %177 = OpLoad %169 
                                       f32_3 %178 = OpCompositeConstruct %177 %177 %177 
                                       f32_4 %179 = OpLoad %84 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %84 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %84 %183 
                                       f32_4 %186 = OpLoad %84 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                                      OpStore %185 %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %188 %190 
                                       f32_4 %193 = OpLoad %192 
                                                      OpStore %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                                      OpStore %194 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_4 %197 = OpVectorShuffle %196 %196 1 1 1 1 
                                       f32_4 %198 = OpFNegate %197 
                              Uniform f32_4* %199 = OpAccessChain %19 %63 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpFAdd %198 %200 
                                                      OpStore %97 %201 
                                       f32_4 %203 = OpLoad %84 
                                       f32_4 %204 = OpVectorShuffle %203 %203 1 1 1 1 
                                       f32_4 %205 = OpLoad %97 
                                       f32_4 %206 = OpFMul %204 %205 
                                                      OpStore %202 %206 
                                       f32_4 %207 = OpLoad %97 
                                       f32_4 %208 = OpLoad %97 
                                       f32_4 %209 = OpFMul %207 %208 
                                                      OpStore %97 %209 
                                       f32_4 %211 = OpLoad %9 
                                       f32_4 %212 = OpVectorShuffle %211 %211 0 0 0 0 
                                       f32_4 %213 = OpFNegate %212 
                              Uniform f32_4* %214 = OpAccessChain %19 %68 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpFAdd %213 %215 
                                                      OpStore %210 %216 
                                       f32_4 %217 = OpLoad %9 
                                       f32_4 %218 = OpVectorShuffle %217 %217 2 2 2 2 
                                       f32_4 %219 = OpFNegate %218 
                              Uniform f32_4* %220 = OpAccessChain %19 %76 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpFAdd %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %210 
                                       f32_4 %224 = OpLoad %84 
                                       f32_4 %225 = OpVectorShuffle %224 %224 0 0 0 0 
                                       f32_4 %226 = OpFMul %223 %225 
                                       f32_4 %227 = OpLoad %202 
                                       f32_4 %228 = OpFAdd %226 %227 
                                                      OpStore %202 %228 
                                       f32_4 %229 = OpLoad %210 
                                       f32_4 %230 = OpLoad %210 
                                       f32_4 %231 = OpFMul %229 %230 
                                       f32_4 %232 = OpLoad %97 
                                       f32_4 %233 = OpFAdd %231 %232 
                                                      OpStore %97 %233 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpLoad %9 
                                       f32_4 %236 = OpFMul %234 %235 
                                       f32_4 %237 = OpLoad %97 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %97 %238 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpLoad %84 
                                       f32_4 %241 = OpVectorShuffle %240 %240 2 2 2 2 
                                       f32_4 %242 = OpFMul %239 %241 
                                       f32_4 %243 = OpLoad %202 
                                       f32_4 %244 = OpFAdd %242 %243 
                                                      OpStore %9 %244 
                                       f32_4 %245 = OpLoad %97 
                                       f32_4 %248 = OpExtInst %1 40 %245 %247 
                                                      OpStore %84 %248 
                                       f32_4 %249 = OpLoad %84 
                                       f32_4 %250 = OpExtInst %1 32 %249 
                                                      OpStore %97 %250 
                                       f32_4 %251 = OpLoad %84 
                              Uniform f32_4* %252 = OpAccessChain %19 %86 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpFMul %251 %253 
                                       f32_4 %256 = OpFAdd %254 %255 
                                                      OpStore %84 %256 
                                       f32_4 %257 = OpLoad %84 
                                       f32_4 %258 = OpFDiv %255 %257 
                                                      OpStore %84 %258 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpLoad %97 
                                       f32_4 %261 = OpFMul %259 %260 
                                                      OpStore %9 %261 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %265 = OpExtInst %1 40 %262 %264 
                                                      OpStore %9 %265 
                                       f32_4 %266 = OpLoad %84 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpFMul %266 %267 
                                                      OpStore %9 %268 
                                       f32_4 %269 = OpLoad %9 
                                       f32_3 %270 = OpVectorShuffle %269 %269 1 1 1 
                              Uniform f32_4* %272 = OpAccessChain %19 %271 %63 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFMul %270 %274 
                                       f32_4 %276 = OpLoad %84 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %84 %277 
                              Uniform f32_4* %278 = OpAccessChain %19 %271 %68 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_4 %281 = OpLoad %9 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %84 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFAdd %283 %285 
                                       f32_4 %287 = OpLoad %84 
                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 6 3 
                                                      OpStore %84 %288 
                              Uniform f32_4* %289 = OpAccessChain %19 %271 %76 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_4 %292 = OpLoad %9 
                                       f32_3 %293 = OpVectorShuffle %292 %292 2 2 2 
                                       f32_3 %294 = OpFMul %291 %293 
                                       f32_4 %295 = OpLoad %84 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                                       f32_3 %297 = OpFAdd %294 %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %9 %299 
                              Uniform f32_4* %300 = OpAccessChain %19 %271 %86 
                                       f32_4 %301 = OpLoad %300 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 3 3 3 
                                       f32_3 %305 = OpFMul %302 %304 
                                       f32_4 %306 = OpLoad %9 
                                       f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
                                       f32_3 %308 = OpFAdd %305 %307 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %9 %310 
                                       f32_4 %312 = OpLoad %9 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                                      OpStore %311 %313 
                                 Output f32* %315 = OpAccessChain %121 %68 %50 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFNegate %316 
                                 Output f32* %318 = OpAccessChain %121 %68 %50 
                                                      OpStore %318 %317 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 265
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %132 %243 %249 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpMemberDecorate %34 0 RelaxedPrecision 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpMemberDecorate %34 5 RelaxedPrecision 
                                                      OpMemberDecorate %34 5 Offset 34 
                                                      OpMemberDecorate %34 6 Offset 34 
                                                      OpMemberDecorate %34 7 Offset 34 
                                                      OpMemberDecorate %34 8 Offset 34 
                                                      OpMemberDecorate %34 9 RelaxedPrecision 
                                                      OpMemberDecorate %34 9 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %260 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeStruct %7 %7 %32 %33 %33 %7 %6 %6 %6 %6 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 8 
                                              %39 = OpTypePointer Uniform %6 
                               Private f32_4* %47 = OpVariable Private 
                                          u32 %48 = OpConstant 3 
                                              %49 = OpTypePointer Private %6 
                                          f32 %52 = OpConstant 3.67402E-40 
                                          u32 %54 = OpConstant 0 
                                              %56 = OpTypeBool 
                                              %57 = OpTypePointer Private %56 
                                Private bool* %58 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                                          i32 %67 = OpConstant -1 
                                              %73 = OpTypePointer Private %33 
                               Private f32_3* %74 = OpVariable Private 
                                          i32 %79 = OpConstant 7 
                                          i32 %96 = OpConstant 9 
                               Private bool* %102 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                                         u32 %126 = OpConstant 1 
                              Private f32_3* %130 = OpVariable Private 
                                             %131 = OpTypePointer Input %33 
                                Input f32_3* %132 = OpVariable Input 
                                         i32 %135 = OpConstant 2 
                                             %136 = OpTypePointer Uniform %7 
                                         i32 %158 = OpConstant 3 
                                             %163 = OpTypePointer Function %33 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %33 
                              Private f32_4* %179 = OpVariable Private 
                                Private f32* %186 = OpVariable Private 
                                         f32 %189 = OpConstant 3.67402E-40 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         u32 %193 = OpConstant 2 
                                         f32 %196 = OpConstant 3.67402E-40 
                                             %205 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %206 = OpTypeSampledImage %205 
                                             %207 = OpTypePointer UniformConstant %206 
 UniformConstant read_only Texture3DSampled* %208 = OpVariable UniformConstant 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %229 = OpVariable Private 
                                         i32 %232 = OpConstant 5 
                                Input f32_3* %243 = OpVariable Input 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %252 = OpTypePointer Output %6 
                                         i32 %254 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %40 = OpAccessChain %36 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_4 %42 = OpCompositeConstruct %41 %41 %41 %41 
                                        f32_4 %43 = OpLoad %20 
                                        f32_4 %44 = OpFMul %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %29 %46 
                                 Private f32* %50 = OpAccessChain %29 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFAdd %51 %52 
                                 Private f32* %55 = OpAccessChain %47 %54 
                                                      OpStore %55 %53 
                                 Private f32* %59 = OpAccessChain %47 %54 
                                          f32 %60 = OpLoad %59 
                                         bool %62 = OpFOrdLessThan %60 %61 
                                                      OpStore %58 %62 
                                         bool %63 = OpLoad %58 
                                          i32 %66 = OpSelect %63 %65 %64 
                                          i32 %68 = OpIMul %66 %67 
                                         bool %69 = OpINotEqual %68 %64 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                        f32_4 %75 = OpLoad %29 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpExtInst %1 30 %76 
                                                      OpStore %74 %77 
                                        f32_3 %78 = OpLoad %74 
                                 Uniform f32* %80 = OpAccessChain %36 %79 
                                          f32 %81 = OpLoad %80 
                                 Uniform f32* %82 = OpAccessChain %36 %79 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %36 %79 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                          f32 %87 = OpCompositeExtract %86 0 
                                          f32 %88 = OpCompositeExtract %86 1 
                                          f32 %89 = OpCompositeExtract %86 2 
                                        f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                        f32_3 %91 = OpFMul %78 %90 
                                                      OpStore %74 %91 
                                        f32_3 %92 = OpLoad %74 
                                        f32_3 %93 = OpExtInst %1 29 %92 
                                                      OpStore %74 %93 
                                 Private f32* %94 = OpAccessChain %29 %48 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %97 = OpAccessChain %36 %96 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %95 %99 
                                Private f32* %101 = OpAccessChain %47 %54 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %47 %54 
                                         f32 %104 = OpLoad %103 
                                        bool %105 = OpFOrdLessThan %104 %61 
                                                      OpStore %102 %105 
                                        bool %106 = OpLoad %102 
                                         i32 %107 = OpSelect %106 %65 %64 
                                         i32 %108 = OpIMul %107 %67 
                                        bool %109 = OpINotEqual %108 %64 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpKill
                                             %111 = OpLabel 
                                Uniform f32* %113 = OpAccessChain %36 %65 %54 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %102 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %102 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %214 
                                             %124 = OpLabel 
                                Uniform f32* %127 = OpAccessChain %36 %65 %126 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %115 
                                                      OpStore %102 %129 
                                       f32_3 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %137 = OpAccessChain %36 %135 %65 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFMul %134 %139 
                                                      OpStore %130 %140 
                              Uniform f32_4* %141 = OpAccessChain %36 %135 %64 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %132 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_3 %147 = OpLoad %130 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %130 %148 
                              Uniform f32_4* %149 = OpAccessChain %36 %135 %135 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %132 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %130 %156 
                                       f32_3 %157 = OpLoad %130 
                              Uniform f32_4* %159 = OpAccessChain %36 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %130 %162 
                                        bool %165 = OpLoad %102 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %169 
                                             %166 = OpLabel 
                                       f32_3 %168 = OpLoad %130 
                                                      OpStore %164 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                       f32_3 %170 = OpLoad %132 
                                                      OpStore %164 %170 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %171 = OpLoad %164 
                                                      OpStore %130 %171 
                                       f32_3 %172 = OpLoad %130 
                              Uniform f32_3* %175 = OpAccessChain %36 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                                      OpStore %130 %178 
                                       f32_3 %180 = OpLoad %130 
                              Uniform f32_3* %181 = OpAccessChain %36 %158 
                                       f32_3 %182 = OpLoad %181 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %179 
                                       f32_4 %185 = OpVectorShuffle %184 %183 0 4 5 6 
                                                      OpStore %179 %185 
                                Private f32* %187 = OpAccessChain %179 %126 
                                         f32 %188 = OpLoad %187 
                                         f32 %190 = OpFMul %188 %189 
                                         f32 %192 = OpFAdd %190 %191 
                                                      OpStore %186 %192 
                                Uniform f32* %194 = OpAccessChain %36 %65 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %198 = OpFAdd %197 %191 
                                Private f32* %199 = OpAccessChain %130 %54 
                                                      OpStore %199 %198 
                                         f32 %200 = OpLoad %186 
                                Private f32* %201 = OpAccessChain %130 %54 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpExtInst %1 40 %200 %202 
                                Private f32* %204 = OpAccessChain %179 %54 
                                                      OpStore %204 %203 
                  read_only Texture3DSampled %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %179 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 2 3 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                                      OpStore %179 %212 
                                       f32_4 %213 = OpLoad %179 
                                                      OpStore %47 %213 
                                                      OpBranch %125 
                                             %214 = OpLabel 
                                Private f32* %215 = OpAccessChain %47 %54 
                                                      OpStore %215 %115 
                                Private f32* %216 = OpAccessChain %47 %126 
                                                      OpStore %216 %115 
                                Private f32* %217 = OpAccessChain %47 %193 
                                                      OpStore %217 %115 
                                Private f32* %218 = OpAccessChain %47 %48 
                                                      OpStore %218 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %220 = OpLoad %47 
                              Uniform f32_4* %221 = OpAccessChain %36 %64 
                                       f32_4 %222 = OpLoad %221 
                                         f32 %223 = OpDot %220 %222 
                                Private f32* %224 = OpAccessChain %219 %54 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %219 %54 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 43 %226 %61 %115 
                                Private f32* %228 = OpAccessChain %219 %54 
                                                      OpStore %228 %227 
                                       f32_4 %230 = OpLoad %29 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %36 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFMul %231 %235 
                                                      OpStore %229 %236 
                                       f32_3 %237 = OpLoad %219 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpLoad %229 
                                       f32_3 %240 = OpFMul %238 %239 
                                                      OpStore %219 %240 
                                       f32_4 %241 = OpLoad %29 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_3 %246 = OpLoad %219 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %219 %247 
                                Private f32* %250 = OpAccessChain %29 %48 
                                         f32 %251 = OpLoad %250 
                                 Output f32* %253 = OpAccessChain %249 %48 
                                                      OpStore %253 %251 
                                Uniform f32* %255 = OpAccessChain %36 %254 
                                         f32 %256 = OpLoad %255 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %74 
                                       f32_3 %259 = OpFMul %257 %258 
                                       f32_3 %260 = OpLoad %219 
                                       f32_3 %261 = OpFAdd %259 %260 
                                       f32_4 %262 = OpLoad %249 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %249 %263 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat6 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat6 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat1 = max(u_xlat3, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
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
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 422
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %121 %133 %134 %148 %185 %188 %191 %192 %194 %413 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 RelaxedPrecision 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 RelaxedPrecision 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 RelaxedPrecision 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 RelaxedPrecision 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 RelaxedPrecision 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 RelaxedPrecision 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 RelaxedPrecision 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpMemberDecorate %17 12 Offset 17 
                                                      OpMemberDecorate %17 13 Offset 17 
                                                      OpMemberDecorate %17 14 Offset 17 
                                                      OpMemberDecorate %17 15 Offset 17 
                                                      OpMemberDecorate %17 16 Offset 17 
                                                      OpMemberDecorate %17 17 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %134 Location 134 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %188 Location 188 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 Location 194 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %397 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %413 RelaxedPrecision 
                                                      OpDecorate %413 Location 413 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %12 %7 %7 %7 %7 %7 %7 %7 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 15 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 16 
                                          f32 %39 = OpConstant 3.67402E-40 
                                 Private f32* %42 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                              %48 = OpTypePointer Input %7 
                                 Input f32_4* %49 = OpVariable Input 
                                          u32 %50 = OpConstant 1 
                                              %51 = OpTypePointer Input %6 
                                          i32 %62 = OpConstant 12 
                                          i32 %63 = OpConstant 1 
                                              %64 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 0 
                                          i32 %76 = OpConstant 2 
                               Private f32_4* %84 = OpVariable Private 
                                          i32 %86 = OpConstant 3 
                               Private f32_4* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 14 
                                             %118 = OpTypeArray %6 %50 
                                             %119 = OpTypeStruct %7 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                             %131 = OpTypeVector %6 2 
                                             %132 = OpTypePointer Output %131 
                               Output f32_2* %133 = OpVariable Output 
                                Input f32_4* %134 = OpVariable Input 
                                         i32 %137 = OpConstant 17 
                                             %146 = OpTypeVector %6 3 
                                             %147 = OpTypePointer Input %146 
                                Input f32_3* %148 = OpVariable Input 
                                         i32 %150 = OpConstant 13 
                                         u32 %167 = OpConstant 2 
                                Private f32* %169 = OpVariable Private 
                                             %184 = OpTypePointer Output %146 
                               Output f32_3* %185 = OpVariable Output 
                               Output f32_3* %188 = OpVariable Output 
                               Output f32_4* %191 = OpVariable Output 
                                Input f32_4* %192 = OpVariable Input 
                               Output f32_4* %194 = OpVariable Output 
                                             %196 = OpTypePointer Private %146 
                              Private f32_3* %197 = OpVariable Private 
                              Private f32_4* %214 = OpVariable Private 
                              Private f32_3* %220 = OpVariable Private 
                                         i32 %221 = OpConstant 8 
                                         i32 %227 = OpConstant 9 
                                         i32 %233 = OpConstant 10 
                                         i32 %239 = OpConstant 11 
                                         u32 %248 = OpConstant 3 
                                         i32 %250 = OpConstant 5 
                                         i32 %256 = OpConstant 6 
                                         i32 %262 = OpConstant 7 
                                         f32 %272 = OpConstant 3.67402E-40 
                                       f32_3 %273 = OpConstantComposite %272 %272 %272 
                              Private f32_3* %275 = OpVariable Private 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_3 %280 = OpConstantComposite %279 %279 %279 
                                         f32 %285 = OpConstant 3.67402E-40 
                                       f32_3 %286 = OpConstantComposite %285 %285 %285 
                                         f32 %288 = OpConstant 3.67402E-40 
                                       f32_3 %289 = OpConstantComposite %288 %288 %288 
                              Private f32_4* %299 = OpVariable Private 
                              Private f32_4* %307 = OpVariable Private 
                                         f32 %343 = OpConstant 3.67402E-40 
                                       f32_4 %344 = OpConstantComposite %343 %343 %343 %343 
                                       f32_4 %352 = OpConstantComposite %46 %46 %46 %46 
                                       f32_4 %360 = OpConstantComposite %272 %272 %272 %272 
                                         i32 %367 = OpConstant 4 
                               Output f32_3* %413 = OpVariable Output 
                                             %416 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                 Uniform f32* %33 = OpAccessChain %19 %32 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpFMul %31 %34 
                                 Private f32* %36 = OpAccessChain %9 %27 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %27 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFMul %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %27 
                                                      OpStore %41 %40 
                                 Uniform f32* %43 = OpAccessChain %19 %32 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFNegate %44 
                                          f32 %47 = OpFAdd %45 %46 
                                                      OpStore %42 %47 
                                   Input f32* %52 = OpAccessChain %49 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpLoad %42 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %9 %27 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFAdd %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %27 
                                                      OpStore %59 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                               Uniform f32_4* %65 = OpAccessChain %19 %62 %63 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFMul %61 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %19 %62 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %49 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %19 %62 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpVectorShuffle %79 %79 2 2 2 2 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %19 %62 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %84 %89 
                               Uniform f32_4* %90 = OpAccessChain %19 %62 %86 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %49 
                                        f32_4 %93 = OpVectorShuffle %92 %92 3 3 3 3 
                                        f32_4 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpFAdd %94 %95 
                                                      OpStore %9 %96 
                                        f32_4 %98 = OpLoad %84 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %101 = OpAccessChain %19 %100 %63 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %97 %103 
                              Uniform f32_4* %104 = OpAccessChain %19 %100 %68 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %84 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %97 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %97 %110 
                              Uniform f32_4* %111 = OpAccessChain %19 %100 %76 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %84 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 2 2 2 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %97 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %97 %117 
                              Uniform f32_4* %122 = OpAccessChain %19 %100 %86 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpLoad %84 
                                       f32_4 %125 = OpVectorShuffle %124 %124 3 3 3 3 
                                       f32_4 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %97 
                                       f32_4 %128 = OpFAdd %126 %127 
                               Output f32_4* %130 = OpAccessChain %121 %68 
                                                      OpStore %130 %128 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                              Uniform f32_4* %138 = OpAccessChain %19 %137 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                              Uniform f32_4* %142 = OpAccessChain %19 %137 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %145 = OpFAdd %141 %144 
                                                      OpStore %133 %145 
                                       f32_3 %149 = OpLoad %148 
                              Uniform f32_4* %151 = OpAccessChain %19 %150 %68 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %149 %153 
                                Private f32* %155 = OpAccessChain %84 %27 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %148 
                              Uniform f32_4* %157 = OpAccessChain %19 %150 %63 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %161 = OpAccessChain %84 %50 
                                                      OpStore %161 %160 
                                       f32_3 %162 = OpLoad %148 
                              Uniform f32_4* %163 = OpAccessChain %19 %150 %76 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                         f32 %166 = OpDot %162 %165 
                                Private f32* %168 = OpAccessChain %84 %167 
                                                      OpStore %168 %166 
                                       f32_4 %170 = OpLoad %84 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_4 %172 = OpLoad %84 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                         f32 %174 = OpDot %171 %173 
                                                      OpStore %169 %174 
                                         f32 %175 = OpLoad %169 
                                         f32 %176 = OpExtInst %1 32 %175 
                                                      OpStore %169 %176 
                                         f32 %177 = OpLoad %169 
                                       f32_3 %178 = OpCompositeConstruct %177 %177 %177 
                                       f32_4 %179 = OpLoad %84 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %84 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %84 %183 
                                       f32_4 %186 = OpLoad %84 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                                      OpStore %185 %187 
                                       f32_4 %189 = OpLoad %9 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %188 %190 
                                       f32_4 %193 = OpLoad %192 
                                                      OpStore %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                                      OpStore %194 %195 
                                Private f32* %198 = OpAccessChain %84 %50 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %84 %50 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFMul %199 %201 
                                Private f32* %203 = OpAccessChain %197 %27 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %84 %27 
                                         f32 %205 = OpLoad %204 
                                Private f32* %206 = OpAccessChain %84 %27 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %205 %207 
                                Private f32* %209 = OpAccessChain %197 %27 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFNegate %210 
                                         f32 %212 = OpFAdd %208 %211 
                                Private f32* %213 = OpAccessChain %197 %27 
                                                      OpStore %213 %212 
                                       f32_4 %215 = OpLoad %84 
                                       f32_4 %216 = OpVectorShuffle %215 %215 1 2 2 0 
                                       f32_4 %217 = OpLoad %84 
                                       f32_4 %218 = OpVectorShuffle %217 %217 0 1 2 2 
                                       f32_4 %219 = OpFMul %216 %218 
                                                      OpStore %214 %219 
                              Uniform f32_4* %222 = OpAccessChain %19 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %214 
                                         f32 %225 = OpDot %223 %224 
                                Private f32* %226 = OpAccessChain %220 %27 
                                                      OpStore %226 %225 
                              Uniform f32_4* %228 = OpAccessChain %19 %227 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %214 
                                         f32 %231 = OpDot %229 %230 
                                Private f32* %232 = OpAccessChain %220 %50 
                                                      OpStore %232 %231 
                              Uniform f32_4* %234 = OpAccessChain %19 %233 
                                       f32_4 %235 = OpLoad %234 
                                       f32_4 %236 = OpLoad %214 
                                         f32 %237 = OpDot %235 %236 
                                Private f32* %238 = OpAccessChain %220 %167 
                                                      OpStore %238 %237 
                              Uniform f32_4* %240 = OpAccessChain %19 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpLoad %197 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 0 0 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_3 %246 = OpLoad %220 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %197 %247 
                                Private f32* %249 = OpAccessChain %84 %248 
                                                      OpStore %249 %46 
                              Uniform f32_4* %251 = OpAccessChain %19 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_4 %253 = OpLoad %84 
                                         f32 %254 = OpDot %252 %253 
                                Private f32* %255 = OpAccessChain %220 %27 
                                                      OpStore %255 %254 
                              Uniform f32_4* %257 = OpAccessChain %19 %256 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpLoad %84 
                                         f32 %260 = OpDot %258 %259 
                                Private f32* %261 = OpAccessChain %220 %50 
                                                      OpStore %261 %260 
                              Uniform f32_4* %263 = OpAccessChain %19 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_4 %265 = OpLoad %84 
                                         f32 %266 = OpDot %264 %265 
                                Private f32* %267 = OpAccessChain %220 %167 
                                                      OpStore %267 %266 
                                       f32_3 %268 = OpLoad %197 
                                       f32_3 %269 = OpLoad %220 
                                       f32_3 %270 = OpFAdd %268 %269 
                                                      OpStore %197 %270 
                                       f32_3 %271 = OpLoad %197 
                                       f32_3 %274 = OpExtInst %1 40 %271 %273 
                                                      OpStore %197 %274 
                                       f32_3 %276 = OpLoad %197 
                                       f32_3 %277 = OpExtInst %1 30 %276 
                                                      OpStore %275 %277 
                                       f32_3 %278 = OpLoad %275 
                                       f32_3 %281 = OpFMul %278 %280 
                                                      OpStore %275 %281 
                                       f32_3 %282 = OpLoad %275 
                                       f32_3 %283 = OpExtInst %1 29 %282 
                                                      OpStore %275 %283 
                                       f32_3 %284 = OpLoad %275 
                                       f32_3 %287 = OpFMul %284 %286 
                                       f32_3 %290 = OpFAdd %287 %289 
                                                      OpStore %275 %290 
                                       f32_3 %291 = OpLoad %275 
                                       f32_3 %292 = OpExtInst %1 40 %291 %273 
                                                      OpStore %275 %292 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 1 1 1 1 
                                       f32_4 %295 = OpFNegate %294 
                              Uniform f32_4* %296 = OpAccessChain %19 %63 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpFAdd %295 %297 
                                                      OpStore %97 %298 
                                       f32_4 %300 = OpLoad %84 
                                       f32_4 %301 = OpVectorShuffle %300 %300 1 1 1 1 
                                       f32_4 %302 = OpLoad %97 
                                       f32_4 %303 = OpFMul %301 %302 
                                                      OpStore %299 %303 
                                       f32_4 %304 = OpLoad %97 
                                       f32_4 %305 = OpLoad %97 
                                       f32_4 %306 = OpFMul %304 %305 
                                                      OpStore %97 %306 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %309 = OpVectorShuffle %308 %308 0 0 0 0 
                                       f32_4 %310 = OpFNegate %309 
                              Uniform f32_4* %311 = OpAccessChain %19 %68 
                                       f32_4 %312 = OpLoad %311 
                                       f32_4 %313 = OpFAdd %310 %312 
                                                      OpStore %307 %313 
                                       f32_4 %314 = OpLoad %9 
                                       f32_4 %315 = OpVectorShuffle %314 %314 2 2 2 2 
                                       f32_4 %316 = OpFNegate %315 
                              Uniform f32_4* %317 = OpAccessChain %19 %76 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpFAdd %316 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %307 
                                       f32_4 %321 = OpLoad %84 
                                       f32_4 %322 = OpVectorShuffle %321 %321 0 0 0 0 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %299 
                                       f32_4 %325 = OpFAdd %323 %324 
                                                      OpStore %299 %325 
                                       f32_4 %326 = OpLoad %307 
                                       f32_4 %327 = OpLoad %307 
                                       f32_4 %328 = OpFMul %326 %327 
                                       f32_4 %329 = OpLoad %97 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %97 %330 
                                       f32_4 %331 = OpLoad %9 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpFMul %331 %332 
                                       f32_4 %334 = OpLoad %97 
                                       f32_4 %335 = OpFAdd %333 %334 
                                                      OpStore %97 %335 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpLoad %84 
                                       f32_4 %338 = OpVectorShuffle %337 %337 2 2 2 2 
                                       f32_4 %339 = OpFMul %336 %338 
                                       f32_4 %340 = OpLoad %299 
                                       f32_4 %341 = OpFAdd %339 %340 
                                                      OpStore %9 %341 
                                       f32_4 %342 = OpLoad %97 
                                       f32_4 %345 = OpExtInst %1 40 %342 %344 
                                                      OpStore %84 %345 
                                       f32_4 %346 = OpLoad %84 
                                       f32_4 %347 = OpExtInst %1 32 %346 
                                                      OpStore %97 %347 
                                       f32_4 %348 = OpLoad %84 
                              Uniform f32_4* %349 = OpAccessChain %19 %86 
                                       f32_4 %350 = OpLoad %349 
                                       f32_4 %351 = OpFMul %348 %350 
                                       f32_4 %353 = OpFAdd %351 %352 
                                                      OpStore %84 %353 
                                       f32_4 %354 = OpLoad %84 
                                       f32_4 %355 = OpFDiv %352 %354 
                                                      OpStore %84 %355 
                                       f32_4 %356 = OpLoad %9 
                                       f32_4 %357 = OpLoad %97 
                                       f32_4 %358 = OpFMul %356 %357 
                                                      OpStore %9 %358 
                                       f32_4 %359 = OpLoad %9 
                                       f32_4 %361 = OpExtInst %1 40 %359 %360 
                                                      OpStore %9 %361 
                                       f32_4 %362 = OpLoad %84 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpFMul %362 %363 
                                                      OpStore %9 %364 
                                       f32_4 %365 = OpLoad %9 
                                       f32_3 %366 = OpVectorShuffle %365 %365 1 1 1 
                              Uniform f32_4* %368 = OpAccessChain %19 %367 %63 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFMul %366 %370 
                                       f32_4 %372 = OpLoad %84 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %84 %373 
                              Uniform f32_4* %374 = OpAccessChain %19 %367 %68 
                                       f32_4 %375 = OpLoad %374 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_4 %377 = OpLoad %9 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 0 0 
                                       f32_3 %379 = OpFMul %376 %378 
                                       f32_4 %380 = OpLoad %84 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                       f32_3 %382 = OpFAdd %379 %381 
                                       f32_4 %383 = OpLoad %84 
                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
                                                      OpStore %84 %384 
                              Uniform f32_4* %385 = OpAccessChain %19 %367 %76 
                                       f32_4 %386 = OpLoad %385 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_4 %388 = OpLoad %9 
                                       f32_3 %389 = OpVectorShuffle %388 %388 2 2 2 
                                       f32_3 %390 = OpFMul %387 %389 
                                       f32_4 %391 = OpLoad %84 
                                       f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                                       f32_3 %393 = OpFAdd %390 %392 
                                       f32_4 %394 = OpLoad %9 
                                       f32_4 %395 = OpVectorShuffle %394 %393 4 5 6 3 
                                                      OpStore %9 %395 
                              Uniform f32_4* %396 = OpAccessChain %19 %367 %86 
                                       f32_4 %397 = OpLoad %396 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_4 %399 = OpLoad %9 
                                       f32_3 %400 = OpVectorShuffle %399 %399 3 3 3 
                                       f32_3 %401 = OpFMul %398 %400 
                                       f32_4 %402 = OpLoad %9 
                                       f32_3 %403 = OpVectorShuffle %402 %402 0 1 2 
                                       f32_3 %404 = OpFAdd %401 %403 
                                       f32_4 %405 = OpLoad %9 
                                       f32_4 %406 = OpVectorShuffle %405 %404 4 5 6 3 
                                                      OpStore %9 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_3 %408 = OpVectorShuffle %407 %407 0 1 2 
                                       f32_3 %409 = OpLoad %275 
                                       f32_3 %410 = OpFAdd %408 %409 
                                       f32_4 %411 = OpLoad %9 
                                       f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
                                                      OpStore %9 %412 
                                       f32_4 %414 = OpLoad %9 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
                                                      OpStore %413 %415 
                                 Output f32* %417 = OpAccessChain %121 %68 %50 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                 Output f32* %420 = OpAccessChain %121 %68 %50 
                                                      OpStore %420 %419 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 265
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %132 %243 %249 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpMemberDecorate %34 0 RelaxedPrecision 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpMemberDecorate %34 5 RelaxedPrecision 
                                                      OpMemberDecorate %34 5 Offset 34 
                                                      OpMemberDecorate %34 6 Offset 34 
                                                      OpMemberDecorate %34 7 Offset 34 
                                                      OpMemberDecorate %34 8 Offset 34 
                                                      OpMemberDecorate %34 9 RelaxedPrecision 
                                                      OpMemberDecorate %34 9 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %260 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeStruct %7 %7 %32 %33 %33 %7 %6 %6 %6 %6 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 8 
                                              %39 = OpTypePointer Uniform %6 
                               Private f32_4* %47 = OpVariable Private 
                                          u32 %48 = OpConstant 3 
                                              %49 = OpTypePointer Private %6 
                                          f32 %52 = OpConstant 3.67402E-40 
                                          u32 %54 = OpConstant 0 
                                              %56 = OpTypeBool 
                                              %57 = OpTypePointer Private %56 
                                Private bool* %58 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                                          i32 %67 = OpConstant -1 
                                              %73 = OpTypePointer Private %33 
                               Private f32_3* %74 = OpVariable Private 
                                          i32 %79 = OpConstant 7 
                                          i32 %96 = OpConstant 9 
                               Private bool* %102 = OpVariable Private 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                                         u32 %126 = OpConstant 1 
                              Private f32_3* %130 = OpVariable Private 
                                             %131 = OpTypePointer Input %33 
                                Input f32_3* %132 = OpVariable Input 
                                         i32 %135 = OpConstant 2 
                                             %136 = OpTypePointer Uniform %7 
                                         i32 %158 = OpConstant 3 
                                             %163 = OpTypePointer Function %33 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %33 
                              Private f32_4* %179 = OpVariable Private 
                                Private f32* %186 = OpVariable Private 
                                         f32 %189 = OpConstant 3.67402E-40 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         u32 %193 = OpConstant 2 
                                         f32 %196 = OpConstant 3.67402E-40 
                                             %205 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %206 = OpTypeSampledImage %205 
                                             %207 = OpTypePointer UniformConstant %206 
 UniformConstant read_only Texture3DSampled* %208 = OpVariable UniformConstant 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %229 = OpVariable Private 
                                         i32 %232 = OpConstant 5 
                                Input f32_3* %243 = OpVariable Input 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %252 = OpTypePointer Output %6 
                                         i32 %254 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %164 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %40 = OpAccessChain %36 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_4 %42 = OpCompositeConstruct %41 %41 %41 %41 
                                        f32_4 %43 = OpLoad %20 
                                        f32_4 %44 = OpFMul %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %29 %46 
                                 Private f32* %50 = OpAccessChain %29 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFAdd %51 %52 
                                 Private f32* %55 = OpAccessChain %47 %54 
                                                      OpStore %55 %53 
                                 Private f32* %59 = OpAccessChain %47 %54 
                                          f32 %60 = OpLoad %59 
                                         bool %62 = OpFOrdLessThan %60 %61 
                                                      OpStore %58 %62 
                                         bool %63 = OpLoad %58 
                                          i32 %66 = OpSelect %63 %65 %64 
                                          i32 %68 = OpIMul %66 %67 
                                         bool %69 = OpINotEqual %68 %64 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                        f32_4 %75 = OpLoad %29 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpExtInst %1 30 %76 
                                                      OpStore %74 %77 
                                        f32_3 %78 = OpLoad %74 
                                 Uniform f32* %80 = OpAccessChain %36 %79 
                                          f32 %81 = OpLoad %80 
                                 Uniform f32* %82 = OpAccessChain %36 %79 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %36 %79 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                          f32 %87 = OpCompositeExtract %86 0 
                                          f32 %88 = OpCompositeExtract %86 1 
                                          f32 %89 = OpCompositeExtract %86 2 
                                        f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                        f32_3 %91 = OpFMul %78 %90 
                                                      OpStore %74 %91 
                                        f32_3 %92 = OpLoad %74 
                                        f32_3 %93 = OpExtInst %1 29 %92 
                                                      OpStore %74 %93 
                                 Private f32* %94 = OpAccessChain %29 %48 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %97 = OpAccessChain %36 %96 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %100 = OpFAdd %95 %99 
                                Private f32* %101 = OpAccessChain %47 %54 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %47 %54 
                                         f32 %104 = OpLoad %103 
                                        bool %105 = OpFOrdLessThan %104 %61 
                                                      OpStore %102 %105 
                                        bool %106 = OpLoad %102 
                                         i32 %107 = OpSelect %106 %65 %64 
                                         i32 %108 = OpIMul %107 %67 
                                        bool %109 = OpINotEqual %108 %64 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpKill
                                             %111 = OpLabel 
                                Uniform f32* %113 = OpAccessChain %36 %65 %54 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %102 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %102 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %214 
                                             %124 = OpLabel 
                                Uniform f32* %127 = OpAccessChain %36 %65 %126 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %115 
                                                      OpStore %102 %129 
                                       f32_3 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %137 = OpAccessChain %36 %135 %65 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFMul %134 %139 
                                                      OpStore %130 %140 
                              Uniform f32_4* %141 = OpAccessChain %36 %135 %64 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %132 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_3 %147 = OpLoad %130 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %130 %148 
                              Uniform f32_4* %149 = OpAccessChain %36 %135 %135 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %132 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %130 %156 
                                       f32_3 %157 = OpLoad %130 
                              Uniform f32_4* %159 = OpAccessChain %36 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %130 %162 
                                        bool %165 = OpLoad %102 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %169 
                                             %166 = OpLabel 
                                       f32_3 %168 = OpLoad %130 
                                                      OpStore %164 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                       f32_3 %170 = OpLoad %132 
                                                      OpStore %164 %170 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %171 = OpLoad %164 
                                                      OpStore %130 %171 
                                       f32_3 %172 = OpLoad %130 
                              Uniform f32_3* %175 = OpAccessChain %36 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                                      OpStore %130 %178 
                                       f32_3 %180 = OpLoad %130 
                              Uniform f32_3* %181 = OpAccessChain %36 %158 
                                       f32_3 %182 = OpLoad %181 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %179 
                                       f32_4 %185 = OpVectorShuffle %184 %183 0 4 5 6 
                                                      OpStore %179 %185 
                                Private f32* %187 = OpAccessChain %179 %126 
                                         f32 %188 = OpLoad %187 
                                         f32 %190 = OpFMul %188 %189 
                                         f32 %192 = OpFAdd %190 %191 
                                                      OpStore %186 %192 
                                Uniform f32* %194 = OpAccessChain %36 %65 %193 
                                         f32 %195 = OpLoad %194 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %198 = OpFAdd %197 %191 
                                Private f32* %199 = OpAccessChain %130 %54 
                                                      OpStore %199 %198 
                                         f32 %200 = OpLoad %186 
                                Private f32* %201 = OpAccessChain %130 %54 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpExtInst %1 40 %200 %202 
                                Private f32* %204 = OpAccessChain %179 %54 
                                                      OpStore %204 %203 
                  read_only Texture3DSampled %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %179 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 2 3 
                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                                                      OpStore %179 %212 
                                       f32_4 %213 = OpLoad %179 
                                                      OpStore %47 %213 
                                                      OpBranch %125 
                                             %214 = OpLabel 
                                Private f32* %215 = OpAccessChain %47 %54 
                                                      OpStore %215 %115 
                                Private f32* %216 = OpAccessChain %47 %126 
                                                      OpStore %216 %115 
                                Private f32* %217 = OpAccessChain %47 %193 
                                                      OpStore %217 %115 
                                Private f32* %218 = OpAccessChain %47 %48 
                                                      OpStore %218 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %220 = OpLoad %47 
                              Uniform f32_4* %221 = OpAccessChain %36 %64 
                                       f32_4 %222 = OpLoad %221 
                                         f32 %223 = OpDot %220 %222 
                                Private f32* %224 = OpAccessChain %219 %54 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %219 %54 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 43 %226 %61 %115 
                                Private f32* %228 = OpAccessChain %219 %54 
                                                      OpStore %228 %227 
                                       f32_4 %230 = OpLoad %29 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %36 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFMul %231 %235 
                                                      OpStore %229 %236 
                                       f32_3 %237 = OpLoad %219 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpLoad %229 
                                       f32_3 %240 = OpFMul %238 %239 
                                                      OpStore %219 %240 
                                       f32_4 %241 = OpLoad %29 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_3 %246 = OpLoad %219 
                                       f32_3 %247 = OpFAdd %245 %246 
                                                      OpStore %219 %247 
                                Private f32* %250 = OpAccessChain %29 %48 
                                         f32 %251 = OpLoad %250 
                                 Output f32* %253 = OpAccessChain %249 %48 
                                                      OpStore %253 %251 
                                Uniform f32* %255 = OpAccessChain %36 %254 
                                         f32 %256 = OpLoad %255 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %74 
                                       f32_3 %259 = OpFMul %257 %258 
                                       f32_3 %260 = OpLoad %219 
                                       f32_3 %261 = OpFAdd %259 %260 
                                       f32_4 %262 = OpLoad %249 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %249 %263 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
float u_xlat20;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat6 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat6 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat2 = max(u_xlat3, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * _LightShadowData.z + _LightShadowData.w;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb6)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat10.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat10.x, u_xlat6.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat6.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat10.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat10.xy);
    u_xlat13 = u_xlat13 + u_xlat10_3.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat6.x = min(u_xlat13, u_xlat6.x);
    u_xlat13 = (u_xlatb2) ? u_xlat6.x : u_xlat13;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 353
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %128 %134 %135 %149 %186 %189 %192 %193 %195 %314 %334 %346 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %126 0 BuiltIn 126 
                                                      OpMemberDecorate %126 1 BuiltIn 126 
                                                      OpMemberDecorate %126 2 BuiltIn 126 
                                                      OpDecorate %126 Block 
                                                      OpDecorate %134 Location 134 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 Location 195 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %314 Location 314 
                                                      OpDecorate %334 Location 334 
                                                      OpDecorate %346 Location 346 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %7 %12 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 9 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 10 
                                          f32 %39 = OpConstant 3.67402E-40 
                                 Private f32* %42 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                              %48 = OpTypePointer Input %7 
                                 Input f32_4* %49 = OpVariable Input 
                                          u32 %50 = OpConstant 1 
                                              %51 = OpTypePointer Input %6 
                                          i32 %62 = OpConstant 6 
                                          i32 %63 = OpConstant 1 
                                              %64 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 0 
                                          i32 %76 = OpConstant 2 
                               Private f32_4* %84 = OpVariable Private 
                                          i32 %86 = OpConstant 3 
                               Private f32_4* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 8 
                                             %125 = OpTypeArray %6 %50 
                                             %126 = OpTypeStruct %7 %6 %125 
                                             %127 = OpTypePointer Output %126 
        Output struct {f32_4; f32; f32[1];}* %128 = OpVariable Output 
                                             %130 = OpTypePointer Output %7 
                                             %132 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Output %132 
                               Output f32_2* %134 = OpVariable Output 
                                Input f32_4* %135 = OpVariable Input 
                                         i32 %138 = OpConstant 11 
                                             %147 = OpTypeVector %6 3 
                                             %148 = OpTypePointer Input %147 
                                Input f32_3* %149 = OpVariable Input 
                                         i32 %151 = OpConstant 7 
                                         u32 %168 = OpConstant 2 
                                Private f32* %170 = OpVariable Private 
                                             %185 = OpTypePointer Output %147 
                               Output f32_3* %186 = OpVariable Output 
                               Output f32_3* %189 = OpVariable Output 
                               Output f32_4* %192 = OpVariable Output 
                                Input f32_4* %193 = OpVariable Input 
                               Output f32_4* %195 = OpVariable Output 
                              Private f32_4* %197 = OpVariable Private 
                              Private f32_4* %204 = OpVariable Private 
                              Private f32_4* %212 = OpVariable Private 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_4 %249 = OpConstantComposite %248 %248 %248 %248 
                                         i32 %254 = OpConstant 4 
                                       f32_4 %258 = OpConstantComposite %46 %46 %46 %46 
                                         f32 %266 = OpConstant 3.67402E-40 
                                       f32_4 %267 = OpConstantComposite %266 %266 %266 %266 
                                         i32 %274 = OpConstant 5 
                               Output f32_3* %314 = OpVariable Output 
                                         u32 %326 = OpConstant 3 
                                       f32_2 %330 = OpConstantComposite %39 %39 
                               Output f32_4* %334 = OpVariable Output 
                               Output f32_4* %346 = OpVariable Output 
                                             %347 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                 Uniform f32* %33 = OpAccessChain %19 %32 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpFMul %31 %34 
                                 Private f32* %36 = OpAccessChain %9 %27 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %27 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFMul %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %27 
                                                      OpStore %41 %40 
                                 Uniform f32* %43 = OpAccessChain %19 %32 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFNegate %44 
                                          f32 %47 = OpFAdd %45 %46 
                                                      OpStore %42 %47 
                                   Input f32* %52 = OpAccessChain %49 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpLoad %42 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %9 %27 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFAdd %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %27 
                                                      OpStore %59 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                               Uniform f32_4* %65 = OpAccessChain %19 %62 %63 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFMul %61 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %19 %62 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %49 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %19 %62 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpVectorShuffle %79 %79 2 2 2 2 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %19 %62 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %84 %89 
                               Uniform f32_4* %90 = OpAccessChain %19 %62 %86 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %49 
                                        f32_4 %93 = OpVectorShuffle %92 %92 3 3 3 3 
                                        f32_4 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpFAdd %94 %95 
                                                      OpStore %9 %96 
                                        f32_4 %98 = OpLoad %84 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %101 = OpAccessChain %19 %100 %63 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %97 %103 
                              Uniform f32_4* %104 = OpAccessChain %19 %100 %68 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %84 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %97 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %97 %110 
                              Uniform f32_4* %111 = OpAccessChain %19 %100 %76 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %84 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 2 2 2 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %97 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %97 %117 
                              Uniform f32_4* %118 = OpAccessChain %19 %100 %86 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpLoad %84 
                                       f32_4 %121 = OpVectorShuffle %120 %120 3 3 3 3 
                                       f32_4 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %97 
                                       f32_4 %124 = OpFAdd %122 %123 
                                                      OpStore %84 %124 
                                       f32_4 %129 = OpLoad %84 
                               Output f32_4* %131 = OpAccessChain %128 %68 
                                                      OpStore %131 %129 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              Uniform f32_4* %139 = OpAccessChain %19 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                              Uniform f32_4* %143 = OpAccessChain %19 %138 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
                                       f32_2 %146 = OpFAdd %142 %145 
                                                      OpStore %134 %146 
                                       f32_3 %150 = OpLoad %149 
                              Uniform f32_4* %152 = OpAccessChain %19 %151 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %150 %154 
                                Private f32* %156 = OpAccessChain %97 %27 
                                                      OpStore %156 %155 
                                       f32_3 %157 = OpLoad %149 
                              Uniform f32_4* %158 = OpAccessChain %19 %151 %63 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %97 %50 
                                                      OpStore %162 %161 
                                       f32_3 %163 = OpLoad %149 
                              Uniform f32_4* %164 = OpAccessChain %19 %151 %76 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                         f32 %167 = OpDot %163 %166 
                                Private f32* %169 = OpAccessChain %97 %168 
                                                      OpStore %169 %167 
                                       f32_4 %171 = OpLoad %97 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_4 %173 = OpLoad %97 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                         f32 %175 = OpDot %172 %174 
                                                      OpStore %170 %175 
                                         f32 %176 = OpLoad %170 
                                         f32 %177 = OpExtInst %1 32 %176 
                                                      OpStore %170 %177 
                                         f32 %178 = OpLoad %170 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %97 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %97 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %97 %184 
                                       f32_4 %187 = OpLoad %97 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                                      OpStore %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                                      OpStore %189 %191 
                                       f32_4 %194 = OpLoad %193 
                                                      OpStore %192 %194 
                                       f32_4 %196 = OpLoad %9 
                                                      OpStore %195 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %198 1 1 1 1 
                                       f32_4 %200 = OpFNegate %199 
                              Uniform f32_4* %201 = OpAccessChain %19 %76 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFAdd %200 %202 
                                                      OpStore %197 %203 
                                       f32_4 %205 = OpLoad %97 
                                       f32_4 %206 = OpVectorShuffle %205 %205 1 1 1 1 
                                       f32_4 %207 = OpLoad %197 
                                       f32_4 %208 = OpFMul %206 %207 
                                                      OpStore %204 %208 
                                       f32_4 %209 = OpLoad %197 
                                       f32_4 %210 = OpLoad %197 
                                       f32_4 %211 = OpFMul %209 %210 
                                                      OpStore %197 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %213 0 0 0 0 
                                       f32_4 %215 = OpFNegate %214 
                              Uniform f32_4* %216 = OpAccessChain %19 %63 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %215 %217 
                                                      OpStore %212 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_4 %220 = OpVectorShuffle %219 %219 2 2 2 2 
                                       f32_4 %221 = OpFNegate %220 
                              Uniform f32_4* %222 = OpAccessChain %19 %86 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFAdd %221 %223 
                                                      OpStore %9 %224 
                                       f32_4 %225 = OpLoad %212 
                                       f32_4 %226 = OpLoad %97 
                                       f32_4 %227 = OpVectorShuffle %226 %226 0 0 0 0 
                                       f32_4 %228 = OpFMul %225 %227 
                                       f32_4 %229 = OpLoad %204 
                                       f32_4 %230 = OpFAdd %228 %229 
                                                      OpStore %204 %230 
                                       f32_4 %231 = OpLoad %212 
                                       f32_4 %232 = OpLoad %212 
                                       f32_4 %233 = OpFMul %231 %232 
                                       f32_4 %234 = OpLoad %197 
                                       f32_4 %235 = OpFAdd %233 %234 
                                                      OpStore %197 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %9 
                                       f32_4 %238 = OpFMul %236 %237 
                                       f32_4 %239 = OpLoad %197 
                                       f32_4 %240 = OpFAdd %238 %239 
                                                      OpStore %197 %240 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpLoad %97 
                                       f32_4 %243 = OpVectorShuffle %242 %242 2 2 2 2 
                                       f32_4 %244 = OpFMul %241 %243 
                                       f32_4 %245 = OpLoad %204 
                                       f32_4 %246 = OpFAdd %244 %245 
                                                      OpStore %9 %246 
                                       f32_4 %247 = OpLoad %197 
                                       f32_4 %250 = OpExtInst %1 40 %247 %249 
                                                      OpStore %97 %250 
                                       f32_4 %251 = OpLoad %97 
                                       f32_4 %252 = OpExtInst %1 32 %251 
                                                      OpStore %197 %252 
                                       f32_4 %253 = OpLoad %97 
                              Uniform f32_4* %255 = OpAccessChain %19 %254 
                                       f32_4 %256 = OpLoad %255 
                                       f32_4 %257 = OpFMul %253 %256 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %97 %259 
                                       f32_4 %260 = OpLoad %97 
                                       f32_4 %261 = OpFDiv %258 %260 
                                                      OpStore %97 %261 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %263 = OpLoad %197 
                                       f32_4 %264 = OpFMul %262 %263 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                                       f32_4 %268 = OpExtInst %1 40 %265 %267 
                                                      OpStore %9 %268 
                                       f32_4 %269 = OpLoad %97 
                                       f32_4 %270 = OpLoad %9 
                                       f32_4 %271 = OpFMul %269 %270 
                                                      OpStore %9 %271 
                                       f32_4 %272 = OpLoad %9 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                              Uniform f32_4* %275 = OpAccessChain %19 %274 %63 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpFMul %273 %277 
                                       f32_4 %279 = OpLoad %97 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %97 %280 
                              Uniform f32_4* %281 = OpAccessChain %19 %274 %68 
                                       f32_4 %282 = OpLoad %281 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_4 %284 = OpLoad %9 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 0 0 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_4 %287 = OpLoad %97 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %97 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %97 %291 
                              Uniform f32_4* %292 = OpAccessChain %19 %274 %76 
                                       f32_4 %293 = OpLoad %292 
                                       f32_3 %294 = OpVectorShuffle %293 %293 0 1 2 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 2 2 2 
                                       f32_3 %297 = OpFMul %294 %296 
                                       f32_4 %298 = OpLoad %97 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_3 %300 = OpFAdd %297 %299 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                                      OpStore %9 %302 
                              Uniform f32_4* %303 = OpAccessChain %19 %274 %86 
                                       f32_4 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_4 %306 = OpLoad %9 
                                       f32_3 %307 = OpVectorShuffle %306 %306 3 3 3 
                                       f32_3 %308 = OpFMul %305 %307 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpFAdd %308 %310 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
                                                      OpStore %9 %313 
                                       f32_4 %315 = OpLoad %9 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 1 2 
                                                      OpStore %314 %316 
                                Private f32* %317 = OpAccessChain %84 %50 
                                         f32 %318 = OpLoad %317 
                                Uniform f32* %319 = OpAccessChain %19 %68 %27 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFMul %318 %320 
                                Private f32* %322 = OpAccessChain %9 %27 
                                                      OpStore %322 %321 
                                Private f32* %323 = OpAccessChain %9 %27 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFMul %324 %39 
                                Private f32* %327 = OpAccessChain %9 %326 
                                                      OpStore %327 %325 
                                       f32_4 %328 = OpLoad %84 
                                       f32_2 %329 = OpVectorShuffle %328 %328 0 3 
                                       f32_2 %331 = OpFMul %329 %330 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpVectorShuffle %332 %331 4 1 5 3 
                                                      OpStore %9 %333 
                                       f32_4 %335 = OpLoad %84 
                                       f32_2 %336 = OpVectorShuffle %335 %335 2 3 
                                       f32_4 %337 = OpLoad %334 
                                       f32_4 %338 = OpVectorShuffle %337 %336 0 1 4 5 
                                                      OpStore %334 %338 
                                       f32_4 %339 = OpLoad %9 
                                       f32_2 %340 = OpVectorShuffle %339 %339 2 2 
                                       f32_4 %341 = OpLoad %9 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 3 
                                       f32_2 %343 = OpFAdd %340 %342 
                                       f32_4 %344 = OpLoad %334 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 5 2 3 
                                                      OpStore %334 %345 
                                                      OpStore %346 %267 
                                 Output f32* %348 = OpAccessChain %128 %68 %50 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFNegate %349 
                                 Output f32* %351 = OpAccessChain %128 %68 %50 
                                                      OpStore %351 %350 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %116 %292 %347 %353 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 RelaxedPrecision 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 RelaxedPrecision 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpMemberDecorate %35 9 RelaxedPrecision 
                                                      OpMemberDecorate %35 9 Offset 35 
                                                      OpMemberDecorate %35 10 Offset 35 
                                                      OpMemberDecorate %35 11 Offset 35 
                                                      OpMemberDecorate %35 12 Offset 35 
                                                      OpMemberDecorate %35 13 RelaxedPrecision 
                                                      OpMemberDecorate %35 13 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %191 SpecId 191 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 DescriptorSet 301 
                                                      OpDecorate %301 Binding 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %347 Location 347 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %364 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 4 
                                              %33 = OpTypeArray %7 %32 
                                              %34 = OpTypeArray %7 %32 
                                              %35 = OpTypeStruct %30 %7 %7 %7 %33 %7 %34 %30 %30 %7 %6 %6 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 12 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                              %74 = OpTypePointer Private %30 
                               Private f32_3* %75 = OpVariable Private 
                                          i32 %80 = OpConstant 11 
                                          i32 %97 = OpConstant 13 
                               Private bool* %103 = OpVariable Private 
                              Private f32_3* %114 = OpVariable Private 
                                             %115 = OpTypePointer Input %30 
                                Input f32_3* %116 = OpVariable Input 
                                             %119 = OpTypePointer Uniform %30 
                              Private f32_3* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 4 
                                         u32 %125 = OpConstant 2 
                                         u32 %131 = OpConstant 1 
                                         i32 %133 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                                         i32 %142 = OpConstant 3 
                                             %143 = OpTypePointer Uniform %7 
                                         f32 %178 = OpConstant 3.67402E-40 
                               Private bool* %180 = OpVariable Private 
                                         i32 %181 = OpConstant 5 
                                        bool %185 = OpConstantFalse 
                                        bool %191 = OpSpecConstantFalse 
                               Private bool* %194 = OpVariable Private 
                                         i32 %200 = OpConstant 6 
                              Private f32_3* %226 = OpVariable Private 
                                             %227 = OpTypePointer Function %30 
                                         i32 %237 = OpConstant 8 
                              Private f32_4* %242 = OpVariable Private 
                                         i32 %244 = OpConstant 7 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %254 = OpConstant 3.67402E-40 
                                Private f32* %257 = OpVariable Private 
                                         f32 %260 = OpConstant 3.67402E-40 
                                             %268 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %269 = OpTypeSampledImage %268 
                                             %270 = OpTypePointer UniformConstant %269 
 UniformConstant read_only Texture3DSampled* %271 = OpVariable UniformConstant 
                              Private f32_3* %282 = OpVariable Private 
                                Input f32_4* %292 = OpVariable Input 
                                Private f32* %300 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %301 = OpVariable UniformConstant 
                              Private f32_3* %307 = OpVariable Private 
                                             %322 = OpTypePointer Function %6 
                                         i32 %336 = OpConstant 9 
                                Input f32_3* %347 = OpVariable Input 
                                             %352 = OpTypePointer Output %7 
                               Output f32_4* %353 = OpVariable Output 
                                             %356 = OpTypePointer Output %6 
                                         i32 %358 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %228 = OpVariable Function 
                               Function f32* %323 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_4 %76 = OpLoad %29 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpExtInst %1 30 %77 
                                                      OpStore %75 %78 
                                        f32_3 %79 = OpLoad %75 
                                 Uniform f32* %81 = OpAccessChain %37 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %37 %80 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %37 %80 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %79 %91 
                                                      OpStore %75 %92 
                                        f32_3 %93 = OpLoad %75 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %75 %94 
                                 Private f32* %95 = OpAccessChain %29 %49 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %98 = OpAccessChain %37 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %101 = OpFAdd %96 %100 
                                Private f32* %102 = OpAccessChain %48 %55 
                                                      OpStore %102 %101 
                                Private f32* %104 = OpAccessChain %48 %55 
                                         f32 %105 = OpLoad %104 
                                        bool %106 = OpFOrdLessThan %105 %62 
                                                      OpStore %103 %106 
                                        bool %107 = OpLoad %103 
                                         i32 %108 = OpSelect %107 %66 %65 
                                         i32 %109 = OpIMul %108 %68 
                                        bool %110 = OpINotEqual %109 %65 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                       f32_3 %117 = OpLoad %116 
                                       f32_3 %118 = OpFNegate %117 
                              Uniform f32_3* %120 = OpAccessChain %37 %65 
                                       f32_3 %121 = OpLoad %120 
                                       f32_3 %122 = OpFAdd %118 %121 
                                                      OpStore %114 %122 
                                Uniform f32* %126 = OpAccessChain %37 %124 %65 %125 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %123 %55 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %37 %124 %66 %125 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %123 %131 
                                                      OpStore %132 %130 
                                Uniform f32* %134 = OpAccessChain %37 %124 %133 %125 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %123 %125 
                                                      OpStore %136 %135 
                                       f32_3 %138 = OpLoad %114 
                                       f32_3 %139 = OpLoad %123 
                                         f32 %140 = OpDot %138 %139 
                                                      OpStore %137 %140 
                                       f32_3 %141 = OpLoad %116 
                              Uniform f32_4* %144 = OpAccessChain %37 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFNegate %146 
                                       f32_3 %148 = OpFAdd %141 %147 
                                                      OpStore %114 %148 
                                       f32_3 %149 = OpLoad %114 
                                       f32_3 %150 = OpLoad %114 
                                         f32 %151 = OpDot %149 %150 
                                Private f32* %152 = OpAccessChain %114 %55 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %114 %55 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpExtInst %1 31 %154 
                                Private f32* %156 = OpAccessChain %114 %55 
                                                      OpStore %156 %155 
                                         f32 %157 = OpLoad %137 
                                         f32 %158 = OpFNegate %157 
                                Private f32* %159 = OpAccessChain %114 %55 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFAdd %158 %160 
                                Private f32* %162 = OpAccessChain %114 %55 
                                                      OpStore %162 %161 
                                Uniform f32* %163 = OpAccessChain %37 %142 %49 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %114 %55 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                         f32 %168 = OpLoad %137 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %137 %169 
                                         f32 %170 = OpLoad %137 
                                Uniform f32* %171 = OpAccessChain %37 %133 %125 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Uniform f32* %174 = OpAccessChain %37 %133 %49 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                                      OpStore %137 %176 
                                         f32 %177 = OpLoad %137 
                                         f32 %179 = OpExtInst %1 43 %177 %62 %178 
                                                      OpStore %137 %179 
                                Uniform f32* %182 = OpAccessChain %37 %181 %55 
                                         f32 %183 = OpLoad %182 
                                        bool %184 = OpFOrdEqual %183 %178 
                                                      OpStore %180 %184 
                                                      OpSelectionMerge %187 None 
                                                      OpBranchConditional %185 %186 %187 
                                             %186 = OpLabel 
                                        bool %188 = OpLoad %180 
                                                      OpSelectionMerge %190 None 
                                                      OpBranchConditional %188 %189 %190 
                                             %189 = OpLabel 
                                                      OpBranch %190 
                                             %190 = OpLabel 
                                                      OpBranch %187 
                                             %187 = OpLabel 
                                                      OpSelectionMerge %193 None 
                                                      OpBranchConditional %191 %192 %277 
                                             %192 = OpLabel 
                                Uniform f32* %195 = OpAccessChain %37 %181 %131 
                                         f32 %196 = OpLoad %195 
                                        bool %197 = OpFOrdEqual %196 %178 
                                                      OpStore %194 %197 
                                       f32_3 %198 = OpLoad %116 
                                       f32_3 %199 = OpVectorShuffle %198 %198 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %37 %200 %66 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %123 %204 
                              Uniform f32_4* %205 = OpAccessChain %37 %200 %65 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %116 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %123 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %123 %212 
                              Uniform f32_4* %213 = OpAccessChain %37 %200 %133 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %116 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %123 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %123 %220 
                                       f32_3 %221 = OpLoad %123 
                              Uniform f32_4* %222 = OpAccessChain %37 %200 %142 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFAdd %221 %224 
                                                      OpStore %123 %225 
                                        bool %229 = OpLoad %194 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %233 
                                             %230 = OpLabel 
                                       f32_3 %232 = OpLoad %123 
                                                      OpStore %228 %232 
                                                      OpBranch %231 
                                             %233 = OpLabel 
                                       f32_3 %234 = OpLoad %116 
                                                      OpStore %228 %234 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                       f32_3 %235 = OpLoad %228 
                                                      OpStore %226 %235 
                                       f32_3 %236 = OpLoad %226 
                              Uniform f32_3* %238 = OpAccessChain %37 %237 
                                       f32_3 %239 = OpLoad %238 
                                       f32_3 %240 = OpFNegate %239 
                                       f32_3 %241 = OpFAdd %236 %240 
                                                      OpStore %226 %241 
                                       f32_3 %243 = OpLoad %226 
                              Uniform f32_3* %245 = OpAccessChain %37 %244 
                                       f32_3 %246 = OpLoad %245 
                                       f32_3 %247 = OpFMul %243 %246 
                                       f32_4 %248 = OpLoad %242 
                                       f32_4 %249 = OpVectorShuffle %248 %247 0 4 5 6 
                                                      OpStore %242 %249 
                                Private f32* %250 = OpAccessChain %242 %131 
                                         f32 %251 = OpLoad %250 
                                         f32 %253 = OpFMul %251 %252 
                                         f32 %255 = OpFAdd %253 %254 
                                Private f32* %256 = OpAccessChain %226 %55 
                                                      OpStore %256 %255 
                                Uniform f32* %258 = OpAccessChain %37 %181 %125 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %254 
                                                      OpStore %257 %262 
                                         f32 %263 = OpLoad %257 
                                Private f32* %264 = OpAccessChain %226 %55 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 40 %263 %265 
                                Private f32* %267 = OpAccessChain %242 %55 
                                                      OpStore %267 %266 
                  read_only Texture3DSampled %272 = OpLoad %271 
                                       f32_4 %273 = OpLoad %242 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 2 3 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                                      OpStore %242 %275 
                                       f32_4 %276 = OpLoad %242 
                                                      OpStore %48 %276 
                                                      OpBranch %193 
                                             %277 = OpLabel 
                                Private f32* %278 = OpAccessChain %48 %55 
                                                      OpStore %278 %178 
                                Private f32* %279 = OpAccessChain %48 %131 
                                                      OpStore %279 %178 
                                Private f32* %280 = OpAccessChain %48 %125 
                                                      OpStore %280 %178 
                                Private f32* %281 = OpAccessChain %48 %49 
                                                      OpStore %281 %178 
                                                      OpBranch %193 
                                             %193 = OpLabel 
                                       f32_4 %283 = OpLoad %48 
                              Uniform f32_4* %284 = OpAccessChain %37 %66 
                                       f32_4 %285 = OpLoad %284 
                                         f32 %286 = OpDot %283 %285 
                                Private f32* %287 = OpAccessChain %282 %55 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %282 %55 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpExtInst %1 43 %289 %62 %178 
                                Private f32* %291 = OpAccessChain %282 %55 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %292 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpLoad %292 
                                       f32_2 %296 = OpVectorShuffle %295 %295 3 3 
                                       f32_2 %297 = OpFDiv %294 %296 
                                       f32_3 %298 = OpLoad %226 
                                       f32_3 %299 = OpVectorShuffle %298 %297 3 4 2 
                                                      OpStore %226 %299 
                  read_only Texture2DSampled %302 = OpLoad %301 
                                       f32_3 %303 = OpLoad %226 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_4 %305 = OpImageSampleImplicitLod %302 %304 
                                         f32 %306 = OpCompositeExtract %305 0 
                                                      OpStore %300 %306 
                                         f32 %308 = OpLoad %137 
                                         f32 %309 = OpLoad %300 
                                         f32 %310 = OpFAdd %308 %309 
                                Private f32* %311 = OpAccessChain %307 %55 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %307 %55 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 43 %313 %62 %178 
                                Private f32* %315 = OpAccessChain %307 %55 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %307 %55 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %282 %55 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpExtInst %1 37 %317 %319 
                                Private f32* %321 = OpAccessChain %282 %55 
                                                      OpStore %321 %320 
                                        bool %324 = OpLoad %180 
                                                      OpSelectionMerge %326 None 
                                                      OpBranchConditional %324 %325 %329 
                                             %325 = OpLabel 
                                Private f32* %327 = OpAccessChain %282 %55 
                                         f32 %328 = OpLoad %327 
                                                      OpStore %323 %328 
                                                      OpBranch %326 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %307 %55 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %323 %331 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         f32 %332 = OpLoad %323 
                                Private f32* %333 = OpAccessChain %282 %55 
                                                      OpStore %333 %332 
                                       f32_4 %334 = OpLoad %29 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                              Uniform f32_4* %337 = OpAccessChain %37 %336 
                                       f32_4 %338 = OpLoad %337 
                                       f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                       f32_3 %340 = OpFMul %335 %339 
                                                      OpStore %307 %340 
                                       f32_3 %341 = OpLoad %282 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpLoad %307 
                                       f32_3 %344 = OpFMul %342 %343 
                                                      OpStore %282 %344 
                                       f32_4 %345 = OpLoad %29 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %348 = OpLoad %347 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_3 %350 = OpLoad %282 
                                       f32_3 %351 = OpFAdd %349 %350 
                                                      OpStore %282 %351 
                                Private f32* %354 = OpAccessChain %29 %49 
                                         f32 %355 = OpLoad %354 
                                 Output f32* %357 = OpAccessChain %353 %49 
                                                      OpStore %357 %355 
                                Uniform f32* %359 = OpAccessChain %37 %358 
                                         f32 %360 = OpLoad %359 
                                       f32_3 %361 = OpCompositeConstruct %360 %360 %360 
                                       f32_3 %362 = OpLoad %75 
                                       f32_3 %363 = OpFMul %361 %362 
                                       f32_3 %364 = OpLoad %282 
                                       f32_3 %365 = OpFAdd %363 %364 
                                       f32_4 %366 = OpLoad %353 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %353 %367 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
float u_xlat21;
float u_xlat23;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat7 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat4 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat2.zzzz + u_xlat5;
    u_xlat2 = max(u_xlat4, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
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
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat13) + u_xlat2.x;
    u_xlat13 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat13;
    u_xlat13 = u_xlat13 * _LightShadowData.z + _LightShadowData.w;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb6)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat10.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat10.x, u_xlat6.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat6.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat10.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat10.xy);
    u_xlat13 = u_xlat13 + u_xlat10_3.x;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat6.x = min(u_xlat13, u_xlat6.x);
    u_xlat13 = (u_xlatb2) ? u_xlat6.x : u_xlat13;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat2;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 455
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %128 %134 %135 %149 %186 %189 %192 %193 %195 %417 %436 %448 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 RelaxedPrecision 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 RelaxedPrecision 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 RelaxedPrecision 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 RelaxedPrecision 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 RelaxedPrecision 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 RelaxedPrecision 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpMemberDecorate %17 12 RelaxedPrecision 
                                                      OpMemberDecorate %17 12 Offset 17 
                                                      OpMemberDecorate %17 13 Offset 17 
                                                      OpMemberDecorate %17 14 Offset 17 
                                                      OpMemberDecorate %17 15 Offset 17 
                                                      OpMemberDecorate %17 16 Offset 17 
                                                      OpMemberDecorate %17 17 Offset 17 
                                                      OpMemberDecorate %17 18 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %126 0 BuiltIn 126 
                                                      OpMemberDecorate %126 1 BuiltIn 126 
                                                      OpMemberDecorate %126 2 BuiltIn 126 
                                                      OpDecorate %126 Block 
                                                      OpDecorate %134 Location 134 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 Location 195 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %417 Location 417 
                                                      OpDecorate %436 Location 436 
                                                      OpDecorate %448 Location 448 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %7 %12 %7 %7 %7 %7 %7 %7 %7 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 16 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 17 
                                          f32 %39 = OpConstant 3.67402E-40 
                                 Private f32* %42 = OpVariable Private 
                                          f32 %46 = OpConstant 3.67402E-40 
                                              %48 = OpTypePointer Input %7 
                                 Input f32_4* %49 = OpVariable Input 
                                          u32 %50 = OpConstant 1 
                                              %51 = OpTypePointer Input %6 
                                          i32 %62 = OpConstant 13 
                                          i32 %63 = OpConstant 1 
                                              %64 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 0 
                                          i32 %76 = OpConstant 2 
                               Private f32_4* %84 = OpVariable Private 
                                          i32 %86 = OpConstant 3 
                               Private f32_4* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 15 
                                             %125 = OpTypeArray %6 %50 
                                             %126 = OpTypeStruct %7 %6 %125 
                                             %127 = OpTypePointer Output %126 
        Output struct {f32_4; f32; f32[1];}* %128 = OpVariable Output 
                                             %130 = OpTypePointer Output %7 
                                             %132 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Output %132 
                               Output f32_2* %134 = OpVariable Output 
                                Input f32_4* %135 = OpVariable Input 
                                         i32 %138 = OpConstant 18 
                                             %147 = OpTypeVector %6 3 
                                             %148 = OpTypePointer Input %147 
                                Input f32_3* %149 = OpVariable Input 
                                         i32 %151 = OpConstant 14 
                                         u32 %168 = OpConstant 2 
                                Private f32* %170 = OpVariable Private 
                                             %185 = OpTypePointer Output %147 
                               Output f32_3* %186 = OpVariable Output 
                               Output f32_3* %189 = OpVariable Output 
                               Output f32_4* %192 = OpVariable Output 
                                Input f32_4* %193 = OpVariable Input 
                               Output f32_4* %195 = OpVariable Output 
                                             %197 = OpTypePointer Private %147 
                              Private f32_3* %198 = OpVariable Private 
                              Private f32_4* %215 = OpVariable Private 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %222 = OpConstant 9 
                                         i32 %228 = OpConstant 10 
                                         i32 %234 = OpConstant 11 
                                         i32 %240 = OpConstant 12 
                                         u32 %249 = OpConstant 3 
                                         i32 %251 = OpConstant 6 
                                         i32 %257 = OpConstant 7 
                                         i32 %263 = OpConstant 8 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %274 %274 %274 
                              Private f32_3* %277 = OpVariable Private 
                                         f32 %281 = OpConstant 3.67402E-40 
                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_3 %288 = OpConstantComposite %287 %287 %287 
                                         f32 %290 = OpConstant 3.67402E-40 
                                       f32_3 %291 = OpConstantComposite %290 %290 %290 
                              Private f32_4* %295 = OpVariable Private 
                              Private f32_4* %302 = OpVariable Private 
                              Private f32_4* %310 = OpVariable Private 
                                         f32 %346 = OpConstant 3.67402E-40 
                                       f32_4 %347 = OpConstantComposite %346 %346 %346 %346 
                                         i32 %352 = OpConstant 4 
                                       f32_4 %356 = OpConstantComposite %46 %46 %46 %46 
                                       f32_4 %364 = OpConstantComposite %274 %274 %274 %274 
                                         i32 %371 = OpConstant 5 
                               Output f32_3* %417 = OpVariable Output 
                                       f32_2 %432 = OpConstantComposite %39 %39 
                               Output f32_4* %436 = OpVariable Output 
                               Output f32_4* %448 = OpVariable Output 
                                             %449 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                 Uniform f32* %33 = OpAccessChain %19 %32 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpFMul %31 %34 
                                 Private f32* %36 = OpAccessChain %9 %27 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %27 
                                          f32 %38 = OpLoad %37 
                                          f32 %40 = OpFMul %38 %39 
                                 Private f32* %41 = OpAccessChain %9 %27 
                                                      OpStore %41 %40 
                                 Uniform f32* %43 = OpAccessChain %19 %32 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFNegate %44 
                                          f32 %47 = OpFAdd %45 %46 
                                                      OpStore %42 %47 
                                   Input f32* %52 = OpAccessChain %49 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpLoad %42 
                                          f32 %55 = OpFMul %53 %54 
                                 Private f32* %56 = OpAccessChain %9 %27 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFAdd %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %27 
                                                      OpStore %59 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_4 %61 = OpVectorShuffle %60 %60 0 0 0 0 
                               Uniform f32_4* %65 = OpAccessChain %19 %62 %63 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFMul %61 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %19 %62 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %49 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %19 %62 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpVectorShuffle %79 %79 2 2 2 2 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %19 %62 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %84 %89 
                               Uniform f32_4* %90 = OpAccessChain %19 %62 %86 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %49 
                                        f32_4 %93 = OpVectorShuffle %92 %92 3 3 3 3 
                                        f32_4 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpFAdd %94 %95 
                                                      OpStore %9 %96 
                                        f32_4 %98 = OpLoad %84 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %101 = OpAccessChain %19 %100 %63 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpFMul %99 %102 
                                                      OpStore %97 %103 
                              Uniform f32_4* %104 = OpAccessChain %19 %100 %68 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %84 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %97 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %97 %110 
                              Uniform f32_4* %111 = OpAccessChain %19 %100 %76 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %84 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 2 2 2 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %97 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %97 %117 
                              Uniform f32_4* %118 = OpAccessChain %19 %100 %86 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpLoad %84 
                                       f32_4 %121 = OpVectorShuffle %120 %120 3 3 3 3 
                                       f32_4 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %97 
                                       f32_4 %124 = OpFAdd %122 %123 
                                                      OpStore %84 %124 
                                       f32_4 %129 = OpLoad %84 
                               Output f32_4* %131 = OpAccessChain %128 %68 
                                                      OpStore %131 %129 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              Uniform f32_4* %139 = OpAccessChain %19 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                              Uniform f32_4* %143 = OpAccessChain %19 %138 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
                                       f32_2 %146 = OpFAdd %142 %145 
                                                      OpStore %134 %146 
                                       f32_3 %150 = OpLoad %149 
                              Uniform f32_4* %152 = OpAccessChain %19 %151 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %150 %154 
                                Private f32* %156 = OpAccessChain %97 %27 
                                                      OpStore %156 %155 
                                       f32_3 %157 = OpLoad %149 
                              Uniform f32_4* %158 = OpAccessChain %19 %151 %63 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %97 %50 
                                                      OpStore %162 %161 
                                       f32_3 %163 = OpLoad %149 
                              Uniform f32_4* %164 = OpAccessChain %19 %151 %76 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                         f32 %167 = OpDot %163 %166 
                                Private f32* %169 = OpAccessChain %97 %168 
                                                      OpStore %169 %167 
                                       f32_4 %171 = OpLoad %97 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_4 %173 = OpLoad %97 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                         f32 %175 = OpDot %172 %174 
                                                      OpStore %170 %175 
                                         f32 %176 = OpLoad %170 
                                         f32 %177 = OpExtInst %1 32 %176 
                                                      OpStore %170 %177 
                                         f32 %178 = OpLoad %170 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %97 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %97 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %97 %184 
                                       f32_4 %187 = OpLoad %97 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                                      OpStore %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                                      OpStore %189 %191 
                                       f32_4 %194 = OpLoad %193 
                                                      OpStore %192 %194 
                                       f32_4 %196 = OpLoad %9 
                                                      OpStore %195 %196 
                                Private f32* %199 = OpAccessChain %97 %50 
                                         f32 %200 = OpLoad %199 
                                Private f32* %201 = OpAccessChain %97 %50 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %200 %202 
                                Private f32* %204 = OpAccessChain %198 %27 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %97 %27 
                                         f32 %206 = OpLoad %205 
                                Private f32* %207 = OpAccessChain %97 %27 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFMul %206 %208 
                                Private f32* %210 = OpAccessChain %198 %27 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFNegate %211 
                                         f32 %213 = OpFAdd %209 %212 
                                Private f32* %214 = OpAccessChain %198 %27 
                                                      OpStore %214 %213 
                                       f32_4 %216 = OpLoad %97 
                                       f32_4 %217 = OpVectorShuffle %216 %216 1 2 2 0 
                                       f32_4 %218 = OpLoad %97 
                                       f32_4 %219 = OpVectorShuffle %218 %218 0 1 2 2 
                                       f32_4 %220 = OpFMul %217 %219 
                                                      OpStore %215 %220 
                              Uniform f32_4* %223 = OpAccessChain %19 %222 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %215 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %221 %27 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %19 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %215 
                                         f32 %232 = OpDot %230 %231 
                                Private f32* %233 = OpAccessChain %221 %50 
                                                      OpStore %233 %232 
                              Uniform f32_4* %235 = OpAccessChain %19 %234 
                                       f32_4 %236 = OpLoad %235 
                                       f32_4 %237 = OpLoad %215 
                                         f32 %238 = OpDot %236 %237 
                                Private f32* %239 = OpAccessChain %221 %168 
                                                      OpStore %239 %238 
                              Uniform f32_4* %241 = OpAccessChain %19 %240 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %198 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %247 = OpLoad %221 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %198 %248 
                                Private f32* %250 = OpAccessChain %97 %249 
                                                      OpStore %250 %46 
                              Uniform f32_4* %252 = OpAccessChain %19 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpLoad %97 
                                         f32 %255 = OpDot %253 %254 
                                Private f32* %256 = OpAccessChain %215 %27 
                                                      OpStore %256 %255 
                              Uniform f32_4* %258 = OpAccessChain %19 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %97 
                                         f32 %261 = OpDot %259 %260 
                                Private f32* %262 = OpAccessChain %215 %50 
                                                      OpStore %262 %261 
                              Uniform f32_4* %264 = OpAccessChain %19 %263 
                                       f32_4 %265 = OpLoad %264 
                                       f32_4 %266 = OpLoad %97 
                                         f32 %267 = OpDot %265 %266 
                                Private f32* %268 = OpAccessChain %215 %168 
                                                      OpStore %268 %267 
                                       f32_3 %269 = OpLoad %198 
                                       f32_4 %270 = OpLoad %215 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFAdd %269 %271 
                                                      OpStore %198 %272 
                                       f32_3 %273 = OpLoad %198 
                                       f32_3 %276 = OpExtInst %1 40 %273 %275 
                                                      OpStore %198 %276 
                                       f32_3 %278 = OpLoad %198 
                                       f32_3 %279 = OpExtInst %1 30 %278 
                                                      OpStore %277 %279 
                                       f32_3 %280 = OpLoad %277 
                                       f32_3 %283 = OpFMul %280 %282 
                                                      OpStore %277 %283 
                                       f32_3 %284 = OpLoad %277 
                                       f32_3 %285 = OpExtInst %1 29 %284 
                                                      OpStore %277 %285 
                                       f32_3 %286 = OpLoad %277 
                                       f32_3 %289 = OpFMul %286 %288 
                                       f32_3 %292 = OpFAdd %289 %291 
                                                      OpStore %277 %292 
                                       f32_3 %293 = OpLoad %277 
                                       f32_3 %294 = OpExtInst %1 40 %293 %275 
                                                      OpStore %277 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_4 %297 = OpVectorShuffle %296 %296 1 1 1 1 
                                       f32_4 %298 = OpFNegate %297 
                              Uniform f32_4* %299 = OpAccessChain %19 %76 
                                       f32_4 %300 = OpLoad %299 
                                       f32_4 %301 = OpFAdd %298 %300 
                                                      OpStore %295 %301 
                                       f32_4 %303 = OpLoad %97 
                                       f32_4 %304 = OpVectorShuffle %303 %303 1 1 1 1 
                                       f32_4 %305 = OpLoad %295 
                                       f32_4 %306 = OpFMul %304 %305 
                                                      OpStore %302 %306 
                                       f32_4 %307 = OpLoad %295 
                                       f32_4 %308 = OpLoad %295 
                                       f32_4 %309 = OpFMul %307 %308 
                                                      OpStore %295 %309 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpVectorShuffle %311 %311 0 0 0 0 
                                       f32_4 %313 = OpFNegate %312 
                              Uniform f32_4* %314 = OpAccessChain %19 %63 
                                       f32_4 %315 = OpLoad %314 
                                       f32_4 %316 = OpFAdd %313 %315 
                                                      OpStore %310 %316 
                                       f32_4 %317 = OpLoad %9 
                                       f32_4 %318 = OpVectorShuffle %317 %317 2 2 2 2 
                                       f32_4 %319 = OpFNegate %318 
                              Uniform f32_4* %320 = OpAccessChain %19 %86 
                                       f32_4 %321 = OpLoad %320 
                                       f32_4 %322 = OpFAdd %319 %321 
                                                      OpStore %9 %322 
                                       f32_4 %323 = OpLoad %310 
                                       f32_4 %324 = OpLoad %97 
                                       f32_4 %325 = OpVectorShuffle %324 %324 0 0 0 0 
                                       f32_4 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %302 
                                       f32_4 %328 = OpFAdd %326 %327 
                                                      OpStore %302 %328 
                                       f32_4 %329 = OpLoad %310 
                                       f32_4 %330 = OpLoad %310 
                                       f32_4 %331 = OpFMul %329 %330 
                                       f32_4 %332 = OpLoad %295 
                                       f32_4 %333 = OpFAdd %331 %332 
                                                      OpStore %295 %333 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpLoad %9 
                                       f32_4 %336 = OpFMul %334 %335 
                                       f32_4 %337 = OpLoad %295 
                                       f32_4 %338 = OpFAdd %336 %337 
                                                      OpStore %295 %338 
                                       f32_4 %339 = OpLoad %9 
                                       f32_4 %340 = OpLoad %97 
                                       f32_4 %341 = OpVectorShuffle %340 %340 2 2 2 2 
                                       f32_4 %342 = OpFMul %339 %341 
                                       f32_4 %343 = OpLoad %302 
                                       f32_4 %344 = OpFAdd %342 %343 
                                                      OpStore %9 %344 
                                       f32_4 %345 = OpLoad %295 
                                       f32_4 %348 = OpExtInst %1 40 %345 %347 
                                                      OpStore %97 %348 
                                       f32_4 %349 = OpLoad %97 
                                       f32_4 %350 = OpExtInst %1 32 %349 
                                                      OpStore %295 %350 
                                       f32_4 %351 = OpLoad %97 
                              Uniform f32_4* %353 = OpAccessChain %19 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                       f32_4 %357 = OpFAdd %355 %356 
                                                      OpStore %97 %357 
                                       f32_4 %358 = OpLoad %97 
                                       f32_4 %359 = OpFDiv %356 %358 
                                                      OpStore %97 %359 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %361 = OpLoad %295 
                                       f32_4 %362 = OpFMul %360 %361 
                                                      OpStore %9 %362 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %365 = OpExtInst %1 40 %363 %364 
                                                      OpStore %9 %365 
                                       f32_4 %366 = OpLoad %97 
                                       f32_4 %367 = OpLoad %9 
                                       f32_4 %368 = OpFMul %366 %367 
                                                      OpStore %9 %368 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 1 1 1 
                              Uniform f32_4* %372 = OpAccessChain %19 %371 %63 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpFMul %370 %374 
                                       f32_4 %376 = OpLoad %97 
                                       f32_4 %377 = OpVectorShuffle %376 %375 4 5 6 3 
                                                      OpStore %97 %377 
                              Uniform f32_4* %378 = OpAccessChain %19 %371 %68 
                                       f32_4 %379 = OpLoad %378 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_4 %381 = OpLoad %9 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 0 0 
                                       f32_3 %383 = OpFMul %380 %382 
                                       f32_4 %384 = OpLoad %97 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %97 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %97 %388 
                              Uniform f32_4* %389 = OpAccessChain %19 %371 %76 
                                       f32_4 %390 = OpLoad %389 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 2 2 2 
                                       f32_3 %394 = OpFMul %391 %393 
                                       f32_4 %395 = OpLoad %97 
                                       f32_3 %396 = OpVectorShuffle %395 %395 0 1 2 
                                       f32_3 %397 = OpFAdd %394 %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %9 %399 
                              Uniform f32_4* %400 = OpAccessChain %19 %371 %86 
                                       f32_4 %401 = OpLoad %400 
                                       f32_3 %402 = OpVectorShuffle %401 %401 0 1 2 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 3 3 3 
                                       f32_3 %405 = OpFMul %402 %404 
                                       f32_4 %406 = OpLoad %9 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                       f32_3 %408 = OpFAdd %405 %407 
                                       f32_4 %409 = OpLoad %9 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                      OpStore %9 %410 
                                       f32_4 %411 = OpLoad %9 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 2 
                                       f32_3 %413 = OpLoad %277 
                                       f32_3 %414 = OpFAdd %412 %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
                                                      OpStore %9 %416 
                                       f32_4 %418 = OpLoad %9 
                                       f32_3 %419 = OpVectorShuffle %418 %418 0 1 2 
                                                      OpStore %417 %419 
                                Private f32* %420 = OpAccessChain %84 %50 
                                         f32 %421 = OpLoad %420 
                                Uniform f32* %422 = OpAccessChain %19 %68 %27 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFMul %421 %423 
                                Private f32* %425 = OpAccessChain %9 %27 
                                                      OpStore %425 %424 
                                Private f32* %426 = OpAccessChain %9 %27 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFMul %427 %39 
                                Private f32* %429 = OpAccessChain %9 %249 
                                                      OpStore %429 %428 
                                       f32_4 %430 = OpLoad %84 
                                       f32_2 %431 = OpVectorShuffle %430 %430 0 3 
                                       f32_2 %433 = OpFMul %431 %432 
                                       f32_4 %434 = OpLoad %9 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 1 5 3 
                                                      OpStore %9 %435 
                                       f32_4 %437 = OpLoad %84 
                                       f32_2 %438 = OpVectorShuffle %437 %437 2 3 
                                       f32_4 %439 = OpLoad %436 
                                       f32_4 %440 = OpVectorShuffle %439 %438 0 1 4 5 
                                                      OpStore %436 %440 
                                       f32_4 %441 = OpLoad %9 
                                       f32_2 %442 = OpVectorShuffle %441 %441 2 2 
                                       f32_4 %443 = OpLoad %9 
                                       f32_2 %444 = OpVectorShuffle %443 %443 0 3 
                                       f32_2 %445 = OpFAdd %442 %444 
                                       f32_4 %446 = OpLoad %436 
                                       f32_4 %447 = OpVectorShuffle %446 %445 4 5 2 3 
                                                      OpStore %436 %447 
                                                      OpStore %448 %364 
                                 Output f32* %450 = OpAccessChain %128 %68 %50 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFNegate %451 
                                 Output f32* %453 = OpAccessChain %128 %68 %50 
                                                      OpStore %453 %452 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %116 %292 %347 %353 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 RelaxedPrecision 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 RelaxedPrecision 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpMemberDecorate %35 9 RelaxedPrecision 
                                                      OpMemberDecorate %35 9 Offset 35 
                                                      OpMemberDecorate %35 10 Offset 35 
                                                      OpMemberDecorate %35 11 Offset 35 
                                                      OpMemberDecorate %35 12 Offset 35 
                                                      OpMemberDecorate %35 13 RelaxedPrecision 
                                                      OpMemberDecorate %35 13 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %191 SpecId 191 
                                                      OpDecorate %271 DescriptorSet 271 
                                                      OpDecorate %271 Binding 271 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 DescriptorSet 301 
                                                      OpDecorate %301 Binding 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %347 Location 347 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %364 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypeInt 32 0 
                                          u32 %32 = OpConstant 4 
                                              %33 = OpTypeArray %7 %32 
                                              %34 = OpTypeArray %7 %32 
                                              %35 = OpTypeStruct %30 %7 %7 %7 %33 %7 %34 %30 %30 %7 %6 %6 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 12 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                              %74 = OpTypePointer Private %30 
                               Private f32_3* %75 = OpVariable Private 
                                          i32 %80 = OpConstant 11 
                                          i32 %97 = OpConstant 13 
                               Private bool* %103 = OpVariable Private 
                              Private f32_3* %114 = OpVariable Private 
                                             %115 = OpTypePointer Input %30 
                                Input f32_3* %116 = OpVariable Input 
                                             %119 = OpTypePointer Uniform %30 
                              Private f32_3* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 4 
                                         u32 %125 = OpConstant 2 
                                         u32 %131 = OpConstant 1 
                                         i32 %133 = OpConstant 2 
                                Private f32* %137 = OpVariable Private 
                                         i32 %142 = OpConstant 3 
                                             %143 = OpTypePointer Uniform %7 
                                         f32 %178 = OpConstant 3.67402E-40 
                               Private bool* %180 = OpVariable Private 
                                         i32 %181 = OpConstant 5 
                                        bool %185 = OpConstantFalse 
                                        bool %191 = OpSpecConstantFalse 
                               Private bool* %194 = OpVariable Private 
                                         i32 %200 = OpConstant 6 
                              Private f32_3* %226 = OpVariable Private 
                                             %227 = OpTypePointer Function %30 
                                         i32 %237 = OpConstant 8 
                              Private f32_4* %242 = OpVariable Private 
                                         i32 %244 = OpConstant 7 
                                         f32 %252 = OpConstant 3.67402E-40 
                                         f32 %254 = OpConstant 3.67402E-40 
                                Private f32* %257 = OpVariable Private 
                                         f32 %260 = OpConstant 3.67402E-40 
                                             %268 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %269 = OpTypeSampledImage %268 
                                             %270 = OpTypePointer UniformConstant %269 
 UniformConstant read_only Texture3DSampled* %271 = OpVariable UniformConstant 
                              Private f32_3* %282 = OpVariable Private 
                                Input f32_4* %292 = OpVariable Input 
                                Private f32* %300 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %301 = OpVariable UniformConstant 
                              Private f32_3* %307 = OpVariable Private 
                                             %322 = OpTypePointer Function %6 
                                         i32 %336 = OpConstant 9 
                                Input f32_3* %347 = OpVariable Input 
                                             %352 = OpTypePointer Output %7 
                               Output f32_4* %353 = OpVariable Output 
                                             %356 = OpTypePointer Output %6 
                                         i32 %358 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %228 = OpVariable Function 
                               Function f32* %323 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_4 %76 = OpLoad %29 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpExtInst %1 30 %77 
                                                      OpStore %75 %78 
                                        f32_3 %79 = OpLoad %75 
                                 Uniform f32* %81 = OpAccessChain %37 %80 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %37 %80 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %37 %80 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %79 %91 
                                                      OpStore %75 %92 
                                        f32_3 %93 = OpLoad %75 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %75 %94 
                                 Private f32* %95 = OpAccessChain %29 %49 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %98 = OpAccessChain %37 %97 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %101 = OpFAdd %96 %100 
                                Private f32* %102 = OpAccessChain %48 %55 
                                                      OpStore %102 %101 
                                Private f32* %104 = OpAccessChain %48 %55 
                                         f32 %105 = OpLoad %104 
                                        bool %106 = OpFOrdLessThan %105 %62 
                                                      OpStore %103 %106 
                                        bool %107 = OpLoad %103 
                                         i32 %108 = OpSelect %107 %66 %65 
                                         i32 %109 = OpIMul %108 %68 
                                        bool %110 = OpINotEqual %109 %65 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                       f32_3 %117 = OpLoad %116 
                                       f32_3 %118 = OpFNegate %117 
                              Uniform f32_3* %120 = OpAccessChain %37 %65 
                                       f32_3 %121 = OpLoad %120 
                                       f32_3 %122 = OpFAdd %118 %121 
                                                      OpStore %114 %122 
                                Uniform f32* %126 = OpAccessChain %37 %124 %65 %125 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %123 %55 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %37 %124 %66 %125 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %123 %131 
                                                      OpStore %132 %130 
                                Uniform f32* %134 = OpAccessChain %37 %124 %133 %125 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %123 %125 
                                                      OpStore %136 %135 
                                       f32_3 %138 = OpLoad %114 
                                       f32_3 %139 = OpLoad %123 
                                         f32 %140 = OpDot %138 %139 
                                                      OpStore %137 %140 
                                       f32_3 %141 = OpLoad %116 
                              Uniform f32_4* %144 = OpAccessChain %37 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFNegate %146 
                                       f32_3 %148 = OpFAdd %141 %147 
                                                      OpStore %114 %148 
                                       f32_3 %149 = OpLoad %114 
                                       f32_3 %150 = OpLoad %114 
                                         f32 %151 = OpDot %149 %150 
                                Private f32* %152 = OpAccessChain %114 %55 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %114 %55 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpExtInst %1 31 %154 
                                Private f32* %156 = OpAccessChain %114 %55 
                                                      OpStore %156 %155 
                                         f32 %157 = OpLoad %137 
                                         f32 %158 = OpFNegate %157 
                                Private f32* %159 = OpAccessChain %114 %55 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFAdd %158 %160 
                                Private f32* %162 = OpAccessChain %114 %55 
                                                      OpStore %162 %161 
                                Uniform f32* %163 = OpAccessChain %37 %142 %49 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %114 %55 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                         f32 %168 = OpLoad %137 
                                         f32 %169 = OpFAdd %167 %168 
                                                      OpStore %137 %169 
                                         f32 %170 = OpLoad %137 
                                Uniform f32* %171 = OpAccessChain %37 %133 %125 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Uniform f32* %174 = OpAccessChain %37 %133 %49 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                                      OpStore %137 %176 
                                         f32 %177 = OpLoad %137 
                                         f32 %179 = OpExtInst %1 43 %177 %62 %178 
                                                      OpStore %137 %179 
                                Uniform f32* %182 = OpAccessChain %37 %181 %55 
                                         f32 %183 = OpLoad %182 
                                        bool %184 = OpFOrdEqual %183 %178 
                                                      OpStore %180 %184 
                                                      OpSelectionMerge %187 None 
                                                      OpBranchConditional %185 %186 %187 
                                             %186 = OpLabel 
                                        bool %188 = OpLoad %180 
                                                      OpSelectionMerge %190 None 
                                                      OpBranchConditional %188 %189 %190 
                                             %189 = OpLabel 
                                                      OpBranch %190 
                                             %190 = OpLabel 
                                                      OpBranch %187 
                                             %187 = OpLabel 
                                                      OpSelectionMerge %193 None 
                                                      OpBranchConditional %191 %192 %277 
                                             %192 = OpLabel 
                                Uniform f32* %195 = OpAccessChain %37 %181 %131 
                                         f32 %196 = OpLoad %195 
                                        bool %197 = OpFOrdEqual %196 %178 
                                                      OpStore %194 %197 
                                       f32_3 %198 = OpLoad %116 
                                       f32_3 %199 = OpVectorShuffle %198 %198 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %37 %200 %66 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %123 %204 
                              Uniform f32_4* %205 = OpAccessChain %37 %200 %65 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %116 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %123 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %123 %212 
                              Uniform f32_4* %213 = OpAccessChain %37 %200 %133 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %116 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %123 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %123 %220 
                                       f32_3 %221 = OpLoad %123 
                              Uniform f32_4* %222 = OpAccessChain %37 %200 %142 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFAdd %221 %224 
                                                      OpStore %123 %225 
                                        bool %229 = OpLoad %194 
                                                      OpSelectionMerge %231 None 
                                                      OpBranchConditional %229 %230 %233 
                                             %230 = OpLabel 
                                       f32_3 %232 = OpLoad %123 
                                                      OpStore %228 %232 
                                                      OpBranch %231 
                                             %233 = OpLabel 
                                       f32_3 %234 = OpLoad %116 
                                                      OpStore %228 %234 
                                                      OpBranch %231 
                                             %231 = OpLabel 
                                       f32_3 %235 = OpLoad %228 
                                                      OpStore %226 %235 
                                       f32_3 %236 = OpLoad %226 
                              Uniform f32_3* %238 = OpAccessChain %37 %237 
                                       f32_3 %239 = OpLoad %238 
                                       f32_3 %240 = OpFNegate %239 
                                       f32_3 %241 = OpFAdd %236 %240 
                                                      OpStore %226 %241 
                                       f32_3 %243 = OpLoad %226 
                              Uniform f32_3* %245 = OpAccessChain %37 %244 
                                       f32_3 %246 = OpLoad %245 
                                       f32_3 %247 = OpFMul %243 %246 
                                       f32_4 %248 = OpLoad %242 
                                       f32_4 %249 = OpVectorShuffle %248 %247 0 4 5 6 
                                                      OpStore %242 %249 
                                Private f32* %250 = OpAccessChain %242 %131 
                                         f32 %251 = OpLoad %250 
                                         f32 %253 = OpFMul %251 %252 
                                         f32 %255 = OpFAdd %253 %254 
                                Private f32* %256 = OpAccessChain %226 %55 
                                                      OpStore %256 %255 
                                Uniform f32* %258 = OpAccessChain %37 %181 %125 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %262 = OpFAdd %261 %254 
                                                      OpStore %257 %262 
                                         f32 %263 = OpLoad %257 
                                Private f32* %264 = OpAccessChain %226 %55 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpExtInst %1 40 %263 %265 
                                Private f32* %267 = OpAccessChain %242 %55 
                                                      OpStore %267 %266 
                  read_only Texture3DSampled %272 = OpLoad %271 
                                       f32_4 %273 = OpLoad %242 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 2 3 
                                       f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                                      OpStore %242 %275 
                                       f32_4 %276 = OpLoad %242 
                                                      OpStore %48 %276 
                                                      OpBranch %193 
                                             %277 = OpLabel 
                                Private f32* %278 = OpAccessChain %48 %55 
                                                      OpStore %278 %178 
                                Private f32* %279 = OpAccessChain %48 %131 
                                                      OpStore %279 %178 
                                Private f32* %280 = OpAccessChain %48 %125 
                                                      OpStore %280 %178 
                                Private f32* %281 = OpAccessChain %48 %49 
                                                      OpStore %281 %178 
                                                      OpBranch %193 
                                             %193 = OpLabel 
                                       f32_4 %283 = OpLoad %48 
                              Uniform f32_4* %284 = OpAccessChain %37 %66 
                                       f32_4 %285 = OpLoad %284 
                                         f32 %286 = OpDot %283 %285 
                                Private f32* %287 = OpAccessChain %282 %55 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %282 %55 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpExtInst %1 43 %289 %62 %178 
                                Private f32* %291 = OpAccessChain %282 %55 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %292 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpLoad %292 
                                       f32_2 %296 = OpVectorShuffle %295 %295 3 3 
                                       f32_2 %297 = OpFDiv %294 %296 
                                       f32_3 %298 = OpLoad %226 
                                       f32_3 %299 = OpVectorShuffle %298 %297 3 4 2 
                                                      OpStore %226 %299 
                  read_only Texture2DSampled %302 = OpLoad %301 
                                       f32_3 %303 = OpLoad %226 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_4 %305 = OpImageSampleImplicitLod %302 %304 
                                         f32 %306 = OpCompositeExtract %305 0 
                                                      OpStore %300 %306 
                                         f32 %308 = OpLoad %137 
                                         f32 %309 = OpLoad %300 
                                         f32 %310 = OpFAdd %308 %309 
                                Private f32* %311 = OpAccessChain %307 %55 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %307 %55 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 43 %313 %62 %178 
                                Private f32* %315 = OpAccessChain %307 %55 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %307 %55 
                                         f32 %317 = OpLoad %316 
                                Private f32* %318 = OpAccessChain %282 %55 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpExtInst %1 37 %317 %319 
                                Private f32* %321 = OpAccessChain %282 %55 
                                                      OpStore %321 %320 
                                        bool %324 = OpLoad %180 
                                                      OpSelectionMerge %326 None 
                                                      OpBranchConditional %324 %325 %329 
                                             %325 = OpLabel 
                                Private f32* %327 = OpAccessChain %282 %55 
                                         f32 %328 = OpLoad %327 
                                                      OpStore %323 %328 
                                                      OpBranch %326 
                                             %329 = OpLabel 
                                Private f32* %330 = OpAccessChain %307 %55 
                                         f32 %331 = OpLoad %330 
                                                      OpStore %323 %331 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         f32 %332 = OpLoad %323 
                                Private f32* %333 = OpAccessChain %282 %55 
                                                      OpStore %333 %332 
                                       f32_4 %334 = OpLoad %29 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                              Uniform f32_4* %337 = OpAccessChain %37 %336 
                                       f32_4 %338 = OpLoad %337 
                                       f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                       f32_3 %340 = OpFMul %335 %339 
                                                      OpStore %307 %340 
                                       f32_3 %341 = OpLoad %282 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpLoad %307 
                                       f32_3 %344 = OpFMul %342 %343 
                                                      OpStore %282 %344 
                                       f32_4 %345 = OpLoad %29 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %348 = OpLoad %347 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_3 %350 = OpLoad %282 
                                       f32_3 %351 = OpFAdd %349 %350 
                                                      OpStore %282 %351 
                                Private f32* %354 = OpAccessChain %29 %49 
                                         f32 %355 = OpLoad %354 
                                 Output f32* %357 = OpAccessChain %353 %49 
                                                      OpStore %357 %355 
                                Uniform f32* %359 = OpAccessChain %37 %358 
                                         f32 %360 = OpLoad %359 
                                       f32_3 %361 = OpCompositeConstruct %360 %360 %360 
                                       f32_3 %362 = OpLoad %75 
                                       f32_3 %363 = OpFMul %361 %362 
                                       f32_3 %364 = OpLoad %282 
                                       f32_3 %365 = OpFAdd %363 %364 
                                       f32_4 %366 = OpLoad %353 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %353 %367 
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
  GpuProgramID 76654
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %95 %264 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 RelaxedPrecision 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 RelaxedPrecision 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 RelaxedPrecision 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %138 SpecId 138 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %243 DescriptorSet 243 
                                                      OpDecorate %243 Binding 243 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %267 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeArray %7 %31 
                                              %35 = OpTypeStruct %7 %7 %32 %33 %33 %7 %34 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 7 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                          i32 %76 = OpConstant 8 
                                              %92 = OpTypePointer Private %33 
                               Private f32_3* %93 = OpVariable Private 
                                              %94 = OpTypePointer Input %33 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                              %99 = OpTypePointer Uniform %7 
                                         i32 %112 = OpConstant 2 
                                         i32 %122 = OpConstant 3 
                               Private bool* %127 = OpVariable Private 
                                         f32 %130 = OpConstant 3.67402E-40 
                                        bool %132 = OpConstantFalse 
                                        bool %138 = OpSpecConstantFalse 
                                         u32 %141 = OpConstant 1 
                              Private f32_3* %145 = OpVariable Private 
                                             %173 = OpTypePointer Function %33 
                                         i32 %183 = OpConstant 4 
                                             %184 = OpTypePointer Uniform %33 
                              Private f32_4* %189 = OpVariable Private 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         f32 %201 = OpConstant 3.67402E-40 
                                         u32 %203 = OpConstant 2 
                                         f32 %206 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                              Private f32_3* %229 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %243 = OpVariable UniformConstant 
                                         i32 %258 = OpConstant 5 
                                             %263 = OpTypePointer Output %7 
                               Output f32_4* %264 = OpVariable Output 
                                             %273 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %174 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                 Private f32* %74 = OpAccessChain %29 %49 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %77 = OpAccessChain %37 %76 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                          f32 %80 = OpFAdd %75 %79 
                                 Private f32* %81 = OpAccessChain %48 %55 
                                                      OpStore %81 %80 
                                 Private f32* %82 = OpAccessChain %48 %55 
                                          f32 %83 = OpLoad %82 
                                         bool %84 = OpFOrdLessThan %83 %62 
                                                      OpStore %59 %84 
                                         bool %85 = OpLoad %59 
                                          i32 %86 = OpSelect %85 %66 %65 
                                          i32 %87 = OpIMul %86 %68 
                                         bool %88 = OpINotEqual %87 %65 
                                                      OpSelectionMerge %90 None 
                                                      OpBranchConditional %88 %89 %90 
                                              %89 = OpLabel 
                                                      OpKill
                                              %90 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %37 %98 %66 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                                       f32_3 %103 = OpFMul %97 %102 
                                                      OpStore %93 %103 
                              Uniform f32_4* %104 = OpAccessChain %37 %98 %65 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpLoad %95 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 0 0 
                                       f32_3 %109 = OpFMul %106 %108 
                                       f32_3 %110 = OpLoad %93 
                                       f32_3 %111 = OpFAdd %109 %110 
                                                      OpStore %93 %111 
                              Uniform f32_4* %113 = OpAccessChain %37 %98 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpLoad %95 
                                       f32_3 %117 = OpVectorShuffle %116 %116 2 2 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %119 = OpLoad %93 
                                       f32_3 %120 = OpFAdd %118 %119 
                                                      OpStore %93 %120 
                                       f32_3 %121 = OpLoad %93 
                              Uniform f32_4* %123 = OpAccessChain %37 %98 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFAdd %121 %125 
                                                      OpStore %93 %126 
                                Uniform f32* %128 = OpAccessChain %37 %66 %55 
                                         f32 %129 = OpLoad %128 
                                        bool %131 = OpFOrdEqual %129 %130 
                                                      OpStore %127 %131 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %134 
                                             %133 = OpLabel 
                                        bool %135 = OpLoad %127 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpBranch %134 
                                             %134 = OpLabel 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %224 
                                             %139 = OpLabel 
                                Uniform f32* %142 = OpAccessChain %37 %66 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %130 
                                                      OpStore %127 %144 
                                       f32_3 %146 = OpLoad %95 
                                       f32_3 %147 = OpVectorShuffle %146 %146 1 1 1 
                              Uniform f32_4* %148 = OpAccessChain %37 %112 %66 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpFMul %147 %150 
                                                      OpStore %145 %151 
                              Uniform f32_4* %152 = OpAccessChain %37 %112 %65 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %95 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_3 %158 = OpLoad %145 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %145 %159 
                              Uniform f32_4* %160 = OpAccessChain %37 %112 %112 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpLoad %95 
                                       f32_3 %164 = OpVectorShuffle %163 %163 2 2 2 
                                       f32_3 %165 = OpFMul %162 %164 
                                       f32_3 %166 = OpLoad %145 
                                       f32_3 %167 = OpFAdd %165 %166 
                                                      OpStore %145 %167 
                                       f32_3 %168 = OpLoad %145 
                              Uniform f32_4* %169 = OpAccessChain %37 %112 %122 
                                       f32_4 %170 = OpLoad %169 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFAdd %168 %171 
                                                      OpStore %145 %172 
                                        bool %175 = OpLoad %127 
                                                      OpSelectionMerge %177 None 
                                                      OpBranchConditional %175 %176 %179 
                                             %176 = OpLabel 
                                       f32_3 %178 = OpLoad %145 
                                                      OpStore %174 %178 
                                                      OpBranch %177 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %95 
                                                      OpStore %174 %180 
                                                      OpBranch %177 
                                             %177 = OpLabel 
                                       f32_3 %181 = OpLoad %174 
                                                      OpStore %145 %181 
                                       f32_3 %182 = OpLoad %145 
                              Uniform f32_3* %185 = OpAccessChain %37 %183 
                                       f32_3 %186 = OpLoad %185 
                                       f32_3 %187 = OpFNegate %186 
                                       f32_3 %188 = OpFAdd %182 %187 
                                                      OpStore %145 %188 
                                       f32_3 %190 = OpLoad %145 
                              Uniform f32_3* %191 = OpAccessChain %37 %122 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %189 
                                       f32_4 %195 = OpVectorShuffle %194 %193 0 4 5 6 
                                                      OpStore %189 %195 
                                Private f32* %197 = OpAccessChain %189 %141 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %202 = OpFAdd %200 %201 
                                                      OpStore %196 %202 
                                Uniform f32* %204 = OpAccessChain %37 %66 %203 
                                         f32 %205 = OpLoad %204 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %208 = OpFAdd %207 %201 
                                Private f32* %209 = OpAccessChain %145 %55 
                                                      OpStore %209 %208 
                                         f32 %210 = OpLoad %196 
                                Private f32* %211 = OpAccessChain %145 %55 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 40 %210 %212 
                                Private f32* %214 = OpAccessChain %189 %55 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %189 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %189 %222 
                                       f32_4 %223 = OpLoad %189 
                                                      OpStore %48 %223 
                                                      OpBranch %140 
                                             %224 = OpLabel 
                                Private f32* %225 = OpAccessChain %48 %55 
                                                      OpStore %225 %130 
                                Private f32* %226 = OpAccessChain %48 %141 
                                                      OpStore %226 %130 
                                Private f32* %227 = OpAccessChain %48 %203 
                                                      OpStore %227 %130 
                                Private f32* %228 = OpAccessChain %48 %49 
                                                      OpStore %228 %130 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                       f32_4 %230 = OpLoad %48 
                              Uniform f32_4* %231 = OpAccessChain %37 %65 
                                       f32_4 %232 = OpLoad %231 
                                         f32 %233 = OpDot %230 %232 
                                Private f32* %234 = OpAccessChain %229 %55 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %229 %55 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpExtInst %1 43 %236 %62 %130 
                                Private f32* %238 = OpAccessChain %229 %55 
                                                      OpStore %238 %237 
                                       f32_3 %239 = OpLoad %93 
                                       f32_3 %240 = OpLoad %93 
                                         f32 %241 = OpDot %239 %240 
                                Private f32* %242 = OpAccessChain %93 %55 
                                                      OpStore %242 %241 
                  read_only Texture2DSampled %244 = OpLoad %243 
                                       f32_3 %245 = OpLoad %93 
                                       f32_2 %246 = OpVectorShuffle %245 %245 0 0 
                                       f32_4 %247 = OpImageSampleImplicitLod %244 %246 
                                         f32 %248 = OpCompositeExtract %247 3 
                                Private f32* %249 = OpAccessChain %93 %55 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %229 %55 
                                         f32 %251 = OpLoad %250 
                                Private f32* %252 = OpAccessChain %93 %55 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %251 %253 
                                Private f32* %255 = OpAccessChain %93 %55 
                                                      OpStore %255 %254 
                                       f32_4 %256 = OpLoad %29 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                              Uniform f32_4* %259 = OpAccessChain %37 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFMul %257 %261 
                                                      OpStore %229 %262 
                                       f32_3 %265 = OpLoad %93 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 0 0 
                                       f32_3 %267 = OpLoad %229 
                                       f32_3 %268 = OpFMul %266 %267 
                                       f32_4 %269 = OpLoad %264 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %264 %270 
                                Private f32* %271 = OpAccessChain %29 %49 
                                         f32 %272 = OpLoad %271 
                                 Output f32* %274 = OpAccessChain %264 %49 
                                                      OpStore %274 %272 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 227
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %107 %215 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpMemberDecorate %34 0 RelaxedPrecision 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpMemberDecorate %34 5 RelaxedPrecision 
                                                      OpMemberDecorate %34 5 Offset 34 
                                                      OpMemberDecorate %34 6 Offset 34 
                                                      OpMemberDecorate %34 7 RelaxedPrecision 
                                                      OpMemberDecorate %34 7 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %97 SpecId 97 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %189 DescriptorSet 189 
                                                      OpDecorate %189 Binding 189 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %215 Location 215 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeStruct %7 %7 %32 %33 %33 %7 %6 %6 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 6 
                                              %39 = OpTypePointer Uniform %6 
                                              %47 = OpTypePointer Private %6 
                                 Private f32* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                          f32 %52 = OpConstant 3.67402E-40 
                                              %54 = OpTypeBool 
                                              %55 = OpTypePointer Private %54 
                                Private bool* %56 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %72 = OpConstant 7 
                                          u32 %86 = OpConstant 0 
                                          f32 %89 = OpConstant 3.67402E-40 
                                         bool %91 = OpConstantFalse 
                                         bool %97 = OpSpecConstantFalse 
                                         u32 %100 = OpConstant 1 
                                             %104 = OpTypePointer Private %33 
                              Private f32_3* %105 = OpVariable Private 
                                             %106 = OpTypePointer Input %33 
                                Input f32_3* %107 = OpVariable Input 
                                         i32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %7 
                                         i32 %133 = OpConstant 3 
                              Private f32_4* %138 = OpVariable Private 
                                             %139 = OpTypePointer Function %33 
                                         i32 %152 = OpConstant 4 
                                             %153 = OpTypePointer Uniform %33 
                                         f32 %169 = OpConstant 3.67402E-40 
                                         f32 %171 = OpConstant 3.67402E-40 
                                Private f32* %174 = OpVariable Private 
                                         u32 %175 = OpConstant 2 
                                         f32 %178 = OpConstant 3.67402E-40 
                                             %186 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %187 = OpTypeSampledImage %186 
                                             %188 = OpTypePointer UniformConstant %187 
 UniformConstant read_only Texture3DSampled* %189 = OpVariable UniformConstant 
                              Private f32_3* %206 = OpVariable Private 
                                         i32 %209 = OpConstant 5 
                                             %214 = OpTypePointer Output %7 
                               Output f32_4* %215 = OpVariable Output 
                                             %224 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %140 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %40 = OpAccessChain %36 %38 
                                          f32 %41 = OpLoad %40 
                                        f32_4 %42 = OpCompositeConstruct %41 %41 %41 %41 
                                        f32_4 %43 = OpLoad %20 
                                        f32_4 %44 = OpFMul %42 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %29 %46 
                                 Private f32* %50 = OpAccessChain %29 %49 
                                          f32 %51 = OpLoad %50 
                                          f32 %53 = OpFAdd %51 %52 
                                                      OpStore %48 %53 
                                          f32 %57 = OpLoad %48 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %56 %59 
                                         bool %60 = OpLoad %56 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Private f32* %70 = OpAccessChain %29 %49 
                                          f32 %71 = OpLoad %70 
                                 Uniform f32* %73 = OpAccessChain %36 %72 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFNegate %74 
                                          f32 %76 = OpFAdd %71 %75 
                                                      OpStore %48 %76 
                                          f32 %77 = OpLoad %48 
                                         bool %78 = OpFOrdLessThan %77 %58 
                                                      OpStore %56 %78 
                                         bool %79 = OpLoad %56 
                                          i32 %80 = OpSelect %79 %62 %61 
                                          i32 %81 = OpIMul %80 %64 
                                         bool %82 = OpINotEqual %81 %61 
                                                      OpSelectionMerge %84 None 
                                                      OpBranchConditional %82 %83 %84 
                                              %83 = OpLabel 
                                                      OpKill
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %36 %62 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdEqual %88 %89 
                                                      OpStore %56 %90 
                                                      OpSelectionMerge %93 None 
                                                      OpBranchConditional %91 %92 %93 
                                              %92 = OpLabel 
                                         bool %94 = OpLoad %56 
                                                      OpSelectionMerge %96 None 
                                                      OpBranchConditional %94 %95 %96 
                                              %95 = OpLabel 
                                                      OpBranch %96 
                                              %96 = OpLabel 
                                                      OpBranch %93 
                                              %93 = OpLabel 
                                                      OpSelectionMerge %99 None 
                                                      OpBranchConditional %97 %98 %195 
                                              %98 = OpLabel 
                                Uniform f32* %101 = OpAccessChain %36 %62 %100 
                                         f32 %102 = OpLoad %101 
                                        bool %103 = OpFOrdEqual %102 %89 
                                                      OpStore %56 %103 
                                       f32_3 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 1 1 1 
                              Uniform f32_4* %112 = OpAccessChain %36 %110 %62 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFMul %109 %114 
                                                      OpStore %105 %115 
                              Uniform f32_4* %116 = OpAccessChain %36 %110 %61 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpLoad %107 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
                                       f32_3 %121 = OpFMul %118 %120 
                                       f32_3 %122 = OpLoad %105 
                                       f32_3 %123 = OpFAdd %121 %122 
                                                      OpStore %105 %123 
                              Uniform f32_4* %124 = OpAccessChain %36 %110 %110 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpLoad %107 
                                       f32_3 %128 = OpVectorShuffle %127 %127 2 2 2 
                                       f32_3 %129 = OpFMul %126 %128 
                                       f32_3 %130 = OpLoad %105 
                                       f32_3 %131 = OpFAdd %129 %130 
                                                      OpStore %105 %131 
                                       f32_3 %132 = OpLoad %105 
                              Uniform f32_4* %134 = OpAccessChain %36 %110 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %132 %136 
                                                      OpStore %105 %137 
                                        bool %141 = OpLoad %56 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %145 
                                             %142 = OpLabel 
                                       f32_3 %144 = OpLoad %105 
                                                      OpStore %140 %144 
                                                      OpBranch %143 
                                             %145 = OpLabel 
                                       f32_3 %146 = OpLoad %107 
                                                      OpStore %140 %146 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_3 %147 = OpLoad %140 
                                       f32_4 %148 = OpLoad %138 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %138 %149 
                                       f32_4 %150 = OpLoad %138 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                              Uniform f32_3* %154 = OpAccessChain %36 %152 
                                       f32_3 %155 = OpLoad %154 
                                       f32_3 %156 = OpFNegate %155 
                                       f32_3 %157 = OpFAdd %151 %156 
                                       f32_4 %158 = OpLoad %138 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %138 %159 
                                       f32_4 %160 = OpLoad %138 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              Uniform f32_3* %162 = OpAccessChain %36 %133 
                                       f32_3 %163 = OpLoad %162 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_4 %165 = OpLoad %138 
                                       f32_4 %166 = OpVectorShuffle %165 %164 0 4 5 6 
                                                      OpStore %138 %166 
                                Private f32* %167 = OpAccessChain %138 %100 
                                         f32 %168 = OpLoad %167 
                                         f32 %170 = OpFMul %168 %169 
                                         f32 %172 = OpFAdd %170 %171 
                                Private f32* %173 = OpAccessChain %105 %86 
                                                      OpStore %173 %172 
                                Uniform f32* %176 = OpAccessChain %36 %62 %175 
                                         f32 %177 = OpLoad %176 
                                         f32 %179 = OpFMul %177 %178 
                                         f32 %180 = OpFAdd %179 %171 
                                                      OpStore %174 %180 
                                Private f32* %181 = OpAccessChain %105 %86 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpLoad %174 
                                         f32 %184 = OpExtInst %1 40 %182 %183 
                                Private f32* %185 = OpAccessChain %138 %86 
                                                      OpStore %185 %184 
                  read_only Texture3DSampled %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %138 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 2 3 
                                       f32_4 %193 = OpImageSampleImplicitLod %190 %192 
                                                      OpStore %138 %193 
                                       f32_4 %194 = OpLoad %138 
                                                      OpStore %20 %194 
                                                      OpBranch %99 
                                             %195 = OpLabel 
                                Private f32* %196 = OpAccessChain %20 %86 
                                                      OpStore %196 %89 
                                Private f32* %197 = OpAccessChain %20 %100 
                                                      OpStore %197 %89 
                                Private f32* %198 = OpAccessChain %20 %175 
                                                      OpStore %198 %89 
                                Private f32* %199 = OpAccessChain %20 %49 
                                                      OpStore %199 %89 
                                                      OpBranch %99 
                                              %99 = OpLabel 
                                       f32_4 %200 = OpLoad %20 
                              Uniform f32_4* %201 = OpAccessChain %36 %61 
                                       f32_4 %202 = OpLoad %201 
                                         f32 %203 = OpDot %200 %202 
                                                      OpStore %48 %203 
                                         f32 %204 = OpLoad %48 
                                         f32 %205 = OpExtInst %1 43 %204 %58 %89 
                                                      OpStore %48 %205 
                                       f32_4 %207 = OpLoad %29 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %36 %209 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFMul %208 %212 
                                                      OpStore %206 %213 
                                         f32 %216 = OpLoad %48 
                                       f32_3 %217 = OpCompositeConstruct %216 %216 %216 
                                       f32_3 %218 = OpLoad %206 
                                       f32_3 %219 = OpFMul %217 %218 
                                       f32_4 %220 = OpLoad %215 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %215 %221 
                                Private f32* %222 = OpAccessChain %29 %49 
                                         f32 %223 = OpLoad %222 
                                 Output f32* %225 = OpAccessChain %215 %49 
                                                      OpStore %225 %223 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
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
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                                      OpStore %190 %189 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %94 %302 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 RelaxedPrecision 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 RelaxedPrecision 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 RelaxedPrecision 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %133 SpecId 133 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %260 DescriptorSet 260 
                                                      OpDecorate %260 Binding 260 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %277 DescriptorSet 277 
                                                      OpDecorate %277 Binding 277 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %302 Location 302 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeArray %7 %31 
                                              %35 = OpTypeStruct %7 %7 %32 %33 %33 %7 %34 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 7 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                          i32 %76 = OpConstant 8 
                               Private f32_4* %92 = OpVariable Private 
                                              %93 = OpTypePointer Input %33 
                                 Input f32_3* %94 = OpVariable Input 
                                          i32 %97 = OpConstant 6 
                                              %98 = OpTypePointer Uniform %7 
                                         i32 %109 = OpConstant 2 
                                         i32 %118 = OpConstant 3 
                               Private bool* %122 = OpVariable Private 
                                         f32 %125 = OpConstant 3.67402E-40 
                                        bool %127 = OpConstantFalse 
                                        bool %133 = OpSpecConstantFalse 
                                         u32 %136 = OpConstant 1 
                                             %140 = OpTypePointer Private %33 
                              Private f32_3* %141 = OpVariable Private 
                              Private f32_3* %169 = OpVariable Private 
                                             %170 = OpTypePointer Function %33 
                                         i32 %180 = OpConstant 4 
                                             %181 = OpTypePointer Uniform %33 
                              Private f32_4* %186 = OpVariable Private 
                                         f32 %195 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         u32 %200 = OpConstant 2 
                                         f32 %203 = OpConstant 3.67402E-40 
                                             %213 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture3DSampled* %216 = OpVariable UniformConstant 
                                Private f32* %227 = OpVariable Private 
                              Private f32_3* %237 = OpVariable Private 
                                             %238 = OpTypePointer Function %6 
                                       f32_2 %255 = OpConstantComposite %203 %203 
                                Private f32* %259 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %260 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %277 = OpVariable UniformConstant 
                                         i32 %296 = OpConstant 5 
                                             %301 = OpTypePointer Output %7 
                               Output f32_4* %302 = OpVariable Output 
                                             %311 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %171 = OpVariable Function 
                               Function f32* %239 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                 Private f32* %74 = OpAccessChain %29 %49 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %77 = OpAccessChain %37 %76 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                          f32 %80 = OpFAdd %75 %79 
                                 Private f32* %81 = OpAccessChain %48 %55 
                                                      OpStore %81 %80 
                                 Private f32* %82 = OpAccessChain %48 %55 
                                          f32 %83 = OpLoad %82 
                                         bool %84 = OpFOrdLessThan %83 %62 
                                                      OpStore %59 %84 
                                         bool %85 = OpLoad %59 
                                          i32 %86 = OpSelect %85 %66 %65 
                                          i32 %87 = OpIMul %86 %68 
                                         bool %88 = OpINotEqual %87 %65 
                                                      OpSelectionMerge %90 None 
                                                      OpBranchConditional %88 %89 %90 
                                              %89 = OpLabel 
                                                      OpKill
                                              %90 = OpLabel 
                                        f32_3 %95 = OpLoad %94 
                                        f32_4 %96 = OpVectorShuffle %95 %95 1 1 1 1 
                               Uniform f32_4* %99 = OpAccessChain %37 %97 %66 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpFMul %96 %100 
                                                      OpStore %92 %101 
                              Uniform f32_4* %102 = OpAccessChain %37 %97 %65 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpLoad %94 
                                       f32_4 %105 = OpVectorShuffle %104 %104 0 0 0 0 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %92 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %92 %108 
                              Uniform f32_4* %110 = OpAccessChain %37 %97 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpLoad %94 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %92 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %92 %116 
                                       f32_4 %117 = OpLoad %92 
                              Uniform f32_4* %119 = OpAccessChain %37 %97 %118 
                                       f32_4 %120 = OpLoad %119 
                                       f32_4 %121 = OpFAdd %117 %120 
                                                      OpStore %92 %121 
                                Uniform f32* %123 = OpAccessChain %37 %66 %55 
                                         f32 %124 = OpLoad %123 
                                        bool %126 = OpFOrdEqual %124 %125 
                                                      OpStore %122 %126 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %129 
                                             %128 = OpLabel 
                                        bool %130 = OpLoad %122 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %222 
                                             %134 = OpLabel 
                                Uniform f32* %137 = OpAccessChain %37 %66 %136 
                                         f32 %138 = OpLoad %137 
                                        bool %139 = OpFOrdEqual %138 %125 
                                                      OpStore %122 %139 
                                       f32_3 %142 = OpLoad %94 
                                       f32_3 %143 = OpVectorShuffle %142 %142 1 1 1 
                              Uniform f32_4* %144 = OpAccessChain %37 %109 %66 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %143 %146 
                                                      OpStore %141 %147 
                              Uniform f32_4* %148 = OpAccessChain %37 %109 %65 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpLoad %94 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 0 0 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_3 %154 = OpLoad %141 
                                       f32_3 %155 = OpFAdd %153 %154 
                                                      OpStore %141 %155 
                              Uniform f32_4* %156 = OpAccessChain %37 %109 %109 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %94 
                                       f32_3 %160 = OpVectorShuffle %159 %159 2 2 2 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_3 %162 = OpLoad %141 
                                       f32_3 %163 = OpFAdd %161 %162 
                                                      OpStore %141 %163 
                                       f32_3 %164 = OpLoad %141 
                              Uniform f32_4* %165 = OpAccessChain %37 %109 %118 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpFAdd %164 %167 
                                                      OpStore %141 %168 
                                        bool %172 = OpLoad %122 
                                                      OpSelectionMerge %174 None 
                                                      OpBranchConditional %172 %173 %176 
                                             %173 = OpLabel 
                                       f32_3 %175 = OpLoad %141 
                                                      OpStore %171 %175 
                                                      OpBranch %174 
                                             %176 = OpLabel 
                                       f32_3 %177 = OpLoad %94 
                                                      OpStore %171 %177 
                                                      OpBranch %174 
                                             %174 = OpLabel 
                                       f32_3 %178 = OpLoad %171 
                                                      OpStore %169 %178 
                                       f32_3 %179 = OpLoad %169 
                              Uniform f32_3* %182 = OpAccessChain %37 %180 
                                       f32_3 %183 = OpLoad %182 
                                       f32_3 %184 = OpFNegate %183 
                                       f32_3 %185 = OpFAdd %179 %184 
                                                      OpStore %169 %185 
                                       f32_3 %187 = OpLoad %169 
                              Uniform f32_3* %188 = OpAccessChain %37 %118 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %186 
                                       f32_4 %192 = OpVectorShuffle %191 %190 0 4 5 6 
                                                      OpStore %186 %192 
                                Private f32* %193 = OpAccessChain %186 %136 
                                         f32 %194 = OpLoad %193 
                                         f32 %196 = OpFMul %194 %195 
                                         f32 %198 = OpFAdd %196 %197 
                                Private f32* %199 = OpAccessChain %169 %55 
                                                      OpStore %199 %198 
                                Uniform f32* %201 = OpAccessChain %37 %66 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %204 = OpFMul %202 %203 
                                         f32 %205 = OpFAdd %204 %197 
                                Private f32* %206 = OpAccessChain %141 %55 
                                                      OpStore %206 %205 
                                Private f32* %207 = OpAccessChain %141 %55 
                                         f32 %208 = OpLoad %207 
                                Private f32* %209 = OpAccessChain %169 %55 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 40 %208 %210 
                                Private f32* %212 = OpAccessChain %186 %55 
                                                      OpStore %212 %211 
                  read_only Texture3DSampled %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %186 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 2 3 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                      OpStore %186 %220 
                                       f32_4 %221 = OpLoad %186 
                                                      OpStore %48 %221 
                                                      OpBranch %135 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %48 %55 
                                                      OpStore %223 %125 
                                Private f32* %224 = OpAccessChain %48 %136 
                                                      OpStore %224 %125 
                                Private f32* %225 = OpAccessChain %48 %200 
                                                      OpStore %225 %125 
                                Private f32* %226 = OpAccessChain %48 %49 
                                                      OpStore %226 %125 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                       f32_4 %228 = OpLoad %48 
                              Uniform f32_4* %229 = OpAccessChain %37 %65 
                                       f32_4 %230 = OpLoad %229 
                                         f32 %231 = OpDot %228 %230 
                                                      OpStore %227 %231 
                                         f32 %232 = OpLoad %227 
                                         f32 %233 = OpExtInst %1 43 %232 %62 %125 
                                                      OpStore %227 %233 
                                Private f32* %234 = OpAccessChain %92 %200 
                                         f32 %235 = OpLoad %234 
                                        bool %236 = OpFOrdLessThan %62 %235 
                                                      OpStore %122 %236 
                                        bool %240 = OpLoad %122 
                                                      OpSelectionMerge %242 None 
                                                      OpBranchConditional %240 %241 %243 
                                             %241 = OpLabel 
                                                      OpStore %239 %125 
                                                      OpBranch %242 
                                             %243 = OpLabel 
                                                      OpStore %239 %62 
                                                      OpBranch %242 
                                             %242 = OpLabel 
                                         f32 %244 = OpLoad %239 
                                Private f32* %245 = OpAccessChain %237 %55 
                                                      OpStore %245 %244 
                                       f32_4 %246 = OpLoad %92 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_4 %248 = OpLoad %92 
                                       f32_2 %249 = OpVectorShuffle %248 %248 3 3 
                                       f32_2 %250 = OpFDiv %247 %249 
                                       f32_3 %251 = OpLoad %169 
                                       f32_3 %252 = OpVectorShuffle %251 %250 3 4 2 
                                                      OpStore %169 %252 
                                       f32_3 %253 = OpLoad %169 
                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                       f32_2 %256 = OpFAdd %254 %255 
                                       f32_3 %257 = OpLoad %169 
                                       f32_3 %258 = OpVectorShuffle %257 %256 3 4 2 
                                                      OpStore %169 %258 
                  read_only Texture2DSampled %261 = OpLoad %260 
                                       f32_3 %262 = OpLoad %169 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                         f32 %265 = OpCompositeExtract %264 3 
                                                      OpStore %259 %265 
                                         f32 %266 = OpLoad %259 
                                Private f32* %267 = OpAccessChain %237 %55 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %266 %268 
                                Private f32* %270 = OpAccessChain %237 %55 
                                                      OpStore %270 %269 
                                       f32_4 %271 = OpLoad %92 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_4 %273 = OpLoad %92 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                         f32 %275 = OpDot %272 %274 
                                Private f32* %276 = OpAccessChain %92 %55 
                                                      OpStore %276 %275 
                  read_only Texture2DSampled %278 = OpLoad %277 
                                       f32_4 %279 = OpLoad %92 
                                       f32_2 %280 = OpVectorShuffle %279 %279 0 0 
                                       f32_4 %281 = OpImageSampleImplicitLod %278 %280 
                                         f32 %282 = OpCompositeExtract %281 3 
                                Private f32* %283 = OpAccessChain %92 %55 
                                                      OpStore %283 %282 
                                Private f32* %284 = OpAccessChain %92 %55 
                                         f32 %285 = OpLoad %284 
                                Private f32* %286 = OpAccessChain %237 %55 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFMul %285 %287 
                                Private f32* %289 = OpAccessChain %237 %55 
                                                      OpStore %289 %288 
                                         f32 %290 = OpLoad %227 
                                Private f32* %291 = OpAccessChain %237 %55 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                                      OpStore %227 %293 
                                       f32_4 %294 = OpLoad %29 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %297 = OpAccessChain %37 %296 
                                       f32_4 %298 = OpLoad %297 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_3 %300 = OpFMul %295 %299 
                                                      OpStore %237 %300 
                                         f32 %303 = OpLoad %227 
                                       f32_3 %304 = OpCompositeConstruct %303 %303 %303 
                                       f32_3 %305 = OpLoad %237 
                                       f32_3 %306 = OpFMul %304 %305 
                                       f32_4 %307 = OpLoad %302 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
                                                      OpStore %302 %308 
                                Private f32* %309 = OpAccessChain %29 %49 
                                         f32 %310 = OpLoad %309 
                                 Output f32* %312 = OpAccessChain %302 %49 
                                                      OpStore %312 %310 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
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
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 288
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %95 %276 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 RelaxedPrecision 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 RelaxedPrecision 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 RelaxedPrecision 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %138 SpecId 138 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %251 DescriptorSet 251 
                                                      OpDecorate %251 Binding 251 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 Location 276 
                                                      OpDecorate %279 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeArray %7 %31 
                                              %35 = OpTypeStruct %7 %7 %32 %33 %33 %7 %34 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 7 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                          i32 %76 = OpConstant 8 
                                              %92 = OpTypePointer Private %33 
                               Private f32_3* %93 = OpVariable Private 
                                              %94 = OpTypePointer Input %33 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                              %99 = OpTypePointer Uniform %7 
                                         i32 %112 = OpConstant 2 
                                         i32 %122 = OpConstant 3 
                               Private bool* %127 = OpVariable Private 
                                         f32 %130 = OpConstant 3.67402E-40 
                                        bool %132 = OpConstantFalse 
                                        bool %138 = OpSpecConstantFalse 
                                         u32 %141 = OpConstant 1 
                              Private f32_3* %145 = OpVariable Private 
                                             %173 = OpTypePointer Function %33 
                                         i32 %183 = OpConstant 4 
                                             %184 = OpTypePointer Uniform %33 
                              Private f32_4* %189 = OpVariable Private 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         f32 %201 = OpConstant 3.67402E-40 
                                         u32 %203 = OpConstant 2 
                                         f32 %206 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                              Private f32_3* %229 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                             %248 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %249 = OpTypeSampledImage %248 
                                             %250 = OpTypePointer UniformConstant %249 
UniformConstant read_only TextureCubeSampled* %251 = OpVariable UniformConstant 
                                         i32 %270 = OpConstant 5 
                                             %275 = OpTypePointer Output %7 
                               Output f32_4* %276 = OpVariable Output 
                                             %285 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %174 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                 Private f32* %74 = OpAccessChain %29 %49 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %77 = OpAccessChain %37 %76 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                          f32 %80 = OpFAdd %75 %79 
                                 Private f32* %81 = OpAccessChain %48 %55 
                                                      OpStore %81 %80 
                                 Private f32* %82 = OpAccessChain %48 %55 
                                          f32 %83 = OpLoad %82 
                                         bool %84 = OpFOrdLessThan %83 %62 
                                                      OpStore %59 %84 
                                         bool %85 = OpLoad %59 
                                          i32 %86 = OpSelect %85 %66 %65 
                                          i32 %87 = OpIMul %86 %68 
                                         bool %88 = OpINotEqual %87 %65 
                                                      OpSelectionMerge %90 None 
                                                      OpBranchConditional %88 %89 %90 
                                              %89 = OpLabel 
                                                      OpKill
                                              %90 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %37 %98 %66 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                                       f32_3 %103 = OpFMul %97 %102 
                                                      OpStore %93 %103 
                              Uniform f32_4* %104 = OpAccessChain %37 %98 %65 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpLoad %95 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 0 0 
                                       f32_3 %109 = OpFMul %106 %108 
                                       f32_3 %110 = OpLoad %93 
                                       f32_3 %111 = OpFAdd %109 %110 
                                                      OpStore %93 %111 
                              Uniform f32_4* %113 = OpAccessChain %37 %98 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpLoad %95 
                                       f32_3 %117 = OpVectorShuffle %116 %116 2 2 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %119 = OpLoad %93 
                                       f32_3 %120 = OpFAdd %118 %119 
                                                      OpStore %93 %120 
                                       f32_3 %121 = OpLoad %93 
                              Uniform f32_4* %123 = OpAccessChain %37 %98 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFAdd %121 %125 
                                                      OpStore %93 %126 
                                Uniform f32* %128 = OpAccessChain %37 %66 %55 
                                         f32 %129 = OpLoad %128 
                                        bool %131 = OpFOrdEqual %129 %130 
                                                      OpStore %127 %131 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %134 
                                             %133 = OpLabel 
                                        bool %135 = OpLoad %127 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpBranch %134 
                                             %134 = OpLabel 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %224 
                                             %139 = OpLabel 
                                Uniform f32* %142 = OpAccessChain %37 %66 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %130 
                                                      OpStore %127 %144 
                                       f32_3 %146 = OpLoad %95 
                                       f32_3 %147 = OpVectorShuffle %146 %146 1 1 1 
                              Uniform f32_4* %148 = OpAccessChain %37 %112 %66 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %151 = OpFMul %147 %150 
                                                      OpStore %145 %151 
                              Uniform f32_4* %152 = OpAccessChain %37 %112 %65 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %95 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_3 %158 = OpLoad %145 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %145 %159 
                              Uniform f32_4* %160 = OpAccessChain %37 %112 %112 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpLoad %95 
                                       f32_3 %164 = OpVectorShuffle %163 %163 2 2 2 
                                       f32_3 %165 = OpFMul %162 %164 
                                       f32_3 %166 = OpLoad %145 
                                       f32_3 %167 = OpFAdd %165 %166 
                                                      OpStore %145 %167 
                                       f32_3 %168 = OpLoad %145 
                              Uniform f32_4* %169 = OpAccessChain %37 %112 %122 
                                       f32_4 %170 = OpLoad %169 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFAdd %168 %171 
                                                      OpStore %145 %172 
                                        bool %175 = OpLoad %127 
                                                      OpSelectionMerge %177 None 
                                                      OpBranchConditional %175 %176 %179 
                                             %176 = OpLabel 
                                       f32_3 %178 = OpLoad %145 
                                                      OpStore %174 %178 
                                                      OpBranch %177 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %95 
                                                      OpStore %174 %180 
                                                      OpBranch %177 
                                             %177 = OpLabel 
                                       f32_3 %181 = OpLoad %174 
                                                      OpStore %145 %181 
                                       f32_3 %182 = OpLoad %145 
                              Uniform f32_3* %185 = OpAccessChain %37 %183 
                                       f32_3 %186 = OpLoad %185 
                                       f32_3 %187 = OpFNegate %186 
                                       f32_3 %188 = OpFAdd %182 %187 
                                                      OpStore %145 %188 
                                       f32_3 %190 = OpLoad %145 
                              Uniform f32_3* %191 = OpAccessChain %37 %122 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %189 
                                       f32_4 %195 = OpVectorShuffle %194 %193 0 4 5 6 
                                                      OpStore %189 %195 
                                Private f32* %197 = OpAccessChain %189 %141 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %202 = OpFAdd %200 %201 
                                                      OpStore %196 %202 
                                Uniform f32* %204 = OpAccessChain %37 %66 %203 
                                         f32 %205 = OpLoad %204 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %208 = OpFAdd %207 %201 
                                Private f32* %209 = OpAccessChain %145 %55 
                                                      OpStore %209 %208 
                                         f32 %210 = OpLoad %196 
                                Private f32* %211 = OpAccessChain %145 %55 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 40 %210 %212 
                                Private f32* %214 = OpAccessChain %189 %55 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %189 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %189 %222 
                                       f32_4 %223 = OpLoad %189 
                                                      OpStore %48 %223 
                                                      OpBranch %140 
                                             %224 = OpLabel 
                                Private f32* %225 = OpAccessChain %48 %55 
                                                      OpStore %225 %130 
                                Private f32* %226 = OpAccessChain %48 %141 
                                                      OpStore %226 %130 
                                Private f32* %227 = OpAccessChain %48 %203 
                                                      OpStore %227 %130 
                                Private f32* %228 = OpAccessChain %48 %49 
                                                      OpStore %228 %130 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                       f32_4 %230 = OpLoad %48 
                              Uniform f32_4* %231 = OpAccessChain %37 %65 
                                       f32_4 %232 = OpLoad %231 
                                         f32 %233 = OpDot %230 %232 
                                Private f32* %234 = OpAccessChain %229 %55 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %229 %55 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpExtInst %1 43 %236 %62 %130 
                                Private f32* %238 = OpAccessChain %229 %55 
                                                      OpStore %238 %237 
                                       f32_3 %239 = OpLoad %93 
                                       f32_3 %240 = OpLoad %93 
                                         f32 %241 = OpDot %239 %240 
                                                      OpStore %196 %241 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                         f32 %244 = OpLoad %196 
                                       f32_2 %245 = OpCompositeConstruct %244 %244 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 3 
                                                      OpStore %196 %247 
                read_only TextureCubeSampled %252 = OpLoad %251 
                                       f32_3 %253 = OpLoad %93 
                                       f32_4 %254 = OpImageSampleImplicitLod %252 %253 
                                         f32 %255 = OpCompositeExtract %254 3 
                                Private f32* %256 = OpAccessChain %93 %55 
                                                      OpStore %256 %255 
                                Private f32* %257 = OpAccessChain %93 %55 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpLoad %196 
                                         f32 %260 = OpFMul %258 %259 
                                Private f32* %261 = OpAccessChain %93 %55 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %229 %55 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %93 %55 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                Private f32* %267 = OpAccessChain %93 %55 
                                                      OpStore %267 %266 
                                       f32_4 %268 = OpLoad %29 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %37 %270 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFMul %269 %273 
                                                      OpStore %229 %274 
                                       f32_3 %277 = OpLoad %93 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpLoad %229 
                                       f32_3 %280 = OpFMul %278 %279 
                                       f32_4 %281 = OpLoad %276 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 5 6 3 
                                                      OpStore %276 %282 
                                Private f32* %283 = OpAccessChain %29 %49 
                                         f32 %284 = OpLoad %283 
                                 Output f32* %286 = OpAccessChain %276 %49 
                                                      OpStore %286 %284 
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
uniform 	float _VertexColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 %184 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %172 Location 172 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 4 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                          i32 %73 = OpConstant 2 
                               Private f32_4* %81 = OpVariable Private 
                               Private f32_4* %93 = OpVariable Private 
                                             %113 = OpTypeArray %6 %48 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 5 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %171 = OpTypePointer Output %141 
                               Output f32_3* %172 = OpVariable Output 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_4* %181 = OpVariable Output 
                               Output f32_4* %183 = OpVariable Output 
                                Input f32_4* %184 = OpVariable Input 
                                             %186 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %25 
                                                      OpStore %57 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %17 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %17 %60 %60 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpLoad %47 
                                        f32_4 %69 = OpVectorShuffle %68 %68 0 0 0 0 
                                        f32_4 %70 = OpFMul %67 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpFAdd %70 %71 
                                                      OpStore %9 %72 
                               Uniform f32_4* %74 = OpAccessChain %17 %60 %73 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %82 = OpLoad %9 
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %19 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %19 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %81 
                                        f32_4 %95 = OpVectorShuffle %94 %94 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %17 %73 %61 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                               Uniform f32_4* %99 = OpAccessChain %17 %73 %60 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %93 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %93 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %73 %73 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %81 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %93 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %93 %112 
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %81 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %93 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %60 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %17 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %17 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %61 %60 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %144 %147 
                                Private f32* %149 = OpAccessChain %81 %25 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %143 
                              Uniform f32_4* %151 = OpAccessChain %17 %61 %61 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %81 %48 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %143 
                              Uniform f32_4* %157 = OpAccessChain %17 %61 %73 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %81 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %81 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %81 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %173 = OpLoad %163 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %81 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                                      OpStore %172 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                                      OpStore %181 %182 
                                       f32_4 %185 = OpLoad %184 
                                                      OpStore %183 %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %116 %60 %48 
                                                      OpStore %190 %189 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %95 %259 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %34 ArrayStride 34 
                                                      OpMemberDecorate %35 0 RelaxedPrecision 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpMemberDecorate %35 4 Offset 35 
                                                      OpMemberDecorate %35 5 RelaxedPrecision 
                                                      OpMemberDecorate %35 5 Offset 35 
                                                      OpMemberDecorate %35 6 Offset 35 
                                                      OpMemberDecorate %35 7 Offset 35 
                                                      OpMemberDecorate %35 8 RelaxedPrecision 
                                                      OpMemberDecorate %35 8 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %138 SpecId 138 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 DescriptorSet 239 
                                                      OpDecorate %239 Binding 239 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %262 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 4 
                                              %32 = OpTypeArray %7 %31 
                                              %33 = OpTypeVector %6 3 
                                              %34 = OpTypeArray %7 %31 
                                              %35 = OpTypeStruct %7 %7 %32 %33 %33 %7 %34 %6 %6 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 7 
                                              %40 = OpTypePointer Uniform %6 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %49 = OpConstant 3 
                                              %50 = OpTypePointer Private %6 
                                          f32 %53 = OpConstant 3.67402E-40 
                                          u32 %55 = OpConstant 0 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                          i32 %76 = OpConstant 8 
                                              %92 = OpTypePointer Private %15 
                               Private f32_2* %93 = OpVariable Private 
                                              %94 = OpTypePointer Input %33 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                              %99 = OpTypePointer Uniform %7 
                                         i32 %112 = OpConstant 2 
                                         i32 %122 = OpConstant 3 
                               Private bool* %127 = OpVariable Private 
                                         f32 %130 = OpConstant 3.67402E-40 
                                        bool %132 = OpConstantFalse 
                                        bool %138 = OpSpecConstantFalse 
                                         u32 %141 = OpConstant 1 
                                             %145 = OpTypePointer Private %33 
                              Private f32_3* %146 = OpVariable Private 
                                             %174 = OpTypePointer Function %33 
                                         i32 %184 = OpConstant 4 
                                             %185 = OpTypePointer Uniform %33 
                              Private f32_4* %190 = OpVariable Private 
                                Private f32* %197 = OpVariable Private 
                                         f32 %200 = OpConstant 3.67402E-40 
                                         f32 %202 = OpConstant 3.67402E-40 
                                Private f32* %204 = OpVariable Private 
                                         u32 %205 = OpConstant 2 
                                         f32 %208 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                              Private f32_3* %229 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %239 = OpVariable UniformConstant 
                                         i32 %253 = OpConstant 5 
                                             %258 = OpTypePointer Output %7 
                               Output f32_4* %259 = OpVariable Output 
                                             %268 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %175 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %41 = OpAccessChain %37 %39 
                                          f32 %42 = OpLoad %41 
                                        f32_4 %43 = OpCompositeConstruct %42 %42 %42 %42 
                                        f32_4 %44 = OpLoad %20 
                                        f32_4 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %29 %47 
                                 Private f32* %51 = OpAccessChain %29 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %54 = OpFAdd %52 %53 
                                 Private f32* %56 = OpAccessChain %48 %55 
                                                      OpStore %56 %54 
                                 Private f32* %60 = OpAccessChain %48 %55 
                                          f32 %61 = OpLoad %60 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %59 %63 
                                         bool %64 = OpLoad %59 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                 Private f32* %74 = OpAccessChain %29 %49 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %77 = OpAccessChain %37 %76 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                          f32 %80 = OpFAdd %75 %79 
                                 Private f32* %81 = OpAccessChain %48 %55 
                                                      OpStore %81 %80 
                                 Private f32* %82 = OpAccessChain %48 %55 
                                          f32 %83 = OpLoad %82 
                                         bool %84 = OpFOrdLessThan %83 %62 
                                                      OpStore %59 %84 
                                         bool %85 = OpLoad %59 
                                          i32 %86 = OpSelect %85 %66 %65 
                                          i32 %87 = OpIMul %86 %68 
                                         bool %88 = OpINotEqual %87 %65 
                                                      OpSelectionMerge %90 None 
                                                      OpBranchConditional %88 %89 %90 
                                              %89 = OpLabel 
                                                      OpKill
                                              %90 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 1 1 
                              Uniform f32_4* %100 = OpAccessChain %37 %98 %66 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFMul %97 %102 
                                                      OpStore %93 %103 
                              Uniform f32_4* %104 = OpAccessChain %37 %98 %65 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_3 %107 = OpLoad %95 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 0 
                                       f32_2 %109 = OpFMul %106 %108 
                                       f32_2 %110 = OpLoad %93 
                                       f32_2 %111 = OpFAdd %109 %110 
                                                      OpStore %93 %111 
                              Uniform f32_4* %113 = OpAccessChain %37 %98 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_3 %116 = OpLoad %95 
                                       f32_2 %117 = OpVectorShuffle %116 %116 2 2 
                                       f32_2 %118 = OpFMul %115 %117 
                                       f32_2 %119 = OpLoad %93 
                                       f32_2 %120 = OpFAdd %118 %119 
                                                      OpStore %93 %120 
                                       f32_2 %121 = OpLoad %93 
                              Uniform f32_4* %123 = OpAccessChain %37 %98 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %121 %125 
                                                      OpStore %93 %126 
                                Uniform f32* %128 = OpAccessChain %37 %66 %55 
                                         f32 %129 = OpLoad %128 
                                        bool %131 = OpFOrdEqual %129 %130 
                                                      OpStore %127 %131 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %134 
                                             %133 = OpLabel 
                                        bool %135 = OpLoad %127 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpBranch %134 
                                             %134 = OpLabel 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %224 
                                             %139 = OpLabel 
                                Uniform f32* %142 = OpAccessChain %37 %66 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %130 
                                                      OpStore %127 %144 
                                       f32_3 %147 = OpLoad %95 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 1 1 
                              Uniform f32_4* %149 = OpAccessChain %37 %112 %66 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %148 %151 
                                                      OpStore %146 %152 
                              Uniform f32_4* %153 = OpAccessChain %37 %112 %65 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpLoad %95 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 0 0 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_3 %159 = OpLoad %146 
                                       f32_3 %160 = OpFAdd %158 %159 
                                                      OpStore %146 %160 
                              Uniform f32_4* %161 = OpAccessChain %37 %112 %112 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpLoad %95 
                                       f32_3 %165 = OpVectorShuffle %164 %164 2 2 2 
                                       f32_3 %166 = OpFMul %163 %165 
                                       f32_3 %167 = OpLoad %146 
                                       f32_3 %168 = OpFAdd %166 %167 
                                                      OpStore %146 %168 
                                       f32_3 %169 = OpLoad %146 
                              Uniform f32_4* %170 = OpAccessChain %37 %112 %122 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFAdd %169 %172 
                                                      OpStore %146 %173 
                                        bool %176 = OpLoad %127 
                                                      OpSelectionMerge %178 None 
                                                      OpBranchConditional %176 %177 %180 
                                             %177 = OpLabel 
                                       f32_3 %179 = OpLoad %146 
                                                      OpStore %175 %179 
                                                      OpBranch %178 
                                             %180 = OpLabel 
                                       f32_3 %181 = OpLoad %95 
                                                      OpStore %175 %181 
                                                      OpBranch %178 
                                             %178 = OpLabel 
                                       f32_3 %182 = OpLoad %175 
                                                      OpStore %146 %182 
                                       f32_3 %183 = OpLoad %146 
                              Uniform f32_3* %186 = OpAccessChain %37 %184 
                                       f32_3 %187 = OpLoad %186 
                                       f32_3 %188 = OpFNegate %187 
                                       f32_3 %189 = OpFAdd %183 %188 
                                                      OpStore %146 %189 
                                       f32_3 %191 = OpLoad %146 
                              Uniform f32_3* %192 = OpAccessChain %37 %122 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %190 
                                       f32_4 %196 = OpVectorShuffle %195 %194 0 4 5 6 
                                                      OpStore %190 %196 
                                Private f32* %198 = OpAccessChain %190 %141 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %203 = OpFAdd %201 %202 
                                                      OpStore %197 %203 
                                Uniform f32* %206 = OpAccessChain %37 %66 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %210 = OpFAdd %209 %202 
                                                      OpStore %204 %210 
                                         f32 %211 = OpLoad %204 
                                         f32 %212 = OpLoad %197 
                                         f32 %213 = OpExtInst %1 40 %211 %212 
                                Private f32* %214 = OpAccessChain %190 %55 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %190 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %190 %222 
                                       f32_4 %223 = OpLoad %190 
                                                      OpStore %48 %223 
                                                      OpBranch %140 
                                             %224 = OpLabel 
                                Private f32* %225 = OpAccessChain %48 %55 
                                                      OpStore %225 %130 
                                Private f32* %226 = OpAccessChain %48 %141 
                                                      OpStore %226 %130 
                                Private f32* %227 = OpAccessChain %48 %205 
                                                      OpStore %227 %130 
                                Private f32* %228 = OpAccessChain %48 %49 
                                                      OpStore %228 %130 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                       f32_4 %230 = OpLoad %48 
                              Uniform f32_4* %231 = OpAccessChain %37 %65 
                                       f32_4 %232 = OpLoad %231 
                                         f32 %233 = OpDot %230 %232 
                                Private f32* %234 = OpAccessChain %229 %55 
                                                      OpStore %234 %233 
                                Private f32* %235 = OpAccessChain %229 %55 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpExtInst %1 43 %236 %62 %130 
                                Private f32* %238 = OpAccessChain %229 %55 
                                                      OpStore %238 %237 
                  read_only Texture2DSampled %240 = OpLoad %239 
                                       f32_2 %241 = OpLoad %93 
                                       f32_4 %242 = OpImageSampleImplicitLod %240 %241 
                                         f32 %243 = OpCompositeExtract %242 3 
                                Private f32* %244 = OpAccessChain %93 %55 
                                                      OpStore %244 %243 
                                Private f32* %245 = OpAccessChain %229 %55 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %93 %55 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFMul %246 %248 
                                Private f32* %250 = OpAccessChain %93 %55 
                                                      OpStore %250 %249 
                                       f32_4 %251 = OpLoad %29 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %37 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFMul %252 %256 
                                                      OpStore %229 %257 
                                       f32_2 %260 = OpLoad %93 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 0 0 
                                       f32_3 %262 = OpLoad %229 
                                       f32_3 %263 = OpFMul %261 %262 
                                       f32_4 %264 = OpLoad %259 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %259 %265 
                                Private f32* %266 = OpAccessChain %29 %49 
                                         f32 %267 = OpLoad %266 
                                 Output f32* %269 = OpAccessChain %259 %49 
                                                      OpStore %269 %267 
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
  GpuProgramID 179886
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
uniform 	float _ReflectionYOffset;
uniform 	float _ReflectionYFactor;
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
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
bool u_xlatb6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.y = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlatb6 = 0.0<in_POSITION0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xz = in_POSITION0.xz;
    u_xlat0.xzw = (unity_MetaVertexControl.x) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlatb2 = 0.0<u_xlat0.w;
    u_xlat1.z = u_xlatb2 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xzw;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _VertexColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float unity_UseLinearSpace;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0 + (-u_xlat10_0);
    u_xlat0 = vec4(_VertexColor) * u_xlat1 + u_xlat10_0;
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat9 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlatb9 = u_xlat9<0.0;
    if((int(u_xlatb9) * int(0xffffffffu))!=0){discard;}
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
; Bound: 264
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %76 %138 %159 %232 %242 %243 %255 %256 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %159 Location 159 
                                                      OpMemberDecorate %230 0 BuiltIn 230 
                                                      OpMemberDecorate %230 1 BuiltIn 230 
                                                      OpMemberDecorate %230 2 BuiltIn 230 
                                                      OpDecorate %230 Block 
                                                      OpDecorate %242 Location 242 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %256 Location 256 
                                                      OpDecorate %257 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeVector %10 4 
                                              %15 = OpTypeStruct %12 %13 %7 %7 %6 %6 %14 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; u32_4; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 5 
                                          f32 %37 = OpConstant 3.67402E-40 
                                 Private f32* %40 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                              %46 = OpTypePointer Input %7 
                                 Input f32_4* %47 = OpVariable Input 
                                          u32 %48 = OpConstant 1 
                                              %49 = OpTypePointer Input %6 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          u32 %62 = OpConstant 2 
                               Private f32_4* %66 = OpVariable Private 
                                              %67 = OpTypePointer Function %6 
                                          f32 %72 = OpConstant 3.67402E-40 
                                 Input f32_4* %76 = OpVariable Input 
                                              %77 = OpTypeVector %6 2 
                                          i32 %80 = OpConstant 2 
                                              %81 = OpTypePointer Uniform %7 
                                              %96 = OpTypeVector %6 3 
                                              %97 = OpTypePointer Function %96 
                                          i32 %99 = OpConstant 6 
                                             %100 = OpTypeVector %58 4 
                                             %101 = OpTypePointer Uniform %14 
                                         i32 %118 = OpConstant 0 
                                         i32 %119 = OpConstant 1 
                                             %137 = OpTypePointer Output %7 
                               Output f32_4* %138 = OpVariable Output 
                                         i32 %139 = OpConstant 3 
                               Private bool* %147 = OpVariable Private 
                                         u32 %148 = OpConstant 3 
                                Input f32_4* %159 = OpVariable Input 
                                             %229 = OpTypeArray %6 %48 
                                             %230 = OpTypeStruct %7 %6 %229 
                                             %231 = OpTypePointer Output %230 
        Output struct {f32_4; f32; f32[1];}* %232 = OpVariable Output 
                                             %241 = OpTypePointer Output %77 
                               Output f32_2* %242 = OpVariable Output 
                                Input f32_4* %243 = OpVariable Input 
                                         i32 %246 = OpConstant 7 
                               Output f32_4* %255 = OpVariable Output 
                                Input f32_4* %256 = OpVariable Input 
                                             %258 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %68 = OpVariable Function 
                              Function f32_3* %98 = OpVariable Function 
                               Function f32* %152 = OpVariable Function 
                             Function f32_3* %172 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                          f32 %24 = OpFAdd %22 %23 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                                      OpStore %27 %24 
                                 Private f32* %28 = OpAccessChain %9 %25 
                                          f32 %29 = OpLoad %28 
                                 Uniform f32* %31 = OpAccessChain %17 %30 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %29 %32 
                                 Private f32* %34 = OpAccessChain %9 %25 
                                                      OpStore %34 %33 
                                 Private f32* %35 = OpAccessChain %9 %25 
                                          f32 %36 = OpLoad %35 
                                          f32 %38 = OpFMul %36 %37 
                                 Private f32* %39 = OpAccessChain %9 %25 
                                                      OpStore %39 %38 
                                 Uniform f32* %41 = OpAccessChain %17 %30 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFNegate %42 
                                          f32 %45 = OpFAdd %43 %44 
                                                      OpStore %40 %45 
                                   Input f32* %50 = OpAccessChain %47 %48 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpLoad %40 
                                          f32 %53 = OpFMul %51 %52 
                                 Private f32* %54 = OpAccessChain %9 %25 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFAdd %53 %55 
                                 Private f32* %57 = OpAccessChain %9 %48 
                                                      OpStore %57 %56 
                                   Input f32* %63 = OpAccessChain %47 %62 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %61 %64 
                                                      OpStore %60 %65 
                                         bool %69 = OpLoad %60 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %73 
                                              %70 = OpLabel 
                                                      OpStore %68 %72 
                                                      OpBranch %71 
                                              %73 = OpLabel 
                                                      OpStore %68 %61 
                                                      OpBranch %71 
                                              %71 = OpLabel 
                                          f32 %74 = OpLoad %68 
                                 Private f32* %75 = OpAccessChain %66 %62 
                                                      OpStore %75 %74 
                                        f32_4 %78 = OpLoad %76 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                               Uniform f32_4* %82 = OpAccessChain %17 %80 
                                        f32_4 %83 = OpLoad %82 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                        f32_2 %85 = OpFMul %79 %84 
                               Uniform f32_4* %86 = OpAccessChain %17 %80 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 2 3 
                                        f32_2 %89 = OpFAdd %85 %88 
                                        f32_4 %90 = OpLoad %66 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %66 %91 
                                        f32_4 %92 = OpLoad %47 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 2 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 1 5 3 
                                                      OpStore %9 %95 
                              Uniform u32_4* %102 = OpAccessChain %17 %99 
                                       u32_4 %103 = OpLoad %102 
                                         u32 %104 = OpCompositeExtract %103 0 
                                        bool %105 = OpINotEqual %104 %25 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %110 
                                             %106 = OpLabel 
                                       f32_4 %108 = OpLoad %66 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                                      OpStore %98 %109 
                                                      OpBranch %107 
                                             %110 = OpLabel 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                                      OpStore %98 %112 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_3 %113 = OpLoad %98 
                                       f32_4 %114 = OpLoad %9 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 1 5 6 
                                                      OpStore %9 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %116 1 1 1 1 
                              Uniform f32_4* %120 = OpAccessChain %17 %118 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_4 %122 = OpFMul %117 %121 
                                                      OpStore %66 %122 
                              Uniform f32_4* %123 = OpAccessChain %17 %118 %118 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpLoad %47 
                                       f32_4 %126 = OpVectorShuffle %125 %125 0 0 0 0 
                                       f32_4 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %66 
                                       f32_4 %129 = OpFAdd %127 %128 
                                                      OpStore %66 %129 
                              Uniform f32_4* %130 = OpAccessChain %17 %118 %80 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpLoad %47 
                                       f32_4 %133 = OpVectorShuffle %132 %132 2 2 2 2 
                                       f32_4 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %66 
                                       f32_4 %136 = OpFAdd %134 %135 
                                                      OpStore %66 %136 
                              Uniform f32_4* %140 = OpAccessChain %17 %118 %139 
                                       f32_4 %141 = OpLoad %140 
                                       f32_4 %142 = OpLoad %47 
                                       f32_4 %143 = OpVectorShuffle %142 %142 3 3 3 3 
                                       f32_4 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %66 
                                       f32_4 %146 = OpFAdd %144 %145 
                                                      OpStore %138 %146 
                                Private f32* %149 = OpAccessChain %9 %148 
                                         f32 %150 = OpLoad %149 
                                        bool %151 = OpFOrdLessThan %61 %150 
                                                      OpStore %147 %151 
                                        bool %153 = OpLoad %147 
                                                      OpSelectionMerge %155 None 
                                                      OpBranchConditional %153 %154 %156 
                                             %154 = OpLabel 
                                                      OpStore %152 %72 
                                                      OpBranch %155 
                                             %156 = OpLabel 
                                                      OpStore %152 %61 
                                                      OpBranch %155 
                                             %155 = OpLabel 
                                         f32 %157 = OpLoad %152 
                                Private f32* %158 = OpAccessChain %66 %62 
                                                      OpStore %158 %157 
                                       f32_4 %160 = OpLoad %159 
                                       f32_2 %161 = OpVectorShuffle %160 %160 0 1 
                              Uniform f32_4* %162 = OpAccessChain %17 %139 
                                       f32_4 %163 = OpLoad %162 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                       f32_2 %165 = OpFMul %161 %164 
                              Uniform f32_4* %166 = OpAccessChain %17 %139 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 2 3 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %66 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %66 %171 
                              Uniform u32_4* %173 = OpAccessChain %17 %99 
                                       u32_4 %174 = OpLoad %173 
                                         u32 %175 = OpCompositeExtract %174 1 
                                        bool %176 = OpINotEqual %175 %25 
                                                      OpSelectionMerge %178 None 
                                                      OpBranchConditional %176 %177 %181 
                                             %177 = OpLabel 
                                       f32_4 %179 = OpLoad %66 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %172 %180 
                                                      OpBranch %178 
                                             %181 = OpLabel 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 2 3 
                                                      OpStore %172 %183 
                                                      OpBranch %178 
                                             %178 = OpLabel 
                                       f32_3 %184 = OpLoad %172 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                      OpStore %9 %186 
                                       f32_4 %187 = OpLoad %9 
                                       f32_4 %188 = OpVectorShuffle %187 %187 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %17 %118 %119 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %188 %190 
                                                      OpStore %66 %191 
                              Uniform f32_4* %192 = OpAccessChain %17 %118 %118 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %9 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %66 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %66 %198 
                              Uniform f32_4* %199 = OpAccessChain %17 %118 %80 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %9 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %66 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %9 %205 
                                       f32_4 %206 = OpLoad %9 
                              Uniform f32_4* %207 = OpAccessChain %17 %118 %139 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpFAdd %206 %208 
                                                      OpStore %9 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 1 1 1 
                              Uniform f32_4* %212 = OpAccessChain %17 %119 %119 
                                       f32_4 %213 = OpLoad %212 
                                       f32_4 %214 = OpFMul %211 %213 
                                                      OpStore %66 %214 
                              Uniform f32_4* %215 = OpAccessChain %17 %119 %118 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %9 
                                       f32_4 %218 = OpVectorShuffle %217 %217 0 0 0 0 
                                       f32_4 %219 = OpFMul %216 %218 
                                       f32_4 %220 = OpLoad %66 
                                       f32_4 %221 = OpFAdd %219 %220 
                                                      OpStore %66 %221 
                              Uniform f32_4* %222 = OpAccessChain %17 %119 %80 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %9 
                                       f32_4 %225 = OpVectorShuffle %224 %224 2 2 2 2 
                                       f32_4 %226 = OpFMul %223 %225 
                                       f32_4 %227 = OpLoad %66 
                                       f32_4 %228 = OpFAdd %226 %227 
                                                      OpStore %66 %228 
                              Uniform f32_4* %233 = OpAccessChain %17 %119 %139 
                                       f32_4 %234 = OpLoad %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 3 3 3 3 
                                       f32_4 %237 = OpFMul %234 %236 
                                       f32_4 %238 = OpLoad %66 
                                       f32_4 %239 = OpFAdd %237 %238 
                               Output f32_4* %240 = OpAccessChain %232 %118 
                                                      OpStore %240 %239 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                              Uniform f32_4* %247 = OpAccessChain %17 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_2 %249 = OpVectorShuffle %248 %248 0 1 
                                       f32_2 %250 = OpFMul %245 %249 
                              Uniform f32_4* %251 = OpAccessChain %17 %246 
                                       f32_4 %252 = OpLoad %251 
                                       f32_2 %253 = OpVectorShuffle %252 %252 2 3 
                                       f32_2 %254 = OpFAdd %250 %253 
                                                      OpStore %242 %254 
                                       f32_4 %257 = OpLoad %256 
                                                      OpStore %255 %257 
                                 Output f32* %259 = OpAccessChain %232 %118 %48 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFNegate %260 
                                 Output f32* %262 = OpAccessChain %232 %118 %48 
                                                      OpStore %262 %261 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 231
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %217 
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
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 RelaxedPrecision 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %217 Location 217 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
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
                               Private f32_4* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                              %31 = OpTypeVector %30 4 
                                              %32 = OpTypeStruct %6 %6 %6 %31 %6 %6 %6 %6 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32; f32; f32; u32_4; f32; f32; f32; f32;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 2 
                                              %37 = OpTypePointer Uniform %6 
                                              %45 = OpTypePointer Private %6 
                                 Private f32* %46 = OpVariable Private 
                                          u32 %47 = OpConstant 3 
                                          f32 %50 = OpConstant 3.67402E-40 
                                              %52 = OpTypeBool 
                                              %53 = OpTypePointer Private %52 
                                Private bool* %54 = OpVariable Private 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          i32 %59 = OpConstant 0 
                                          i32 %60 = OpConstant 1 
                                          i32 %62 = OpConstant -1 
                                          i32 %70 = OpConstant 7 
                                              %75 = OpTypeVector %6 3 
                                Private bool* %81 = OpVariable Private 
                                              %91 = OpTypePointer Private %75 
                               Private f32_3* %92 = OpVariable Private 
                              Private f32_3* %114 = OpVariable Private 
                                         f32 %116 = OpConstant 3.67402E-40 
                                       f32_3 %117 = OpConstantComposite %116 %116 %116 
                                         f32 %119 = OpConstant 3.67402E-40 
                                       f32_3 %120 = OpConstantComposite %119 %119 %119 
                                         f32 %125 = OpConstant 3.67402E-40 
                                       f32_3 %126 = OpConstantComposite %125 %125 %125 
                                       f32_4 %131 = OpConstantComposite %56 %56 %56 %56 
                                         i32 %132 = OpConstant 6 
                                             %136 = OpTypeVector %52 4 
                                             %139 = OpTypePointer Function %75 
                                Private f32* %150 = OpVariable Private 
                                         i32 %151 = OpConstant 4 
                                         f32 %155 = OpConstant 3.67402E-40 
                                         i32 %171 = OpConstant 5 
                              Private f32_4* %186 = OpVariable Private 
                                         i32 %188 = OpConstant 3 
                                             %189 = OpTypePointer Uniform %31 
                                         u32 %193 = OpConstant 0 
                                       f32_3 %200 = OpConstantComposite %56 %56 %56 
                                             %204 = OpTypePointer Function %6 
                                             %216 = OpTypePointer Output %7 
                               Output f32_4* %217 = OpVariable Output 
                                             %218 = OpTypePointer Function %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %140 = OpVariable Function 
                             Function f32_3* %187 = OpVariable Function 
                               Function f32* %205 = OpVariable Function 
                             Function f32_4* %219 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpFNegate %26 
                                        f32_4 %28 = OpFAdd %25 %27 
                                                      OpStore %20 %28 
                                 Uniform f32* %38 = OpAccessChain %34 %36 
                                          f32 %39 = OpLoad %38 
                                        f32_4 %40 = OpCompositeConstruct %39 %39 %39 %39 
                                        f32_4 %41 = OpLoad %20 
                                        f32_4 %42 = OpFMul %40 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %29 %44 
                                 Private f32* %48 = OpAccessChain %29 %47 
                                          f32 %49 = OpLoad %48 
                                          f32 %51 = OpFAdd %49 %50 
                                                      OpStore %46 %51 
                                          f32 %55 = OpLoad %46 
                                         bool %57 = OpFOrdLessThan %55 %56 
                                                      OpStore %54 %57 
                                         bool %58 = OpLoad %54 
                                          i32 %61 = OpSelect %58 %60 %59 
                                          i32 %63 = OpIMul %61 %62 
                                         bool %64 = OpINotEqual %63 %59 
                                                      OpSelectionMerge %66 None 
                                                      OpBranchConditional %64 %65 %66 
                                              %65 = OpLabel 
                                                      OpKill
                                              %66 = OpLabel 
                                 Private f32* %68 = OpAccessChain %29 %47 
                                          f32 %69 = OpLoad %68 
                                 Uniform f32* %71 = OpAccessChain %34 %70 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %74 = OpFAdd %69 %73 
                                                      OpStore %46 %74 
                                        f32_4 %76 = OpLoad %29 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpExtInst %1 30 %77 
                                        f32_4 %79 = OpLoad %29 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %29 %80 
                                          f32 %82 = OpLoad %46 
                                         bool %83 = OpFOrdLessThan %82 %56 
                                                      OpStore %81 %83 
                                         bool %84 = OpLoad %81 
                                          i32 %85 = OpSelect %84 %60 %59 
                                          i32 %86 = OpIMul %85 %62 
                                         bool %87 = OpINotEqual %86 %59 
                                                      OpSelectionMerge %89 None 
                                                      OpBranchConditional %87 %88 %89 
                                              %88 = OpLabel 
                                                      OpKill
                                              %89 = OpLabel 
                                        f32_4 %93 = OpLoad %29 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                 Uniform f32* %95 = OpAccessChain %34 %60 
                                          f32 %96 = OpLoad %95 
                                 Uniform f32* %97 = OpAccessChain %34 %60 
                                          f32 %98 = OpLoad %97 
                                 Uniform f32* %99 = OpAccessChain %34 %60 
                                         f32 %100 = OpLoad %99 
                                       f32_3 %101 = OpCompositeConstruct %96 %98 %100 
                                         f32 %102 = OpCompositeExtract %101 0 
                                         f32 %103 = OpCompositeExtract %101 1 
                                         f32 %104 = OpCompositeExtract %101 2 
                                       f32_3 %105 = OpCompositeConstruct %102 %103 %104 
                                       f32_3 %106 = OpFMul %94 %105 
                                                      OpStore %92 %106 
                                       f32_3 %107 = OpLoad %92 
                                       f32_3 %108 = OpExtInst %1 29 %107 
                                                      OpStore %92 %108 
                                       f32_3 %109 = OpLoad %92 
                                Uniform f32* %110 = OpAccessChain %34 %59 
                                         f32 %111 = OpLoad %110 
                                       f32_3 %112 = OpCompositeConstruct %111 %111 %111 
                                       f32_3 %113 = OpFMul %109 %112 
                                                      OpStore %92 %113 
                                       f32_3 %115 = OpLoad %92 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %121 = OpFAdd %118 %120 
                                                      OpStore %114 %121 
                                       f32_3 %122 = OpLoad %92 
                                       f32_3 %123 = OpLoad %114 
                                       f32_3 %124 = OpFMul %122 %123 
                                       f32_3 %127 = OpFAdd %124 %126 
                                                      OpStore %114 %127 
                                       f32_3 %128 = OpLoad %92 
                                       f32_3 %129 = OpLoad %114 
                                       f32_3 %130 = OpFMul %128 %129 
                                                      OpStore %114 %130 
                                Uniform f32* %133 = OpAccessChain %34 %132 
                                         f32 %134 = OpLoad %133 
                                       f32_4 %135 = OpCompositeConstruct %134 %134 %134 %134 
                                      bool_4 %137 = OpFOrdNotEqual %131 %135 
                                        bool %138 = OpAny %137 
                                                      OpStore %81 %138 
                                        bool %141 = OpLoad %81 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %145 
                                             %142 = OpLabel 
                                       f32_3 %144 = OpLoad %92 
                                                      OpStore %140 %144 
                                                      OpBranch %143 
                                             %145 = OpLabel 
                                       f32_3 %146 = OpLoad %114 
                                                      OpStore %140 %146 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_3 %147 = OpLoad %140 
                                       f32_4 %148 = OpLoad %20 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %20 %149 
                                Uniform f32* %152 = OpAccessChain %34 %151 
                                         f32 %153 = OpLoad %152 
                                                      OpStore %150 %153 
                                         f32 %154 = OpLoad %150 
                                         f32 %156 = OpExtInst %1 43 %154 %56 %155 
                                                      OpStore %150 %156 
                                       f32_4 %157 = OpLoad %29 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpLoad %150 
                                       f32_3 %160 = OpCompositeConstruct %159 %159 %159 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_4 %162 = OpLoad %29 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %29 %163 
                                       f32_4 %164 = OpLoad %29 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpExtInst %1 29 %165 
                                       f32_4 %167 = OpLoad %29 
                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 6 3 
                                                      OpStore %29 %168 
                                       f32_4 %169 = OpLoad %29 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                Uniform f32* %172 = OpAccessChain %34 %171 
                                         f32 %173 = OpLoad %172 
                                Uniform f32* %174 = OpAccessChain %34 %171 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %176 = OpAccessChain %34 %171 
                                         f32 %177 = OpLoad %176 
                                       f32_3 %178 = OpCompositeConstruct %173 %175 %177 
                                         f32 %179 = OpCompositeExtract %178 0 
                                         f32 %180 = OpCompositeExtract %178 1 
                                         f32 %181 = OpCompositeExtract %178 2 
                                       f32_3 %182 = OpCompositeConstruct %179 %180 %181 
                                       f32_3 %183 = OpExtInst %1 37 %170 %182 
                                       f32_4 %184 = OpLoad %29 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %29 %185 
                              Uniform u32_4* %190 = OpAccessChain %34 %188 
                                       u32_4 %191 = OpLoad %190 
                                         u32 %192 = OpCompositeExtract %191 0 
                                        bool %194 = OpINotEqual %192 %193 
                                                      OpSelectionMerge %196 None 
                                                      OpBranchConditional %194 %195 %199 
                                             %195 = OpLabel 
                                       f32_4 %197 = OpLoad %29 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                                      OpStore %187 %198 
                                                      OpBranch %196 
                                             %199 = OpLabel 
                                                      OpStore %187 %200 
                                                      OpBranch %196 
                                             %196 = OpLabel 
                                       f32_3 %201 = OpLoad %187 
                                       f32_4 %202 = OpLoad %186 
                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
                                                      OpStore %186 %203 
                              Uniform u32_4* %206 = OpAccessChain %34 %188 
                                       u32_4 %207 = OpLoad %206 
                                         u32 %208 = OpCompositeExtract %207 0 
                                        bool %209 = OpINotEqual %208 %193 
                                                      OpSelectionMerge %211 None 
                                                      OpBranchConditional %209 %210 %212 
                                             %210 = OpLabel 
                                                      OpStore %205 %155 
                                                      OpBranch %211 
                                             %212 = OpLabel 
                                                      OpStore %205 %56 
                                                      OpBranch %211 
                                             %211 = OpLabel 
                                         f32 %213 = OpLoad %205 
                                Private f32* %214 = OpAccessChain %186 %47 
                                                      OpStore %214 %213 
                                Private f32* %215 = OpAccessChain %20 %47 
                                                      OpStore %215 %155 
                              Uniform u32_4* %220 = OpAccessChain %34 %188 
                                       u32_4 %221 = OpLoad %220 
                                         u32 %222 = OpCompositeExtract %221 1 
                                        bool %223 = OpINotEqual %222 %193 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %227 
                                             %224 = OpLabel 
                                       f32_4 %226 = OpLoad %20 
                                                      OpStore %219 %226 
                                                      OpBranch %225 
                                             %227 = OpLabel 
                                       f32_4 %228 = OpLoad %186 
                                                      OpStore %219 %228 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                       f32_4 %229 = OpLoad %219 
                                                      OpStore %217 %229 
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