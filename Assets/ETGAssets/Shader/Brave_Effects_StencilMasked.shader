//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/StencilMasked" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_TintColor ("Tint Color", Color) = (0.2,0.2,0.8,0.5)
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  ColorMask RGB 0
  Cull Off
  Stencil {
   Ref 1
   Comp Equal
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 27320
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat10 = u_xlat0.w + -0.100000001;
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10 = u_xlat0.w + (-_Cutoff);
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
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
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 %183 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                               Output f32_3* %183 = OpVariable Output 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_3 %185 = OpConstantComposite %184 %184 %184 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %115 %228 %230 
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
                                                      OpMemberDecorate %28 7 RelaxedPrecision 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %106 SpecId 106 
                                                      OpDecorate %115 Location 115 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %230 Location 230 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
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
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                               Private f32_3* %51 = OpVariable Private 
                                          u32 %52 = OpConstant 3 
                                              %53 = OpTypePointer Private %6 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          u32 %58 = OpConstant 0 
                                              %60 = OpTypeBool 
                                              %61 = OpTypePointer Private %60 
                                Private bool* %62 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          i32 %68 = OpConstant 0 
                                          i32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant -1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        bool %100 = OpConstantFalse 
                                        bool %106 = OpSpecConstantFalse 
                                         u32 %109 = OpConstant 1 
                              Private f32_3* %113 = OpVariable Private 
                                             %114 = OpTypePointer Input %21 
                                Input f32_3* %115 = OpVariable Input 
                                         i32 %118 = OpConstant 2 
                                         i32 %140 = OpConstant 3 
                                             %145 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         f32 %177 = OpConstant 3.67402E-40 
                                Private f32* %180 = OpVariable Private 
                                         u32 %181 = OpConstant 2 
                                         f32 %184 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_4* %200 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %218 = OpConstant 5 
                                             %227 = OpTypePointer Output %7 
                               Output f32_4* %228 = OpVariable Output 
                                Input f32_3* %230 = OpVariable Input 
                                             %239 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %146 = OpVariable Function 
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
                                 Private f32* %54 = OpAccessChain %9 %52 
                                          f32 %55 = OpLoad %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %59 = OpAccessChain %51 %58 
                                                      OpStore %59 %57 
                                 Private f32* %63 = OpAccessChain %51 %58 
                                          f32 %64 = OpLoad %63 
                                         bool %66 = OpFOrdLessThan %64 %65 
                                                      OpStore %62 %66 
                                         bool %67 = OpLoad %62 
                                          i32 %70 = OpSelect %67 %69 %68 
                                          i32 %72 = OpIMul %70 %71 
                                         bool %73 = OpINotEqual %72 %68 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpKill
                                              %75 = OpLabel 
                                 Private f32* %77 = OpAccessChain %9 %52 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %81 = OpAccessChain %30 %79 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFNegate %82 
                                          f32 %84 = OpFAdd %78 %83 
                                 Private f32* %85 = OpAccessChain %51 %58 
                                                      OpStore %85 %84 
                                 Private f32* %86 = OpAccessChain %51 %58 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdLessThan %87 %65 
                                                      OpStore %62 %88 
                                         bool %89 = OpLoad %62 
                                          i32 %90 = OpSelect %89 %69 %68 
                                          i32 %91 = OpIMul %90 %71 
                                         bool %92 = OpINotEqual %91 %68 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                                      OpKill
                                              %94 = OpLabel 
                                 Uniform f32* %96 = OpAccessChain %30 %69 %58 
                                          f32 %97 = OpLoad %96 
                                         bool %99 = OpFOrdEqual %97 %98 
                                                      OpStore %62 %99 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %102 
                                             %101 = OpLabel 
                                        bool %103 = OpLoad %62 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %105 
                                             %104 = OpLabel 
                                                      OpBranch %105 
                                             %105 = OpLabel 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %202 
                                             %107 = OpLabel 
                                Uniform f32* %110 = OpAccessChain %30 %69 %109 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %98 
                                                      OpStore %62 %112 
                                       f32_3 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 1 1 1 
                              Uniform f32_4* %119 = OpAccessChain %30 %118 %69 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFMul %117 %121 
                                                      OpStore %113 %122 
                              Uniform f32_4* %123 = OpAccessChain %30 %118 %68 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpLoad %115 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %113 
                                       f32_3 %130 = OpFAdd %128 %129 
                                                      OpStore %113 %130 
                              Uniform f32_4* %131 = OpAccessChain %30 %118 %118 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpLoad %115 
                                       f32_3 %135 = OpVectorShuffle %134 %134 2 2 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_3 %137 = OpLoad %113 
                                       f32_3 %138 = OpFAdd %136 %137 
                                                      OpStore %113 %138 
                                       f32_3 %139 = OpLoad %113 
                              Uniform f32_4* %141 = OpAccessChain %30 %118 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFAdd %139 %143 
                                                      OpStore %113 %144 
                                        bool %147 = OpLoad %62 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %151 
                                             %148 = OpLabel 
                                       f32_3 %150 = OpLoad %113 
                                                      OpStore %146 %150 
                                                      OpBranch %149 
                                             %151 = OpLabel 
                                       f32_3 %152 = OpLoad %115 
                                                      OpStore %146 %152 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                       f32_3 %153 = OpLoad %146 
                                       f32_4 %154 = OpLoad %20 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %20 %155 
                                       f32_4 %156 = OpLoad %20 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_3* %160 = OpAccessChain %30 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                       f32_4 %164 = OpLoad %20 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %20 %165 
                                       f32_4 %166 = OpLoad %20 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %140 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %20 
                                       f32_4 %172 = OpVectorShuffle %171 %170 0 4 5 6 
                                                      OpStore %20 %172 
                                Private f32* %173 = OpAccessChain %20 %109 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %178 = OpFAdd %176 %177 
                                Private f32* %179 = OpAccessChain %113 %58 
                                                      OpStore %179 %178 
                                Uniform f32* %182 = OpAccessChain %30 %69 %181 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %186 = OpFAdd %185 %177 
                                                      OpStore %180 %186 
                                Private f32* %187 = OpAccessChain %113 %58 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpLoad %180 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %20 %58 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %20 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %20 %199 
                                       f32_4 %201 = OpLoad %20 
                                                      OpStore %200 %201 
                                                      OpBranch %108 
                                             %202 = OpLabel 
                                Private f32* %203 = OpAccessChain %200 %58 
                                                      OpStore %203 %98 
                                Private f32* %204 = OpAccessChain %200 %109 
                                                      OpStore %204 %98 
                                Private f32* %205 = OpAccessChain %200 %181 
                                                      OpStore %205 %98 
                                Private f32* %206 = OpAccessChain %200 %52 
                                                      OpStore %206 %98 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                       f32_4 %207 = OpLoad %200 
                              Uniform f32_4* %208 = OpAccessChain %30 %68 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                Private f32* %211 = OpAccessChain %51 %58 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %51 %58 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpExtInst %1 43 %213 %65 %98 
                                Private f32* %215 = OpAccessChain %51 %58 
                                                      OpStore %215 %214 
                                       f32_3 %217 = OpLoad %41 
                              Uniform f32_4* %219 = OpAccessChain %30 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFMul %217 %221 
                                                      OpStore %216 %222 
                                       f32_3 %223 = OpLoad %51 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                                       f32_3 %225 = OpLoad %216 
                                       f32_3 %226 = OpFMul %224 %225 
                                                      OpStore %51 %226 
                                       f32_3 %229 = OpLoad %41 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %229 %231 
                                       f32_3 %233 = OpLoad %51 
                                       f32_3 %234 = OpFAdd %232 %233 
                                       f32_4 %235 = OpLoad %228 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %228 %236 
                                Private f32* %237 = OpAccessChain %9 %52 
                                         f32 %238 = OpLoad %237 
                                 Output f32* %240 = OpAccessChain %228 %52 
                                                      OpStore %240 %238 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat10 = u_xlat0.w + -0.100000001;
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10 = u_xlat0.w + (-_Cutoff);
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
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
; Bound: 306
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %119 %131 %132 %146 %183 %186 %189 %297 
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
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %297 Location 297 
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
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 10 
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
                                             %191 = OpTypePointer Private %144 
                              Private f32_3* %192 = OpVariable Private 
                              Private f32_4* %209 = OpVariable Private 
                              Private f32_3* %215 = OpVariable Private 
                                         i32 %221 = OpConstant 4 
                                         i32 %227 = OpConstant 5 
                                         i32 %233 = OpConstant 6 
                                         u32 %242 = OpConstant 3 
                                         f32 %263 = OpConstant 3.67402E-40 
                                       f32_3 %264 = OpConstantComposite %263 %263 %263 
                                         f32 %272 = OpConstant 3.67402E-40 
                                       f32_3 %273 = OpConstantComposite %272 %272 %272 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %284 %284 %284 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_3 %288 = OpConstantComposite %287 %287 %287 
                               Output f32_3* %297 = OpVariable Output 
                                             %300 = OpTypePointer Output %6 
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
                                Private f32* %193 = OpAccessChain %82 %48 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %82 %48 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %198 = OpAccessChain %192 %25 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %82 %25 
                                         f32 %200 = OpLoad %199 
                                Private f32* %201 = OpAccessChain %82 %25 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %200 %202 
                                Private f32* %204 = OpAccessChain %192 %25 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                         f32 %207 = OpFAdd %203 %206 
                                Private f32* %208 = OpAccessChain %192 %25 
                                                      OpStore %208 %207 
                                       f32_4 %210 = OpLoad %82 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 2 2 0 
                                       f32_4 %212 = OpLoad %82 
                                       f32_4 %213 = OpVectorShuffle %212 %212 0 1 2 2 
                                       f32_4 %214 = OpFMul %211 %213 
                                                      OpStore %209 %214 
                              Uniform f32_4* %216 = OpAccessChain %17 %84 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %209 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %215 %25 
                                                      OpStore %220 %219 
                              Uniform f32_4* %222 = OpAccessChain %17 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %209 
                                         f32 %225 = OpDot %223 %224 
                                Private f32* %226 = OpAccessChain %215 %48 
                                                      OpStore %226 %225 
                              Uniform f32_4* %228 = OpAccessChain %17 %227 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %209 
                                         f32 %231 = OpDot %229 %230 
                                Private f32* %232 = OpAccessChain %215 %165 
                                                      OpStore %232 %231 
                              Uniform f32_4* %234 = OpAccessChain %17 %233 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpLoad %192 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpFMul %236 %238 
                                       f32_3 %240 = OpLoad %215 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %192 %241 
                                Private f32* %243 = OpAccessChain %82 %242 
                                                      OpStore %243 %44 
                              Uniform f32_4* %244 = OpAccessChain %17 %66 
                                       f32_4 %245 = OpLoad %244 
                                       f32_4 %246 = OpLoad %82 
                                         f32 %247 = OpDot %245 %246 
                                Private f32* %248 = OpAccessChain %215 %25 
                                                      OpStore %248 %247 
                              Uniform f32_4* %249 = OpAccessChain %17 %61 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %82 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %215 %48 
                                                      OpStore %253 %252 
                              Uniform f32_4* %254 = OpAccessChain %17 %74 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %82 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %215 %165 
                                                      OpStore %258 %257 
                                       f32_3 %259 = OpLoad %192 
                                       f32_3 %260 = OpLoad %215 
                                       f32_3 %261 = OpFAdd %259 %260 
                                                      OpStore %192 %261 
                                       f32_3 %262 = OpLoad %192 
                                       f32_3 %265 = OpExtInst %1 40 %262 %264 
                                                      OpStore %192 %265 
                                       f32_3 %266 = OpLoad %192 
                                       f32_3 %267 = OpExtInst %1 30 %266 
                                       f32_4 %268 = OpLoad %82 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %82 %269 
                                       f32_4 %270 = OpLoad %82 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %274 = OpFMul %271 %273 
                                       f32_4 %275 = OpLoad %82 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %82 %276 
                                       f32_4 %277 = OpLoad %82 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpExtInst %1 29 %278 
                                       f32_4 %280 = OpLoad %82 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %82 %281 
                                       f32_4 %282 = OpLoad %82 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_3 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %82 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %82 %291 
                                       f32_4 %292 = OpLoad %82 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_3 %294 = OpExtInst %1 40 %293 %264 
                                       f32_4 %295 = OpLoad %82 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %82 %296 
                                       f32_4 %298 = OpLoad %82 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                                      OpStore %297 %299 
                                 Output f32* %301 = OpAccessChain %119 %66 %48 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                 Output f32* %304 = OpAccessChain %119 %66 %48 
                                                      OpStore %304 %303 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %115 %228 %230 
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
                                                      OpMemberDecorate %28 7 RelaxedPrecision 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %106 SpecId 106 
                                                      OpDecorate %115 Location 115 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %230 Location 230 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
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
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                               Private f32_3* %51 = OpVariable Private 
                                          u32 %52 = OpConstant 3 
                                              %53 = OpTypePointer Private %6 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          u32 %58 = OpConstant 0 
                                              %60 = OpTypeBool 
                                              %61 = OpTypePointer Private %60 
                                Private bool* %62 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          i32 %68 = OpConstant 0 
                                          i32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant -1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        bool %100 = OpConstantFalse 
                                        bool %106 = OpSpecConstantFalse 
                                         u32 %109 = OpConstant 1 
                              Private f32_3* %113 = OpVariable Private 
                                             %114 = OpTypePointer Input %21 
                                Input f32_3* %115 = OpVariable Input 
                                         i32 %118 = OpConstant 2 
                                         i32 %140 = OpConstant 3 
                                             %145 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         f32 %177 = OpConstant 3.67402E-40 
                                Private f32* %180 = OpVariable Private 
                                         u32 %181 = OpConstant 2 
                                         f32 %184 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_4* %200 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %218 = OpConstant 5 
                                             %227 = OpTypePointer Output %7 
                               Output f32_4* %228 = OpVariable Output 
                                Input f32_3* %230 = OpVariable Input 
                                             %239 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %146 = OpVariable Function 
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
                                 Private f32* %54 = OpAccessChain %9 %52 
                                          f32 %55 = OpLoad %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %59 = OpAccessChain %51 %58 
                                                      OpStore %59 %57 
                                 Private f32* %63 = OpAccessChain %51 %58 
                                          f32 %64 = OpLoad %63 
                                         bool %66 = OpFOrdLessThan %64 %65 
                                                      OpStore %62 %66 
                                         bool %67 = OpLoad %62 
                                          i32 %70 = OpSelect %67 %69 %68 
                                          i32 %72 = OpIMul %70 %71 
                                         bool %73 = OpINotEqual %72 %68 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpKill
                                              %75 = OpLabel 
                                 Private f32* %77 = OpAccessChain %9 %52 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %81 = OpAccessChain %30 %79 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFNegate %82 
                                          f32 %84 = OpFAdd %78 %83 
                                 Private f32* %85 = OpAccessChain %51 %58 
                                                      OpStore %85 %84 
                                 Private f32* %86 = OpAccessChain %51 %58 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdLessThan %87 %65 
                                                      OpStore %62 %88 
                                         bool %89 = OpLoad %62 
                                          i32 %90 = OpSelect %89 %69 %68 
                                          i32 %91 = OpIMul %90 %71 
                                         bool %92 = OpINotEqual %91 %68 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                                      OpKill
                                              %94 = OpLabel 
                                 Uniform f32* %96 = OpAccessChain %30 %69 %58 
                                          f32 %97 = OpLoad %96 
                                         bool %99 = OpFOrdEqual %97 %98 
                                                      OpStore %62 %99 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %102 
                                             %101 = OpLabel 
                                        bool %103 = OpLoad %62 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %105 
                                             %104 = OpLabel 
                                                      OpBranch %105 
                                             %105 = OpLabel 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %202 
                                             %107 = OpLabel 
                                Uniform f32* %110 = OpAccessChain %30 %69 %109 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %98 
                                                      OpStore %62 %112 
                                       f32_3 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 1 1 1 
                              Uniform f32_4* %119 = OpAccessChain %30 %118 %69 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFMul %117 %121 
                                                      OpStore %113 %122 
                              Uniform f32_4* %123 = OpAccessChain %30 %118 %68 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpLoad %115 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %113 
                                       f32_3 %130 = OpFAdd %128 %129 
                                                      OpStore %113 %130 
                              Uniform f32_4* %131 = OpAccessChain %30 %118 %118 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpLoad %115 
                                       f32_3 %135 = OpVectorShuffle %134 %134 2 2 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_3 %137 = OpLoad %113 
                                       f32_3 %138 = OpFAdd %136 %137 
                                                      OpStore %113 %138 
                                       f32_3 %139 = OpLoad %113 
                              Uniform f32_4* %141 = OpAccessChain %30 %118 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFAdd %139 %143 
                                                      OpStore %113 %144 
                                        bool %147 = OpLoad %62 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %151 
                                             %148 = OpLabel 
                                       f32_3 %150 = OpLoad %113 
                                                      OpStore %146 %150 
                                                      OpBranch %149 
                                             %151 = OpLabel 
                                       f32_3 %152 = OpLoad %115 
                                                      OpStore %146 %152 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                       f32_3 %153 = OpLoad %146 
                                       f32_4 %154 = OpLoad %20 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %20 %155 
                                       f32_4 %156 = OpLoad %20 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_3* %160 = OpAccessChain %30 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                       f32_4 %164 = OpLoad %20 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %20 %165 
                                       f32_4 %166 = OpLoad %20 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %140 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %20 
                                       f32_4 %172 = OpVectorShuffle %171 %170 0 4 5 6 
                                                      OpStore %20 %172 
                                Private f32* %173 = OpAccessChain %20 %109 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %178 = OpFAdd %176 %177 
                                Private f32* %179 = OpAccessChain %113 %58 
                                                      OpStore %179 %178 
                                Uniform f32* %182 = OpAccessChain %30 %69 %181 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %186 = OpFAdd %185 %177 
                                                      OpStore %180 %186 
                                Private f32* %187 = OpAccessChain %113 %58 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpLoad %180 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %20 %58 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %20 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %20 %199 
                                       f32_4 %201 = OpLoad %20 
                                                      OpStore %200 %201 
                                                      OpBranch %108 
                                             %202 = OpLabel 
                                Private f32* %203 = OpAccessChain %200 %58 
                                                      OpStore %203 %98 
                                Private f32* %204 = OpAccessChain %200 %109 
                                                      OpStore %204 %98 
                                Private f32* %205 = OpAccessChain %200 %181 
                                                      OpStore %205 %98 
                                Private f32* %206 = OpAccessChain %200 %52 
                                                      OpStore %206 %98 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                       f32_4 %207 = OpLoad %200 
                              Uniform f32_4* %208 = OpAccessChain %30 %68 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                Private f32* %211 = OpAccessChain %51 %58 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %51 %58 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpExtInst %1 43 %213 %65 %98 
                                Private f32* %215 = OpAccessChain %51 %58 
                                                      OpStore %215 %214 
                                       f32_3 %217 = OpLoad %41 
                              Uniform f32_4* %219 = OpAccessChain %30 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFMul %217 %221 
                                                      OpStore %216 %222 
                                       f32_3 %223 = OpLoad %51 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                                       f32_3 %225 = OpLoad %216 
                                       f32_3 %226 = OpFMul %224 %225 
                                                      OpStore %51 %226 
                                       f32_3 %229 = OpLoad %41 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %229 %231 
                                       f32_3 %233 = OpLoad %51 
                                       f32_3 %234 = OpFAdd %232 %233 
                                       f32_4 %235 = OpLoad %228 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %228 %236 
                                Private f32* %237 = OpAccessChain %9 %52 
                                         f32 %238 = OpLoad %237 
                                 Output f32* %240 = OpAccessChain %228 %52 
                                                      OpStore %240 %238 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat13 = u_xlat0.w + -0.100000001;
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
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
; Bound: 225
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %124 %130 %131 %145 %174 %180 %183 %185 %205 %217 
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
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %217 Location 217 
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
                                          i32 %19 = OpConstant 5 
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
                               Output f32_3* %185 = OpVariable Output 
                                         f32 %186 = OpConstant 3.67402E-40 
                                       f32_3 %187 = OpConstantComposite %186 %186 %186 
                                         u32 %197 = OpConstant 3 
                                       f32_2 %201 = OpConstantComposite %37 %37 
                               Output f32_4* %205 = OpVariable Output 
                               Output f32_4* %217 = OpVariable Output 
                                       f32_4 %218 = OpConstantComposite %186 %186 %186 %186 
                                             %219 = OpTypePointer Output %6 
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
                                                      OpStore %185 %187 
                                Private f32* %188 = OpAccessChain %81 %48 
                                         f32 %189 = OpLoad %188 
                                Uniform f32* %190 = OpAccessChain %17 %65 %25 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFMul %189 %191 
                                Private f32* %193 = OpAccessChain %9 %25 
                                                      OpStore %193 %192 
                                Private f32* %194 = OpAccessChain %9 %25 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %195 %37 
                                Private f32* %198 = OpAccessChain %9 %197 
                                                      OpStore %198 %196 
                                       f32_4 %199 = OpLoad %81 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 3 
                                       f32_2 %202 = OpFMul %200 %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 1 5 3 
                                                      OpStore %9 %204 
                                       f32_4 %206 = OpLoad %81 
                                       f32_2 %207 = OpVectorShuffle %206 %206 2 3 
                                       f32_4 %208 = OpLoad %205 
                                       f32_4 %209 = OpVectorShuffle %208 %207 0 1 4 5 
                                                      OpStore %205 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 2 2 
                                       f32_4 %212 = OpLoad %9 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 3 
                                       f32_2 %214 = OpFAdd %211 %213 
                                       f32_4 %215 = OpLoad %205 
                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 2 3 
                                                      OpStore %205 %216 
                                                      OpStore %217 %218 
                                 Output f32* %220 = OpAccessChain %124 %65 %48 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                 Output f32* %223 = OpAccessChain %124 %65 %48 
                                                      OpStore %223 %222 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 345
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %280 %331 %333 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %177 SpecId 177 
                                                      OpDecorate %258 DescriptorSet 258 
                                                      OpDecorate %258 Binding 258 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %333 Location 333 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %20 %7 %7 %7 %28 %7 %29 %20 %20 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 10 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 11 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                              %98 = OpTypePointer Uniform %20 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %103 = OpConstant 4 
                                         u32 %104 = OpConstant 2 
                                         u32 %110 = OpConstant 1 
                                         i32 %112 = OpConstant 2 
                              Private f32_3* %120 = OpVariable Private 
                                         i32 %122 = OpConstant 3 
                                         f32 %163 = OpConstant 3.67402E-40 
                               Private bool* %166 = OpVariable Private 
                                         i32 %167 = OpConstant 5 
                                        bool %171 = OpConstantFalse 
                                        bool %177 = OpSpecConstantFalse 
                               Private bool* %180 = OpVariable Private 
                                         i32 %186 = OpConstant 6 
                                             %212 = OpTypePointer Function %20 
                                         i32 %222 = OpConstant 8 
                              Private f32_4* %227 = OpVariable Private 
                                         i32 %229 = OpConstant 7 
                                             %235 = OpTypePointer Private %15 
                              Private f32_2* %236 = OpVariable Private 
                                         f32 %239 = OpConstant 3.67402E-40 
                                         f32 %241 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         f32 %247 = OpConstant 3.67402E-40 
                                             %255 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %256 = OpTypeSampledImage %255 
                                             %257 = OpTypePointer UniformConstant %256 
 UniformConstant read_only Texture3DSampled* %258 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %279 = OpTypePointer Input %7 
                                Input f32_4* %280 = OpVariable Input 
                                Private f32* %286 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %287 = OpVariable UniformConstant 
                              Private f32_3* %292 = OpVariable Private 
                                             %308 = OpTypePointer Function %6 
                                         i32 %321 = OpConstant 9 
                                             %330 = OpTypePointer Output %7 
                               Output f32_4* %331 = OpVariable Output 
                                Input f32_3* %333 = OpVariable Input 
                                             %342 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %213 = OpVariable Function 
                               Function f32* %309 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpFNegate %96 
                               Uniform f32_3* %99 = OpAccessChain %32 %66 
                                       f32_3 %100 = OpLoad %99 
                                       f32_3 %101 = OpFAdd %97 %100 
                                                      OpStore %22 %101 
                                Uniform f32* %105 = OpAccessChain %32 %103 %66 %104 
                                         f32 %106 = OpLoad %105 
                                Private f32* %107 = OpAccessChain %102 %56 
                                                      OpStore %107 %106 
                                Uniform f32* %108 = OpAccessChain %32 %103 %67 %104 
                                         f32 %109 = OpLoad %108 
                                Private f32* %111 = OpAccessChain %102 %110 
                                                      OpStore %111 %109 
                                Uniform f32* %113 = OpAccessChain %32 %103 %112 %104 
                                         f32 %114 = OpLoad %113 
                                Private f32* %115 = OpAccessChain %102 %104 
                                                      OpStore %115 %114 
                                       f32_3 %116 = OpLoad %22 
                                       f32_3 %117 = OpLoad %102 
                                         f32 %118 = OpDot %116 %117 
                                Private f32* %119 = OpAccessChain %22 %56 
                                                      OpStore %119 %118 
                                       f32_3 %121 = OpLoad %95 
                              Uniform f32_4* %123 = OpAccessChain %32 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %121 %126 
                                                      OpStore %120 %127 
                                       f32_3 %128 = OpLoad %120 
                                       f32_3 %129 = OpLoad %120 
                                         f32 %130 = OpDot %128 %129 
                                Private f32* %131 = OpAccessChain %120 %56 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %120 %56 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpExtInst %1 31 %133 
                                Private f32* %135 = OpAccessChain %120 %56 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %22 %56 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Private f32* %139 = OpAccessChain %120 %56 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %120 %56 
                                                      OpStore %142 %141 
                                Uniform f32* %143 = OpAccessChain %32 %122 %50 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %120 %56 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFMul %144 %146 
                                Private f32* %148 = OpAccessChain %22 %56 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFAdd %147 %149 
                                Private f32* %151 = OpAccessChain %22 %56 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %22 %56 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %154 = OpAccessChain %32 %112 %104 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Uniform f32* %157 = OpAccessChain %32 %112 %50 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %22 %56 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %22 %56 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpExtInst %1 43 %162 %63 %163 
                                Private f32* %165 = OpAccessChain %22 %56 
                                                      OpStore %165 %164 
                                Uniform f32* %168 = OpAccessChain %32 %167 %56 
                                         f32 %169 = OpLoad %168 
                                        bool %170 = OpFOrdEqual %169 %163 
                                                      OpStore %166 %170 
                                                      OpSelectionMerge %173 None 
                                                      OpBranchConditional %171 %172 %173 
                                             %172 = OpLabel 
                                        bool %174 = OpLoad %166 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %176 
                                             %175 = OpLabel 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                                      OpBranch %173 
                                             %173 = OpLabel 
                                                      OpSelectionMerge %179 None 
                                                      OpBranchConditional %177 %178 %264 
                                             %178 = OpLabel 
                                Uniform f32* %181 = OpAccessChain %32 %167 %110 
                                         f32 %182 = OpLoad %181 
                                        bool %183 = OpFOrdEqual %182 %163 
                                                      OpStore %180 %183 
                                       f32_3 %184 = OpLoad %95 
                                       f32_3 %185 = OpVectorShuffle %184 %184 1 1 1 
                              Uniform f32_4* %187 = OpAccessChain %32 %186 %67 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %185 %189 
                                                      OpStore %102 %190 
                              Uniform f32_4* %191 = OpAccessChain %32 %186 %66 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpLoad %95 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_3 %197 = OpLoad %102 
                                       f32_3 %198 = OpFAdd %196 %197 
                                                      OpStore %102 %198 
                              Uniform f32_4* %199 = OpAccessChain %32 %186 %112 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpLoad %95 
                                       f32_3 %203 = OpVectorShuffle %202 %202 2 2 2 
                                       f32_3 %204 = OpFMul %201 %203 
                                       f32_3 %205 = OpLoad %102 
                                       f32_3 %206 = OpFAdd %204 %205 
                                                      OpStore %102 %206 
                                       f32_3 %207 = OpLoad %102 
                              Uniform f32_4* %208 = OpAccessChain %32 %186 %122 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %207 %210 
                                                      OpStore %102 %211 
                                        bool %214 = OpLoad %180 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %218 
                                             %215 = OpLabel 
                                       f32_3 %217 = OpLoad %102 
                                                      OpStore %213 %217 
                                                      OpBranch %216 
                                             %218 = OpLabel 
                                       f32_3 %219 = OpLoad %95 
                                                      OpStore %213 %219 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_3 %220 = OpLoad %213 
                                                      OpStore %102 %220 
                                       f32_3 %221 = OpLoad %102 
                              Uniform f32_3* %223 = OpAccessChain %32 %222 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFNegate %224 
                                       f32_3 %226 = OpFAdd %221 %225 
                                                      OpStore %102 %226 
                                       f32_3 %228 = OpLoad %102 
                              Uniform f32_3* %230 = OpAccessChain %32 %229 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %228 %231 
                                       f32_4 %233 = OpLoad %227 
                                       f32_4 %234 = OpVectorShuffle %233 %232 0 4 5 6 
                                                      OpStore %227 %234 
                                Private f32* %237 = OpAccessChain %227 %110 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                         f32 %242 = OpFAdd %240 %241 
                                Private f32* %243 = OpAccessChain %236 %56 
                                                      OpStore %243 %242 
                                Uniform f32* %245 = OpAccessChain %32 %167 %104 
                                         f32 %246 = OpLoad %245 
                                         f32 %248 = OpFMul %246 %247 
                                         f32 %249 = OpFAdd %248 %241 
                                                      OpStore %244 %249 
                                         f32 %250 = OpLoad %244 
                                Private f32* %251 = OpAccessChain %236 %56 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpExtInst %1 40 %250 %252 
                                Private f32* %254 = OpAccessChain %227 %56 
                                                      OpStore %254 %253 
                  read_only Texture3DSampled %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %227 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 2 3 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                                      OpStore %227 %262 
                                       f32_4 %263 = OpLoad %227 
                                                      OpStore %49 %263 
                                                      OpBranch %179 
                                             %264 = OpLabel 
                                Private f32* %265 = OpAccessChain %49 %56 
                                                      OpStore %265 %163 
                                Private f32* %266 = OpAccessChain %49 %110 
                                                      OpStore %266 %163 
                                Private f32* %267 = OpAccessChain %49 %104 
                                                      OpStore %267 %163 
                                Private f32* %268 = OpAccessChain %49 %50 
                                                      OpStore %268 %163 
                                                      OpBranch %179 
                                             %179 = OpLabel 
                                       f32_4 %270 = OpLoad %49 
                              Uniform f32_4* %271 = OpAccessChain %32 %67 
                                       f32_4 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                Private f32* %274 = OpAccessChain %269 %56 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %269 %56 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 43 %276 %63 %163 
                                Private f32* %278 = OpAccessChain %269 %56 
                                                      OpStore %278 %277 
                                       f32_4 %281 = OpLoad %280 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpLoad %280 
                                       f32_2 %284 = OpVectorShuffle %283 %283 3 3 
                                       f32_2 %285 = OpFDiv %282 %284 
                                                      OpStore %236 %285 
                  read_only Texture2DSampled %288 = OpLoad %287 
                                       f32_2 %289 = OpLoad %236 
                                       f32_4 %290 = OpImageSampleImplicitLod %288 %289 
                                         f32 %291 = OpCompositeExtract %290 0 
                                                      OpStore %286 %291 
                                Private f32* %293 = OpAccessChain %22 %56 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpLoad %286 
                                         f32 %296 = OpFAdd %294 %295 
                                Private f32* %297 = OpAccessChain %292 %56 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %292 %56 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %63 %163 
                                Private f32* %301 = OpAccessChain %292 %56 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %292 %56 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %269 %56 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 37 %303 %305 
                                Private f32* %307 = OpAccessChain %269 %56 
                                                      OpStore %307 %306 
                                        bool %310 = OpLoad %166 
                                                      OpSelectionMerge %312 None 
                                                      OpBranchConditional %310 %311 %315 
                                             %311 = OpLabel 
                                Private f32* %313 = OpAccessChain %269 %56 
                                         f32 %314 = OpLoad %313 
                                                      OpStore %309 %314 
                                                      OpBranch %312 
                                             %315 = OpLabel 
                                Private f32* %316 = OpAccessChain %292 %56 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %309 %317 
                                                      OpBranch %312 
                                             %312 = OpLabel 
                                         f32 %318 = OpLoad %309 
                                Private f32* %319 = OpAccessChain %269 %56 
                                                      OpStore %319 %318 
                                       f32_3 %320 = OpLoad %40 
                              Uniform f32_4* %322 = OpAccessChain %32 %321 
                                       f32_4 %323 = OpLoad %322 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFMul %320 %324 
                                                      OpStore %292 %325 
                                       f32_3 %326 = OpLoad %269 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
                                       f32_3 %328 = OpLoad %292 
                                       f32_3 %329 = OpFMul %327 %328 
                                                      OpStore %269 %329 
                                       f32_3 %332 = OpLoad %40 
                                       f32_3 %334 = OpLoad %333 
                                       f32_3 %335 = OpFMul %332 %334 
                                       f32_3 %336 = OpLoad %269 
                                       f32_3 %337 = OpFAdd %335 %336 
                                       f32_4 %338 = OpLoad %331 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %331 %339 
                                Private f32* %340 = OpAccessChain %9 %50 
                                         f32 %341 = OpLoad %340 
                                 Output f32* %343 = OpAccessChain %331 %50 
                                                      OpStore %343 %341 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat13 = u_xlat0.w + -0.100000001;
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
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
; Bound: 334
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %126 %132 %133 %147 %184 %187 %190 %299 %314 %326 
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
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %299 Location 299 
                                                      OpDecorate %314 Location 314 
                                                      OpDecorate %326 Location 326 
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
                                          i32 %19 = OpConstant 12 
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
                                             %192 = OpTypePointer Private %145 
                              Private f32_3* %193 = OpVariable Private 
                              Private f32_4* %210 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %217 = OpConstant 4 
                                         i32 %223 = OpConstant 5 
                                         i32 %229 = OpConstant 6 
                                         i32 %235 = OpConstant 7 
                                         u32 %244 = OpConstant 3 
                                         f32 %265 = OpConstant 3.67402E-40 
                                       f32_3 %266 = OpConstantComposite %265 %265 %265 
                                         f32 %274 = OpConstant 3.67402E-40 
                                       f32_3 %275 = OpConstantComposite %274 %274 %274 
                                         f32 %286 = OpConstant 3.67402E-40 
                                       f32_3 %287 = OpConstantComposite %286 %286 %286 
                                         f32 %289 = OpConstant 3.67402E-40 
                                       f32_3 %290 = OpConstantComposite %289 %289 %289 
                               Output f32_3* %299 = OpVariable Output 
                                       f32_3 %310 = OpConstantComposite %37 %37 %37 
                               Output f32_4* %314 = OpVariable Output 
                               Output f32_4* %326 = OpVariable Output 
                                       f32_4 %327 = OpConstantComposite %265 %265 %265 %265 
                                             %328 = OpTypePointer Output %6 
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
                                Private f32* %194 = OpAccessChain %95 %48 
                                         f32 %195 = OpLoad %194 
                                Private f32* %196 = OpAccessChain %95 %48 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFMul %195 %197 
                                Private f32* %199 = OpAccessChain %193 %25 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %95 %25 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %95 %25 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %193 %25 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFNegate %206 
                                         f32 %208 = OpFAdd %204 %207 
                                Private f32* %209 = OpAccessChain %193 %25 
                                                      OpStore %209 %208 
                                       f32_4 %211 = OpLoad %95 
                                       f32_4 %212 = OpVectorShuffle %211 %211 1 2 2 0 
                                       f32_4 %213 = OpLoad %95 
                                       f32_4 %214 = OpVectorShuffle %213 %213 0 1 2 2 
                                       f32_4 %215 = OpFMul %212 %214 
                                                      OpStore %210 %215 
                              Uniform f32_4* %218 = OpAccessChain %17 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %210 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %216 %25 
                                                      OpStore %222 %221 
                              Uniform f32_4* %224 = OpAccessChain %17 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %210 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %216 %48 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %17 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %210 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %216 %166 
                                                      OpStore %234 %233 
                              Uniform f32_4* %236 = OpAccessChain %17 %235 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpLoad %193 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 0 0 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_3 %242 = OpLoad %216 
                                       f32_3 %243 = OpFAdd %241 %242 
                                                      OpStore %193 %243 
                                Private f32* %245 = OpAccessChain %95 %244 
                                                      OpStore %245 %44 
                              Uniform f32_4* %246 = OpAccessChain %17 %61 
                                       f32_4 %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %95 
                                         f32 %249 = OpDot %247 %248 
                                Private f32* %250 = OpAccessChain %216 %25 
                                                      OpStore %250 %249 
                              Uniform f32_4* %251 = OpAccessChain %17 %74 
                                       f32_4 %252 = OpLoad %251 
                                       f32_4 %253 = OpLoad %95 
                                         f32 %254 = OpDot %252 %253 
                                Private f32* %255 = OpAccessChain %216 %48 
                                                      OpStore %255 %254 
                              Uniform f32_4* %256 = OpAccessChain %17 %84 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpLoad %95 
                                         f32 %259 = OpDot %257 %258 
                                Private f32* %260 = OpAccessChain %216 %166 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %193 
                                       f32_3 %262 = OpLoad %216 
                                       f32_3 %263 = OpFAdd %261 %262 
                                                      OpStore %193 %263 
                                       f32_3 %264 = OpLoad %193 
                                       f32_3 %267 = OpExtInst %1 40 %264 %266 
                                                      OpStore %193 %267 
                                       f32_3 %268 = OpLoad %193 
                                       f32_3 %269 = OpExtInst %1 30 %268 
                                       f32_4 %270 = OpLoad %95 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %95 %271 
                                       f32_4 %272 = OpLoad %95 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %95 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
                                                      OpStore %95 %278 
                                       f32_4 %279 = OpLoad %95 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpExtInst %1 29 %280 
                                       f32_4 %282 = OpLoad %95 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %95 %283 
                                       f32_4 %284 = OpLoad %95 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %288 = OpFMul %285 %287 
                                       f32_3 %291 = OpFAdd %288 %290 
                                       f32_4 %292 = OpLoad %95 
                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 6 3 
                                                      OpStore %95 %293 
                                       f32_4 %294 = OpLoad %95 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_3 %296 = OpExtInst %1 40 %295 %266 
                                       f32_4 %297 = OpLoad %95 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %95 %298 
                                       f32_4 %300 = OpLoad %95 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                                      OpStore %299 %301 
                                Private f32* %302 = OpAccessChain %82 %48 
                                         f32 %303 = OpLoad %302 
                                Uniform f32* %304 = OpAccessChain %17 %66 %25 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                Private f32* %307 = OpAccessChain %82 %48 
                                                      OpStore %307 %306 
                                       f32_4 %308 = OpLoad %82 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 3 1 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %95 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 1 5 6 
                                                      OpStore %95 %313 
                                       f32_4 %315 = OpLoad %82 
                                       f32_2 %316 = OpVectorShuffle %315 %315 2 3 
                                       f32_4 %317 = OpLoad %314 
                                       f32_4 %318 = OpVectorShuffle %317 %316 0 1 4 5 
                                                      OpStore %314 %318 
                                       f32_4 %319 = OpLoad %95 
                                       f32_2 %320 = OpVectorShuffle %319 %319 2 2 
                                       f32_4 %321 = OpLoad %95 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 3 
                                       f32_2 %323 = OpFAdd %320 %322 
                                       f32_4 %324 = OpLoad %314 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 2 3 
                                                      OpStore %314 %325 
                                                      OpStore %326 %327 
                                 Output f32* %329 = OpAccessChain %126 %66 %48 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFNegate %330 
                                 Output f32* %332 = OpAccessChain %126 %66 %48 
                                                      OpStore %332 %331 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 345
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %280 %331 %333 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %177 SpecId 177 
                                                      OpDecorate %258 DescriptorSet 258 
                                                      OpDecorate %258 Binding 258 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %333 Location 333 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %20 %7 %7 %7 %28 %7 %29 %20 %20 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 10 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 11 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                              %98 = OpTypePointer Uniform %20 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %103 = OpConstant 4 
                                         u32 %104 = OpConstant 2 
                                         u32 %110 = OpConstant 1 
                                         i32 %112 = OpConstant 2 
                              Private f32_3* %120 = OpVariable Private 
                                         i32 %122 = OpConstant 3 
                                         f32 %163 = OpConstant 3.67402E-40 
                               Private bool* %166 = OpVariable Private 
                                         i32 %167 = OpConstant 5 
                                        bool %171 = OpConstantFalse 
                                        bool %177 = OpSpecConstantFalse 
                               Private bool* %180 = OpVariable Private 
                                         i32 %186 = OpConstant 6 
                                             %212 = OpTypePointer Function %20 
                                         i32 %222 = OpConstant 8 
                              Private f32_4* %227 = OpVariable Private 
                                         i32 %229 = OpConstant 7 
                                             %235 = OpTypePointer Private %15 
                              Private f32_2* %236 = OpVariable Private 
                                         f32 %239 = OpConstant 3.67402E-40 
                                         f32 %241 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         f32 %247 = OpConstant 3.67402E-40 
                                             %255 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %256 = OpTypeSampledImage %255 
                                             %257 = OpTypePointer UniformConstant %256 
 UniformConstant read_only Texture3DSampled* %258 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %279 = OpTypePointer Input %7 
                                Input f32_4* %280 = OpVariable Input 
                                Private f32* %286 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %287 = OpVariable UniformConstant 
                              Private f32_3* %292 = OpVariable Private 
                                             %308 = OpTypePointer Function %6 
                                         i32 %321 = OpConstant 9 
                                             %330 = OpTypePointer Output %7 
                               Output f32_4* %331 = OpVariable Output 
                                Input f32_3* %333 = OpVariable Input 
                                             %342 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %213 = OpVariable Function 
                               Function f32* %309 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpFNegate %96 
                               Uniform f32_3* %99 = OpAccessChain %32 %66 
                                       f32_3 %100 = OpLoad %99 
                                       f32_3 %101 = OpFAdd %97 %100 
                                                      OpStore %22 %101 
                                Uniform f32* %105 = OpAccessChain %32 %103 %66 %104 
                                         f32 %106 = OpLoad %105 
                                Private f32* %107 = OpAccessChain %102 %56 
                                                      OpStore %107 %106 
                                Uniform f32* %108 = OpAccessChain %32 %103 %67 %104 
                                         f32 %109 = OpLoad %108 
                                Private f32* %111 = OpAccessChain %102 %110 
                                                      OpStore %111 %109 
                                Uniform f32* %113 = OpAccessChain %32 %103 %112 %104 
                                         f32 %114 = OpLoad %113 
                                Private f32* %115 = OpAccessChain %102 %104 
                                                      OpStore %115 %114 
                                       f32_3 %116 = OpLoad %22 
                                       f32_3 %117 = OpLoad %102 
                                         f32 %118 = OpDot %116 %117 
                                Private f32* %119 = OpAccessChain %22 %56 
                                                      OpStore %119 %118 
                                       f32_3 %121 = OpLoad %95 
                              Uniform f32_4* %123 = OpAccessChain %32 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %121 %126 
                                                      OpStore %120 %127 
                                       f32_3 %128 = OpLoad %120 
                                       f32_3 %129 = OpLoad %120 
                                         f32 %130 = OpDot %128 %129 
                                Private f32* %131 = OpAccessChain %120 %56 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %120 %56 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpExtInst %1 31 %133 
                                Private f32* %135 = OpAccessChain %120 %56 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %22 %56 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Private f32* %139 = OpAccessChain %120 %56 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %120 %56 
                                                      OpStore %142 %141 
                                Uniform f32* %143 = OpAccessChain %32 %122 %50 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %120 %56 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFMul %144 %146 
                                Private f32* %148 = OpAccessChain %22 %56 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFAdd %147 %149 
                                Private f32* %151 = OpAccessChain %22 %56 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %22 %56 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %154 = OpAccessChain %32 %112 %104 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Uniform f32* %157 = OpAccessChain %32 %112 %50 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %22 %56 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %22 %56 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpExtInst %1 43 %162 %63 %163 
                                Private f32* %165 = OpAccessChain %22 %56 
                                                      OpStore %165 %164 
                                Uniform f32* %168 = OpAccessChain %32 %167 %56 
                                         f32 %169 = OpLoad %168 
                                        bool %170 = OpFOrdEqual %169 %163 
                                                      OpStore %166 %170 
                                                      OpSelectionMerge %173 None 
                                                      OpBranchConditional %171 %172 %173 
                                             %172 = OpLabel 
                                        bool %174 = OpLoad %166 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %176 
                                             %175 = OpLabel 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                                      OpBranch %173 
                                             %173 = OpLabel 
                                                      OpSelectionMerge %179 None 
                                                      OpBranchConditional %177 %178 %264 
                                             %178 = OpLabel 
                                Uniform f32* %181 = OpAccessChain %32 %167 %110 
                                         f32 %182 = OpLoad %181 
                                        bool %183 = OpFOrdEqual %182 %163 
                                                      OpStore %180 %183 
                                       f32_3 %184 = OpLoad %95 
                                       f32_3 %185 = OpVectorShuffle %184 %184 1 1 1 
                              Uniform f32_4* %187 = OpAccessChain %32 %186 %67 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %185 %189 
                                                      OpStore %102 %190 
                              Uniform f32_4* %191 = OpAccessChain %32 %186 %66 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpLoad %95 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_3 %197 = OpLoad %102 
                                       f32_3 %198 = OpFAdd %196 %197 
                                                      OpStore %102 %198 
                              Uniform f32_4* %199 = OpAccessChain %32 %186 %112 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpLoad %95 
                                       f32_3 %203 = OpVectorShuffle %202 %202 2 2 2 
                                       f32_3 %204 = OpFMul %201 %203 
                                       f32_3 %205 = OpLoad %102 
                                       f32_3 %206 = OpFAdd %204 %205 
                                                      OpStore %102 %206 
                                       f32_3 %207 = OpLoad %102 
                              Uniform f32_4* %208 = OpAccessChain %32 %186 %122 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %207 %210 
                                                      OpStore %102 %211 
                                        bool %214 = OpLoad %180 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %218 
                                             %215 = OpLabel 
                                       f32_3 %217 = OpLoad %102 
                                                      OpStore %213 %217 
                                                      OpBranch %216 
                                             %218 = OpLabel 
                                       f32_3 %219 = OpLoad %95 
                                                      OpStore %213 %219 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_3 %220 = OpLoad %213 
                                                      OpStore %102 %220 
                                       f32_3 %221 = OpLoad %102 
                              Uniform f32_3* %223 = OpAccessChain %32 %222 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFNegate %224 
                                       f32_3 %226 = OpFAdd %221 %225 
                                                      OpStore %102 %226 
                                       f32_3 %228 = OpLoad %102 
                              Uniform f32_3* %230 = OpAccessChain %32 %229 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %228 %231 
                                       f32_4 %233 = OpLoad %227 
                                       f32_4 %234 = OpVectorShuffle %233 %232 0 4 5 6 
                                                      OpStore %227 %234 
                                Private f32* %237 = OpAccessChain %227 %110 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                         f32 %242 = OpFAdd %240 %241 
                                Private f32* %243 = OpAccessChain %236 %56 
                                                      OpStore %243 %242 
                                Uniform f32* %245 = OpAccessChain %32 %167 %104 
                                         f32 %246 = OpLoad %245 
                                         f32 %248 = OpFMul %246 %247 
                                         f32 %249 = OpFAdd %248 %241 
                                                      OpStore %244 %249 
                                         f32 %250 = OpLoad %244 
                                Private f32* %251 = OpAccessChain %236 %56 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpExtInst %1 40 %250 %252 
                                Private f32* %254 = OpAccessChain %227 %56 
                                                      OpStore %254 %253 
                  read_only Texture3DSampled %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %227 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 2 3 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                                      OpStore %227 %262 
                                       f32_4 %263 = OpLoad %227 
                                                      OpStore %49 %263 
                                                      OpBranch %179 
                                             %264 = OpLabel 
                                Private f32* %265 = OpAccessChain %49 %56 
                                                      OpStore %265 %163 
                                Private f32* %266 = OpAccessChain %49 %110 
                                                      OpStore %266 %163 
                                Private f32* %267 = OpAccessChain %49 %104 
                                                      OpStore %267 %163 
                                Private f32* %268 = OpAccessChain %49 %50 
                                                      OpStore %268 %163 
                                                      OpBranch %179 
                                             %179 = OpLabel 
                                       f32_4 %270 = OpLoad %49 
                              Uniform f32_4* %271 = OpAccessChain %32 %67 
                                       f32_4 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                Private f32* %274 = OpAccessChain %269 %56 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %269 %56 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 43 %276 %63 %163 
                                Private f32* %278 = OpAccessChain %269 %56 
                                                      OpStore %278 %277 
                                       f32_4 %281 = OpLoad %280 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpLoad %280 
                                       f32_2 %284 = OpVectorShuffle %283 %283 3 3 
                                       f32_2 %285 = OpFDiv %282 %284 
                                                      OpStore %236 %285 
                  read_only Texture2DSampled %288 = OpLoad %287 
                                       f32_2 %289 = OpLoad %236 
                                       f32_4 %290 = OpImageSampleImplicitLod %288 %289 
                                         f32 %291 = OpCompositeExtract %290 0 
                                                      OpStore %286 %291 
                                Private f32* %293 = OpAccessChain %22 %56 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpLoad %286 
                                         f32 %296 = OpFAdd %294 %295 
                                Private f32* %297 = OpAccessChain %292 %56 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %292 %56 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %63 %163 
                                Private f32* %301 = OpAccessChain %292 %56 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %292 %56 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %269 %56 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 37 %303 %305 
                                Private f32* %307 = OpAccessChain %269 %56 
                                                      OpStore %307 %306 
                                        bool %310 = OpLoad %166 
                                                      OpSelectionMerge %312 None 
                                                      OpBranchConditional %310 %311 %315 
                                             %311 = OpLabel 
                                Private f32* %313 = OpAccessChain %269 %56 
                                         f32 %314 = OpLoad %313 
                                                      OpStore %309 %314 
                                                      OpBranch %312 
                                             %315 = OpLabel 
                                Private f32* %316 = OpAccessChain %292 %56 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %309 %317 
                                                      OpBranch %312 
                                             %312 = OpLabel 
                                         f32 %318 = OpLoad %309 
                                Private f32* %319 = OpAccessChain %269 %56 
                                                      OpStore %319 %318 
                                       f32_3 %320 = OpLoad %40 
                              Uniform f32_4* %322 = OpAccessChain %32 %321 
                                       f32_4 %323 = OpLoad %322 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFMul %320 %324 
                                                      OpStore %292 %325 
                                       f32_3 %326 = OpLoad %269 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
                                       f32_3 %328 = OpLoad %292 
                                       f32_3 %329 = OpFMul %327 %328 
                                                      OpStore %269 %329 
                                       f32_3 %332 = OpLoad %40 
                                       f32_3 %334 = OpLoad %333 
                                       f32_3 %335 = OpFMul %332 %334 
                                       f32_3 %336 = OpLoad %269 
                                       f32_3 %337 = OpFAdd %335 %336 
                                       f32_4 %338 = OpLoad %331 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %331 %339 
                                Private f32* %340 = OpAccessChain %9 %50 
                                         f32 %341 = OpLoad %340 
                                 Output f32* %343 = OpAccessChain %331 %50 
                                                      OpStore %343 %341 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat10 = u_xlat0.w + -0.100000001;
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10 = u_xlat0.w + (-_Cutoff);
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
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
; Bound: 317
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %121 %133 %134 %148 %185 %188 %191 %308 
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
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %308 Location 308 
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
                                          i32 %21 = OpConstant 9 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 8 
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
                              Private f32_4* %199 = OpVariable Private 
                              Private f32_4* %207 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                                       f32_4 %244 = OpConstantComposite %243 %243 %243 %243 
                                       f32_4 %252 = OpConstantComposite %46 %46 %46 %46 
                                         f32 %260 = OpConstant 3.67402E-40 
                                       f32_4 %261 = OpConstantComposite %260 %260 %260 %260 
                                         i32 %268 = OpConstant 4 
                               Output f32_3* %308 = OpVariable Output 
                                             %311 = OpTypePointer Output %6 
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
                                       f32_4 %192 = OpLoad %9 
                                                      OpStore %191 %192 
                                       f32_4 %193 = OpLoad %9 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                                       f32_4 %195 = OpFNegate %194 
                              Uniform f32_4* %196 = OpAccessChain %19 %63 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFAdd %195 %197 
                                                      OpStore %97 %198 
                                       f32_4 %200 = OpLoad %84 
                                       f32_4 %201 = OpVectorShuffle %200 %200 1 1 1 1 
                                       f32_4 %202 = OpLoad %97 
                                       f32_4 %203 = OpFMul %201 %202 
                                                      OpStore %199 %203 
                                       f32_4 %204 = OpLoad %97 
                                       f32_4 %205 = OpLoad %97 
                                       f32_4 %206 = OpFMul %204 %205 
                                                      OpStore %97 %206 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpVectorShuffle %208 %208 0 0 0 0 
                                       f32_4 %210 = OpFNegate %209 
                              Uniform f32_4* %211 = OpAccessChain %19 %68 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpFAdd %210 %212 
                                                      OpStore %207 %213 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %214 2 2 2 2 
                                       f32_4 %216 = OpFNegate %215 
                              Uniform f32_4* %217 = OpAccessChain %19 %76 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpFAdd %216 %218 
                                                      OpStore %9 %219 
                                       f32_4 %220 = OpLoad %207 
                                       f32_4 %221 = OpLoad %84 
                                       f32_4 %222 = OpVectorShuffle %221 %221 0 0 0 0 
                                       f32_4 %223 = OpFMul %220 %222 
                                       f32_4 %224 = OpLoad %199 
                                       f32_4 %225 = OpFAdd %223 %224 
                                                      OpStore %199 %225 
                                       f32_4 %226 = OpLoad %207 
                                       f32_4 %227 = OpLoad %207 
                                       f32_4 %228 = OpFMul %226 %227 
                                       f32_4 %229 = OpLoad %97 
                                       f32_4 %230 = OpFAdd %228 %229 
                                                      OpStore %97 %230 
                                       f32_4 %231 = OpLoad %9 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpFMul %231 %232 
                                       f32_4 %234 = OpLoad %97 
                                       f32_4 %235 = OpFAdd %233 %234 
                                                      OpStore %97 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %84 
                                       f32_4 %238 = OpVectorShuffle %237 %237 2 2 2 2 
                                       f32_4 %239 = OpFMul %236 %238 
                                       f32_4 %240 = OpLoad %199 
                                       f32_4 %241 = OpFAdd %239 %240 
                                                      OpStore %9 %241 
                                       f32_4 %242 = OpLoad %97 
                                       f32_4 %245 = OpExtInst %1 40 %242 %244 
                                                      OpStore %84 %245 
                                       f32_4 %246 = OpLoad %84 
                                       f32_4 %247 = OpExtInst %1 32 %246 
                                                      OpStore %97 %247 
                                       f32_4 %248 = OpLoad %84 
                              Uniform f32_4* %249 = OpAccessChain %19 %86 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpFMul %248 %250 
                                       f32_4 %253 = OpFAdd %251 %252 
                                                      OpStore %84 %253 
                                       f32_4 %254 = OpLoad %84 
                                       f32_4 %255 = OpFDiv %252 %254 
                                                      OpStore %84 %255 
                                       f32_4 %256 = OpLoad %9 
                                       f32_4 %257 = OpLoad %97 
                                       f32_4 %258 = OpFMul %256 %257 
                                                      OpStore %9 %258 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %262 = OpExtInst %1 40 %259 %261 
                                                      OpStore %9 %262 
                                       f32_4 %263 = OpLoad %84 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpFMul %263 %264 
                                                      OpStore %9 %265 
                                       f32_4 %266 = OpLoad %9 
                                       f32_3 %267 = OpVectorShuffle %266 %266 1 1 1 
                              Uniform f32_4* %269 = OpAccessChain %19 %268 %63 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFMul %267 %271 
                                       f32_4 %273 = OpLoad %84 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %84 %274 
                              Uniform f32_4* %275 = OpAccessChain %19 %268 %68 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_4 %278 = OpLoad %9 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 0 0 
                                       f32_3 %280 = OpFMul %277 %279 
                                       f32_4 %281 = OpLoad %84 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %283 = OpFAdd %280 %282 
                                       f32_4 %284 = OpLoad %84 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %84 %285 
                              Uniform f32_4* %286 = OpAccessChain %19 %268 %76 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_4 %289 = OpLoad %9 
                                       f32_3 %290 = OpVectorShuffle %289 %289 2 2 2 
                                       f32_3 %291 = OpFMul %288 %290 
                                       f32_4 %292 = OpLoad %84 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_3 %294 = OpFAdd %291 %293 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %9 %296 
                              Uniform f32_4* %297 = OpAccessChain %19 %268 %86 
                                       f32_4 %298 = OpLoad %297 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                       f32_4 %300 = OpLoad %9 
                                       f32_3 %301 = OpVectorShuffle %300 %300 3 3 3 
                                       f32_3 %302 = OpFMul %299 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                       f32_3 %305 = OpFAdd %302 %304 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                                      OpStore %9 %307 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                                      OpStore %308 %310 
                                 Output f32* %312 = OpAccessChain %121 %68 %50 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFNegate %313 
                                 Output f32* %315 = OpAccessChain %121 %68 %50 
                                                      OpStore %315 %314 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %115 %228 %230 
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
                                                      OpMemberDecorate %28 7 RelaxedPrecision 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %106 SpecId 106 
                                                      OpDecorate %115 Location 115 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %230 Location 230 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
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
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                               Private f32_3* %51 = OpVariable Private 
                                          u32 %52 = OpConstant 3 
                                              %53 = OpTypePointer Private %6 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          u32 %58 = OpConstant 0 
                                              %60 = OpTypeBool 
                                              %61 = OpTypePointer Private %60 
                                Private bool* %62 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          i32 %68 = OpConstant 0 
                                          i32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant -1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        bool %100 = OpConstantFalse 
                                        bool %106 = OpSpecConstantFalse 
                                         u32 %109 = OpConstant 1 
                              Private f32_3* %113 = OpVariable Private 
                                             %114 = OpTypePointer Input %21 
                                Input f32_3* %115 = OpVariable Input 
                                         i32 %118 = OpConstant 2 
                                         i32 %140 = OpConstant 3 
                                             %145 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         f32 %177 = OpConstant 3.67402E-40 
                                Private f32* %180 = OpVariable Private 
                                         u32 %181 = OpConstant 2 
                                         f32 %184 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_4* %200 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %218 = OpConstant 5 
                                             %227 = OpTypePointer Output %7 
                               Output f32_4* %228 = OpVariable Output 
                                Input f32_3* %230 = OpVariable Input 
                                             %239 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %146 = OpVariable Function 
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
                                 Private f32* %54 = OpAccessChain %9 %52 
                                          f32 %55 = OpLoad %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %59 = OpAccessChain %51 %58 
                                                      OpStore %59 %57 
                                 Private f32* %63 = OpAccessChain %51 %58 
                                          f32 %64 = OpLoad %63 
                                         bool %66 = OpFOrdLessThan %64 %65 
                                                      OpStore %62 %66 
                                         bool %67 = OpLoad %62 
                                          i32 %70 = OpSelect %67 %69 %68 
                                          i32 %72 = OpIMul %70 %71 
                                         bool %73 = OpINotEqual %72 %68 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpKill
                                              %75 = OpLabel 
                                 Private f32* %77 = OpAccessChain %9 %52 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %81 = OpAccessChain %30 %79 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFNegate %82 
                                          f32 %84 = OpFAdd %78 %83 
                                 Private f32* %85 = OpAccessChain %51 %58 
                                                      OpStore %85 %84 
                                 Private f32* %86 = OpAccessChain %51 %58 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdLessThan %87 %65 
                                                      OpStore %62 %88 
                                         bool %89 = OpLoad %62 
                                          i32 %90 = OpSelect %89 %69 %68 
                                          i32 %91 = OpIMul %90 %71 
                                         bool %92 = OpINotEqual %91 %68 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                                      OpKill
                                              %94 = OpLabel 
                                 Uniform f32* %96 = OpAccessChain %30 %69 %58 
                                          f32 %97 = OpLoad %96 
                                         bool %99 = OpFOrdEqual %97 %98 
                                                      OpStore %62 %99 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %102 
                                             %101 = OpLabel 
                                        bool %103 = OpLoad %62 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %105 
                                             %104 = OpLabel 
                                                      OpBranch %105 
                                             %105 = OpLabel 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %202 
                                             %107 = OpLabel 
                                Uniform f32* %110 = OpAccessChain %30 %69 %109 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %98 
                                                      OpStore %62 %112 
                                       f32_3 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 1 1 1 
                              Uniform f32_4* %119 = OpAccessChain %30 %118 %69 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFMul %117 %121 
                                                      OpStore %113 %122 
                              Uniform f32_4* %123 = OpAccessChain %30 %118 %68 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpLoad %115 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %113 
                                       f32_3 %130 = OpFAdd %128 %129 
                                                      OpStore %113 %130 
                              Uniform f32_4* %131 = OpAccessChain %30 %118 %118 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpLoad %115 
                                       f32_3 %135 = OpVectorShuffle %134 %134 2 2 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_3 %137 = OpLoad %113 
                                       f32_3 %138 = OpFAdd %136 %137 
                                                      OpStore %113 %138 
                                       f32_3 %139 = OpLoad %113 
                              Uniform f32_4* %141 = OpAccessChain %30 %118 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFAdd %139 %143 
                                                      OpStore %113 %144 
                                        bool %147 = OpLoad %62 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %151 
                                             %148 = OpLabel 
                                       f32_3 %150 = OpLoad %113 
                                                      OpStore %146 %150 
                                                      OpBranch %149 
                                             %151 = OpLabel 
                                       f32_3 %152 = OpLoad %115 
                                                      OpStore %146 %152 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                       f32_3 %153 = OpLoad %146 
                                       f32_4 %154 = OpLoad %20 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %20 %155 
                                       f32_4 %156 = OpLoad %20 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_3* %160 = OpAccessChain %30 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                       f32_4 %164 = OpLoad %20 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %20 %165 
                                       f32_4 %166 = OpLoad %20 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %140 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %20 
                                       f32_4 %172 = OpVectorShuffle %171 %170 0 4 5 6 
                                                      OpStore %20 %172 
                                Private f32* %173 = OpAccessChain %20 %109 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %178 = OpFAdd %176 %177 
                                Private f32* %179 = OpAccessChain %113 %58 
                                                      OpStore %179 %178 
                                Uniform f32* %182 = OpAccessChain %30 %69 %181 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %186 = OpFAdd %185 %177 
                                                      OpStore %180 %186 
                                Private f32* %187 = OpAccessChain %113 %58 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpLoad %180 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %20 %58 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %20 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %20 %199 
                                       f32_4 %201 = OpLoad %20 
                                                      OpStore %200 %201 
                                                      OpBranch %108 
                                             %202 = OpLabel 
                                Private f32* %203 = OpAccessChain %200 %58 
                                                      OpStore %203 %98 
                                Private f32* %204 = OpAccessChain %200 %109 
                                                      OpStore %204 %98 
                                Private f32* %205 = OpAccessChain %200 %181 
                                                      OpStore %205 %98 
                                Private f32* %206 = OpAccessChain %200 %52 
                                                      OpStore %206 %98 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                       f32_4 %207 = OpLoad %200 
                              Uniform f32_4* %208 = OpAccessChain %30 %68 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                Private f32* %211 = OpAccessChain %51 %58 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %51 %58 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpExtInst %1 43 %213 %65 %98 
                                Private f32* %215 = OpAccessChain %51 %58 
                                                      OpStore %215 %214 
                                       f32_3 %217 = OpLoad %41 
                              Uniform f32_4* %219 = OpAccessChain %30 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFMul %217 %221 
                                                      OpStore %216 %222 
                                       f32_3 %223 = OpLoad %51 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                                       f32_3 %225 = OpLoad %216 
                                       f32_3 %226 = OpFMul %224 %225 
                                                      OpStore %51 %226 
                                       f32_3 %229 = OpLoad %41 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %229 %231 
                                       f32_3 %233 = OpLoad %51 
                                       f32_3 %234 = OpFAdd %232 %233 
                                       f32_4 %235 = OpLoad %228 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %228 %236 
                                Private f32* %237 = OpAccessChain %9 %52 
                                         f32 %238 = OpLoad %237 
                                 Output f32* %240 = OpAccessChain %228 %52 
                                                      OpStore %240 %238 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat10 = u_xlat0.w + -0.100000001;
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
    u_xlat10 = u_xlat0.w + (-_Cutoff);
    u_xlatb10 = u_xlat10<0.0;
    if((int(u_xlatb10) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
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
; Bound: 419
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %121 %133 %134 %148 %185 %188 %191 %410 
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
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
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
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %410 Location 410 
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
                                          i32 %21 = OpConstant 16 
                                              %22 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          i32 %32 = OpConstant 15 
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
                                             %193 = OpTypePointer Private %146 
                              Private f32_3* %194 = OpVariable Private 
                              Private f32_4* %211 = OpVariable Private 
                              Private f32_3* %217 = OpVariable Private 
                                         i32 %218 = OpConstant 8 
                                         i32 %224 = OpConstant 9 
                                         i32 %230 = OpConstant 10 
                                         i32 %236 = OpConstant 11 
                                         u32 %245 = OpConstant 3 
                                         i32 %247 = OpConstant 5 
                                         i32 %253 = OpConstant 6 
                                         i32 %259 = OpConstant 7 
                                         f32 %269 = OpConstant 3.67402E-40 
                                       f32_3 %270 = OpConstantComposite %269 %269 %269 
                              Private f32_3* %272 = OpVariable Private 
                                         f32 %276 = OpConstant 3.67402E-40 
                                       f32_3 %277 = OpConstantComposite %276 %276 %276 
                                         f32 %282 = OpConstant 3.67402E-40 
                                       f32_3 %283 = OpConstantComposite %282 %282 %282 
                                         f32 %285 = OpConstant 3.67402E-40 
                                       f32_3 %286 = OpConstantComposite %285 %285 %285 
                              Private f32_4* %296 = OpVariable Private 
                              Private f32_4* %304 = OpVariable Private 
                                         f32 %340 = OpConstant 3.67402E-40 
                                       f32_4 %341 = OpConstantComposite %340 %340 %340 %340 
                                       f32_4 %349 = OpConstantComposite %46 %46 %46 %46 
                                       f32_4 %357 = OpConstantComposite %269 %269 %269 %269 
                                         i32 %364 = OpConstant 4 
                               Output f32_3* %410 = OpVariable Output 
                                             %413 = OpTypePointer Output %6 
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
                                       f32_4 %192 = OpLoad %9 
                                                      OpStore %191 %192 
                                Private f32* %195 = OpAccessChain %84 %50 
                                         f32 %196 = OpLoad %195 
                                Private f32* %197 = OpAccessChain %84 %50 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %200 = OpAccessChain %194 %27 
                                                      OpStore %200 %199 
                                Private f32* %201 = OpAccessChain %84 %27 
                                         f32 %202 = OpLoad %201 
                                Private f32* %203 = OpAccessChain %84 %27 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFMul %202 %204 
                                Private f32* %206 = OpAccessChain %194 %27 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %205 %208 
                                Private f32* %210 = OpAccessChain %194 %27 
                                                      OpStore %210 %209 
                                       f32_4 %212 = OpLoad %84 
                                       f32_4 %213 = OpVectorShuffle %212 %212 1 2 2 0 
                                       f32_4 %214 = OpLoad %84 
                                       f32_4 %215 = OpVectorShuffle %214 %214 0 1 2 2 
                                       f32_4 %216 = OpFMul %213 %215 
                                                      OpStore %211 %216 
                              Uniform f32_4* %219 = OpAccessChain %19 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %211 
                                         f32 %222 = OpDot %220 %221 
                                Private f32* %223 = OpAccessChain %217 %27 
                                                      OpStore %223 %222 
                              Uniform f32_4* %225 = OpAccessChain %19 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %211 
                                         f32 %228 = OpDot %226 %227 
                                Private f32* %229 = OpAccessChain %217 %50 
                                                      OpStore %229 %228 
                              Uniform f32_4* %231 = OpAccessChain %19 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %211 
                                         f32 %234 = OpDot %232 %233 
                                Private f32* %235 = OpAccessChain %217 %167 
                                                      OpStore %235 %234 
                              Uniform f32_4* %237 = OpAccessChain %19 %236 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpLoad %194 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                       f32_3 %242 = OpFMul %239 %241 
                                       f32_3 %243 = OpLoad %217 
                                       f32_3 %244 = OpFAdd %242 %243 
                                                      OpStore %194 %244 
                                Private f32* %246 = OpAccessChain %84 %245 
                                                      OpStore %246 %46 
                              Uniform f32_4* %248 = OpAccessChain %19 %247 
                                       f32_4 %249 = OpLoad %248 
                                       f32_4 %250 = OpLoad %84 
                                         f32 %251 = OpDot %249 %250 
                                Private f32* %252 = OpAccessChain %217 %27 
                                                      OpStore %252 %251 
                              Uniform f32_4* %254 = OpAccessChain %19 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %84 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %217 %50 
                                                      OpStore %258 %257 
                              Uniform f32_4* %260 = OpAccessChain %19 %259 
                                       f32_4 %261 = OpLoad %260 
                                       f32_4 %262 = OpLoad %84 
                                         f32 %263 = OpDot %261 %262 
                                Private f32* %264 = OpAccessChain %217 %167 
                                                      OpStore %264 %263 
                                       f32_3 %265 = OpLoad %194 
                                       f32_3 %266 = OpLoad %217 
                                       f32_3 %267 = OpFAdd %265 %266 
                                                      OpStore %194 %267 
                                       f32_3 %268 = OpLoad %194 
                                       f32_3 %271 = OpExtInst %1 40 %268 %270 
                                                      OpStore %194 %271 
                                       f32_3 %273 = OpLoad %194 
                                       f32_3 %274 = OpExtInst %1 30 %273 
                                                      OpStore %272 %274 
                                       f32_3 %275 = OpLoad %272 
                                       f32_3 %278 = OpFMul %275 %277 
                                                      OpStore %272 %278 
                                       f32_3 %279 = OpLoad %272 
                                       f32_3 %280 = OpExtInst %1 29 %279 
                                                      OpStore %272 %280 
                                       f32_3 %281 = OpLoad %272 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_3 %287 = OpFAdd %284 %286 
                                                      OpStore %272 %287 
                                       f32_3 %288 = OpLoad %272 
                                       f32_3 %289 = OpExtInst %1 40 %288 %270 
                                                      OpStore %272 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 1 1 1 
                                       f32_4 %292 = OpFNegate %291 
                              Uniform f32_4* %293 = OpAccessChain %19 %63 
                                       f32_4 %294 = OpLoad %293 
                                       f32_4 %295 = OpFAdd %292 %294 
                                                      OpStore %97 %295 
                                       f32_4 %297 = OpLoad %84 
                                       f32_4 %298 = OpVectorShuffle %297 %297 1 1 1 1 
                                       f32_4 %299 = OpLoad %97 
                                       f32_4 %300 = OpFMul %298 %299 
                                                      OpStore %296 %300 
                                       f32_4 %301 = OpLoad %97 
                                       f32_4 %302 = OpLoad %97 
                                       f32_4 %303 = OpFMul %301 %302 
                                                      OpStore %97 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpVectorShuffle %305 %305 0 0 0 0 
                                       f32_4 %307 = OpFNegate %306 
                              Uniform f32_4* %308 = OpAccessChain %19 %68 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpFAdd %307 %309 
                                                      OpStore %304 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpVectorShuffle %311 %311 2 2 2 2 
                                       f32_4 %313 = OpFNegate %312 
                              Uniform f32_4* %314 = OpAccessChain %19 %76 
                                       f32_4 %315 = OpLoad %314 
                                       f32_4 %316 = OpFAdd %313 %315 
                                                      OpStore %9 %316 
                                       f32_4 %317 = OpLoad %304 
                                       f32_4 %318 = OpLoad %84 
                                       f32_4 %319 = OpVectorShuffle %318 %318 0 0 0 0 
                                       f32_4 %320 = OpFMul %317 %319 
                                       f32_4 %321 = OpLoad %296 
                                       f32_4 %322 = OpFAdd %320 %321 
                                                      OpStore %296 %322 
                                       f32_4 %323 = OpLoad %304 
                                       f32_4 %324 = OpLoad %304 
                                       f32_4 %325 = OpFMul %323 %324 
                                       f32_4 %326 = OpLoad %97 
                                       f32_4 %327 = OpFAdd %325 %326 
                                                      OpStore %97 %327 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpFMul %328 %329 
                                       f32_4 %331 = OpLoad %97 
                                       f32_4 %332 = OpFAdd %330 %331 
                                                      OpStore %97 %332 
                                       f32_4 %333 = OpLoad %9 
                                       f32_4 %334 = OpLoad %84 
                                       f32_4 %335 = OpVectorShuffle %334 %334 2 2 2 2 
                                       f32_4 %336 = OpFMul %333 %335 
                                       f32_4 %337 = OpLoad %296 
                                       f32_4 %338 = OpFAdd %336 %337 
                                                      OpStore %9 %338 
                                       f32_4 %339 = OpLoad %97 
                                       f32_4 %342 = OpExtInst %1 40 %339 %341 
                                                      OpStore %84 %342 
                                       f32_4 %343 = OpLoad %84 
                                       f32_4 %344 = OpExtInst %1 32 %343 
                                                      OpStore %97 %344 
                                       f32_4 %345 = OpLoad %84 
                              Uniform f32_4* %346 = OpAccessChain %19 %86 
                                       f32_4 %347 = OpLoad %346 
                                       f32_4 %348 = OpFMul %345 %347 
                                       f32_4 %350 = OpFAdd %348 %349 
                                                      OpStore %84 %350 
                                       f32_4 %351 = OpLoad %84 
                                       f32_4 %352 = OpFDiv %349 %351 
                                                      OpStore %84 %352 
                                       f32_4 %353 = OpLoad %9 
                                       f32_4 %354 = OpLoad %97 
                                       f32_4 %355 = OpFMul %353 %354 
                                                      OpStore %9 %355 
                                       f32_4 %356 = OpLoad %9 
                                       f32_4 %358 = OpExtInst %1 40 %356 %357 
                                                      OpStore %9 %358 
                                       f32_4 %359 = OpLoad %84 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %361 = OpFMul %359 %360 
                                                      OpStore %9 %361 
                                       f32_4 %362 = OpLoad %9 
                                       f32_3 %363 = OpVectorShuffle %362 %362 1 1 1 
                              Uniform f32_4* %365 = OpAccessChain %19 %364 %63 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFMul %363 %367 
                                       f32_4 %369 = OpLoad %84 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %84 %370 
                              Uniform f32_4* %371 = OpAccessChain %19 %364 %68 
                                       f32_4 %372 = OpLoad %371 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_4 %374 = OpLoad %9 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 0 0 
                                       f32_3 %376 = OpFMul %373 %375 
                                       f32_4 %377 = OpLoad %84 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpFAdd %376 %378 
                                       f32_4 %380 = OpLoad %84 
                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                                      OpStore %84 %381 
                              Uniform f32_4* %382 = OpAccessChain %19 %364 %76 
                                       f32_4 %383 = OpLoad %382 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 2 2 2 
                                       f32_3 %387 = OpFMul %384 %386 
                                       f32_4 %388 = OpLoad %84 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                       f32_3 %390 = OpFAdd %387 %389 
                                       f32_4 %391 = OpLoad %9 
                                       f32_4 %392 = OpVectorShuffle %391 %390 4 5 6 3 
                                                      OpStore %9 %392 
                              Uniform f32_4* %393 = OpAccessChain %19 %364 %86 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                       f32_4 %396 = OpLoad %9 
                                       f32_3 %397 = OpVectorShuffle %396 %396 3 3 3 
                                       f32_3 %398 = OpFMul %395 %397 
                                       f32_4 %399 = OpLoad %9 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_3 %401 = OpFAdd %398 %400 
                                       f32_4 %402 = OpLoad %9 
                                       f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
                                                      OpStore %9 %403 
                                       f32_4 %404 = OpLoad %9 
                                       f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                                       f32_3 %406 = OpLoad %272 
                                       f32_3 %407 = OpFAdd %405 %406 
                                       f32_4 %408 = OpLoad %9 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 5 6 3 
                                                      OpStore %9 %409 
                                       f32_4 %411 = OpLoad %9 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 2 
                                                      OpStore %410 %412 
                                 Output f32* %414 = OpAccessChain %121 %68 %50 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                 Output f32* %417 = OpAccessChain %121 %68 %50 
                                                      OpStore %417 %416 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %115 %228 %230 
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
                                                      OpMemberDecorate %28 7 RelaxedPrecision 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %106 SpecId 106 
                                                      OpDecorate %115 Location 115 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %228 Location 228 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %230 Location 230 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
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
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                               Private f32_3* %51 = OpVariable Private 
                                          u32 %52 = OpConstant 3 
                                              %53 = OpTypePointer Private %6 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          u32 %58 = OpConstant 0 
                                              %60 = OpTypeBool 
                                              %61 = OpTypePointer Private %60 
                                Private bool* %62 = OpVariable Private 
                                          f32 %65 = OpConstant 3.67402E-40 
                                          i32 %68 = OpConstant 0 
                                          i32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant -1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        bool %100 = OpConstantFalse 
                                        bool %106 = OpSpecConstantFalse 
                                         u32 %109 = OpConstant 1 
                              Private f32_3* %113 = OpVariable Private 
                                             %114 = OpTypePointer Input %21 
                                Input f32_3* %115 = OpVariable Input 
                                         i32 %118 = OpConstant 2 
                                         i32 %140 = OpConstant 3 
                                             %145 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         f32 %177 = OpConstant 3.67402E-40 
                                Private f32* %180 = OpVariable Private 
                                         u32 %181 = OpConstant 2 
                                         f32 %184 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_4* %200 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %218 = OpConstant 5 
                                             %227 = OpTypePointer Output %7 
                               Output f32_4* %228 = OpVariable Output 
                                Input f32_3* %230 = OpVariable Input 
                                             %239 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %146 = OpVariable Function 
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
                                 Private f32* %54 = OpAccessChain %9 %52 
                                          f32 %55 = OpLoad %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %59 = OpAccessChain %51 %58 
                                                      OpStore %59 %57 
                                 Private f32* %63 = OpAccessChain %51 %58 
                                          f32 %64 = OpLoad %63 
                                         bool %66 = OpFOrdLessThan %64 %65 
                                                      OpStore %62 %66 
                                         bool %67 = OpLoad %62 
                                          i32 %70 = OpSelect %67 %69 %68 
                                          i32 %72 = OpIMul %70 %71 
                                         bool %73 = OpINotEqual %72 %68 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpKill
                                              %75 = OpLabel 
                                 Private f32* %77 = OpAccessChain %9 %52 
                                          f32 %78 = OpLoad %77 
                                 Uniform f32* %81 = OpAccessChain %30 %79 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFNegate %82 
                                          f32 %84 = OpFAdd %78 %83 
                                 Private f32* %85 = OpAccessChain %51 %58 
                                                      OpStore %85 %84 
                                 Private f32* %86 = OpAccessChain %51 %58 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdLessThan %87 %65 
                                                      OpStore %62 %88 
                                         bool %89 = OpLoad %62 
                                          i32 %90 = OpSelect %89 %69 %68 
                                          i32 %91 = OpIMul %90 %71 
                                         bool %92 = OpINotEqual %91 %68 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                                      OpKill
                                              %94 = OpLabel 
                                 Uniform f32* %96 = OpAccessChain %30 %69 %58 
                                          f32 %97 = OpLoad %96 
                                         bool %99 = OpFOrdEqual %97 %98 
                                                      OpStore %62 %99 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %102 
                                             %101 = OpLabel 
                                        bool %103 = OpLoad %62 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %105 
                                             %104 = OpLabel 
                                                      OpBranch %105 
                                             %105 = OpLabel 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %202 
                                             %107 = OpLabel 
                                Uniform f32* %110 = OpAccessChain %30 %69 %109 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %98 
                                                      OpStore %62 %112 
                                       f32_3 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 1 1 1 
                              Uniform f32_4* %119 = OpAccessChain %30 %118 %69 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFMul %117 %121 
                                                      OpStore %113 %122 
                              Uniform f32_4* %123 = OpAccessChain %30 %118 %68 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpLoad %115 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %113 
                                       f32_3 %130 = OpFAdd %128 %129 
                                                      OpStore %113 %130 
                              Uniform f32_4* %131 = OpAccessChain %30 %118 %118 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpLoad %115 
                                       f32_3 %135 = OpVectorShuffle %134 %134 2 2 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_3 %137 = OpLoad %113 
                                       f32_3 %138 = OpFAdd %136 %137 
                                                      OpStore %113 %138 
                                       f32_3 %139 = OpLoad %113 
                              Uniform f32_4* %141 = OpAccessChain %30 %118 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFAdd %139 %143 
                                                      OpStore %113 %144 
                                        bool %147 = OpLoad %62 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %151 
                                             %148 = OpLabel 
                                       f32_3 %150 = OpLoad %113 
                                                      OpStore %146 %150 
                                                      OpBranch %149 
                                             %151 = OpLabel 
                                       f32_3 %152 = OpLoad %115 
                                                      OpStore %146 %152 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                       f32_3 %153 = OpLoad %146 
                                       f32_4 %154 = OpLoad %20 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %20 %155 
                                       f32_4 %156 = OpLoad %20 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_3* %160 = OpAccessChain %30 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                       f32_4 %164 = OpLoad %20 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %20 %165 
                                       f32_4 %166 = OpLoad %20 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %30 %140 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %20 
                                       f32_4 %172 = OpVectorShuffle %171 %170 0 4 5 6 
                                                      OpStore %20 %172 
                                Private f32* %173 = OpAccessChain %20 %109 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFMul %174 %175 
                                         f32 %178 = OpFAdd %176 %177 
                                Private f32* %179 = OpAccessChain %113 %58 
                                                      OpStore %179 %178 
                                Uniform f32* %182 = OpAccessChain %30 %69 %181 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %186 = OpFAdd %185 %177 
                                                      OpStore %180 %186 
                                Private f32* %187 = OpAccessChain %113 %58 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpLoad %180 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %20 %58 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %20 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %20 %199 
                                       f32_4 %201 = OpLoad %20 
                                                      OpStore %200 %201 
                                                      OpBranch %108 
                                             %202 = OpLabel 
                                Private f32* %203 = OpAccessChain %200 %58 
                                                      OpStore %203 %98 
                                Private f32* %204 = OpAccessChain %200 %109 
                                                      OpStore %204 %98 
                                Private f32* %205 = OpAccessChain %200 %181 
                                                      OpStore %205 %98 
                                Private f32* %206 = OpAccessChain %200 %52 
                                                      OpStore %206 %98 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                       f32_4 %207 = OpLoad %200 
                              Uniform f32_4* %208 = OpAccessChain %30 %68 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                Private f32* %211 = OpAccessChain %51 %58 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %51 %58 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpExtInst %1 43 %213 %65 %98 
                                Private f32* %215 = OpAccessChain %51 %58 
                                                      OpStore %215 %214 
                                       f32_3 %217 = OpLoad %41 
                              Uniform f32_4* %219 = OpAccessChain %30 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_3 %222 = OpFMul %217 %221 
                                                      OpStore %216 %222 
                                       f32_3 %223 = OpLoad %51 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                                       f32_3 %225 = OpLoad %216 
                                       f32_3 %226 = OpFMul %224 %225 
                                                      OpStore %51 %226 
                                       f32_3 %229 = OpLoad %41 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %229 %231 
                                       f32_3 %233 = OpLoad %51 
                                       f32_3 %234 = OpFAdd %232 %233 
                                       f32_4 %235 = OpLoad %228 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %228 %236 
                                Private f32* %237 = OpAccessChain %9 %52 
                                         f32 %238 = OpLoad %237 
                                 Output f32* %240 = OpAccessChain %228 %52 
                                                      OpStore %240 %238 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat13 = u_xlat0.w + -0.100000001;
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
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
; Bound: 350
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %128 %134 %135 %149 %186 %189 %192 %311 %331 %343 
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
                                                      OpDecorate %192 Location 192 
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
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate %343 Location 343 
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
                                          i32 %21 = OpConstant 10 
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
                              Private f32_4* %194 = OpVariable Private 
                              Private f32_4* %201 = OpVariable Private 
                              Private f32_4* %209 = OpVariable Private 
                                         f32 %245 = OpConstant 3.67402E-40 
                                       f32_4 %246 = OpConstantComposite %245 %245 %245 %245 
                                         i32 %251 = OpConstant 4 
                                       f32_4 %255 = OpConstantComposite %46 %46 %46 %46 
                                         f32 %263 = OpConstant 3.67402E-40 
                                       f32_4 %264 = OpConstantComposite %263 %263 %263 %263 
                                         i32 %271 = OpConstant 5 
                               Output f32_3* %311 = OpVariable Output 
                                         u32 %323 = OpConstant 3 
                                       f32_2 %327 = OpConstantComposite %39 %39 
                               Output f32_4* %331 = OpVariable Output 
                               Output f32_4* %343 = OpVariable Output 
                                             %344 = OpTypePointer Output %6 
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
                                       f32_4 %193 = OpLoad %9 
                                                      OpStore %192 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %195 1 1 1 1 
                                       f32_4 %197 = OpFNegate %196 
                              Uniform f32_4* %198 = OpAccessChain %19 %76 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpFAdd %197 %199 
                                                      OpStore %194 %200 
                                       f32_4 %202 = OpLoad %97 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                                       f32_4 %204 = OpLoad %194 
                                       f32_4 %205 = OpFMul %203 %204 
                                                      OpStore %201 %205 
                                       f32_4 %206 = OpLoad %194 
                                       f32_4 %207 = OpLoad %194 
                                       f32_4 %208 = OpFMul %206 %207 
                                                      OpStore %194 %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %210 0 0 0 0 
                                       f32_4 %212 = OpFNegate %211 
                              Uniform f32_4* %213 = OpAccessChain %19 %63 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpFAdd %212 %214 
                                                      OpStore %209 %215 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %216 2 2 2 2 
                                       f32_4 %218 = OpFNegate %217 
                              Uniform f32_4* %219 = OpAccessChain %19 %86 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpFAdd %218 %220 
                                                      OpStore %9 %221 
                                       f32_4 %222 = OpLoad %209 
                                       f32_4 %223 = OpLoad %97 
                                       f32_4 %224 = OpVectorShuffle %223 %223 0 0 0 0 
                                       f32_4 %225 = OpFMul %222 %224 
                                       f32_4 %226 = OpLoad %201 
                                       f32_4 %227 = OpFAdd %225 %226 
                                                      OpStore %201 %227 
                                       f32_4 %228 = OpLoad %209 
                                       f32_4 %229 = OpLoad %209 
                                       f32_4 %230 = OpFMul %228 %229 
                                       f32_4 %231 = OpLoad %194 
                                       f32_4 %232 = OpFAdd %230 %231 
                                                      OpStore %194 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpFMul %233 %234 
                                       f32_4 %236 = OpLoad %194 
                                       f32_4 %237 = OpFAdd %235 %236 
                                                      OpStore %194 %237 
                                       f32_4 %238 = OpLoad %9 
                                       f32_4 %239 = OpLoad %97 
                                       f32_4 %240 = OpVectorShuffle %239 %239 2 2 2 2 
                                       f32_4 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %201 
                                       f32_4 %243 = OpFAdd %241 %242 
                                                      OpStore %9 %243 
                                       f32_4 %244 = OpLoad %194 
                                       f32_4 %247 = OpExtInst %1 40 %244 %246 
                                                      OpStore %97 %247 
                                       f32_4 %248 = OpLoad %97 
                                       f32_4 %249 = OpExtInst %1 32 %248 
                                                      OpStore %194 %249 
                                       f32_4 %250 = OpLoad %97 
                              Uniform f32_4* %252 = OpAccessChain %19 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpFMul %250 %253 
                                       f32_4 %256 = OpFAdd %254 %255 
                                                      OpStore %97 %256 
                                       f32_4 %257 = OpLoad %97 
                                       f32_4 %258 = OpFDiv %255 %257 
                                                      OpStore %97 %258 
                                       f32_4 %259 = OpLoad %9 
                                       f32_4 %260 = OpLoad %194 
                                       f32_4 %261 = OpFMul %259 %260 
                                                      OpStore %9 %261 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %265 = OpExtInst %1 40 %262 %264 
                                                      OpStore %9 %265 
                                       f32_4 %266 = OpLoad %97 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpFMul %266 %267 
                                                      OpStore %9 %268 
                                       f32_4 %269 = OpLoad %9 
                                       f32_3 %270 = OpVectorShuffle %269 %269 1 1 1 
                              Uniform f32_4* %272 = OpAccessChain %19 %271 %63 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFMul %270 %274 
                                       f32_4 %276 = OpLoad %97 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %97 %277 
                              Uniform f32_4* %278 = OpAccessChain %19 %271 %68 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_4 %281 = OpLoad %9 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %97 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFAdd %283 %285 
                                       f32_4 %287 = OpLoad %97 
                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 6 3 
                                                      OpStore %97 %288 
                              Uniform f32_4* %289 = OpAccessChain %19 %271 %76 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                       f32_4 %292 = OpLoad %9 
                                       f32_3 %293 = OpVectorShuffle %292 %292 2 2 2 
                                       f32_3 %294 = OpFMul %291 %293 
                                       f32_4 %295 = OpLoad %97 
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
                                Private f32* %314 = OpAccessChain %84 %50 
                                         f32 %315 = OpLoad %314 
                                Uniform f32* %316 = OpAccessChain %19 %68 %27 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %315 %317 
                                Private f32* %319 = OpAccessChain %9 %27 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %9 %27 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpFMul %321 %39 
                                Private f32* %324 = OpAccessChain %9 %323 
                                                      OpStore %324 %322 
                                       f32_4 %325 = OpLoad %84 
                                       f32_2 %326 = OpVectorShuffle %325 %325 0 3 
                                       f32_2 %328 = OpFMul %326 %327 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 1 5 3 
                                                      OpStore %9 %330 
                                       f32_4 %332 = OpLoad %84 
                                       f32_2 %333 = OpVectorShuffle %332 %332 2 3 
                                       f32_4 %334 = OpLoad %331 
                                       f32_4 %335 = OpVectorShuffle %334 %333 0 1 4 5 
                                                      OpStore %331 %335 
                                       f32_4 %336 = OpLoad %9 
                                       f32_2 %337 = OpVectorShuffle %336 %336 2 2 
                                       f32_4 %338 = OpLoad %9 
                                       f32_2 %339 = OpVectorShuffle %338 %338 0 3 
                                       f32_2 %340 = OpFAdd %337 %339 
                                       f32_4 %341 = OpLoad %331 
                                       f32_4 %342 = OpVectorShuffle %341 %340 4 5 2 3 
                                                      OpStore %331 %342 
                                                      OpStore %343 %264 
                                 Output f32* %345 = OpAccessChain %128 %68 %50 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                 Output f32* %348 = OpAccessChain %128 %68 %50 
                                                      OpStore %348 %347 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 345
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %280 %331 %333 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %177 SpecId 177 
                                                      OpDecorate %258 DescriptorSet 258 
                                                      OpDecorate %258 Binding 258 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %333 Location 333 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %20 %7 %7 %7 %28 %7 %29 %20 %20 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 10 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 11 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                              %98 = OpTypePointer Uniform %20 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %103 = OpConstant 4 
                                         u32 %104 = OpConstant 2 
                                         u32 %110 = OpConstant 1 
                                         i32 %112 = OpConstant 2 
                              Private f32_3* %120 = OpVariable Private 
                                         i32 %122 = OpConstant 3 
                                         f32 %163 = OpConstant 3.67402E-40 
                               Private bool* %166 = OpVariable Private 
                                         i32 %167 = OpConstant 5 
                                        bool %171 = OpConstantFalse 
                                        bool %177 = OpSpecConstantFalse 
                               Private bool* %180 = OpVariable Private 
                                         i32 %186 = OpConstant 6 
                                             %212 = OpTypePointer Function %20 
                                         i32 %222 = OpConstant 8 
                              Private f32_4* %227 = OpVariable Private 
                                         i32 %229 = OpConstant 7 
                                             %235 = OpTypePointer Private %15 
                              Private f32_2* %236 = OpVariable Private 
                                         f32 %239 = OpConstant 3.67402E-40 
                                         f32 %241 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         f32 %247 = OpConstant 3.67402E-40 
                                             %255 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %256 = OpTypeSampledImage %255 
                                             %257 = OpTypePointer UniformConstant %256 
 UniformConstant read_only Texture3DSampled* %258 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %279 = OpTypePointer Input %7 
                                Input f32_4* %280 = OpVariable Input 
                                Private f32* %286 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %287 = OpVariable UniformConstant 
                              Private f32_3* %292 = OpVariable Private 
                                             %308 = OpTypePointer Function %6 
                                         i32 %321 = OpConstant 9 
                                             %330 = OpTypePointer Output %7 
                               Output f32_4* %331 = OpVariable Output 
                                Input f32_3* %333 = OpVariable Input 
                                             %342 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %213 = OpVariable Function 
                               Function f32* %309 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpFNegate %96 
                               Uniform f32_3* %99 = OpAccessChain %32 %66 
                                       f32_3 %100 = OpLoad %99 
                                       f32_3 %101 = OpFAdd %97 %100 
                                                      OpStore %22 %101 
                                Uniform f32* %105 = OpAccessChain %32 %103 %66 %104 
                                         f32 %106 = OpLoad %105 
                                Private f32* %107 = OpAccessChain %102 %56 
                                                      OpStore %107 %106 
                                Uniform f32* %108 = OpAccessChain %32 %103 %67 %104 
                                         f32 %109 = OpLoad %108 
                                Private f32* %111 = OpAccessChain %102 %110 
                                                      OpStore %111 %109 
                                Uniform f32* %113 = OpAccessChain %32 %103 %112 %104 
                                         f32 %114 = OpLoad %113 
                                Private f32* %115 = OpAccessChain %102 %104 
                                                      OpStore %115 %114 
                                       f32_3 %116 = OpLoad %22 
                                       f32_3 %117 = OpLoad %102 
                                         f32 %118 = OpDot %116 %117 
                                Private f32* %119 = OpAccessChain %22 %56 
                                                      OpStore %119 %118 
                                       f32_3 %121 = OpLoad %95 
                              Uniform f32_4* %123 = OpAccessChain %32 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %121 %126 
                                                      OpStore %120 %127 
                                       f32_3 %128 = OpLoad %120 
                                       f32_3 %129 = OpLoad %120 
                                         f32 %130 = OpDot %128 %129 
                                Private f32* %131 = OpAccessChain %120 %56 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %120 %56 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpExtInst %1 31 %133 
                                Private f32* %135 = OpAccessChain %120 %56 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %22 %56 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Private f32* %139 = OpAccessChain %120 %56 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %120 %56 
                                                      OpStore %142 %141 
                                Uniform f32* %143 = OpAccessChain %32 %122 %50 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %120 %56 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFMul %144 %146 
                                Private f32* %148 = OpAccessChain %22 %56 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFAdd %147 %149 
                                Private f32* %151 = OpAccessChain %22 %56 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %22 %56 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %154 = OpAccessChain %32 %112 %104 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Uniform f32* %157 = OpAccessChain %32 %112 %50 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %22 %56 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %22 %56 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpExtInst %1 43 %162 %63 %163 
                                Private f32* %165 = OpAccessChain %22 %56 
                                                      OpStore %165 %164 
                                Uniform f32* %168 = OpAccessChain %32 %167 %56 
                                         f32 %169 = OpLoad %168 
                                        bool %170 = OpFOrdEqual %169 %163 
                                                      OpStore %166 %170 
                                                      OpSelectionMerge %173 None 
                                                      OpBranchConditional %171 %172 %173 
                                             %172 = OpLabel 
                                        bool %174 = OpLoad %166 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %176 
                                             %175 = OpLabel 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                                      OpBranch %173 
                                             %173 = OpLabel 
                                                      OpSelectionMerge %179 None 
                                                      OpBranchConditional %177 %178 %264 
                                             %178 = OpLabel 
                                Uniform f32* %181 = OpAccessChain %32 %167 %110 
                                         f32 %182 = OpLoad %181 
                                        bool %183 = OpFOrdEqual %182 %163 
                                                      OpStore %180 %183 
                                       f32_3 %184 = OpLoad %95 
                                       f32_3 %185 = OpVectorShuffle %184 %184 1 1 1 
                              Uniform f32_4* %187 = OpAccessChain %32 %186 %67 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %185 %189 
                                                      OpStore %102 %190 
                              Uniform f32_4* %191 = OpAccessChain %32 %186 %66 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpLoad %95 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_3 %197 = OpLoad %102 
                                       f32_3 %198 = OpFAdd %196 %197 
                                                      OpStore %102 %198 
                              Uniform f32_4* %199 = OpAccessChain %32 %186 %112 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpLoad %95 
                                       f32_3 %203 = OpVectorShuffle %202 %202 2 2 2 
                                       f32_3 %204 = OpFMul %201 %203 
                                       f32_3 %205 = OpLoad %102 
                                       f32_3 %206 = OpFAdd %204 %205 
                                                      OpStore %102 %206 
                                       f32_3 %207 = OpLoad %102 
                              Uniform f32_4* %208 = OpAccessChain %32 %186 %122 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %207 %210 
                                                      OpStore %102 %211 
                                        bool %214 = OpLoad %180 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %218 
                                             %215 = OpLabel 
                                       f32_3 %217 = OpLoad %102 
                                                      OpStore %213 %217 
                                                      OpBranch %216 
                                             %218 = OpLabel 
                                       f32_3 %219 = OpLoad %95 
                                                      OpStore %213 %219 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_3 %220 = OpLoad %213 
                                                      OpStore %102 %220 
                                       f32_3 %221 = OpLoad %102 
                              Uniform f32_3* %223 = OpAccessChain %32 %222 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFNegate %224 
                                       f32_3 %226 = OpFAdd %221 %225 
                                                      OpStore %102 %226 
                                       f32_3 %228 = OpLoad %102 
                              Uniform f32_3* %230 = OpAccessChain %32 %229 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %228 %231 
                                       f32_4 %233 = OpLoad %227 
                                       f32_4 %234 = OpVectorShuffle %233 %232 0 4 5 6 
                                                      OpStore %227 %234 
                                Private f32* %237 = OpAccessChain %227 %110 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                         f32 %242 = OpFAdd %240 %241 
                                Private f32* %243 = OpAccessChain %236 %56 
                                                      OpStore %243 %242 
                                Uniform f32* %245 = OpAccessChain %32 %167 %104 
                                         f32 %246 = OpLoad %245 
                                         f32 %248 = OpFMul %246 %247 
                                         f32 %249 = OpFAdd %248 %241 
                                                      OpStore %244 %249 
                                         f32 %250 = OpLoad %244 
                                Private f32* %251 = OpAccessChain %236 %56 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpExtInst %1 40 %250 %252 
                                Private f32* %254 = OpAccessChain %227 %56 
                                                      OpStore %254 %253 
                  read_only Texture3DSampled %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %227 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 2 3 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                                      OpStore %227 %262 
                                       f32_4 %263 = OpLoad %227 
                                                      OpStore %49 %263 
                                                      OpBranch %179 
                                             %264 = OpLabel 
                                Private f32* %265 = OpAccessChain %49 %56 
                                                      OpStore %265 %163 
                                Private f32* %266 = OpAccessChain %49 %110 
                                                      OpStore %266 %163 
                                Private f32* %267 = OpAccessChain %49 %104 
                                                      OpStore %267 %163 
                                Private f32* %268 = OpAccessChain %49 %50 
                                                      OpStore %268 %163 
                                                      OpBranch %179 
                                             %179 = OpLabel 
                                       f32_4 %270 = OpLoad %49 
                              Uniform f32_4* %271 = OpAccessChain %32 %67 
                                       f32_4 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                Private f32* %274 = OpAccessChain %269 %56 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %269 %56 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 43 %276 %63 %163 
                                Private f32* %278 = OpAccessChain %269 %56 
                                                      OpStore %278 %277 
                                       f32_4 %281 = OpLoad %280 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpLoad %280 
                                       f32_2 %284 = OpVectorShuffle %283 %283 3 3 
                                       f32_2 %285 = OpFDiv %282 %284 
                                                      OpStore %236 %285 
                  read_only Texture2DSampled %288 = OpLoad %287 
                                       f32_2 %289 = OpLoad %236 
                                       f32_4 %290 = OpImageSampleImplicitLod %288 %289 
                                         f32 %291 = OpCompositeExtract %290 0 
                                                      OpStore %286 %291 
                                Private f32* %293 = OpAccessChain %22 %56 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpLoad %286 
                                         f32 %296 = OpFAdd %294 %295 
                                Private f32* %297 = OpAccessChain %292 %56 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %292 %56 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %63 %163 
                                Private f32* %301 = OpAccessChain %292 %56 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %292 %56 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %269 %56 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 37 %303 %305 
                                Private f32* %307 = OpAccessChain %269 %56 
                                                      OpStore %307 %306 
                                        bool %310 = OpLoad %166 
                                                      OpSelectionMerge %312 None 
                                                      OpBranchConditional %310 %311 %315 
                                             %311 = OpLabel 
                                Private f32* %313 = OpAccessChain %269 %56 
                                         f32 %314 = OpLoad %313 
                                                      OpStore %309 %314 
                                                      OpBranch %312 
                                             %315 = OpLabel 
                                Private f32* %316 = OpAccessChain %292 %56 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %309 %317 
                                                      OpBranch %312 
                                             %312 = OpLabel 
                                         f32 %318 = OpLoad %309 
                                Private f32* %319 = OpAccessChain %269 %56 
                                                      OpStore %319 %318 
                                       f32_3 %320 = OpLoad %40 
                              Uniform f32_4* %322 = OpAccessChain %32 %321 
                                       f32_4 %323 = OpLoad %322 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFMul %320 %324 
                                                      OpStore %292 %325 
                                       f32_3 %326 = OpLoad %269 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
                                       f32_3 %328 = OpLoad %292 
                                       f32_3 %329 = OpFMul %327 %328 
                                                      OpStore %269 %329 
                                       f32_3 %332 = OpLoad %40 
                                       f32_3 %334 = OpLoad %333 
                                       f32_3 %335 = OpFMul %332 %334 
                                       f32_3 %336 = OpLoad %269 
                                       f32_3 %337 = OpFAdd %335 %336 
                                       f32_4 %338 = OpLoad %331 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %331 %339 
                                Private f32* %340 = OpAccessChain %9 %50 
                                         f32 %341 = OpLoad %340 
                                 Output f32* %343 = OpAccessChain %331 %50 
                                                      OpStore %343 %341 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + _TintColor.xyz;
    u_xlat1.xyz = _TintColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat13 = u_xlat0.w + -0.100000001;
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
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
; Bound: 452
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %128 %134 %135 %149 %186 %189 %192 %414 %433 %445 
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
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %414 RelaxedPrecision 
                                                      OpDecorate %414 Location 414 
                                                      OpDecorate %433 Location 433 
                                                      OpDecorate %445 Location 445 
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
                                          i32 %21 = OpConstant 17 
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
                                             %194 = OpTypePointer Private %147 
                              Private f32_3* %195 = OpVariable Private 
                              Private f32_4* %212 = OpVariable Private 
                              Private f32_3* %218 = OpVariable Private 
                                         i32 %219 = OpConstant 9 
                                         i32 %225 = OpConstant 10 
                                         i32 %231 = OpConstant 11 
                                         i32 %237 = OpConstant 12 
                                         u32 %246 = OpConstant 3 
                                         i32 %248 = OpConstant 6 
                                         i32 %254 = OpConstant 7 
                                         i32 %260 = OpConstant 8 
                                         f32 %271 = OpConstant 3.67402E-40 
                                       f32_3 %272 = OpConstantComposite %271 %271 %271 
                              Private f32_3* %274 = OpVariable Private 
                                         f32 %278 = OpConstant 3.67402E-40 
                                       f32_3 %279 = OpConstantComposite %278 %278 %278 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %284 %284 %284 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_3 %288 = OpConstantComposite %287 %287 %287 
                              Private f32_4* %292 = OpVariable Private 
                              Private f32_4* %299 = OpVariable Private 
                              Private f32_4* %307 = OpVariable Private 
                                         f32 %343 = OpConstant 3.67402E-40 
                                       f32_4 %344 = OpConstantComposite %343 %343 %343 %343 
                                         i32 %349 = OpConstant 4 
                                       f32_4 %353 = OpConstantComposite %46 %46 %46 %46 
                                       f32_4 %361 = OpConstantComposite %271 %271 %271 %271 
                                         i32 %368 = OpConstant 5 
                               Output f32_3* %414 = OpVariable Output 
                                       f32_2 %429 = OpConstantComposite %39 %39 
                               Output f32_4* %433 = OpVariable Output 
                               Output f32_4* %445 = OpVariable Output 
                                             %446 = OpTypePointer Output %6 
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
                                       f32_4 %193 = OpLoad %9 
                                                      OpStore %192 %193 
                                Private f32* %196 = OpAccessChain %97 %50 
                                         f32 %197 = OpLoad %196 
                                Private f32* %198 = OpAccessChain %97 %50 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFMul %197 %199 
                                Private f32* %201 = OpAccessChain %195 %27 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %97 %27 
                                         f32 %203 = OpLoad %202 
                                Private f32* %204 = OpAccessChain %97 %27 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %203 %205 
                                Private f32* %207 = OpAccessChain %195 %27 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFNegate %208 
                                         f32 %210 = OpFAdd %206 %209 
                                Private f32* %211 = OpAccessChain %195 %27 
                                                      OpStore %211 %210 
                                       f32_4 %213 = OpLoad %97 
                                       f32_4 %214 = OpVectorShuffle %213 %213 1 2 2 0 
                                       f32_4 %215 = OpLoad %97 
                                       f32_4 %216 = OpVectorShuffle %215 %215 0 1 2 2 
                                       f32_4 %217 = OpFMul %214 %216 
                                                      OpStore %212 %217 
                              Uniform f32_4* %220 = OpAccessChain %19 %219 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpLoad %212 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %218 %27 
                                                      OpStore %224 %223 
                              Uniform f32_4* %226 = OpAccessChain %19 %225 
                                       f32_4 %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %212 
                                         f32 %229 = OpDot %227 %228 
                                Private f32* %230 = OpAccessChain %218 %50 
                                                      OpStore %230 %229 
                              Uniform f32_4* %232 = OpAccessChain %19 %231 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %212 
                                         f32 %235 = OpDot %233 %234 
                                Private f32* %236 = OpAccessChain %218 %168 
                                                      OpStore %236 %235 
                              Uniform f32_4* %238 = OpAccessChain %19 %237 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpLoad %195 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 0 0 
                                       f32_3 %243 = OpFMul %240 %242 
                                       f32_3 %244 = OpLoad %218 
                                       f32_3 %245 = OpFAdd %243 %244 
                                                      OpStore %195 %245 
                                Private f32* %247 = OpAccessChain %97 %246 
                                                      OpStore %247 %46 
                              Uniform f32_4* %249 = OpAccessChain %19 %248 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %97 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %212 %27 
                                                      OpStore %253 %252 
                              Uniform f32_4* %255 = OpAccessChain %19 %254 
                                       f32_4 %256 = OpLoad %255 
                                       f32_4 %257 = OpLoad %97 
                                         f32 %258 = OpDot %256 %257 
                                Private f32* %259 = OpAccessChain %212 %50 
                                                      OpStore %259 %258 
                              Uniform f32_4* %261 = OpAccessChain %19 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_4 %263 = OpLoad %97 
                                         f32 %264 = OpDot %262 %263 
                                Private f32* %265 = OpAccessChain %212 %168 
                                                      OpStore %265 %264 
                                       f32_3 %266 = OpLoad %195 
                                       f32_4 %267 = OpLoad %212 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %269 = OpFAdd %266 %268 
                                                      OpStore %195 %269 
                                       f32_3 %270 = OpLoad %195 
                                       f32_3 %273 = OpExtInst %1 40 %270 %272 
                                                      OpStore %195 %273 
                                       f32_3 %275 = OpLoad %195 
                                       f32_3 %276 = OpExtInst %1 30 %275 
                                                      OpStore %274 %276 
                                       f32_3 %277 = OpLoad %274 
                                       f32_3 %280 = OpFMul %277 %279 
                                                      OpStore %274 %280 
                                       f32_3 %281 = OpLoad %274 
                                       f32_3 %282 = OpExtInst %1 29 %281 
                                                      OpStore %274 %282 
                                       f32_3 %283 = OpLoad %274 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_3 %289 = OpFAdd %286 %288 
                                                      OpStore %274 %289 
                                       f32_3 %290 = OpLoad %274 
                                       f32_3 %291 = OpExtInst %1 40 %290 %272 
                                                      OpStore %274 %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 1 1 1 1 
                                       f32_4 %295 = OpFNegate %294 
                              Uniform f32_4* %296 = OpAccessChain %19 %76 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpFAdd %295 %297 
                                                      OpStore %292 %298 
                                       f32_4 %300 = OpLoad %97 
                                       f32_4 %301 = OpVectorShuffle %300 %300 1 1 1 1 
                                       f32_4 %302 = OpLoad %292 
                                       f32_4 %303 = OpFMul %301 %302 
                                                      OpStore %299 %303 
                                       f32_4 %304 = OpLoad %292 
                                       f32_4 %305 = OpLoad %292 
                                       f32_4 %306 = OpFMul %304 %305 
                                                      OpStore %292 %306 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %309 = OpVectorShuffle %308 %308 0 0 0 0 
                                       f32_4 %310 = OpFNegate %309 
                              Uniform f32_4* %311 = OpAccessChain %19 %63 
                                       f32_4 %312 = OpLoad %311 
                                       f32_4 %313 = OpFAdd %310 %312 
                                                      OpStore %307 %313 
                                       f32_4 %314 = OpLoad %9 
                                       f32_4 %315 = OpVectorShuffle %314 %314 2 2 2 2 
                                       f32_4 %316 = OpFNegate %315 
                              Uniform f32_4* %317 = OpAccessChain %19 %86 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpFAdd %316 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %307 
                                       f32_4 %321 = OpLoad %97 
                                       f32_4 %322 = OpVectorShuffle %321 %321 0 0 0 0 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %299 
                                       f32_4 %325 = OpFAdd %323 %324 
                                                      OpStore %299 %325 
                                       f32_4 %326 = OpLoad %307 
                                       f32_4 %327 = OpLoad %307 
                                       f32_4 %328 = OpFMul %326 %327 
                                       f32_4 %329 = OpLoad %292 
                                       f32_4 %330 = OpFAdd %328 %329 
                                                      OpStore %292 %330 
                                       f32_4 %331 = OpLoad %9 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpFMul %331 %332 
                                       f32_4 %334 = OpLoad %292 
                                       f32_4 %335 = OpFAdd %333 %334 
                                                      OpStore %292 %335 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpLoad %97 
                                       f32_4 %338 = OpVectorShuffle %337 %337 2 2 2 2 
                                       f32_4 %339 = OpFMul %336 %338 
                                       f32_4 %340 = OpLoad %299 
                                       f32_4 %341 = OpFAdd %339 %340 
                                                      OpStore %9 %341 
                                       f32_4 %342 = OpLoad %292 
                                       f32_4 %345 = OpExtInst %1 40 %342 %344 
                                                      OpStore %97 %345 
                                       f32_4 %346 = OpLoad %97 
                                       f32_4 %347 = OpExtInst %1 32 %346 
                                                      OpStore %292 %347 
                                       f32_4 %348 = OpLoad %97 
                              Uniform f32_4* %350 = OpAccessChain %19 %349 
                                       f32_4 %351 = OpLoad %350 
                                       f32_4 %352 = OpFMul %348 %351 
                                       f32_4 %354 = OpFAdd %352 %353 
                                                      OpStore %97 %354 
                                       f32_4 %355 = OpLoad %97 
                                       f32_4 %356 = OpFDiv %353 %355 
                                                      OpStore %97 %356 
                                       f32_4 %357 = OpLoad %9 
                                       f32_4 %358 = OpLoad %292 
                                       f32_4 %359 = OpFMul %357 %358 
                                                      OpStore %9 %359 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %362 = OpExtInst %1 40 %360 %361 
                                                      OpStore %9 %362 
                                       f32_4 %363 = OpLoad %97 
                                       f32_4 %364 = OpLoad %9 
                                       f32_4 %365 = OpFMul %363 %364 
                                                      OpStore %9 %365 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 1 1 1 
                              Uniform f32_4* %369 = OpAccessChain %19 %368 %63 
                                       f32_4 %370 = OpLoad %369 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_3 %372 = OpFMul %367 %371 
                                       f32_4 %373 = OpLoad %97 
                                       f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
                                                      OpStore %97 %374 
                              Uniform f32_4* %375 = OpAccessChain %19 %368 %68 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 0 0 
                                       f32_3 %380 = OpFMul %377 %379 
                                       f32_4 %381 = OpLoad %97 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_3 %383 = OpFAdd %380 %382 
                                       f32_4 %384 = OpLoad %97 
                                       f32_4 %385 = OpVectorShuffle %384 %383 4 5 6 3 
                                                      OpStore %97 %385 
                              Uniform f32_4* %386 = OpAccessChain %19 %368 %76 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 2 2 2 
                                       f32_3 %391 = OpFMul %388 %390 
                                       f32_4 %392 = OpLoad %97 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %9 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %9 %396 
                              Uniform f32_4* %397 = OpAccessChain %19 %368 %86 
                                       f32_4 %398 = OpLoad %397 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_4 %400 = OpLoad %9 
                                       f32_3 %401 = OpVectorShuffle %400 %400 3 3 3 
                                       f32_3 %402 = OpFMul %399 %401 
                                       f32_4 %403 = OpLoad %9 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                       f32_3 %405 = OpFAdd %402 %404 
                                       f32_4 %406 = OpLoad %9 
                                       f32_4 %407 = OpVectorShuffle %406 %405 4 5 6 3 
                                                      OpStore %9 %407 
                                       f32_4 %408 = OpLoad %9 
                                       f32_3 %409 = OpVectorShuffle %408 %408 0 1 2 
                                       f32_3 %410 = OpLoad %274 
                                       f32_3 %411 = OpFAdd %409 %410 
                                       f32_4 %412 = OpLoad %9 
                                       f32_4 %413 = OpVectorShuffle %412 %411 4 5 6 3 
                                                      OpStore %9 %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 1 2 
                                                      OpStore %414 %416 
                                Private f32* %417 = OpAccessChain %84 %50 
                                         f32 %418 = OpLoad %417 
                                Uniform f32* %419 = OpAccessChain %19 %68 %27 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFMul %418 %420 
                                Private f32* %422 = OpAccessChain %9 %27 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %9 %27 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFMul %424 %39 
                                Private f32* %426 = OpAccessChain %9 %246 
                                                      OpStore %426 %425 
                                       f32_4 %427 = OpLoad %84 
                                       f32_2 %428 = OpVectorShuffle %427 %427 0 3 
                                       f32_2 %430 = OpFMul %428 %429 
                                       f32_4 %431 = OpLoad %9 
                                       f32_4 %432 = OpVectorShuffle %431 %430 4 1 5 3 
                                                      OpStore %9 %432 
                                       f32_4 %434 = OpLoad %84 
                                       f32_2 %435 = OpVectorShuffle %434 %434 2 3 
                                       f32_4 %436 = OpLoad %433 
                                       f32_4 %437 = OpVectorShuffle %436 %435 0 1 4 5 
                                                      OpStore %433 %437 
                                       f32_4 %438 = OpLoad %9 
                                       f32_2 %439 = OpVectorShuffle %438 %438 2 2 
                                       f32_4 %440 = OpLoad %9 
                                       f32_2 %441 = OpVectorShuffle %440 %440 0 3 
                                       f32_2 %442 = OpFAdd %439 %441 
                                       f32_4 %443 = OpLoad %433 
                                       f32_4 %444 = OpVectorShuffle %443 %442 4 5 2 3 
                                                      OpStore %433 %444 
                                                      OpStore %445 %361 
                                 Output f32* %447 = OpAccessChain %128 %68 %50 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFNegate %448 
                                 Output f32* %450 = OpAccessChain %128 %68 %50 
                                                      OpStore %450 %449 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 345
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %280 %331 %333 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %177 SpecId 177 
                                                      OpDecorate %258 DescriptorSet 258 
                                                      OpDecorate %258 Binding 258 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %331 Location 331 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %333 Location 333 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %20 %7 %7 %7 %28 %7 %29 %20 %20 %7 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 10 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 11 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                              %98 = OpTypePointer Uniform %20 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %103 = OpConstant 4 
                                         u32 %104 = OpConstant 2 
                                         u32 %110 = OpConstant 1 
                                         i32 %112 = OpConstant 2 
                              Private f32_3* %120 = OpVariable Private 
                                         i32 %122 = OpConstant 3 
                                         f32 %163 = OpConstant 3.67402E-40 
                               Private bool* %166 = OpVariable Private 
                                         i32 %167 = OpConstant 5 
                                        bool %171 = OpConstantFalse 
                                        bool %177 = OpSpecConstantFalse 
                               Private bool* %180 = OpVariable Private 
                                         i32 %186 = OpConstant 6 
                                             %212 = OpTypePointer Function %20 
                                         i32 %222 = OpConstant 8 
                              Private f32_4* %227 = OpVariable Private 
                                         i32 %229 = OpConstant 7 
                                             %235 = OpTypePointer Private %15 
                              Private f32_2* %236 = OpVariable Private 
                                         f32 %239 = OpConstant 3.67402E-40 
                                         f32 %241 = OpConstant 3.67402E-40 
                                Private f32* %244 = OpVariable Private 
                                         f32 %247 = OpConstant 3.67402E-40 
                                             %255 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %256 = OpTypeSampledImage %255 
                                             %257 = OpTypePointer UniformConstant %256 
 UniformConstant read_only Texture3DSampled* %258 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %279 = OpTypePointer Input %7 
                                Input f32_4* %280 = OpVariable Input 
                                Private f32* %286 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %287 = OpVariable UniformConstant 
                              Private f32_3* %292 = OpVariable Private 
                                             %308 = OpTypePointer Function %6 
                                         i32 %321 = OpConstant 9 
                                             %330 = OpTypePointer Output %7 
                               Output f32_4* %331 = OpVariable Output 
                                Input f32_3* %333 = OpVariable Input 
                                             %342 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %213 = OpVariable Function 
                               Function f32* %309 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpFNegate %96 
                               Uniform f32_3* %99 = OpAccessChain %32 %66 
                                       f32_3 %100 = OpLoad %99 
                                       f32_3 %101 = OpFAdd %97 %100 
                                                      OpStore %22 %101 
                                Uniform f32* %105 = OpAccessChain %32 %103 %66 %104 
                                         f32 %106 = OpLoad %105 
                                Private f32* %107 = OpAccessChain %102 %56 
                                                      OpStore %107 %106 
                                Uniform f32* %108 = OpAccessChain %32 %103 %67 %104 
                                         f32 %109 = OpLoad %108 
                                Private f32* %111 = OpAccessChain %102 %110 
                                                      OpStore %111 %109 
                                Uniform f32* %113 = OpAccessChain %32 %103 %112 %104 
                                         f32 %114 = OpLoad %113 
                                Private f32* %115 = OpAccessChain %102 %104 
                                                      OpStore %115 %114 
                                       f32_3 %116 = OpLoad %22 
                                       f32_3 %117 = OpLoad %102 
                                         f32 %118 = OpDot %116 %117 
                                Private f32* %119 = OpAccessChain %22 %56 
                                                      OpStore %119 %118 
                                       f32_3 %121 = OpLoad %95 
                              Uniform f32_4* %123 = OpAccessChain %32 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %121 %126 
                                                      OpStore %120 %127 
                                       f32_3 %128 = OpLoad %120 
                                       f32_3 %129 = OpLoad %120 
                                         f32 %130 = OpDot %128 %129 
                                Private f32* %131 = OpAccessChain %120 %56 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %120 %56 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpExtInst %1 31 %133 
                                Private f32* %135 = OpAccessChain %120 %56 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %22 %56 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Private f32* %139 = OpAccessChain %120 %56 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %120 %56 
                                                      OpStore %142 %141 
                                Uniform f32* %143 = OpAccessChain %32 %122 %50 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %120 %56 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFMul %144 %146 
                                Private f32* %148 = OpAccessChain %22 %56 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFAdd %147 %149 
                                Private f32* %151 = OpAccessChain %22 %56 
                                                      OpStore %151 %150 
                                Private f32* %152 = OpAccessChain %22 %56 
                                         f32 %153 = OpLoad %152 
                                Uniform f32* %154 = OpAccessChain %32 %112 %104 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFMul %153 %155 
                                Uniform f32* %157 = OpAccessChain %32 %112 %50 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFAdd %156 %158 
                                Private f32* %160 = OpAccessChain %22 %56 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %22 %56 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpExtInst %1 43 %162 %63 %163 
                                Private f32* %165 = OpAccessChain %22 %56 
                                                      OpStore %165 %164 
                                Uniform f32* %168 = OpAccessChain %32 %167 %56 
                                         f32 %169 = OpLoad %168 
                                        bool %170 = OpFOrdEqual %169 %163 
                                                      OpStore %166 %170 
                                                      OpSelectionMerge %173 None 
                                                      OpBranchConditional %171 %172 %173 
                                             %172 = OpLabel 
                                        bool %174 = OpLoad %166 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %176 
                                             %175 = OpLabel 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                                      OpBranch %173 
                                             %173 = OpLabel 
                                                      OpSelectionMerge %179 None 
                                                      OpBranchConditional %177 %178 %264 
                                             %178 = OpLabel 
                                Uniform f32* %181 = OpAccessChain %32 %167 %110 
                                         f32 %182 = OpLoad %181 
                                        bool %183 = OpFOrdEqual %182 %163 
                                                      OpStore %180 %183 
                                       f32_3 %184 = OpLoad %95 
                                       f32_3 %185 = OpVectorShuffle %184 %184 1 1 1 
                              Uniform f32_4* %187 = OpAccessChain %32 %186 %67 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %185 %189 
                                                      OpStore %102 %190 
                              Uniform f32_4* %191 = OpAccessChain %32 %186 %66 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpLoad %95 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_3 %197 = OpLoad %102 
                                       f32_3 %198 = OpFAdd %196 %197 
                                                      OpStore %102 %198 
                              Uniform f32_4* %199 = OpAccessChain %32 %186 %112 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                       f32_3 %202 = OpLoad %95 
                                       f32_3 %203 = OpVectorShuffle %202 %202 2 2 2 
                                       f32_3 %204 = OpFMul %201 %203 
                                       f32_3 %205 = OpLoad %102 
                                       f32_3 %206 = OpFAdd %204 %205 
                                                      OpStore %102 %206 
                                       f32_3 %207 = OpLoad %102 
                              Uniform f32_4* %208 = OpAccessChain %32 %186 %122 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpFAdd %207 %210 
                                                      OpStore %102 %211 
                                        bool %214 = OpLoad %180 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %218 
                                             %215 = OpLabel 
                                       f32_3 %217 = OpLoad %102 
                                                      OpStore %213 %217 
                                                      OpBranch %216 
                                             %218 = OpLabel 
                                       f32_3 %219 = OpLoad %95 
                                                      OpStore %213 %219 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_3 %220 = OpLoad %213 
                                                      OpStore %102 %220 
                                       f32_3 %221 = OpLoad %102 
                              Uniform f32_3* %223 = OpAccessChain %32 %222 
                                       f32_3 %224 = OpLoad %223 
                                       f32_3 %225 = OpFNegate %224 
                                       f32_3 %226 = OpFAdd %221 %225 
                                                      OpStore %102 %226 
                                       f32_3 %228 = OpLoad %102 
                              Uniform f32_3* %230 = OpAccessChain %32 %229 
                                       f32_3 %231 = OpLoad %230 
                                       f32_3 %232 = OpFMul %228 %231 
                                       f32_4 %233 = OpLoad %227 
                                       f32_4 %234 = OpVectorShuffle %233 %232 0 4 5 6 
                                                      OpStore %227 %234 
                                Private f32* %237 = OpAccessChain %227 %110 
                                         f32 %238 = OpLoad %237 
                                         f32 %240 = OpFMul %238 %239 
                                         f32 %242 = OpFAdd %240 %241 
                                Private f32* %243 = OpAccessChain %236 %56 
                                                      OpStore %243 %242 
                                Uniform f32* %245 = OpAccessChain %32 %167 %104 
                                         f32 %246 = OpLoad %245 
                                         f32 %248 = OpFMul %246 %247 
                                         f32 %249 = OpFAdd %248 %241 
                                                      OpStore %244 %249 
                                         f32 %250 = OpLoad %244 
                                Private f32* %251 = OpAccessChain %236 %56 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpExtInst %1 40 %250 %252 
                                Private f32* %254 = OpAccessChain %227 %56 
                                                      OpStore %254 %253 
                  read_only Texture3DSampled %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %227 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 2 3 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                                      OpStore %227 %262 
                                       f32_4 %263 = OpLoad %227 
                                                      OpStore %49 %263 
                                                      OpBranch %179 
                                             %264 = OpLabel 
                                Private f32* %265 = OpAccessChain %49 %56 
                                                      OpStore %265 %163 
                                Private f32* %266 = OpAccessChain %49 %110 
                                                      OpStore %266 %163 
                                Private f32* %267 = OpAccessChain %49 %104 
                                                      OpStore %267 %163 
                                Private f32* %268 = OpAccessChain %49 %50 
                                                      OpStore %268 %163 
                                                      OpBranch %179 
                                             %179 = OpLabel 
                                       f32_4 %270 = OpLoad %49 
                              Uniform f32_4* %271 = OpAccessChain %32 %67 
                                       f32_4 %272 = OpLoad %271 
                                         f32 %273 = OpDot %270 %272 
                                Private f32* %274 = OpAccessChain %269 %56 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %269 %56 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpExtInst %1 43 %276 %63 %163 
                                Private f32* %278 = OpAccessChain %269 %56 
                                                      OpStore %278 %277 
                                       f32_4 %281 = OpLoad %280 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                       f32_4 %283 = OpLoad %280 
                                       f32_2 %284 = OpVectorShuffle %283 %283 3 3 
                                       f32_2 %285 = OpFDiv %282 %284 
                                                      OpStore %236 %285 
                  read_only Texture2DSampled %288 = OpLoad %287 
                                       f32_2 %289 = OpLoad %236 
                                       f32_4 %290 = OpImageSampleImplicitLod %288 %289 
                                         f32 %291 = OpCompositeExtract %290 0 
                                                      OpStore %286 %291 
                                Private f32* %293 = OpAccessChain %22 %56 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpLoad %286 
                                         f32 %296 = OpFAdd %294 %295 
                                Private f32* %297 = OpAccessChain %292 %56 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %292 %56 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 43 %299 %63 %163 
                                Private f32* %301 = OpAccessChain %292 %56 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %292 %56 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %269 %56 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 37 %303 %305 
                                Private f32* %307 = OpAccessChain %269 %56 
                                                      OpStore %307 %306 
                                        bool %310 = OpLoad %166 
                                                      OpSelectionMerge %312 None 
                                                      OpBranchConditional %310 %311 %315 
                                             %311 = OpLabel 
                                Private f32* %313 = OpAccessChain %269 %56 
                                         f32 %314 = OpLoad %313 
                                                      OpStore %309 %314 
                                                      OpBranch %312 
                                             %315 = OpLabel 
                                Private f32* %316 = OpAccessChain %292 %56 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %309 %317 
                                                      OpBranch %312 
                                             %312 = OpLabel 
                                         f32 %318 = OpLoad %309 
                                Private f32* %319 = OpAccessChain %269 %56 
                                                      OpStore %319 %318 
                                       f32_3 %320 = OpLoad %40 
                              Uniform f32_4* %322 = OpAccessChain %32 %321 
                                       f32_4 %323 = OpLoad %322 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFMul %320 %324 
                                                      OpStore %292 %325 
                                       f32_3 %326 = OpLoad %269 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
                                       f32_3 %328 = OpLoad %292 
                                       f32_3 %329 = OpFMul %327 %328 
                                                      OpStore %269 %329 
                                       f32_3 %332 = OpLoad %40 
                                       f32_3 %334 = OpLoad %333 
                                       f32_3 %335 = OpFMul %332 %334 
                                       f32_3 %336 = OpLoad %269 
                                       f32_3 %337 = OpFAdd %335 %336 
                                       f32_4 %338 = OpLoad %331 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %331 %339 
                                Private f32* %340 = OpAccessChain %9 %50 
                                         f32 %341 = OpLoad %340 
                                 Output f32* %343 = OpAccessChain %331 %50 
                                                      OpStore %343 %341 
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
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend One One, One One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Stencil {
   Ref 1
   Comp Equal
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 105305
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                                             %183 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
                                 Output f32* %184 = OpAccessChain %116 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 274
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %262 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %137 SpecId 137 
                                                      OpDecorate %217 DescriptorSet 217 
                                                      OpDecorate %217 Binding 217 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %262 Location 262 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %7 %7 %28 %20 %20 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 7 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 8 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                         i32 %111 = OpConstant 2 
                                         i32 %121 = OpConstant 3 
                               Private bool* %126 = OpVariable Private 
                                         f32 %129 = OpConstant 3.67402E-40 
                                        bool %131 = OpConstantFalse 
                                        bool %137 = OpSpecConstantFalse 
                                         u32 %140 = OpConstant 1 
                              Private f32_3* %144 = OpVariable Private 
                                             %172 = OpTypePointer Function %20 
                                         i32 %182 = OpConstant 4 
                                             %183 = OpTypePointer Uniform %20 
                              Private f32_4* %188 = OpVariable Private 
                                Private f32* %195 = OpVariable Private 
                                         f32 %198 = OpConstant 3.67402E-40 
                                         f32 %200 = OpConstant 3.67402E-40 
                                         u32 %202 = OpConstant 2 
                                         f32 %205 = OpConstant 3.67402E-40 
                                             %214 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %215 = OpTypeSampledImage %214 
                                             %216 = OpTypePointer UniformConstant %215 
 UniformConstant read_only Texture3DSampled* %217 = OpVariable UniformConstant 
                              Private f32_3* %228 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                         i32 %256 = OpConstant 5 
                                             %261 = OpTypePointer Output %7 
                               Output f32_4* %262 = OpVariable Output 
                                             %271 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 1 1 1 
                               Uniform f32_4* %99 = OpAccessChain %32 %98 %67 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %97 %101 
                                                      OpStore %22 %102 
                              Uniform f32_4* %103 = OpAccessChain %32 %98 %66 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %95 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 0 0 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_3 %109 = OpLoad %22 
                                       f32_3 %110 = OpFAdd %108 %109 
                                                      OpStore %22 %110 
                              Uniform f32_4* %112 = OpAccessChain %32 %98 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpLoad %95 
                                       f32_3 %116 = OpVectorShuffle %115 %115 2 2 2 
                                       f32_3 %117 = OpFMul %114 %116 
                                       f32_3 %118 = OpLoad %22 
                                       f32_3 %119 = OpFAdd %117 %118 
                                                      OpStore %22 %119 
                                       f32_3 %120 = OpLoad %22 
                              Uniform f32_4* %122 = OpAccessChain %32 %98 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %120 %124 
                                                      OpStore %22 %125 
                                Uniform f32* %127 = OpAccessChain %32 %67 %56 
                                         f32 %128 = OpLoad %127 
                                        bool %130 = OpFOrdEqual %128 %129 
                                                      OpStore %126 %130 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %133 
                                             %132 = OpLabel 
                                        bool %134 = OpLoad %126 
                                                      OpSelectionMerge %136 None 
                                                      OpBranchConditional %134 %135 %136 
                                             %135 = OpLabel 
                                                      OpBranch %136 
                                             %136 = OpLabel 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                                      OpSelectionMerge %139 None 
                                                      OpBranchConditional %137 %138 %223 
                                             %138 = OpLabel 
                                Uniform f32* %141 = OpAccessChain %32 %67 %140 
                                         f32 %142 = OpLoad %141 
                                        bool %143 = OpFOrdEqual %142 %129 
                                                      OpStore %126 %143 
                                       f32_3 %145 = OpLoad %95 
                                       f32_3 %146 = OpVectorShuffle %145 %145 1 1 1 
                              Uniform f32_4* %147 = OpAccessChain %32 %111 %67 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                                      OpStore %144 %150 
                              Uniform f32_4* %151 = OpAccessChain %32 %111 %66 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpLoad %95 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 0 0 
                                       f32_3 %156 = OpFMul %153 %155 
                                       f32_3 %157 = OpLoad %144 
                                       f32_3 %158 = OpFAdd %156 %157 
                                                      OpStore %144 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %111 %111 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %95 
                                       f32_3 %163 = OpVectorShuffle %162 %162 2 2 2 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %144 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %144 %166 
                                       f32_3 %167 = OpLoad %144 
                              Uniform f32_4* %168 = OpAccessChain %32 %111 %121 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %167 %170 
                                                      OpStore %144 %171 
                                        bool %174 = OpLoad %126 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %178 
                                             %175 = OpLabel 
                                       f32_3 %177 = OpLoad %144 
                                                      OpStore %173 %177 
                                                      OpBranch %176 
                                             %178 = OpLabel 
                                       f32_3 %179 = OpLoad %95 
                                                      OpStore %173 %179 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %180 = OpLoad %173 
                                                      OpStore %144 %180 
                                       f32_3 %181 = OpLoad %144 
                              Uniform f32_3* %184 = OpAccessChain %32 %182 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %181 %186 
                                                      OpStore %144 %187 
                                       f32_3 %189 = OpLoad %144 
                              Uniform f32_3* %190 = OpAccessChain %32 %121 
                                       f32_3 %191 = OpLoad %190 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %192 0 4 5 6 
                                                      OpStore %188 %194 
                                Private f32* %196 = OpAccessChain %188 %140 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpFMul %197 %198 
                                         f32 %201 = OpFAdd %199 %200 
                                                      OpStore %195 %201 
                                Uniform f32* %203 = OpAccessChain %32 %67 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFMul %204 %205 
                                         f32 %207 = OpFAdd %206 %200 
                                Private f32* %208 = OpAccessChain %144 %56 
                                                      OpStore %208 %207 
                                         f32 %209 = OpLoad %195 
                                Private f32* %210 = OpAccessChain %144 %56 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpExtInst %1 40 %209 %211 
                                Private f32* %213 = OpAccessChain %188 %56 
                                                      OpStore %213 %212 
                  read_only Texture3DSampled %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %188 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 2 3 
                                       f32_4 %221 = OpImageSampleImplicitLod %218 %220 
                                                      OpStore %188 %221 
                                       f32_4 %222 = OpLoad %188 
                                                      OpStore %49 %222 
                                                      OpBranch %139 
                                             %223 = OpLabel 
                                Private f32* %224 = OpAccessChain %49 %56 
                                                      OpStore %224 %129 
                                Private f32* %225 = OpAccessChain %49 %140 
                                                      OpStore %225 %129 
                                Private f32* %226 = OpAccessChain %49 %202 
                                                      OpStore %226 %129 
                                Private f32* %227 = OpAccessChain %49 %50 
                                                      OpStore %227 %129 
                                                      OpBranch %139 
                                             %139 = OpLabel 
                                       f32_4 %229 = OpLoad %49 
                              Uniform f32_4* %230 = OpAccessChain %32 %66 
                                       f32_4 %231 = OpLoad %230 
                                         f32 %232 = OpDot %229 %231 
                                Private f32* %233 = OpAccessChain %228 %56 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %228 %56 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 43 %235 %63 %129 
                                Private f32* %237 = OpAccessChain %228 %56 
                                                      OpStore %237 %236 
                                       f32_3 %238 = OpLoad %22 
                                       f32_3 %239 = OpLoad %22 
                                         f32 %240 = OpDot %238 %239 
                                Private f32* %241 = OpAccessChain %22 %56 
                                                      OpStore %241 %240 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_3 %244 = OpLoad %22 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 0 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 3 
                                Private f32* %248 = OpAccessChain %22 %56 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %228 %56 
                                         f32 %250 = OpLoad %249 
                                Private f32* %251 = OpAccessChain %22 %56 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFMul %250 %252 
                                Private f32* %254 = OpAccessChain %22 %56 
                                                      OpStore %254 %253 
                                       f32_3 %255 = OpLoad %40 
                              Uniform f32_4* %257 = OpAccessChain %32 %256 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                       f32_3 %260 = OpFMul %255 %259 
                                                      OpStore %228 %260 
                                       f32_3 %263 = OpLoad %22 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 0 0 
                                       f32_3 %265 = OpLoad %228 
                                       f32_3 %266 = OpFMul %264 %265 
                                       f32_4 %267 = OpLoad %262 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %262 %268 
                                Private f32* %269 = OpAccessChain %9 %50 
                                         f32 %270 = OpLoad %269 
                                 Output f32* %272 = OpAccessChain %262 %50 
                                                      OpStore %272 %270 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                                             %183 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
                                 Output f32* %184 = OpAccessChain %116 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 229
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %111 %217 
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
                                                      OpMemberDecorate %28 7 RelaxedPrecision 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %102 SpecId 102 
                                                      OpDecorate %111 Location 111 
                                                      OpDecorate %191 DescriptorSet 191 
                                                      OpDecorate %191 Binding 191 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %217 Location 217 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
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
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %7 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 6 
                                              %33 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %21 
                               Private f32_3* %41 = OpVariable Private 
                                              %51 = OpTypePointer Private %6 
                                 Private f32* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                          f32 %56 = OpConstant 3.67402E-40 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %62 = OpConstant 3.67402E-40 
                                          i32 %65 = OpConstant 0 
                                          i32 %66 = OpConstant 1 
                                          i32 %68 = OpConstant -1 
                                          i32 %76 = OpConstant 7 
                                              %77 = OpTypePointer Uniform %6 
                                          u32 %91 = OpConstant 0 
                                          f32 %94 = OpConstant 3.67402E-40 
                                         bool %96 = OpConstantFalse 
                                        bool %102 = OpSpecConstantFalse 
                                         u32 %105 = OpConstant 1 
                              Private f32_3* %109 = OpVariable Private 
                                             %110 = OpTypePointer Input %21 
                                Input f32_3* %111 = OpVariable Input 
                                         i32 %114 = OpConstant 2 
                                         i32 %136 = OpConstant 3 
                                             %141 = OpTypePointer Function %21 
                                         i32 %154 = OpConstant 4 
                                             %155 = OpTypePointer Uniform %21 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         f32 %173 = OpConstant 3.67402E-40 
                                Private f32* %176 = OpVariable Private 
                                         u32 %177 = OpConstant 2 
                                         f32 %180 = OpConstant 3.67402E-40 
                                             %188 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %189 = OpTypeSampledImage %188 
                                             %190 = OpTypePointer UniformConstant %189 
 UniformConstant read_only Texture3DSampled* %191 = OpVariable UniformConstant 
                              Private f32_4* %196 = OpVariable Private 
                              Private f32_3* %209 = OpVariable Private 
                                         i32 %211 = OpConstant 5 
                                             %216 = OpTypePointer Output %7 
                               Output f32_4* %217 = OpVariable Output 
                                             %226 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %142 = OpVariable Function 
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
                                 Private f32* %54 = OpAccessChain %9 %53 
                                          f32 %55 = OpLoad %54 
                                          f32 %57 = OpFAdd %55 %56 
                                                      OpStore %52 %57 
                                          f32 %61 = OpLoad %52 
                                         bool %63 = OpFOrdLessThan %61 %62 
                                                      OpStore %60 %63 
                                         bool %64 = OpLoad %60 
                                          i32 %67 = OpSelect %64 %66 %65 
                                          i32 %69 = OpIMul %67 %68 
                                         bool %70 = OpINotEqual %69 %65 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                 Private f32* %74 = OpAccessChain %9 %53 
                                          f32 %75 = OpLoad %74 
                                 Uniform f32* %78 = OpAccessChain %30 %76 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                          f32 %81 = OpFAdd %75 %80 
                                                      OpStore %52 %81 
                                          f32 %82 = OpLoad %52 
                                         bool %83 = OpFOrdLessThan %82 %62 
                                                      OpStore %60 %83 
                                         bool %84 = OpLoad %60 
                                          i32 %85 = OpSelect %84 %66 %65 
                                          i32 %86 = OpIMul %85 %68 
                                         bool %87 = OpINotEqual %86 %65 
                                                      OpSelectionMerge %89 None 
                                                      OpBranchConditional %87 %88 %89 
                                              %88 = OpLabel 
                                                      OpKill
                                              %89 = OpLabel 
                                 Uniform f32* %92 = OpAccessChain %30 %66 %91 
                                          f32 %93 = OpLoad %92 
                                         bool %95 = OpFOrdEqual %93 %94 
                                                      OpStore %60 %95 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %96 %97 %98 
                                              %97 = OpLabel 
                                         bool %99 = OpLoad %60 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                                      OpSelectionMerge %104 None 
                                                      OpBranchConditional %102 %103 %198 
                                             %103 = OpLabel 
                                Uniform f32* %106 = OpAccessChain %30 %66 %105 
                                         f32 %107 = OpLoad %106 
                                        bool %108 = OpFOrdEqual %107 %94 
                                                      OpStore %60 %108 
                                       f32_3 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %30 %114 %66 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %113 %117 
                                                      OpStore %109 %118 
                              Uniform f32_4* %119 = OpAccessChain %30 %114 %65 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpLoad %111 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 0 0 
                                       f32_3 %124 = OpFMul %121 %123 
                                       f32_3 %125 = OpLoad %109 
                                       f32_3 %126 = OpFAdd %124 %125 
                                                      OpStore %109 %126 
                              Uniform f32_4* %127 = OpAccessChain %30 %114 %114 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpLoad %111 
                                       f32_3 %131 = OpVectorShuffle %130 %130 2 2 2 
                                       f32_3 %132 = OpFMul %129 %131 
                                       f32_3 %133 = OpLoad %109 
                                       f32_3 %134 = OpFAdd %132 %133 
                                                      OpStore %109 %134 
                                       f32_3 %135 = OpLoad %109 
                              Uniform f32_4* %137 = OpAccessChain %30 %114 %136 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %135 %139 
                                                      OpStore %109 %140 
                                        bool %143 = OpLoad %60 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %147 
                                             %144 = OpLabel 
                                       f32_3 %146 = OpLoad %109 
                                                      OpStore %142 %146 
                                                      OpBranch %145 
                                             %147 = OpLabel 
                                       f32_3 %148 = OpLoad %111 
                                                      OpStore %142 %148 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                       f32_3 %149 = OpLoad %142 
                                       f32_4 %150 = OpLoad %20 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %20 %151 
                                       f32_4 %152 = OpLoad %20 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_3* %156 = OpAccessChain %30 %154 
                                       f32_3 %157 = OpLoad %156 
                                       f32_3 %158 = OpFNegate %157 
                                       f32_3 %159 = OpFAdd %153 %158 
                                       f32_4 %160 = OpLoad %20 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                                      OpStore %20 %161 
                                       f32_4 %162 = OpLoad %20 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                              Uniform f32_3* %164 = OpAccessChain %30 %136 
                                       f32_3 %165 = OpLoad %164 
                                       f32_3 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %20 
                                       f32_4 %168 = OpVectorShuffle %167 %166 0 4 5 6 
                                                      OpStore %20 %168 
                                Private f32* %169 = OpAccessChain %20 %105 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpFMul %170 %171 
                                         f32 %174 = OpFAdd %172 %173 
                                Private f32* %175 = OpAccessChain %109 %91 
                                                      OpStore %175 %174 
                                Uniform f32* %178 = OpAccessChain %30 %66 %177 
                                         f32 %179 = OpLoad %178 
                                         f32 %181 = OpFMul %179 %180 
                                         f32 %182 = OpFAdd %181 %173 
                                                      OpStore %176 %182 
                                Private f32* %183 = OpAccessChain %109 %91 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpLoad %176 
                                         f32 %186 = OpExtInst %1 40 %184 %185 
                                Private f32* %187 = OpAccessChain %20 %91 
                                                      OpStore %187 %186 
                  read_only Texture3DSampled %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %20 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 2 3 
                                       f32_4 %195 = OpImageSampleImplicitLod %192 %194 
                                                      OpStore %20 %195 
                                       f32_4 %197 = OpLoad %20 
                                                      OpStore %196 %197 
                                                      OpBranch %104 
                                             %198 = OpLabel 
                                Private f32* %199 = OpAccessChain %196 %91 
                                                      OpStore %199 %94 
                                Private f32* %200 = OpAccessChain %196 %105 
                                                      OpStore %200 %94 
                                Private f32* %201 = OpAccessChain %196 %177 
                                                      OpStore %201 %94 
                                Private f32* %202 = OpAccessChain %196 %53 
                                                      OpStore %202 %94 
                                                      OpBranch %104 
                                             %104 = OpLabel 
                                       f32_4 %203 = OpLoad %196 
                              Uniform f32_4* %204 = OpAccessChain %30 %65 
                                       f32_4 %205 = OpLoad %204 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %52 %206 
                                         f32 %207 = OpLoad %52 
                                         f32 %208 = OpExtInst %1 43 %207 %62 %94 
                                                      OpStore %52 %208 
                                       f32_3 %210 = OpLoad %41 
                              Uniform f32_4* %212 = OpAccessChain %30 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                       f32_3 %215 = OpFMul %210 %214 
                                                      OpStore %209 %215 
                                         f32 %218 = OpLoad %52 
                                       f32_3 %219 = OpCompositeConstruct %218 %218 %218 
                                       f32_3 %220 = OpLoad %209 
                                       f32_3 %221 = OpFMul %219 %220 
                                       f32_4 %222 = OpLoad %217 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %217 %223 
                                Private f32* %224 = OpAccessChain %9 %53 
                                         f32 %225 = OpLoad %224 
                                 Output f32* %227 = OpAccessChain %217 %53 
                                                      OpStore %227 %225 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                                             %183 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
                                 Output f32* %184 = OpAccessChain %116 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 315
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %98 %303 
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
                                                      OpMemberDecorate %29 8 RelaxedPrecision 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %262 DescriptorSet 262 
                                                      OpDecorate %262 Binding 262 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %303 Location 303 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
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
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %7 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 7 
                                              %34 = OpTypePointer Uniform %7 
                                              %41 = OpTypePointer Private %21 
                               Private f32_3* %42 = OpVariable Private 
                               Private f32_4* %52 = OpVariable Private 
                                          u32 %53 = OpConstant 3 
                                              %54 = OpTypePointer Private %6 
                                          f32 %57 = OpConstant 3.67402E-40 
                                          u32 %59 = OpConstant 0 
                                              %61 = OpTypeBool 
                                              %62 = OpTypePointer Private %61 
                                Private bool* %63 = OpVariable Private 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          i32 %69 = OpConstant 0 
                                          i32 %70 = OpConstant 1 
                                          i32 %72 = OpConstant -1 
                                          i32 %80 = OpConstant 8 
                                              %81 = OpTypePointer Uniform %6 
                                              %97 = OpTypePointer Input %21 
                                 Input f32_3* %98 = OpVariable Input 
                                         i32 %101 = OpConstant 6 
                                         i32 %112 = OpConstant 2 
                                         i32 %121 = OpConstant 3 
                               Private bool* %125 = OpVariable Private 
                                         f32 %128 = OpConstant 3.67402E-40 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                                         u32 %139 = OpConstant 1 
                              Private f32_3* %143 = OpVariable Private 
                              Private f32_3* %171 = OpVariable Private 
                                             %172 = OpTypePointer Function %21 
                                         i32 %182 = OpConstant 4 
                                             %183 = OpTypePointer Uniform %21 
                              Private f32_4* %188 = OpVariable Private 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         u32 %202 = OpConstant 2 
                                         f32 %205 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                                Private f32* %229 = OpVariable Private 
                              Private f32_3* %239 = OpVariable Private 
                                             %240 = OpTypePointer Function %6 
                                       f32_2 %257 = OpConstantComposite %205 %205 
                                Private f32* %261 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %262 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %279 = OpVariable UniformConstant 
                                         i32 %297 = OpConstant 5 
                                             %302 = OpTypePointer Output %7 
                               Output f32_4* %303 = OpVariable Output 
                                             %312 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                               Function f32* %241 = OpVariable Function 
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
                                 Private f32* %55 = OpAccessChain %9 %53 
                                          f32 %56 = OpLoad %55 
                                          f32 %58 = OpFAdd %56 %57 
                                 Private f32* %60 = OpAccessChain %52 %59 
                                                      OpStore %60 %58 
                                 Private f32* %64 = OpAccessChain %52 %59 
                                          f32 %65 = OpLoad %64 
                                         bool %67 = OpFOrdLessThan %65 %66 
                                                      OpStore %63 %67 
                                         bool %68 = OpLoad %63 
                                          i32 %71 = OpSelect %68 %70 %69 
                                          i32 %73 = OpIMul %71 %72 
                                         bool %74 = OpINotEqual %73 %69 
                                                      OpSelectionMerge %76 None 
                                                      OpBranchConditional %74 %75 %76 
                                              %75 = OpLabel 
                                                      OpKill
                                              %76 = OpLabel 
                                 Private f32* %78 = OpAccessChain %9 %53 
                                          f32 %79 = OpLoad %78 
                                 Uniform f32* %82 = OpAccessChain %31 %80 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                          f32 %85 = OpFAdd %79 %84 
                                 Private f32* %86 = OpAccessChain %52 %59 
                                                      OpStore %86 %85 
                                 Private f32* %87 = OpAccessChain %52 %59 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdLessThan %88 %66 
                                                      OpStore %63 %89 
                                         bool %90 = OpLoad %63 
                                          i32 %91 = OpSelect %90 %70 %69 
                                          i32 %92 = OpIMul %91 %72 
                                         bool %93 = OpINotEqual %92 %69 
                                                      OpSelectionMerge %95 None 
                                                      OpBranchConditional %93 %94 %95 
                                              %94 = OpLabel 
                                                      OpKill
                                              %95 = OpLabel 
                                        f32_3 %99 = OpLoad %98 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                              Uniform f32_4* %102 = OpAccessChain %31 %101 %70 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpFMul %100 %103 
                                                      OpStore %20 %104 
                              Uniform f32_4* %105 = OpAccessChain %31 %101 %69 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpLoad %98 
                                       f32_4 %108 = OpVectorShuffle %107 %107 0 0 0 0 
                                       f32_4 %109 = OpFMul %106 %108 
                                       f32_4 %110 = OpLoad %20 
                                       f32_4 %111 = OpFAdd %109 %110 
                                                      OpStore %20 %111 
                              Uniform f32_4* %113 = OpAccessChain %31 %101 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpLoad %98 
                                       f32_4 %116 = OpVectorShuffle %115 %115 2 2 2 2 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %20 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %20 %119 
                                       f32_4 %120 = OpLoad %20 
                              Uniform f32_4* %122 = OpAccessChain %31 %101 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpFAdd %120 %123 
                                                      OpStore %20 %124 
                                Uniform f32* %126 = OpAccessChain %31 %70 %59 
                                         f32 %127 = OpLoad %126 
                                        bool %129 = OpFOrdEqual %127 %128 
                                                      OpStore %125 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %125 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %224 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %31 %70 %139 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %128 
                                                      OpStore %125 %142 
                                       f32_3 %144 = OpLoad %98 
                                       f32_3 %145 = OpVectorShuffle %144 %144 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %31 %112 %70 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %145 %148 
                                                      OpStore %143 %149 
                              Uniform f32_4* %150 = OpAccessChain %31 %112 %69 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %98 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 0 0 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_3 %156 = OpLoad %143 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %143 %157 
                              Uniform f32_4* %158 = OpAccessChain %31 %112 %112 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpLoad %98 
                                       f32_3 %162 = OpVectorShuffle %161 %161 2 2 2 
                                       f32_3 %163 = OpFMul %160 %162 
                                       f32_3 %164 = OpLoad %143 
                                       f32_3 %165 = OpFAdd %163 %164 
                                                      OpStore %143 %165 
                                       f32_3 %166 = OpLoad %143 
                              Uniform f32_4* %167 = OpAccessChain %31 %112 %121 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %166 %169 
                                                      OpStore %143 %170 
                                        bool %174 = OpLoad %125 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %178 
                                             %175 = OpLabel 
                                       f32_3 %177 = OpLoad %143 
                                                      OpStore %173 %177 
                                                      OpBranch %176 
                                             %178 = OpLabel 
                                       f32_3 %179 = OpLoad %98 
                                                      OpStore %173 %179 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %180 = OpLoad %173 
                                                      OpStore %171 %180 
                                       f32_3 %181 = OpLoad %171 
                              Uniform f32_3* %184 = OpAccessChain %31 %182 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %181 %186 
                                                      OpStore %171 %187 
                                       f32_3 %189 = OpLoad %171 
                              Uniform f32_3* %190 = OpAccessChain %31 %121 
                                       f32_3 %191 = OpLoad %190 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %192 0 4 5 6 
                                                      OpStore %188 %194 
                                Private f32* %195 = OpAccessChain %188 %139 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                         f32 %200 = OpFAdd %198 %199 
                                Private f32* %201 = OpAccessChain %171 %59 
                                                      OpStore %201 %200 
                                Uniform f32* %203 = OpAccessChain %31 %70 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFMul %204 %205 
                                         f32 %207 = OpFAdd %206 %199 
                                Private f32* %208 = OpAccessChain %143 %59 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %143 %59 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %171 %59 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 40 %210 %212 
                                Private f32* %214 = OpAccessChain %188 %59 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %188 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %188 %222 
                                       f32_4 %223 = OpLoad %188 
                                                      OpStore %52 %223 
                                                      OpBranch %138 
                                             %224 = OpLabel 
                                Private f32* %225 = OpAccessChain %52 %59 
                                                      OpStore %225 %128 
                                Private f32* %226 = OpAccessChain %52 %139 
                                                      OpStore %226 %128 
                                Private f32* %227 = OpAccessChain %52 %202 
                                                      OpStore %227 %128 
                                Private f32* %228 = OpAccessChain %52 %53 
                                                      OpStore %228 %128 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %230 = OpLoad %52 
                              Uniform f32_4* %231 = OpAccessChain %31 %69 
                                       f32_4 %232 = OpLoad %231 
                                         f32 %233 = OpDot %230 %232 
                                                      OpStore %229 %233 
                                         f32 %234 = OpLoad %229 
                                         f32 %235 = OpExtInst %1 43 %234 %66 %128 
                                                      OpStore %229 %235 
                                Private f32* %236 = OpAccessChain %20 %202 
                                         f32 %237 = OpLoad %236 
                                        bool %238 = OpFOrdLessThan %66 %237 
                                                      OpStore %125 %238 
                                        bool %242 = OpLoad %125 
                                                      OpSelectionMerge %244 None 
                                                      OpBranchConditional %242 %243 %245 
                                             %243 = OpLabel 
                                                      OpStore %241 %128 
                                                      OpBranch %244 
                                             %245 = OpLabel 
                                                      OpStore %241 %66 
                                                      OpBranch %244 
                                             %244 = OpLabel 
                                         f32 %246 = OpLoad %241 
                                Private f32* %247 = OpAccessChain %239 %59 
                                                      OpStore %247 %246 
                                       f32_4 %248 = OpLoad %20 
                                       f32_2 %249 = OpVectorShuffle %248 %248 0 1 
                                       f32_4 %250 = OpLoad %20 
                                       f32_2 %251 = OpVectorShuffle %250 %250 3 3 
                                       f32_2 %252 = OpFDiv %249 %251 
                                       f32_3 %253 = OpLoad %171 
                                       f32_3 %254 = OpVectorShuffle %253 %252 3 4 2 
                                                      OpStore %171 %254 
                                       f32_3 %255 = OpLoad %171 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %258 = OpFAdd %256 %257 
                                       f32_3 %259 = OpLoad %171 
                                       f32_3 %260 = OpVectorShuffle %259 %258 3 4 2 
                                                      OpStore %171 %260 
                  read_only Texture2DSampled %263 = OpLoad %262 
                                       f32_3 %264 = OpLoad %171 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %266 = OpImageSampleImplicitLod %263 %265 
                                         f32 %267 = OpCompositeExtract %266 3 
                                                      OpStore %261 %267 
                                         f32 %268 = OpLoad %261 
                                Private f32* %269 = OpAccessChain %239 %59 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFMul %268 %270 
                                Private f32* %272 = OpAccessChain %239 %59 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %20 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_4 %275 = OpLoad %20 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                         f32 %277 = OpDot %274 %276 
                                Private f32* %278 = OpAccessChain %20 %59 
                                                      OpStore %278 %277 
                  read_only Texture2DSampled %280 = OpLoad %279 
                                       f32_4 %281 = OpLoad %20 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 0 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                         f32 %284 = OpCompositeExtract %283 3 
                                Private f32* %285 = OpAccessChain %20 %59 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %20 %59 
                                         f32 %287 = OpLoad %286 
                                Private f32* %288 = OpAccessChain %239 %59 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFMul %287 %289 
                                Private f32* %291 = OpAccessChain %239 %59 
                                                      OpStore %291 %290 
                                         f32 %292 = OpLoad %229 
                                Private f32* %293 = OpAccessChain %239 %59 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %292 %294 
                                                      OpStore %229 %295 
                                       f32_3 %296 = OpLoad %42 
                              Uniform f32_4* %298 = OpAccessChain %31 %297 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFMul %296 %300 
                                                      OpStore %239 %301 
                                         f32 %304 = OpLoad %229 
                                       f32_3 %305 = OpCompositeConstruct %304 %304 %304 
                                       f32_3 %306 = OpLoad %239 
                                       f32_3 %307 = OpFMul %305 %306 
                                       f32_4 %308 = OpLoad %303 
                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 6 3 
                                                      OpStore %303 %309 
                                Private f32* %310 = OpAccessChain %9 %53 
                                         f32 %311 = OpLoad %310 
                                 Output f32* %313 = OpAccessChain %303 %53 
                                                      OpStore %313 %311 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                                             %183 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
                                 Output f32* %184 = OpAccessChain %116 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 286
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %274 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %137 SpecId 137 
                                                      OpDecorate %217 DescriptorSet 217 
                                                      OpDecorate %217 Binding 217 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 DescriptorSet 241 
                                                      OpDecorate %241 Binding 241 
                                                      OpDecorate %250 DescriptorSet 250 
                                                      OpDecorate %250 Binding 250 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %274 Location 274 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %7 %7 %28 %20 %20 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 7 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 8 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                         i32 %111 = OpConstant 2 
                                         i32 %121 = OpConstant 3 
                               Private bool* %126 = OpVariable Private 
                                         f32 %129 = OpConstant 3.67402E-40 
                                        bool %131 = OpConstantFalse 
                                        bool %137 = OpSpecConstantFalse 
                                         u32 %140 = OpConstant 1 
                              Private f32_3* %144 = OpVariable Private 
                                             %172 = OpTypePointer Function %20 
                                         i32 %182 = OpConstant 4 
                                             %183 = OpTypePointer Uniform %20 
                              Private f32_4* %188 = OpVariable Private 
                                Private f32* %195 = OpVariable Private 
                                         f32 %198 = OpConstant 3.67402E-40 
                                         f32 %200 = OpConstant 3.67402E-40 
                                         u32 %202 = OpConstant 2 
                                         f32 %205 = OpConstant 3.67402E-40 
                                             %214 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %215 = OpTypeSampledImage %214 
                                             %216 = OpTypePointer UniformConstant %215 
 UniformConstant read_only Texture3DSampled* %217 = OpVariable UniformConstant 
                              Private f32_3* %228 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %241 = OpVariable UniformConstant 
                                             %247 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %248 = OpTypeSampledImage %247 
                                             %249 = OpTypePointer UniformConstant %248 
UniformConstant read_only TextureCubeSampled* %250 = OpVariable UniformConstant 
                                         i32 %268 = OpConstant 5 
                                             %273 = OpTypePointer Output %7 
                               Output f32_4* %274 = OpVariable Output 
                                             %283 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 1 1 1 
                               Uniform f32_4* %99 = OpAccessChain %32 %98 %67 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFMul %97 %101 
                                                      OpStore %22 %102 
                              Uniform f32_4* %103 = OpAccessChain %32 %98 %66 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %95 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 0 0 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_3 %109 = OpLoad %22 
                                       f32_3 %110 = OpFAdd %108 %109 
                                                      OpStore %22 %110 
                              Uniform f32_4* %112 = OpAccessChain %32 %98 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpLoad %95 
                                       f32_3 %116 = OpVectorShuffle %115 %115 2 2 2 
                                       f32_3 %117 = OpFMul %114 %116 
                                       f32_3 %118 = OpLoad %22 
                                       f32_3 %119 = OpFAdd %117 %118 
                                                      OpStore %22 %119 
                                       f32_3 %120 = OpLoad %22 
                              Uniform f32_4* %122 = OpAccessChain %32 %98 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %120 %124 
                                                      OpStore %22 %125 
                                Uniform f32* %127 = OpAccessChain %32 %67 %56 
                                         f32 %128 = OpLoad %127 
                                        bool %130 = OpFOrdEqual %128 %129 
                                                      OpStore %126 %130 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %133 
                                             %132 = OpLabel 
                                        bool %134 = OpLoad %126 
                                                      OpSelectionMerge %136 None 
                                                      OpBranchConditional %134 %135 %136 
                                             %135 = OpLabel 
                                                      OpBranch %136 
                                             %136 = OpLabel 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                                      OpSelectionMerge %139 None 
                                                      OpBranchConditional %137 %138 %223 
                                             %138 = OpLabel 
                                Uniform f32* %141 = OpAccessChain %32 %67 %140 
                                         f32 %142 = OpLoad %141 
                                        bool %143 = OpFOrdEqual %142 %129 
                                                      OpStore %126 %143 
                                       f32_3 %145 = OpLoad %95 
                                       f32_3 %146 = OpVectorShuffle %145 %145 1 1 1 
                              Uniform f32_4* %147 = OpAccessChain %32 %111 %67 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                                      OpStore %144 %150 
                              Uniform f32_4* %151 = OpAccessChain %32 %111 %66 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpLoad %95 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 0 0 
                                       f32_3 %156 = OpFMul %153 %155 
                                       f32_3 %157 = OpLoad %144 
                                       f32_3 %158 = OpFAdd %156 %157 
                                                      OpStore %144 %158 
                              Uniform f32_4* %159 = OpAccessChain %32 %111 %111 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpLoad %95 
                                       f32_3 %163 = OpVectorShuffle %162 %162 2 2 2 
                                       f32_3 %164 = OpFMul %161 %163 
                                       f32_3 %165 = OpLoad %144 
                                       f32_3 %166 = OpFAdd %164 %165 
                                                      OpStore %144 %166 
                                       f32_3 %167 = OpLoad %144 
                              Uniform f32_4* %168 = OpAccessChain %32 %111 %121 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %167 %170 
                                                      OpStore %144 %171 
                                        bool %174 = OpLoad %126 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %178 
                                             %175 = OpLabel 
                                       f32_3 %177 = OpLoad %144 
                                                      OpStore %173 %177 
                                                      OpBranch %176 
                                             %178 = OpLabel 
                                       f32_3 %179 = OpLoad %95 
                                                      OpStore %173 %179 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %180 = OpLoad %173 
                                                      OpStore %144 %180 
                                       f32_3 %181 = OpLoad %144 
                              Uniform f32_3* %184 = OpAccessChain %32 %182 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %181 %186 
                                                      OpStore %144 %187 
                                       f32_3 %189 = OpLoad %144 
                              Uniform f32_3* %190 = OpAccessChain %32 %121 
                                       f32_3 %191 = OpLoad %190 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %192 0 4 5 6 
                                                      OpStore %188 %194 
                                Private f32* %196 = OpAccessChain %188 %140 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpFMul %197 %198 
                                         f32 %201 = OpFAdd %199 %200 
                                                      OpStore %195 %201 
                                Uniform f32* %203 = OpAccessChain %32 %67 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFMul %204 %205 
                                         f32 %207 = OpFAdd %206 %200 
                                Private f32* %208 = OpAccessChain %144 %56 
                                                      OpStore %208 %207 
                                         f32 %209 = OpLoad %195 
                                Private f32* %210 = OpAccessChain %144 %56 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpExtInst %1 40 %209 %211 
                                Private f32* %213 = OpAccessChain %188 %56 
                                                      OpStore %213 %212 
                  read_only Texture3DSampled %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %188 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 2 3 
                                       f32_4 %221 = OpImageSampleImplicitLod %218 %220 
                                                      OpStore %188 %221 
                                       f32_4 %222 = OpLoad %188 
                                                      OpStore %49 %222 
                                                      OpBranch %139 
                                             %223 = OpLabel 
                                Private f32* %224 = OpAccessChain %49 %56 
                                                      OpStore %224 %129 
                                Private f32* %225 = OpAccessChain %49 %140 
                                                      OpStore %225 %129 
                                Private f32* %226 = OpAccessChain %49 %202 
                                                      OpStore %226 %129 
                                Private f32* %227 = OpAccessChain %49 %50 
                                                      OpStore %227 %129 
                                                      OpBranch %139 
                                             %139 = OpLabel 
                                       f32_4 %229 = OpLoad %49 
                              Uniform f32_4* %230 = OpAccessChain %32 %66 
                                       f32_4 %231 = OpLoad %230 
                                         f32 %232 = OpDot %229 %231 
                                Private f32* %233 = OpAccessChain %228 %56 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %228 %56 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 43 %235 %63 %129 
                                Private f32* %237 = OpAccessChain %228 %56 
                                                      OpStore %237 %236 
                                       f32_3 %238 = OpLoad %22 
                                       f32_3 %239 = OpLoad %22 
                                         f32 %240 = OpDot %238 %239 
                                                      OpStore %195 %240 
                  read_only Texture2DSampled %242 = OpLoad %241 
                                         f32 %243 = OpLoad %195 
                                       f32_2 %244 = OpCompositeConstruct %243 %243 
                                       f32_4 %245 = OpImageSampleImplicitLod %242 %244 
                                         f32 %246 = OpCompositeExtract %245 3 
                                                      OpStore %195 %246 
                read_only TextureCubeSampled %251 = OpLoad %250 
                                       f32_3 %252 = OpLoad %22 
                                       f32_4 %253 = OpImageSampleImplicitLod %251 %252 
                                         f32 %254 = OpCompositeExtract %253 3 
                                Private f32* %255 = OpAccessChain %22 %56 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %22 %56 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpLoad %195 
                                         f32 %259 = OpFMul %257 %258 
                                Private f32* %260 = OpAccessChain %22 %56 
                                                      OpStore %260 %259 
                                Private f32* %261 = OpAccessChain %228 %56 
                                         f32 %262 = OpLoad %261 
                                Private f32* %263 = OpAccessChain %22 %56 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %262 %264 
                                Private f32* %266 = OpAccessChain %22 %56 
                                                      OpStore %266 %265 
                                       f32_3 %267 = OpLoad %40 
                              Uniform f32_4* %269 = OpAccessChain %32 %268 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFMul %267 %271 
                                                      OpStore %228 %272 
                                       f32_3 %275 = OpLoad %22 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 0 0 
                                       f32_3 %277 = OpLoad %228 
                                       f32_3 %278 = OpFMul %276 %277 
                                       f32_4 %279 = OpLoad %274 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %274 %280 
                                Private f32* %281 = OpAccessChain %9 %50 
                                         f32 %282 = OpLoad %281 
                                 Output f32* %284 = OpAccessChain %274 %50 
                                                      OpStore %284 %282 
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
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
uniform 	vec4 _TintColor;
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
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %116 %128 %129 %143 %172 %178 %181 
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
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          f32 %23 = OpConstant 3.67402E-40 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          i32 %30 = OpConstant 3 
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
                                             %183 = OpTypePointer Output %6 
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
                               Uniform f32_4* %83 = OpAccessChain %17 %60 %30 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %81 %85 
                               Uniform f32_4* %86 = OpAccessChain %17 %60 %30 
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
                              Uniform f32_4* %117 = OpAccessChain %17 %73 %30 
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
                                 Output f32* %184 = OpAccessChain %116 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %116 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 280
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %95 %268 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
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
                                                      OpMemberDecorate %30 7 Offset 30 
                                                      OpMemberDecorate %30 8 RelaxedPrecision 
                                                      OpMemberDecorate %30 8 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %148 SpecId 148 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %268 Location 268 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
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
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %7 %7 %28 %20 %20 %7 %29 %7 %6 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 7 
                                              %35 = OpTypePointer Uniform %7 
                               Private f32_3* %40 = OpVariable Private 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 3 
                                              %51 = OpTypePointer Private %6 
                                          f32 %54 = OpConstant 3.67402E-40 
                                          u32 %56 = OpConstant 0 
                                              %58 = OpTypeBool 
                                              %59 = OpTypePointer Private %58 
                                Private bool* %60 = OpVariable Private 
                                          f32 %63 = OpConstant 3.67402E-40 
                                          i32 %66 = OpConstant 0 
                                          i32 %67 = OpConstant 1 
                                          i32 %69 = OpConstant -1 
                                          i32 %77 = OpConstant 8 
                                              %78 = OpTypePointer Uniform %6 
                                              %94 = OpTypePointer Input %20 
                                 Input f32_3* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 6 
                                         i32 %116 = OpConstant 2 
                                         i32 %130 = OpConstant 3 
                               Private bool* %137 = OpVariable Private 
                                         f32 %140 = OpConstant 3.67402E-40 
                                        bool %142 = OpConstantFalse 
                                        bool %148 = OpSpecConstantFalse 
                                         u32 %151 = OpConstant 1 
                              Private f32_3* %155 = OpVariable Private 
                                             %183 = OpTypePointer Function %20 
                                         i32 %193 = OpConstant 4 
                                             %194 = OpTypePointer Uniform %20 
                              Private f32_4* %199 = OpVariable Private 
                                Private f32* %206 = OpVariable Private 
                                         f32 %209 = OpConstant 3.67402E-40 
                                         f32 %211 = OpConstant 3.67402E-40 
                                Private f32* %213 = OpVariable Private 
                                         u32 %214 = OpConstant 2 
                                         f32 %217 = OpConstant 3.67402E-40 
                                             %224 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %225 = OpTypeSampledImage %224 
                                             %226 = OpTypePointer UniformConstant %225 
 UniformConstant read_only Texture3DSampled* %227 = OpVariable UniformConstant 
                              Private f32_3* %238 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %262 = OpConstant 5 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                             %277 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %184 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32_3 %25 = OpFNegate %24 
                               Uniform f32_4* %36 = OpAccessChain %32 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFAdd %25 %38 
                                                      OpStore %22 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_3 %44 = OpLoad %22 
                                        f32_3 %45 = OpFMul %43 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                                      OpStore %40 %48 
                                 Private f32* %52 = OpAccessChain %9 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFAdd %53 %54 
                                 Private f32* %57 = OpAccessChain %49 %56 
                                                      OpStore %57 %55 
                                 Private f32* %61 = OpAccessChain %49 %56 
                                          f32 %62 = OpLoad %61 
                                         bool %64 = OpFOrdLessThan %62 %63 
                                                      OpStore %60 %64 
                                         bool %65 = OpLoad %60 
                                          i32 %68 = OpSelect %65 %67 %66 
                                          i32 %70 = OpIMul %68 %69 
                                         bool %71 = OpINotEqual %70 %66 
                                                      OpSelectionMerge %73 None 
                                                      OpBranchConditional %71 %72 %73 
                                              %72 = OpLabel 
                                                      OpKill
                                              %73 = OpLabel 
                                 Private f32* %75 = OpAccessChain %9 %50 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %79 = OpAccessChain %32 %77 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFNegate %80 
                                          f32 %82 = OpFAdd %76 %81 
                                 Private f32* %83 = OpAccessChain %49 %56 
                                                      OpStore %83 %82 
                                 Private f32* %84 = OpAccessChain %49 %56 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdLessThan %85 %63 
                                                      OpStore %60 %86 
                                         bool %87 = OpLoad %60 
                                          i32 %88 = OpSelect %87 %67 %66 
                                          i32 %89 = OpIMul %88 %69 
                                         bool %90 = OpINotEqual %89 %66 
                                                      OpSelectionMerge %92 None 
                                                      OpBranchConditional %90 %91 %92 
                                              %91 = OpLabel 
                                                      OpKill
                                              %92 = OpLabel 
                                        f32_3 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 1 1 
                               Uniform f32_4* %99 = OpAccessChain %32 %98 %67 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFMul %97 %101 
                                       f32_3 %103 = OpLoad %22 
                                       f32_3 %104 = OpVectorShuffle %103 %102 3 4 2 
                                                      OpStore %22 %104 
                              Uniform f32_4* %105 = OpAccessChain %32 %98 %66 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_3 %108 = OpLoad %95 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 0 
                                       f32_2 %110 = OpFMul %107 %109 
                                       f32_3 %111 = OpLoad %22 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFAdd %110 %112 
                                       f32_3 %114 = OpLoad %22 
                                       f32_3 %115 = OpVectorShuffle %114 %113 3 4 2 
                                                      OpStore %22 %115 
                              Uniform f32_4* %117 = OpAccessChain %32 %98 %116 
                                       f32_4 %118 = OpLoad %117 
                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                       f32_3 %120 = OpLoad %95 
                                       f32_2 %121 = OpVectorShuffle %120 %120 2 2 
                                       f32_2 %122 = OpFMul %119 %121 
                                       f32_3 %123 = OpLoad %22 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpFAdd %122 %124 
                                       f32_3 %126 = OpLoad %22 
                                       f32_3 %127 = OpVectorShuffle %126 %125 3 4 2 
                                                      OpStore %22 %127 
                                       f32_3 %128 = OpLoad %22 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                              Uniform f32_4* %131 = OpAccessChain %32 %98 %130 
                                       f32_4 %132 = OpLoad %131 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFAdd %129 %133 
                                       f32_3 %135 = OpLoad %22 
                                       f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
                                                      OpStore %22 %136 
                                Uniform f32* %138 = OpAccessChain %32 %67 %56 
                                         f32 %139 = OpLoad %138 
                                        bool %141 = OpFOrdEqual %139 %140 
                                                      OpStore %137 %141 
                                                      OpSelectionMerge %144 None 
                                                      OpBranchConditional %142 %143 %144 
                                             %143 = OpLabel 
                                        bool %145 = OpLoad %137 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %147 
                                             %146 = OpLabel 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                                      OpSelectionMerge %150 None 
                                                      OpBranchConditional %148 %149 %233 
                                             %149 = OpLabel 
                                Uniform f32* %152 = OpAccessChain %32 %67 %151 
                                         f32 %153 = OpLoad %152 
                                        bool %154 = OpFOrdEqual %153 %140 
                                                      OpStore %137 %154 
                                       f32_3 %156 = OpLoad %95 
                                       f32_3 %157 = OpVectorShuffle %156 %156 1 1 1 
                              Uniform f32_4* %158 = OpAccessChain %32 %116 %67 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                                      OpStore %155 %161 
                              Uniform f32_4* %162 = OpAccessChain %32 %116 %66 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpLoad %95 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 0 0 
                                       f32_3 %167 = OpFMul %164 %166 
                                       f32_3 %168 = OpLoad %155 
                                       f32_3 %169 = OpFAdd %167 %168 
                                                      OpStore %155 %169 
                              Uniform f32_4* %170 = OpAccessChain %32 %116 %116 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpLoad %95 
                                       f32_3 %174 = OpVectorShuffle %173 %173 2 2 2 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_3 %176 = OpLoad %155 
                                       f32_3 %177 = OpFAdd %175 %176 
                                                      OpStore %155 %177 
                                       f32_3 %178 = OpLoad %155 
                              Uniform f32_4* %179 = OpAccessChain %32 %116 %130 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %178 %181 
                                                      OpStore %155 %182 
                                        bool %185 = OpLoad %137 
                                                      OpSelectionMerge %187 None 
                                                      OpBranchConditional %185 %186 %189 
                                             %186 = OpLabel 
                                       f32_3 %188 = OpLoad %155 
                                                      OpStore %184 %188 
                                                      OpBranch %187 
                                             %189 = OpLabel 
                                       f32_3 %190 = OpLoad %95 
                                                      OpStore %184 %190 
                                                      OpBranch %187 
                                             %187 = OpLabel 
                                       f32_3 %191 = OpLoad %184 
                                                      OpStore %155 %191 
                                       f32_3 %192 = OpLoad %155 
                              Uniform f32_3* %195 = OpAccessChain %32 %193 
                                       f32_3 %196 = OpLoad %195 
                                       f32_3 %197 = OpFNegate %196 
                                       f32_3 %198 = OpFAdd %192 %197 
                                                      OpStore %155 %198 
                                       f32_3 %200 = OpLoad %155 
                              Uniform f32_3* %201 = OpAccessChain %32 %130 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %199 
                                       f32_4 %205 = OpVectorShuffle %204 %203 0 4 5 6 
                                                      OpStore %199 %205 
                                Private f32* %207 = OpAccessChain %199 %151 
                                         f32 %208 = OpLoad %207 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %212 = OpFAdd %210 %211 
                                                      OpStore %206 %212 
                                Uniform f32* %215 = OpAccessChain %32 %67 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %218 = OpFMul %216 %217 
                                         f32 %219 = OpFAdd %218 %211 
                                                      OpStore %213 %219 
                                         f32 %220 = OpLoad %213 
                                         f32 %221 = OpLoad %206 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                Private f32* %223 = OpAccessChain %199 %56 
                                                      OpStore %223 %222 
                  read_only Texture3DSampled %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %199 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 2 3 
                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
                                                      OpStore %199 %231 
                                       f32_4 %232 = OpLoad %199 
                                                      OpStore %49 %232 
                                                      OpBranch %150 
                                             %233 = OpLabel 
                                Private f32* %234 = OpAccessChain %49 %56 
                                                      OpStore %234 %140 
                                Private f32* %235 = OpAccessChain %49 %151 
                                                      OpStore %235 %140 
                                Private f32* %236 = OpAccessChain %49 %214 
                                                      OpStore %236 %140 
                                Private f32* %237 = OpAccessChain %49 %50 
                                                      OpStore %237 %140 
                                                      OpBranch %150 
                                             %150 = OpLabel 
                                       f32_4 %239 = OpLoad %49 
                              Uniform f32_4* %240 = OpAccessChain %32 %66 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %238 %56 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %238 %56 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 43 %245 %63 %140 
                                Private f32* %247 = OpAccessChain %238 %56 
                                                      OpStore %247 %246 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                       f32_3 %250 = OpLoad %22 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                Private f32* %254 = OpAccessChain %22 %56 
                                                      OpStore %254 %253 
                                Private f32* %255 = OpAccessChain %238 %56 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %22 %56 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Private f32* %260 = OpAccessChain %22 %56 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %40 
                              Uniform f32_4* %263 = OpAccessChain %32 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFMul %261 %265 
                                                      OpStore %238 %266 
                                       f32_3 %269 = OpLoad %22 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 0 0 
                                       f32_3 %271 = OpLoad %238 
                                       f32_3 %272 = OpFMul %270 %271 
                                       f32_4 %273 = OpLoad %268 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %268 %274 
                                Private f32* %275 = OpAccessChain %9 %50 
                                         f32 %276 = OpLoad %275 
                                 Output f32* %278 = OpAccessChain %268 %50 
                                                      OpStore %278 %276 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Stencil {
   Ref 1
   Comp Equal
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 184259
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TintColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = u_xlat10_0.w + (-_Cutoff);
    u_xlatb6 = u_xlat6<0.0;
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _TintColor.xyz;
    u_xlat0.xyz = _TintColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
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
; Bound: 261
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %76 %138 %159 %232 %242 %243 
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
                                          i32 %19 = OpConstant 5 
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
                                             %255 = OpTypePointer Output %6 
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
                                 Output f32* %256 = OpAccessChain %232 %118 %48 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFNegate %257 
                                 Output f32* %259 = OpAccessChain %232 %118 %48 
                                                      OpStore %259 %258 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 160
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %146 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpMemberDecorate %48 0 Offset 48 
                                                      OpMemberDecorate %48 1 Offset 48 
                                                      OpMemberDecorate %48 2 Offset 48 
                                                      OpMemberDecorate %48 3 Offset 48 
                                                      OpMemberDecorate %48 4 RelaxedPrecision 
                                                      OpMemberDecorate %48 4 Offset 48 
                                                      OpDecorate %48 Block 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                              %28 = OpTypeBool 
                                              %29 = OpTypePointer Private %28 
                                Private bool* %30 = OpVariable Private 
                                          f32 %32 = OpConstant 3.67402E-40 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 0 
                                          i32 %37 = OpConstant 1 
                                          i32 %39 = OpConstant -1 
                                              %47 = OpTypeVector %22 4 
                                              %48 = OpTypeStruct %7 %47 %6 %6 %6 
                                              %49 = OpTypePointer Uniform %48 
Uniform struct {f32_4; u32_4; f32; f32; f32;}* %50 = OpVariable Uniform 
                                          i32 %51 = OpConstant 4 
                                              %52 = OpTypePointer Uniform %6 
                                Private bool* %57 = OpVariable Private 
                                              %67 = OpTypeVector %6 3 
                                              %68 = OpTypePointer Private %67 
                               Private f32_3* %69 = OpVariable Private 
                                              %73 = OpTypePointer Uniform %7 
                               Private f32_3* %78 = OpVariable Private 
                                 Private f32* %89 = OpVariable Private 
                                          i32 %90 = OpConstant 2 
                                          f32 %94 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 3 
                              Private f32_4* %116 = OpVariable Private 
                                             %117 = OpTypePointer Function %67 
                                             %119 = OpTypeVector %28 4 
                                             %120 = OpTypePointer Uniform %47 
                                         u32 %124 = OpConstant 0 
                                       f32_3 %130 = OpConstantComposite %32 %32 %32 
                                             %134 = OpTypePointer Function %6 
                                             %145 = OpTypePointer Output %7 
                               Output f32_4* %146 = OpVariable Output 
                                             %147 = OpTypePointer Function %7 
                                       f32_4 %155 = OpConstantComposite %32 %32 %32 %94 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %118 = OpVariable Function 
                               Function f32* %135 = OpVariable Function 
                             Function f32_4* %148 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                                      OpStore %21 %27 
                                          f32 %31 = OpLoad %21 
                                         bool %33 = OpFOrdLessThan %31 %32 
                                                      OpStore %30 %33 
                                         bool %34 = OpLoad %30 
                                          i32 %38 = OpSelect %34 %37 %36 
                                          i32 %40 = OpIMul %38 %39 
                                         bool %41 = OpINotEqual %40 %36 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpKill
                                              %43 = OpLabel 
                                 Private f32* %45 = OpAccessChain %9 %23 
                                          f32 %46 = OpLoad %45 
                                 Uniform f32* %53 = OpAccessChain %50 %51 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFNegate %54 
                                          f32 %56 = OpFAdd %46 %55 
                                                      OpStore %21 %56 
                                          f32 %58 = OpLoad %21 
                                         bool %59 = OpFOrdLessThan %58 %32 
                                                      OpStore %57 %59 
                                         bool %60 = OpLoad %57 
                                          i32 %61 = OpSelect %60 %37 %36 
                                          i32 %62 = OpIMul %61 %39 
                                         bool %63 = OpINotEqual %62 %36 
                                                      OpSelectionMerge %65 None 
                                                      OpBranchConditional %63 %64 %65 
                                              %64 = OpLabel 
                                                      OpKill
                                              %65 = OpLabel 
                                        f32_4 %70 = OpLoad %9 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                               Uniform f32_4* %74 = OpAccessChain %50 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %72 %76 
                                                      OpStore %69 %77 
                               Uniform f32_4* %79 = OpAccessChain %50 %36 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 3 3 3 
                                        f32_3 %82 = OpLoad %69 
                                        f32_3 %83 = OpFMul %81 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                                      OpStore %78 %86 
                                        f32_3 %87 = OpLoad %78 
                                        f32_3 %88 = OpExtInst %1 30 %87 
                                                      OpStore %78 %88 
                                 Uniform f32* %91 = OpAccessChain %50 %90 
                                          f32 %92 = OpLoad %91 
                                                      OpStore %89 %92 
                                          f32 %93 = OpLoad %89 
                                          f32 %95 = OpExtInst %1 43 %93 %32 %94 
                                                      OpStore %89 %95 
                                        f32_3 %96 = OpLoad %78 
                                          f32 %97 = OpLoad %89 
                                        f32_3 %98 = OpCompositeConstruct %97 %97 %97 
                                        f32_3 %99 = OpFMul %96 %98 
                                                      OpStore %78 %99 
                                       f32_3 %100 = OpLoad %78 
                                       f32_3 %101 = OpExtInst %1 29 %100 
                                                      OpStore %78 %101 
                                       f32_3 %102 = OpLoad %78 
                                Uniform f32* %104 = OpAccessChain %50 %103 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %106 = OpAccessChain %50 %103 
                                         f32 %107 = OpLoad %106 
                                Uniform f32* %108 = OpAccessChain %50 %103 
                                         f32 %109 = OpLoad %108 
                                       f32_3 %110 = OpCompositeConstruct %105 %107 %109 
                                         f32 %111 = OpCompositeExtract %110 0 
                                         f32 %112 = OpCompositeExtract %110 1 
                                         f32 %113 = OpCompositeExtract %110 2 
                                       f32_3 %114 = OpCompositeConstruct %111 %112 %113 
                                       f32_3 %115 = OpExtInst %1 37 %102 %114 
                                                      OpStore %78 %115 
                              Uniform u32_4* %121 = OpAccessChain %50 %37 
                                       u32_4 %122 = OpLoad %121 
                                         u32 %123 = OpCompositeExtract %122 0 
                                        bool %125 = OpINotEqual %123 %124 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %129 
                                             %126 = OpLabel 
                                       f32_3 %128 = OpLoad %78 
                                                      OpStore %118 %128 
                                                      OpBranch %127 
                                             %129 = OpLabel 
                                                      OpStore %118 %130 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                       f32_3 %131 = OpLoad %118 
                                       f32_4 %132 = OpLoad %116 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %116 %133 
                              Uniform u32_4* %136 = OpAccessChain %50 %37 
                                       u32_4 %137 = OpLoad %136 
                                         u32 %138 = OpCompositeExtract %137 0 
                                        bool %139 = OpINotEqual %138 %124 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %142 
                                             %140 = OpLabel 
                                                      OpStore %135 %94 
                                                      OpBranch %141 
                                             %142 = OpLabel 
                                                      OpStore %135 %32 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                         f32 %143 = OpLoad %135 
                                Private f32* %144 = OpAccessChain %116 %23 
                                                      OpStore %144 %143 
                              Uniform u32_4* %149 = OpAccessChain %50 %37 
                                       u32_4 %150 = OpLoad %149 
                                         u32 %151 = OpCompositeExtract %150 1 
                                        bool %152 = OpINotEqual %151 %124 
                                                      OpSelectionMerge %154 None 
                                                      OpBranchConditional %152 %153 %156 
                                             %153 = OpLabel 
                                                      OpStore %148 %155 
                                                      OpBranch %154 
                                             %156 = OpLabel 
                                       f32_4 %157 = OpLoad %116 
                                                      OpStore %148 %157 
                                                      OpBranch %154 
                                             %154 = OpLabel 
                                       f32_4 %158 = OpLoad %148 
                                                      OpStore %146 %158 
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
Fallback "tk2d/CutoutVertexColor"
}