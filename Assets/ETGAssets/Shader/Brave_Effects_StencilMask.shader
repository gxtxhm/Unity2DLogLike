//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/StencilMask" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
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
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 40909
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
; Bound: 191
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 %183 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
                               Output f32_3* %183 = OpVariable Output 
                                       f32_3 %184 = OpConstantComposite %181 %181 %181 
                                             %185 = OpTypePointer Output %6 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                                      OpStore %183 %184 
                                 Output f32* %186 = OpAccessChain %120 %60 %48 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFNegate %187 
                                 Output f32* %189 = OpAccessChain %120 %60 %48 
                                                      OpStore %189 %188 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %93 %205 %208 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpMemberDecorate %53 0 RelaxedPrecision 
                                                      OpMemberDecorate %53 0 Offset 53 
                                                      OpMemberDecorate %53 1 Offset 53 
                                                      OpMemberDecorate %53 2 Offset 53 
                                                      OpMemberDecorate %53 3 Offset 53 
                                                      OpMemberDecorate %53 4 Offset 53 
                                                      OpMemberDecorate %53 5 RelaxedPrecision 
                                                      OpMemberDecorate %53 5 Offset 53 
                                                      OpMemberDecorate %53 6 RelaxedPrecision 
                                                      OpMemberDecorate %53 6 Offset 53 
                                                      OpDecorate %53 Block 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %83 SpecId 83 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeStruct %7 %7 %51 %52 %52 %7 %6 
                                              %54 = OpTypePointer Uniform %53 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %55 = OpVariable Uniform 
                                          i32 %56 = OpConstant 6 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                                         bool %77 = OpConstantFalse 
                                         bool %83 = OpSpecConstantFalse 
                                          u32 %86 = OpConstant 1 
                                              %90 = OpTypePointer Private %52 
                               Private f32_3* %91 = OpVariable Private 
                                              %92 = OpTypePointer Input %52 
                                 Input f32_3* %93 = OpVariable Input 
                                          i32 %96 = OpConstant 2 
                                              %97 = OpTypePointer Uniform %7 
                                         i32 %119 = OpConstant 3 
                              Private f32_3* %124 = OpVariable Private 
                                             %125 = OpTypePointer Function %52 
                                         i32 %135 = OpConstant 4 
                                             %136 = OpTypePointer Uniform %52 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                             %168 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %169 = OpTypeSampledImage %168 
                                             %170 = OpTypePointer UniformConstant %169 
 UniformConstant read_only Texture3DSampled* %171 = OpVariable UniformConstant 
                              Private f32_3* %182 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %195 = OpConstant 5 
                                             %204 = OpTypePointer Output %7 
                               Output f32_4* %205 = OpVariable Output 
                                Input f32_3* %208 = OpVariable Input 
                                             %217 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %126 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %58 = OpAccessChain %55 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %49 %60 
                                 Private f32* %62 = OpAccessChain %20 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %64 %35 
                                                      OpStore %32 %65 
                                         bool %66 = OpLoad %32 
                                          i32 %67 = OpSelect %66 %40 %39 
                                          i32 %68 = OpIMul %67 %42 
                                         bool %69 = OpINotEqual %68 %39 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                 Uniform f32* %73 = OpAccessChain %55 %40 %28 
                                          f32 %74 = OpLoad %73 
                                         bool %76 = OpFOrdEqual %74 %75 
                                                      OpStore %32 %76 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                         bool %80 = OpLoad %32 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %82 
                                              %82 = OpLabel 
                                                      OpBranch %79 
                                              %79 = OpLabel 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %177 
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %55 %40 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdEqual %88 %75 
                                                      OpStore %32 %89 
                                        f32_3 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 1 1 1 
                               Uniform f32_4* %98 = OpAccessChain %55 %96 %40 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFMul %95 %100 
                                                      OpStore %91 %101 
                              Uniform f32_4* %102 = OpAccessChain %55 %96 %39 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %93 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %91 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %91 %109 
                              Uniform f32_4* %110 = OpAccessChain %55 %96 %96 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %93 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpFAdd %115 %116 
                                                      OpStore %91 %117 
                                       f32_3 %118 = OpLoad %91 
                              Uniform f32_4* %120 = OpAccessChain %55 %96 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %118 %122 
                                                      OpStore %91 %123 
                                        bool %127 = OpLoad %32 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %131 
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %91 
                                                      OpStore %126 %130 
                                                      OpBranch %129 
                                             %131 = OpLabel 
                                       f32_3 %132 = OpLoad %93 
                                                      OpStore %126 %132 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_3 %133 = OpLoad %126 
                                                      OpStore %124 %133 
                                       f32_3 %134 = OpLoad %124 
                              Uniform f32_3* %137 = OpAccessChain %55 %135 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_3 %140 = OpFAdd %134 %139 
                                                      OpStore %124 %140 
                                       f32_3 %142 = OpLoad %124 
                              Uniform f32_3* %143 = OpAccessChain %55 %119 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %141 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %141 %147 
                                Private f32* %148 = OpAccessChain %141 %86 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %124 %28 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %55 %40 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %152 
                                Private f32* %161 = OpAccessChain %91 %28 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %91 %28 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %124 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpExtInst %1 40 %163 %165 
                                Private f32* %167 = OpAccessChain %141 %28 
                                                      OpStore %167 %166 
                  read_only Texture3DSampled %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %141 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                                      OpStore %20 %176 
                                                      OpBranch %85 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %20 %28 
                                                      OpStore %178 %75 
                                Private f32* %179 = OpAccessChain %20 %86 
                                                      OpStore %179 %75 
                                Private f32* %180 = OpAccessChain %20 %155 
                                                      OpStore %180 %75 
                                Private f32* %181 = OpAccessChain %20 %22 
                                                      OpStore %181 %75 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                       f32_4 %183 = OpLoad %20 
                              Uniform f32_4* %184 = OpAccessChain %55 %39 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                Private f32* %187 = OpAccessChain %182 %28 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %182 %28 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpExtInst %1 43 %189 %35 %75 
                                Private f32* %191 = OpAccessChain %182 %28 
                                                      OpStore %191 %190 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %196 = OpAccessChain %55 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %192 %199 
                                       f32_3 %200 = OpLoad %182 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 0 
                                       f32_3 %202 = OpLoad %192 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %182 %203 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %209 = OpLoad %208 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %182 
                                       f32_3 %212 = OpFAdd %210 %211 
                                       f32_4 %213 = OpLoad %205 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
                                                      OpStore %205 %214 
                                Private f32* %215 = OpAccessChain %9 %22 
                                         f32 %216 = OpLoad %215 
                                 Output f32* %218 = OpAccessChain %205 %22 
                                                      OpStore %218 %216 
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
float u_xlat12;
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
; Bound: 305
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %90 %123 %135 %136 %149 %185 %188 %296 
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
                                                      OpDecorate %90 Location 90 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %188 Location 188 
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
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %296 Location 296 
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
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Output %88 
                                Output f32_3* %90 = OpVariable Output 
                                         i32 %102 = OpConstant 9 
                                             %120 = OpTypeArray %6 %48 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %131 = OpTypePointer Output %7 
                                             %133 = OpTypeVector %6 2 
                                             %134 = OpTypePointer Output %133 
                               Output f32_2* %135 = OpVariable Output 
                                Input f32_4* %136 = OpVariable Input 
                                         i32 %139 = OpConstant 12 
                                             %148 = OpTypePointer Input %88 
                                Input f32_3* %149 = OpVariable Input 
                                         i32 %151 = OpConstant 8 
                                         u32 %168 = OpConstant 2 
                                Private f32* %170 = OpVariable Private 
                               Output f32_3* %185 = OpVariable Output 
                               Output f32_4* %188 = OpVariable Output 
                                         f32 %189 = OpConstant 3.67402E-40 
                                       f32_4 %190 = OpConstantComposite %189 %189 %189 %189 
                                             %191 = OpTypePointer Private %88 
                              Private f32_3* %192 = OpVariable Private 
                              Private f32_4* %209 = OpVariable Private 
                              Private f32_3* %215 = OpVariable Private 
                                         i32 %221 = OpConstant 4 
                                         i32 %227 = OpConstant 5 
                                         i32 %233 = OpConstant 6 
                                         u32 %242 = OpConstant 3 
                                       f32_3 %263 = OpConstantComposite %189 %189 %189 
                                         f32 %271 = OpConstant 3.67402E-40 
                                       f32_3 %272 = OpConstantComposite %271 %271 %271 
                                         f32 %283 = OpConstant 3.67402E-40 
                                       f32_3 %284 = OpConstantComposite %283 %283 %283 
                                         f32 %286 = OpConstant 3.67402E-40 
                                       f32_3 %287 = OpConstantComposite %286 %286 %286 
                               Output f32_3* %296 = OpVariable Output 
                                             %299 = OpTypePointer Output %6 
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
                               Uniform f32_4* %91 = OpAccessChain %17 %60 %84 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %47 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                                      OpStore %90 %99 
                                       f32_4 %100 = OpLoad %82 
                                       f32_4 %101 = OpVectorShuffle %100 %100 1 1 1 1 
                              Uniform f32_4* %103 = OpAccessChain %17 %102 %61 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFMul %101 %104 
                                                      OpStore %9 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %102 %66 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %82 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %9 %112 
                              Uniform f32_4* %113 = OpAccessChain %17 %102 %74 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %82 
                                       f32_4 %116 = OpVectorShuffle %115 %115 2 2 2 2 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %9 %119 
                              Uniform f32_4* %124 = OpAccessChain %17 %102 %84 
                                       f32_4 %125 = OpLoad %124 
                                       f32_4 %126 = OpLoad %82 
                                       f32_4 %127 = OpVectorShuffle %126 %126 3 3 3 3 
                                       f32_4 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpFAdd %128 %129 
                               Output f32_4* %132 = OpAccessChain %123 %66 
                                                      OpStore %132 %130 
                                       f32_4 %137 = OpLoad %136 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                              Uniform f32_4* %140 = OpAccessChain %17 %139 
                                       f32_4 %141 = OpLoad %140 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                                       f32_2 %143 = OpFMul %138 %142 
                              Uniform f32_4* %144 = OpAccessChain %17 %139 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 2 3 
                                       f32_2 %147 = OpFAdd %143 %146 
                                                      OpStore %135 %147 
                                       f32_3 %150 = OpLoad %149 
                              Uniform f32_4* %152 = OpAccessChain %17 %151 %66 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %150 %154 
                                Private f32* %156 = OpAccessChain %9 %25 
                                                      OpStore %156 %155 
                                       f32_3 %157 = OpLoad %149 
                              Uniform f32_4* %158 = OpAccessChain %17 %151 %61 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %9 %48 
                                                      OpStore %162 %161 
                                       f32_3 %163 = OpLoad %149 
                              Uniform f32_4* %164 = OpAccessChain %17 %151 %74 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                         f32 %167 = OpDot %163 %166 
                                Private f32* %169 = OpAccessChain %9 %168 
                                                      OpStore %169 %167 
                                       f32_4 %171 = OpLoad %9 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_4 %173 = OpLoad %9 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                         f32 %175 = OpDot %172 %174 
                                                      OpStore %170 %175 
                                         f32 %176 = OpLoad %170 
                                         f32 %177 = OpExtInst %1 32 %176 
                                                      OpStore %170 %177 
                                         f32 %178 = OpLoad %170 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %9 %184 
                                       f32_4 %186 = OpLoad %9 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                                                      OpStore %185 %187 
                                                      OpStore %188 %190 
                                Private f32* %193 = OpAccessChain %9 %48 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %9 %48 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %198 = OpAccessChain %192 %25 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %9 %25 
                                         f32 %200 = OpLoad %199 
                                Private f32* %201 = OpAccessChain %9 %25 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %200 %202 
                                Private f32* %204 = OpAccessChain %192 %25 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                         f32 %207 = OpFAdd %203 %206 
                                Private f32* %208 = OpAccessChain %192 %25 
                                                      OpStore %208 %207 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 2 2 0 
                                       f32_4 %212 = OpLoad %9 
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
                                Private f32* %232 = OpAccessChain %215 %168 
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
                                Private f32* %243 = OpAccessChain %9 %242 
                                                      OpStore %243 %44 
                              Uniform f32_4* %244 = OpAccessChain %17 %66 
                                       f32_4 %245 = OpLoad %244 
                                       f32_4 %246 = OpLoad %9 
                                         f32 %247 = OpDot %245 %246 
                                Private f32* %248 = OpAccessChain %215 %25 
                                                      OpStore %248 %247 
                              Uniform f32_4* %249 = OpAccessChain %17 %61 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %9 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %215 %48 
                                                      OpStore %253 %252 
                              Uniform f32_4* %254 = OpAccessChain %17 %74 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %9 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %215 %168 
                                                      OpStore %258 %257 
                                       f32_3 %259 = OpLoad %192 
                                       f32_3 %260 = OpLoad %215 
                                       f32_3 %261 = OpFAdd %259 %260 
                                                      OpStore %192 %261 
                                       f32_3 %262 = OpLoad %192 
                                       f32_3 %264 = OpExtInst %1 40 %262 %263 
                                                      OpStore %192 %264 
                                       f32_3 %265 = OpLoad %192 
                                       f32_3 %266 = OpExtInst %1 30 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %9 %268 
                                       f32_4 %269 = OpLoad %9 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_3 %273 = OpFMul %270 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %9 %275 
                                       f32_4 %276 = OpLoad %9 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpExtInst %1 29 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %9 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %285 = OpFMul %282 %284 
                                       f32_3 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %9 %290 
                                       f32_4 %291 = OpLoad %9 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_3 %293 = OpExtInst %1 40 %292 %263 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %9 %295 
                                       f32_4 %297 = OpLoad %9 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                                      OpStore %296 %298 
                                 Output f32* %300 = OpAccessChain %123 %66 %48 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFNegate %301 
                                 Output f32* %303 = OpAccessChain %123 %66 %48 
                                                      OpStore %303 %302 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %93 %205 %208 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpMemberDecorate %53 0 RelaxedPrecision 
                                                      OpMemberDecorate %53 0 Offset 53 
                                                      OpMemberDecorate %53 1 Offset 53 
                                                      OpMemberDecorate %53 2 Offset 53 
                                                      OpMemberDecorate %53 3 Offset 53 
                                                      OpMemberDecorate %53 4 Offset 53 
                                                      OpMemberDecorate %53 5 RelaxedPrecision 
                                                      OpMemberDecorate %53 5 Offset 53 
                                                      OpMemberDecorate %53 6 RelaxedPrecision 
                                                      OpMemberDecorate %53 6 Offset 53 
                                                      OpDecorate %53 Block 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %83 SpecId 83 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeStruct %7 %7 %51 %52 %52 %7 %6 
                                              %54 = OpTypePointer Uniform %53 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %55 = OpVariable Uniform 
                                          i32 %56 = OpConstant 6 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                                         bool %77 = OpConstantFalse 
                                         bool %83 = OpSpecConstantFalse 
                                          u32 %86 = OpConstant 1 
                                              %90 = OpTypePointer Private %52 
                               Private f32_3* %91 = OpVariable Private 
                                              %92 = OpTypePointer Input %52 
                                 Input f32_3* %93 = OpVariable Input 
                                          i32 %96 = OpConstant 2 
                                              %97 = OpTypePointer Uniform %7 
                                         i32 %119 = OpConstant 3 
                              Private f32_3* %124 = OpVariable Private 
                                             %125 = OpTypePointer Function %52 
                                         i32 %135 = OpConstant 4 
                                             %136 = OpTypePointer Uniform %52 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                             %168 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %169 = OpTypeSampledImage %168 
                                             %170 = OpTypePointer UniformConstant %169 
 UniformConstant read_only Texture3DSampled* %171 = OpVariable UniformConstant 
                              Private f32_3* %182 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %195 = OpConstant 5 
                                             %204 = OpTypePointer Output %7 
                               Output f32_4* %205 = OpVariable Output 
                                Input f32_3* %208 = OpVariable Input 
                                             %217 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %126 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %58 = OpAccessChain %55 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %49 %60 
                                 Private f32* %62 = OpAccessChain %20 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %64 %35 
                                                      OpStore %32 %65 
                                         bool %66 = OpLoad %32 
                                          i32 %67 = OpSelect %66 %40 %39 
                                          i32 %68 = OpIMul %67 %42 
                                         bool %69 = OpINotEqual %68 %39 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                 Uniform f32* %73 = OpAccessChain %55 %40 %28 
                                          f32 %74 = OpLoad %73 
                                         bool %76 = OpFOrdEqual %74 %75 
                                                      OpStore %32 %76 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                         bool %80 = OpLoad %32 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %82 
                                              %82 = OpLabel 
                                                      OpBranch %79 
                                              %79 = OpLabel 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %177 
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %55 %40 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdEqual %88 %75 
                                                      OpStore %32 %89 
                                        f32_3 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 1 1 1 
                               Uniform f32_4* %98 = OpAccessChain %55 %96 %40 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFMul %95 %100 
                                                      OpStore %91 %101 
                              Uniform f32_4* %102 = OpAccessChain %55 %96 %39 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %93 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %91 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %91 %109 
                              Uniform f32_4* %110 = OpAccessChain %55 %96 %96 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %93 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpFAdd %115 %116 
                                                      OpStore %91 %117 
                                       f32_3 %118 = OpLoad %91 
                              Uniform f32_4* %120 = OpAccessChain %55 %96 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %118 %122 
                                                      OpStore %91 %123 
                                        bool %127 = OpLoad %32 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %131 
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %91 
                                                      OpStore %126 %130 
                                                      OpBranch %129 
                                             %131 = OpLabel 
                                       f32_3 %132 = OpLoad %93 
                                                      OpStore %126 %132 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_3 %133 = OpLoad %126 
                                                      OpStore %124 %133 
                                       f32_3 %134 = OpLoad %124 
                              Uniform f32_3* %137 = OpAccessChain %55 %135 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_3 %140 = OpFAdd %134 %139 
                                                      OpStore %124 %140 
                                       f32_3 %142 = OpLoad %124 
                              Uniform f32_3* %143 = OpAccessChain %55 %119 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %141 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %141 %147 
                                Private f32* %148 = OpAccessChain %141 %86 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %124 %28 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %55 %40 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %152 
                                Private f32* %161 = OpAccessChain %91 %28 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %91 %28 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %124 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpExtInst %1 40 %163 %165 
                                Private f32* %167 = OpAccessChain %141 %28 
                                                      OpStore %167 %166 
                  read_only Texture3DSampled %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %141 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                                      OpStore %20 %176 
                                                      OpBranch %85 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %20 %28 
                                                      OpStore %178 %75 
                                Private f32* %179 = OpAccessChain %20 %86 
                                                      OpStore %179 %75 
                                Private f32* %180 = OpAccessChain %20 %155 
                                                      OpStore %180 %75 
                                Private f32* %181 = OpAccessChain %20 %22 
                                                      OpStore %181 %75 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                       f32_4 %183 = OpLoad %20 
                              Uniform f32_4* %184 = OpAccessChain %55 %39 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                Private f32* %187 = OpAccessChain %182 %28 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %182 %28 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpExtInst %1 43 %189 %35 %75 
                                Private f32* %191 = OpAccessChain %182 %28 
                                                      OpStore %191 %190 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %196 = OpAccessChain %55 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %192 %199 
                                       f32_3 %200 = OpLoad %182 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 0 
                                       f32_3 %202 = OpLoad %192 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %182 %203 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %209 = OpLoad %208 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %182 
                                       f32_3 %212 = OpFAdd %210 %211 
                                       f32_4 %213 = OpLoad %205 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
                                                      OpStore %205 %214 
                                Private f32* %215 = OpAccessChain %9 %22 
                                         f32 %216 = OpLoad %215 
                                 Output f32* %218 = OpAccessChain %205 %22 
                                                      OpStore %218 %216 
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
float u_xlat2;
float u_xlat7;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = (-u_xlat1.x) + u_xlat4.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb4 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb4){
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = min(u_xlat1.x, u_xlat7);
    u_xlat1.x = (u_xlatb4) ? u_xlat7 : u_xlat1.x;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 218
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %89 %128 %134 %135 %148 %176 %182 %185 %199 %211 
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
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %126 0 BuiltIn 126 
                                                      OpMemberDecorate %126 1 BuiltIn 126 
                                                      OpMemberDecorate %126 2 BuiltIn 126 
                                                      OpDecorate %126 Block 
                                                      OpDecorate %134 Location 134 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %182 Location 182 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %199 Location 199 
                                                      OpDecorate %211 Location 211 
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
                                              %87 = OpTypeVector %6 3 
                                              %88 = OpTypePointer Output %87 
                                Output f32_3* %89 = OpVariable Output 
                                             %125 = OpTypeArray %6 %48 
                                             %126 = OpTypeStruct %7 %6 %125 
                                             %127 = OpTypePointer Output %126 
        Output struct {f32_4; f32; f32[1];}* %128 = OpVariable Output 
                                             %130 = OpTypePointer Output %7 
                                             %132 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Output %132 
                               Output f32_2* %134 = OpVariable Output 
                                Input f32_4* %135 = OpVariable Input 
                                         i32 %138 = OpConstant 6 
                                             %147 = OpTypePointer Input %87 
                                Input f32_3* %148 = OpVariable Input 
                                         u32 %166 = OpConstant 2 
                                Private f32* %168 = OpVariable Private 
                               Output f32_3* %176 = OpVariable Output 
                               Output f32_4* %182 = OpVariable Output 
                                         f32 %183 = OpConstant 3.67402E-40 
                                       f32_4 %184 = OpConstantComposite %183 %183 %183 %183 
                               Output f32_3* %185 = OpVariable Output 
                                       f32_3 %186 = OpConstantComposite %183 %183 %183 
                                       f32_3 %195 = OpConstantComposite %37 %37 %37 
                               Output f32_4* %199 = OpVariable Output 
                               Output f32_4* %211 = OpVariable Output 
                                             %212 = OpTypePointer Output %6 
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
                               Uniform f32_4* %90 = OpAccessChain %17 %60 %83 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_4 %93 = OpLoad %47 
                                        f32_3 %94 = OpVectorShuffle %93 %93 3 3 3 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %95 %97 
                                                      OpStore %89 %98 
                                        f32_4 %99 = OpLoad %81 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                              Uniform f32_4* %101 = OpAccessChain %17 %83 %60 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpFMul %100 %102 
                                                      OpStore %9 %103 
                              Uniform f32_4* %104 = OpAccessChain %17 %83 %65 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %81 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %17 %83 %73 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %81 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 2 2 2 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %17 %83 %83 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpLoad %81 
                                       f32_4 %121 = OpVectorShuffle %120 %120 3 3 3 3 
                                       f32_4 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %9 
                                       f32_4 %124 = OpFAdd %122 %123 
                                                      OpStore %9 %124 
                                       f32_4 %129 = OpLoad %9 
                               Output f32_4* %131 = OpAccessChain %128 %65 
                                                      OpStore %131 %129 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              Uniform f32_4* %139 = OpAccessChain %17 %138 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpFMul %137 %141 
                              Uniform f32_4* %143 = OpAccessChain %17 %138 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
                                       f32_2 %146 = OpFAdd %142 %145 
                                                      OpStore %134 %146 
                                       f32_3 %149 = OpLoad %148 
                              Uniform f32_4* %150 = OpAccessChain %17 %73 %65 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                         f32 %153 = OpDot %149 %152 
                                Private f32* %154 = OpAccessChain %81 %25 
                                                      OpStore %154 %153 
                                       f32_3 %155 = OpLoad %148 
                              Uniform f32_4* %156 = OpAccessChain %17 %73 %60 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpDot %155 %158 
                                Private f32* %160 = OpAccessChain %81 %48 
                                                      OpStore %160 %159 
                                       f32_3 %161 = OpLoad %148 
                              Uniform f32_4* %162 = OpAccessChain %17 %73 %73 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %161 %164 
                                Private f32* %167 = OpAccessChain %81 %166 
                                                      OpStore %167 %165 
                                       f32_4 %169 = OpLoad %81 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_4 %171 = OpLoad %81 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                         f32 %173 = OpDot %170 %172 
                                                      OpStore %168 %173 
                                         f32 %174 = OpLoad %168 
                                         f32 %175 = OpExtInst %1 32 %174 
                                                      OpStore %168 %175 
                                         f32 %177 = OpLoad %168 
                                       f32_3 %178 = OpCompositeConstruct %177 %177 %177 
                                       f32_4 %179 = OpLoad %81 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpFMul %178 %180 
                                                      OpStore %176 %181 
                                                      OpStore %182 %184 
                                                      OpStore %185 %186 
                                Private f32* %187 = OpAccessChain %9 %48 
                                         f32 %188 = OpLoad %187 
                                Uniform f32* %189 = OpAccessChain %17 %65 %25 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpFMul %188 %190 
                                Private f32* %192 = OpAccessChain %9 %48 
                                                      OpStore %192 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 3 1 
                                       f32_3 %196 = OpFMul %194 %195 
                                       f32_4 %197 = OpLoad %81 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 1 5 6 
                                                      OpStore %81 %198 
                                       f32_4 %200 = OpLoad %9 
                                       f32_2 %201 = OpVectorShuffle %200 %200 2 3 
                                       f32_4 %202 = OpLoad %199 
                                       f32_4 %203 = OpVectorShuffle %202 %201 0 1 4 5 
                                                      OpStore %199 %203 
                                       f32_4 %204 = OpLoad %81 
                                       f32_2 %205 = OpVectorShuffle %204 %204 2 2 
                                       f32_4 %206 = OpLoad %81 
                                       f32_2 %207 = OpVectorShuffle %206 %206 0 3 
                                       f32_2 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %199 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 2 3 
                                                      OpStore %199 %210 
                                                      OpStore %211 %184 
                                 Output f32* %213 = OpAccessChain %128 %65 %48 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                 Output f32* %216 = OpAccessChain %128 %65 %48 
                                                      OpStore %216 %215 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %263 %315 %318 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %52 ArrayStride 52 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 RelaxedPrecision 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 RelaxedPrecision 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 RelaxedPrecision 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpMemberDecorate %54 10 RelaxedPrecision 
                                                      OpMemberDecorate %54 10 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %160 SpecId 160 
                                                      OpDecorate %241 DescriptorSet 241 
                                                      OpDecorate %241 Binding 241 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %270 DescriptorSet 270 
                                                      OpDecorate %270 Binding 270 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %315 Location 315 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %318 Location 318 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                              %50 = OpTypeVector %6 3 
                                          u32 %51 = OpConstant 4 
                                              %52 = OpTypeArray %7 %51 
                                              %53 = OpTypeArray %7 %51 
                                              %54 = OpTypeStruct %50 %7 %7 %7 %52 %7 %53 %50 %50 %7 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 10 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %50 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %50 
                                 Input f32_3* %77 = OpVariable Input 
                                              %80 = OpTypePointer Uniform %50 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                                          u32 %86 = OpConstant 2 
                                          u32 %92 = OpConstant 1 
                                          i32 %94 = OpConstant 2 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %105 = OpTypePointer Uniform %7 
                                         f32 %146 = OpConstant 3.67402E-40 
                               Private bool* %149 = OpVariable Private 
                                         i32 %150 = OpConstant 5 
                                        bool %154 = OpConstantFalse 
                                        bool %160 = OpSpecConstantFalse 
                               Private bool* %163 = OpVariable Private 
                                         i32 %169 = OpConstant 6 
                                             %195 = OpTypePointer Function %50 
                                         i32 %205 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
                                         i32 %212 = OpConstant 7 
                                             %218 = OpTypePointer Private %15 
                              Private f32_2* %219 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
                                         f32 %224 = OpConstant 3.67402E-40 
                                Private f32* %227 = OpVariable Private 
                                         f32 %230 = OpConstant 3.67402E-40 
                                             %238 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %239 = OpTypeSampledImage %238 
                                             %240 = OpTypePointer UniformConstant %239 
 UniformConstant read_only Texture3DSampled* %241 = OpVariable UniformConstant 
                              Private f32_3* %252 = OpVariable Private 
                                             %262 = OpTypePointer Input %7 
                                Input f32_4* %263 = OpVariable Input 
                                Private f32* %269 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %270 = OpVariable UniformConstant 
                              Private f32_3* %275 = OpVariable Private 
                                             %291 = OpTypePointer Function %6 
                                         i32 %305 = OpConstant 9 
                                             %314 = OpTypePointer Output %7 
                               Output f32_4* %315 = OpVariable Output 
                                Input f32_3* %318 = OpVariable Input 
                                             %327 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %196 = OpVariable Function 
                               Function f32* %292 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpFNegate %78 
                               Uniform f32_3* %81 = OpAccessChain %56 %39 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFAdd %79 %82 
                                                      OpStore %75 %83 
                                 Uniform f32* %87 = OpAccessChain %56 %85 %39 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %84 %28 
                                                      OpStore %89 %88 
                                 Uniform f32* %90 = OpAccessChain %56 %85 %40 %86 
                                          f32 %91 = OpLoad %90 
                                 Private f32* %93 = OpAccessChain %84 %92 
                                                      OpStore %93 %91 
                                 Uniform f32* %95 = OpAccessChain %56 %85 %94 %86 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %97 = OpAccessChain %84 %86 
                                                      OpStore %97 %96 
                                        f32_3 %98 = OpLoad %75 
                                        f32_3 %99 = OpLoad %84 
                                         f32 %100 = OpDot %98 %99 
                                Private f32* %101 = OpAccessChain %75 %28 
                                                      OpStore %101 %100 
                                       f32_3 %103 = OpLoad %77 
                              Uniform f32_4* %106 = OpAccessChain %56 %104 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %103 %109 
                                                      OpStore %102 %110 
                                       f32_3 %111 = OpLoad %102 
                                       f32_3 %112 = OpLoad %102 
                                         f32 %113 = OpDot %111 %112 
                                Private f32* %114 = OpAccessChain %102 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %102 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpExtInst %1 31 %116 
                                Private f32* %118 = OpAccessChain %102 %28 
                                                      OpStore %118 %117 
                                Private f32* %119 = OpAccessChain %75 %28 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                Private f32* %122 = OpAccessChain %102 %28 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFAdd %121 %123 
                                Private f32* %125 = OpAccessChain %102 %28 
                                                      OpStore %125 %124 
                                Uniform f32* %126 = OpAccessChain %56 %104 %22 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %102 %28 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %75 %28 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFAdd %130 %132 
                                Private f32* %134 = OpAccessChain %75 %28 
                                                      OpStore %134 %133 
                                Private f32* %135 = OpAccessChain %75 %28 
                                         f32 %136 = OpLoad %135 
                                Uniform f32* %137 = OpAccessChain %56 %94 %86 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFMul %136 %138 
                                Uniform f32* %140 = OpAccessChain %56 %94 %22 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFAdd %139 %141 
                                Private f32* %143 = OpAccessChain %75 %28 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %75 %28 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 43 %145 %35 %146 
                                Private f32* %148 = OpAccessChain %75 %28 
                                                      OpStore %148 %147 
                                Uniform f32* %151 = OpAccessChain %56 %150 %28 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdEqual %152 %146 
                                                      OpStore %149 %153 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %156 
                                             %155 = OpLabel 
                                        bool %157 = OpLoad %149 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %159 
                                             %158 = OpLabel 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %247 
                                             %161 = OpLabel 
                                Uniform f32* %164 = OpAccessChain %56 %150 %92 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %146 
                                                      OpStore %163 %166 
                                       f32_3 %167 = OpLoad %77 
                                       f32_3 %168 = OpVectorShuffle %167 %167 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %56 %169 %40 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %168 %172 
                                                      OpStore %84 %173 
                              Uniform f32_4* %174 = OpAccessChain %56 %169 %39 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpLoad %77 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_3 %180 = OpLoad %84 
                                       f32_3 %181 = OpFAdd %179 %180 
                                                      OpStore %84 %181 
                              Uniform f32_4* %182 = OpAccessChain %56 %169 %94 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpLoad %77 
                                       f32_3 %186 = OpVectorShuffle %185 %185 2 2 2 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %84 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %84 %189 
                                       f32_3 %190 = OpLoad %84 
                              Uniform f32_4* %191 = OpAccessChain %56 %169 %104 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                                      OpStore %84 %194 
                                        bool %197 = OpLoad %163 
                                                      OpSelectionMerge %199 None 
                                                      OpBranchConditional %197 %198 %201 
                                             %198 = OpLabel 
                                       f32_3 %200 = OpLoad %84 
                                                      OpStore %196 %200 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                       f32_3 %202 = OpLoad %77 
                                                      OpStore %196 %202 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                       f32_3 %203 = OpLoad %196 
                                                      OpStore %84 %203 
                                       f32_3 %204 = OpLoad %84 
                              Uniform f32_3* %206 = OpAccessChain %56 %205 
                                       f32_3 %207 = OpLoad %206 
                                       f32_3 %208 = OpFNegate %207 
                                       f32_3 %209 = OpFAdd %204 %208 
                                                      OpStore %84 %209 
                                       f32_3 %211 = OpLoad %84 
                              Uniform f32_3* %213 = OpAccessChain %56 %212 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFMul %211 %214 
                                       f32_4 %216 = OpLoad %210 
                                       f32_4 %217 = OpVectorShuffle %216 %215 0 4 5 6 
                                                      OpStore %210 %217 
                                Private f32* %220 = OpAccessChain %210 %92 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpFMul %221 %222 
                                         f32 %225 = OpFAdd %223 %224 
                                Private f32* %226 = OpAccessChain %219 %28 
                                                      OpStore %226 %225 
                                Uniform f32* %228 = OpAccessChain %56 %150 %86 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                         f32 %232 = OpFAdd %231 %224 
                                                      OpStore %227 %232 
                                         f32 %233 = OpLoad %227 
                                Private f32* %234 = OpAccessChain %219 %28 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 40 %233 %235 
                                Private f32* %237 = OpAccessChain %210 %28 
                                                      OpStore %237 %236 
                  read_only Texture3DSampled %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %210 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 2 3 
                                       f32_4 %245 = OpImageSampleImplicitLod %242 %244 
                                                      OpStore %210 %245 
                                       f32_4 %246 = OpLoad %210 
                                                      OpStore %20 %246 
                                                      OpBranch %162 
                                             %247 = OpLabel 
                                Private f32* %248 = OpAccessChain %20 %28 
                                                      OpStore %248 %146 
                                Private f32* %249 = OpAccessChain %20 %92 
                                                      OpStore %249 %146 
                                Private f32* %250 = OpAccessChain %20 %86 
                                                      OpStore %250 %146 
                                Private f32* %251 = OpAccessChain %20 %22 
                                                      OpStore %251 %146 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                       f32_4 %253 = OpLoad %20 
                              Uniform f32_4* %254 = OpAccessChain %56 %40 
                                       f32_4 %255 = OpLoad %254 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %252 %28 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %252 %28 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %35 %146 
                                Private f32* %261 = OpAccessChain %252 %28 
                                                      OpStore %261 %260 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %266 = OpLoad %263 
                                       f32_2 %267 = OpVectorShuffle %266 %266 3 3 
                                       f32_2 %268 = OpFDiv %265 %267 
                                                      OpStore %219 %268 
                  read_only Texture2DSampled %271 = OpLoad %270 
                                       f32_2 %272 = OpLoad %219 
                                       f32_4 %273 = OpImageSampleImplicitLod %271 %272 
                                         f32 %274 = OpCompositeExtract %273 0 
                                                      OpStore %269 %274 
                                Private f32* %276 = OpAccessChain %75 %28 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %269 
                                         f32 %279 = OpFAdd %277 %278 
                                Private f32* %280 = OpAccessChain %275 %28 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %275 %28 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpExtInst %1 43 %282 %35 %146 
                                Private f32* %284 = OpAccessChain %275 %28 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %275 %28 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %252 %28 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpExtInst %1 37 %286 %288 
                                Private f32* %290 = OpAccessChain %252 %28 
                                                      OpStore %290 %289 
                                        bool %293 = OpLoad %149 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %293 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %252 %28 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %292 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                Private f32* %299 = OpAccessChain %275 %28 
                                         f32 %300 = OpLoad %299 
                                                      OpStore %292 %300 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %301 = OpLoad %292 
                                Private f32* %302 = OpAccessChain %252 %28 
                                                      OpStore %302 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %56 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFMul %304 %308 
                                                      OpStore %275 %309 
                                       f32_3 %310 = OpLoad %252 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpLoad %275 
                                       f32_3 %313 = OpFMul %311 %312 
                                                      OpStore %252 %313 
                                       f32_4 %316 = OpLoad %9 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %319 = OpLoad %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %252 
                                       f32_3 %322 = OpFAdd %320 %321 
                                       f32_4 %323 = OpLoad %315 
                                       f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
                                                      OpStore %315 %324 
                                Private f32* %325 = OpAccessChain %9 %22 
                                         f32 %326 = OpLoad %325 
                                 Output f32* %328 = OpAccessChain %315 %22 
                                                      OpStore %328 %326 
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
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = (-u_xlat1.x) + u_xlat4.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb4 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb4){
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = min(u_xlat1.x, u_xlat7);
    u_xlat1.x = (u_xlatb4) ? u_xlat7 : u_xlat1.x;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 333
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %90 %130 %136 %137 %150 %186 %189 %299 %314 %326 
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
                                                      OpDecorate %90 Location 90 
                                                      OpMemberDecorate %128 0 BuiltIn 128 
                                                      OpMemberDecorate %128 1 BuiltIn 128 
                                                      OpMemberDecorate %128 2 BuiltIn 128 
                                                      OpDecorate %128 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
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
                                                      OpDecorate %265 RelaxedPrecision 
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
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Output %88 
                                Output f32_3* %90 = OpVariable Output 
                                         i32 %102 = OpConstant 10 
                                             %127 = OpTypeArray %6 %48 
                                             %128 = OpTypeStruct %7 %6 %127 
                                             %129 = OpTypePointer Output %128 
        Output struct {f32_4; f32; f32[1];}* %130 = OpVariable Output 
                                             %132 = OpTypePointer Output %7 
                                             %134 = OpTypeVector %6 2 
                                             %135 = OpTypePointer Output %134 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 13 
                                             %149 = OpTypePointer Input %88 
                                Input f32_3* %150 = OpVariable Input 
                                         i32 %152 = OpConstant 9 
                                         u32 %169 = OpConstant 2 
                                Private f32* %171 = OpVariable Private 
                               Output f32_3* %186 = OpVariable Output 
                               Output f32_4* %189 = OpVariable Output 
                                         f32 %190 = OpConstant 3.67402E-40 
                                       f32_4 %191 = OpConstantComposite %190 %190 %190 %190 
                                             %192 = OpTypePointer Private %88 
                              Private f32_3* %193 = OpVariable Private 
                              Private f32_4* %210 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %217 = OpConstant 4 
                                         i32 %223 = OpConstant 5 
                                         i32 %229 = OpConstant 6 
                                         i32 %235 = OpConstant 7 
                                         u32 %244 = OpConstant 3 
                                       f32_3 %266 = OpConstantComposite %190 %190 %190 
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
                                             %327 = OpTypePointer Output %6 
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
                               Uniform f32_4* %91 = OpAccessChain %17 %60 %84 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %47 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                                      OpStore %90 %99 
                                       f32_4 %100 = OpLoad %82 
                                       f32_4 %101 = OpVectorShuffle %100 %100 1 1 1 1 
                              Uniform f32_4* %103 = OpAccessChain %17 %102 %61 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFMul %101 %104 
                                                      OpStore %9 %105 
                              Uniform f32_4* %106 = OpAccessChain %17 %102 %66 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %82 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %9 %112 
                              Uniform f32_4* %113 = OpAccessChain %17 %102 %74 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %82 
                                       f32_4 %116 = OpVectorShuffle %115 %115 2 2 2 2 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %9 %119 
                              Uniform f32_4* %120 = OpAccessChain %17 %102 %84 
                                       f32_4 %121 = OpLoad %120 
                                       f32_4 %122 = OpLoad %82 
                                       f32_4 %123 = OpVectorShuffle %122 %122 3 3 3 3 
                                       f32_4 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpFAdd %124 %125 
                                                      OpStore %9 %126 
                                       f32_4 %131 = OpLoad %9 
                               Output f32_4* %133 = OpAccessChain %130 %66 
                                                      OpStore %133 %131 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %17 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %17 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                       f32_3 %151 = OpLoad %150 
                              Uniform f32_4* %153 = OpAccessChain %17 %152 %66 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %151 %155 
                                Private f32* %157 = OpAccessChain %82 %25 
                                                      OpStore %157 %156 
                                       f32_3 %158 = OpLoad %150 
                              Uniform f32_4* %159 = OpAccessChain %17 %152 %61 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                         f32 %162 = OpDot %158 %161 
                                Private f32* %163 = OpAccessChain %82 %48 
                                                      OpStore %163 %162 
                                       f32_3 %164 = OpLoad %150 
                              Uniform f32_4* %165 = OpAccessChain %17 %152 %74 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %164 %167 
                                Private f32* %170 = OpAccessChain %82 %169 
                                                      OpStore %170 %168 
                                       f32_4 %172 = OpLoad %82 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_4 %174 = OpLoad %82 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                         f32 %176 = OpDot %173 %175 
                                                      OpStore %171 %176 
                                         f32 %177 = OpLoad %171 
                                         f32 %178 = OpExtInst %1 32 %177 
                                                      OpStore %171 %178 
                                         f32 %179 = OpLoad %171 
                                       f32_3 %180 = OpCompositeConstruct %179 %179 %179 
                                       f32_4 %181 = OpLoad %82 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %82 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %82 %185 
                                       f32_4 %187 = OpLoad %82 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                                      OpStore %186 %188 
                                                      OpStore %189 %191 
                                Private f32* %194 = OpAccessChain %82 %48 
                                         f32 %195 = OpLoad %194 
                                Private f32* %196 = OpAccessChain %82 %48 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFMul %195 %197 
                                Private f32* %199 = OpAccessChain %193 %25 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %82 %25 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %82 %25 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %193 %25 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFNegate %206 
                                         f32 %208 = OpFAdd %204 %207 
                                Private f32* %209 = OpAccessChain %193 %25 
                                                      OpStore %209 %208 
                                       f32_4 %211 = OpLoad %82 
                                       f32_4 %212 = OpVectorShuffle %211 %211 1 2 2 0 
                                       f32_4 %213 = OpLoad %82 
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
                                Private f32* %234 = OpAccessChain %216 %169 
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
                                Private f32* %245 = OpAccessChain %82 %244 
                                                      OpStore %245 %44 
                              Uniform f32_4* %246 = OpAccessChain %17 %61 
                                       f32_4 %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %82 
                                         f32 %249 = OpDot %247 %248 
                                Private f32* %250 = OpAccessChain %210 %25 
                                                      OpStore %250 %249 
                              Uniform f32_4* %251 = OpAccessChain %17 %74 
                                       f32_4 %252 = OpLoad %251 
                                       f32_4 %253 = OpLoad %82 
                                         f32 %254 = OpDot %252 %253 
                                Private f32* %255 = OpAccessChain %210 %48 
                                                      OpStore %255 %254 
                              Uniform f32_4* %256 = OpAccessChain %17 %84 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpLoad %82 
                                         f32 %259 = OpDot %257 %258 
                                Private f32* %260 = OpAccessChain %210 %169 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %193 
                                       f32_4 %262 = OpLoad %210 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                                      OpStore %193 %264 
                                       f32_3 %265 = OpLoad %193 
                                       f32_3 %267 = OpExtInst %1 40 %265 %266 
                                                      OpStore %193 %267 
                                       f32_3 %268 = OpLoad %193 
                                       f32_3 %269 = OpExtInst %1 30 %268 
                                       f32_4 %270 = OpLoad %82 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %82 %271 
                                       f32_4 %272 = OpLoad %82 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %82 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
                                                      OpStore %82 %278 
                                       f32_4 %279 = OpLoad %82 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpExtInst %1 29 %280 
                                       f32_4 %282 = OpLoad %82 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %82 %283 
                                       f32_4 %284 = OpLoad %82 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %288 = OpFMul %285 %287 
                                       f32_3 %291 = OpFAdd %288 %290 
                                       f32_4 %292 = OpLoad %82 
                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 6 3 
                                                      OpStore %82 %293 
                                       f32_4 %294 = OpLoad %82 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_3 %296 = OpExtInst %1 40 %295 %266 
                                       f32_4 %297 = OpLoad %82 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %82 %298 
                                       f32_4 %300 = OpLoad %82 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                                      OpStore %299 %301 
                                Private f32* %302 = OpAccessChain %9 %48 
                                         f32 %303 = OpLoad %302 
                                Uniform f32* %304 = OpAccessChain %17 %66 %25 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                Private f32* %307 = OpAccessChain %9 %48 
                                                      OpStore %307 %306 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 3 1 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %82 
                                       f32_4 %313 = OpVectorShuffle %312 %311 4 1 5 6 
                                                      OpStore %82 %313 
                                       f32_4 %315 = OpLoad %9 
                                       f32_2 %316 = OpVectorShuffle %315 %315 2 3 
                                       f32_4 %317 = OpLoad %314 
                                       f32_4 %318 = OpVectorShuffle %317 %316 0 1 4 5 
                                                      OpStore %314 %318 
                                       f32_4 %319 = OpLoad %82 
                                       f32_2 %320 = OpVectorShuffle %319 %319 2 2 
                                       f32_4 %321 = OpLoad %82 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 3 
                                       f32_2 %323 = OpFAdd %320 %322 
                                       f32_4 %324 = OpLoad %314 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 2 3 
                                                      OpStore %314 %325 
                                                      OpStore %326 %191 
                                 Output f32* %328 = OpAccessChain %130 %66 %48 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpFNegate %329 
                                 Output f32* %331 = OpAccessChain %130 %66 %48 
                                                      OpStore %331 %330 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %263 %315 %318 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %52 ArrayStride 52 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 RelaxedPrecision 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 RelaxedPrecision 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 RelaxedPrecision 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpMemberDecorate %54 10 RelaxedPrecision 
                                                      OpMemberDecorate %54 10 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %160 SpecId 160 
                                                      OpDecorate %241 DescriptorSet 241 
                                                      OpDecorate %241 Binding 241 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %270 DescriptorSet 270 
                                                      OpDecorate %270 Binding 270 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %315 Location 315 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %318 Location 318 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                              %50 = OpTypeVector %6 3 
                                          u32 %51 = OpConstant 4 
                                              %52 = OpTypeArray %7 %51 
                                              %53 = OpTypeArray %7 %51 
                                              %54 = OpTypeStruct %50 %7 %7 %7 %52 %7 %53 %50 %50 %7 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 10 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %50 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %50 
                                 Input f32_3* %77 = OpVariable Input 
                                              %80 = OpTypePointer Uniform %50 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                                          u32 %86 = OpConstant 2 
                                          u32 %92 = OpConstant 1 
                                          i32 %94 = OpConstant 2 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %105 = OpTypePointer Uniform %7 
                                         f32 %146 = OpConstant 3.67402E-40 
                               Private bool* %149 = OpVariable Private 
                                         i32 %150 = OpConstant 5 
                                        bool %154 = OpConstantFalse 
                                        bool %160 = OpSpecConstantFalse 
                               Private bool* %163 = OpVariable Private 
                                         i32 %169 = OpConstant 6 
                                             %195 = OpTypePointer Function %50 
                                         i32 %205 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
                                         i32 %212 = OpConstant 7 
                                             %218 = OpTypePointer Private %15 
                              Private f32_2* %219 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
                                         f32 %224 = OpConstant 3.67402E-40 
                                Private f32* %227 = OpVariable Private 
                                         f32 %230 = OpConstant 3.67402E-40 
                                             %238 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %239 = OpTypeSampledImage %238 
                                             %240 = OpTypePointer UniformConstant %239 
 UniformConstant read_only Texture3DSampled* %241 = OpVariable UniformConstant 
                              Private f32_3* %252 = OpVariable Private 
                                             %262 = OpTypePointer Input %7 
                                Input f32_4* %263 = OpVariable Input 
                                Private f32* %269 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %270 = OpVariable UniformConstant 
                              Private f32_3* %275 = OpVariable Private 
                                             %291 = OpTypePointer Function %6 
                                         i32 %305 = OpConstant 9 
                                             %314 = OpTypePointer Output %7 
                               Output f32_4* %315 = OpVariable Output 
                                Input f32_3* %318 = OpVariable Input 
                                             %327 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %196 = OpVariable Function 
                               Function f32* %292 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpFNegate %78 
                               Uniform f32_3* %81 = OpAccessChain %56 %39 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFAdd %79 %82 
                                                      OpStore %75 %83 
                                 Uniform f32* %87 = OpAccessChain %56 %85 %39 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %84 %28 
                                                      OpStore %89 %88 
                                 Uniform f32* %90 = OpAccessChain %56 %85 %40 %86 
                                          f32 %91 = OpLoad %90 
                                 Private f32* %93 = OpAccessChain %84 %92 
                                                      OpStore %93 %91 
                                 Uniform f32* %95 = OpAccessChain %56 %85 %94 %86 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %97 = OpAccessChain %84 %86 
                                                      OpStore %97 %96 
                                        f32_3 %98 = OpLoad %75 
                                        f32_3 %99 = OpLoad %84 
                                         f32 %100 = OpDot %98 %99 
                                Private f32* %101 = OpAccessChain %75 %28 
                                                      OpStore %101 %100 
                                       f32_3 %103 = OpLoad %77 
                              Uniform f32_4* %106 = OpAccessChain %56 %104 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %103 %109 
                                                      OpStore %102 %110 
                                       f32_3 %111 = OpLoad %102 
                                       f32_3 %112 = OpLoad %102 
                                         f32 %113 = OpDot %111 %112 
                                Private f32* %114 = OpAccessChain %102 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %102 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpExtInst %1 31 %116 
                                Private f32* %118 = OpAccessChain %102 %28 
                                                      OpStore %118 %117 
                                Private f32* %119 = OpAccessChain %75 %28 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                Private f32* %122 = OpAccessChain %102 %28 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFAdd %121 %123 
                                Private f32* %125 = OpAccessChain %102 %28 
                                                      OpStore %125 %124 
                                Uniform f32* %126 = OpAccessChain %56 %104 %22 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %102 %28 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %75 %28 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFAdd %130 %132 
                                Private f32* %134 = OpAccessChain %75 %28 
                                                      OpStore %134 %133 
                                Private f32* %135 = OpAccessChain %75 %28 
                                         f32 %136 = OpLoad %135 
                                Uniform f32* %137 = OpAccessChain %56 %94 %86 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFMul %136 %138 
                                Uniform f32* %140 = OpAccessChain %56 %94 %22 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFAdd %139 %141 
                                Private f32* %143 = OpAccessChain %75 %28 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %75 %28 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 43 %145 %35 %146 
                                Private f32* %148 = OpAccessChain %75 %28 
                                                      OpStore %148 %147 
                                Uniform f32* %151 = OpAccessChain %56 %150 %28 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdEqual %152 %146 
                                                      OpStore %149 %153 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %156 
                                             %155 = OpLabel 
                                        bool %157 = OpLoad %149 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %159 
                                             %158 = OpLabel 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %247 
                                             %161 = OpLabel 
                                Uniform f32* %164 = OpAccessChain %56 %150 %92 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %146 
                                                      OpStore %163 %166 
                                       f32_3 %167 = OpLoad %77 
                                       f32_3 %168 = OpVectorShuffle %167 %167 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %56 %169 %40 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %168 %172 
                                                      OpStore %84 %173 
                              Uniform f32_4* %174 = OpAccessChain %56 %169 %39 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpLoad %77 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_3 %180 = OpLoad %84 
                                       f32_3 %181 = OpFAdd %179 %180 
                                                      OpStore %84 %181 
                              Uniform f32_4* %182 = OpAccessChain %56 %169 %94 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpLoad %77 
                                       f32_3 %186 = OpVectorShuffle %185 %185 2 2 2 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %84 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %84 %189 
                                       f32_3 %190 = OpLoad %84 
                              Uniform f32_4* %191 = OpAccessChain %56 %169 %104 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                                      OpStore %84 %194 
                                        bool %197 = OpLoad %163 
                                                      OpSelectionMerge %199 None 
                                                      OpBranchConditional %197 %198 %201 
                                             %198 = OpLabel 
                                       f32_3 %200 = OpLoad %84 
                                                      OpStore %196 %200 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                       f32_3 %202 = OpLoad %77 
                                                      OpStore %196 %202 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                       f32_3 %203 = OpLoad %196 
                                                      OpStore %84 %203 
                                       f32_3 %204 = OpLoad %84 
                              Uniform f32_3* %206 = OpAccessChain %56 %205 
                                       f32_3 %207 = OpLoad %206 
                                       f32_3 %208 = OpFNegate %207 
                                       f32_3 %209 = OpFAdd %204 %208 
                                                      OpStore %84 %209 
                                       f32_3 %211 = OpLoad %84 
                              Uniform f32_3* %213 = OpAccessChain %56 %212 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFMul %211 %214 
                                       f32_4 %216 = OpLoad %210 
                                       f32_4 %217 = OpVectorShuffle %216 %215 0 4 5 6 
                                                      OpStore %210 %217 
                                Private f32* %220 = OpAccessChain %210 %92 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpFMul %221 %222 
                                         f32 %225 = OpFAdd %223 %224 
                                Private f32* %226 = OpAccessChain %219 %28 
                                                      OpStore %226 %225 
                                Uniform f32* %228 = OpAccessChain %56 %150 %86 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                         f32 %232 = OpFAdd %231 %224 
                                                      OpStore %227 %232 
                                         f32 %233 = OpLoad %227 
                                Private f32* %234 = OpAccessChain %219 %28 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 40 %233 %235 
                                Private f32* %237 = OpAccessChain %210 %28 
                                                      OpStore %237 %236 
                  read_only Texture3DSampled %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %210 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 2 3 
                                       f32_4 %245 = OpImageSampleImplicitLod %242 %244 
                                                      OpStore %210 %245 
                                       f32_4 %246 = OpLoad %210 
                                                      OpStore %20 %246 
                                                      OpBranch %162 
                                             %247 = OpLabel 
                                Private f32* %248 = OpAccessChain %20 %28 
                                                      OpStore %248 %146 
                                Private f32* %249 = OpAccessChain %20 %92 
                                                      OpStore %249 %146 
                                Private f32* %250 = OpAccessChain %20 %86 
                                                      OpStore %250 %146 
                                Private f32* %251 = OpAccessChain %20 %22 
                                                      OpStore %251 %146 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                       f32_4 %253 = OpLoad %20 
                              Uniform f32_4* %254 = OpAccessChain %56 %40 
                                       f32_4 %255 = OpLoad %254 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %252 %28 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %252 %28 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %35 %146 
                                Private f32* %261 = OpAccessChain %252 %28 
                                                      OpStore %261 %260 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %266 = OpLoad %263 
                                       f32_2 %267 = OpVectorShuffle %266 %266 3 3 
                                       f32_2 %268 = OpFDiv %265 %267 
                                                      OpStore %219 %268 
                  read_only Texture2DSampled %271 = OpLoad %270 
                                       f32_2 %272 = OpLoad %219 
                                       f32_4 %273 = OpImageSampleImplicitLod %271 %272 
                                         f32 %274 = OpCompositeExtract %273 0 
                                                      OpStore %269 %274 
                                Private f32* %276 = OpAccessChain %75 %28 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %269 
                                         f32 %279 = OpFAdd %277 %278 
                                Private f32* %280 = OpAccessChain %275 %28 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %275 %28 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpExtInst %1 43 %282 %35 %146 
                                Private f32* %284 = OpAccessChain %275 %28 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %275 %28 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %252 %28 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpExtInst %1 37 %286 %288 
                                Private f32* %290 = OpAccessChain %252 %28 
                                                      OpStore %290 %289 
                                        bool %293 = OpLoad %149 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %293 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %252 %28 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %292 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                Private f32* %299 = OpAccessChain %275 %28 
                                         f32 %300 = OpLoad %299 
                                                      OpStore %292 %300 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %301 = OpLoad %292 
                                Private f32* %302 = OpAccessChain %252 %28 
                                                      OpStore %302 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %56 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFMul %304 %308 
                                                      OpStore %275 %309 
                                       f32_3 %310 = OpLoad %252 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpLoad %275 
                                       f32_3 %313 = OpFMul %311 %312 
                                                      OpStore %252 %313 
                                       f32_4 %316 = OpLoad %9 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %319 = OpLoad %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %252 
                                       f32_3 %322 = OpFAdd %320 %321 
                                       f32_4 %323 = OpLoad %315 
                                       f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
                                                      OpStore %315 %324 
                                Private f32* %325 = OpAccessChain %9 %22 
                                         f32 %326 = OpLoad %325 
                                 Output f32* %328 = OpAccessChain %315 %22 
                                                      OpStore %328 %326 
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
float u_xlat15;
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 320
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %126 %138 %139 %152 %189 %192 %195 %311 
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
                                                      OpMemberDecorate %124 0 BuiltIn 124 
                                                      OpMemberDecorate %124 1 BuiltIn 124 
                                                      OpMemberDecorate %124 2 BuiltIn 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %195 Location 195 
                                                      OpDecorate %255 RelaxedPrecision 
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
                                              %90 = OpTypeVector %6 3 
                              Private f32_4* %102 = OpVariable Private 
                                         i32 %105 = OpConstant 7 
                                             %123 = OpTypeArray %6 %50 
                                             %124 = OpTypeStruct %7 %6 %123 
                                             %125 = OpTypePointer Output %124 
        Output struct {f32_4; f32; f32[1];}* %126 = OpVariable Output 
                                             %134 = OpTypePointer Output %7 
                                             %136 = OpTypeVector %6 2 
                                             %137 = OpTypePointer Output %136 
                               Output f32_2* %138 = OpVariable Output 
                                Input f32_4* %139 = OpVariable Input 
                                         i32 %142 = OpConstant 10 
                                             %151 = OpTypePointer Input %90 
                                Input f32_3* %152 = OpVariable Input 
                                         i32 %154 = OpConstant 6 
                                         u32 %171 = OpConstant 2 
                                Private f32* %173 = OpVariable Private 
                                             %188 = OpTypePointer Output %90 
                               Output f32_3* %189 = OpVariable Output 
                               Output f32_3* %192 = OpVariable Output 
                               Output f32_4* %195 = OpVariable Output 
                                         f32 %196 = OpConstant 3.67402E-40 
                                       f32_4 %197 = OpConstantComposite %196 %196 %196 %196 
                              Private f32_4* %204 = OpVariable Private 
                              Private f32_4* %212 = OpVariable Private 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_4 %249 = OpConstantComposite %248 %248 %248 %248 
                                       f32_4 %257 = OpConstantComposite %46 %46 %46 %46 
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
                               Uniform f32_4* %91 = OpAccessChain %19 %62 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %49 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %9 %101 
                                       f32_4 %103 = OpLoad %84 
                                       f32_4 %104 = OpVectorShuffle %103 %103 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %19 %105 %63 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %104 %107 
                                                      OpStore %102 %108 
                              Uniform f32_4* %109 = OpAccessChain %19 %105 %68 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %84 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %102 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %102 %115 
                              Uniform f32_4* %116 = OpAccessChain %19 %105 %76 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %84 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %102 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %102 %122 
                              Uniform f32_4* %127 = OpAccessChain %19 %105 %86 
                                       f32_4 %128 = OpLoad %127 
                                       f32_4 %129 = OpLoad %84 
                                       f32_4 %130 = OpVectorShuffle %129 %129 3 3 3 3 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %102 
                                       f32_4 %133 = OpFAdd %131 %132 
                               Output f32_4* %135 = OpAccessChain %126 %68 
                                                      OpStore %135 %133 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              Uniform f32_4* %143 = OpAccessChain %19 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_2 %146 = OpFMul %141 %145 
                              Uniform f32_4* %147 = OpAccessChain %19 %142 
                                       f32_4 %148 = OpLoad %147 
                                       f32_2 %149 = OpVectorShuffle %148 %148 2 3 
                                       f32_2 %150 = OpFAdd %146 %149 
                                                      OpStore %138 %150 
                                       f32_3 %153 = OpLoad %152 
                              Uniform f32_4* %155 = OpAccessChain %19 %154 %68 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                         f32 %158 = OpDot %153 %157 
                                Private f32* %159 = OpAccessChain %84 %27 
                                                      OpStore %159 %158 
                                       f32_3 %160 = OpLoad %152 
                              Uniform f32_4* %161 = OpAccessChain %19 %154 %63 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                         f32 %164 = OpDot %160 %163 
                                Private f32* %165 = OpAccessChain %84 %50 
                                                      OpStore %165 %164 
                                       f32_3 %166 = OpLoad %152 
                              Uniform f32_4* %167 = OpAccessChain %19 %154 %76 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %166 %169 
                                Private f32* %172 = OpAccessChain %84 %171 
                                                      OpStore %172 %170 
                                       f32_4 %174 = OpLoad %84 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_4 %176 = OpLoad %84 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                         f32 %178 = OpDot %175 %177 
                                                      OpStore %173 %178 
                                         f32 %179 = OpLoad %173 
                                         f32 %180 = OpExtInst %1 32 %179 
                                                      OpStore %173 %180 
                                         f32 %181 = OpLoad %173 
                                       f32_3 %182 = OpCompositeConstruct %181 %181 %181 
                                       f32_4 %183 = OpLoad %84 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %84 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %84 %187 
                                       f32_4 %190 = OpLoad %84 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                                      OpStore %189 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                                      OpStore %192 %194 
                                                      OpStore %195 %197 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %198 1 1 1 1 
                                       f32_4 %200 = OpFNegate %199 
                              Uniform f32_4* %201 = OpAccessChain %19 %63 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFAdd %200 %202 
                                                      OpStore %102 %203 
                                       f32_4 %205 = OpLoad %84 
                                       f32_4 %206 = OpVectorShuffle %205 %205 1 1 1 1 
                                       f32_4 %207 = OpLoad %102 
                                       f32_4 %208 = OpFMul %206 %207 
                                                      OpStore %204 %208 
                                       f32_4 %209 = OpLoad %102 
                                       f32_4 %210 = OpLoad %102 
                                       f32_4 %211 = OpFMul %209 %210 
                                                      OpStore %102 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %213 0 0 0 0 
                                       f32_4 %215 = OpFNegate %214 
                              Uniform f32_4* %216 = OpAccessChain %19 %68 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %215 %217 
                                                      OpStore %212 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_4 %220 = OpVectorShuffle %219 %219 2 2 2 2 
                                       f32_4 %221 = OpFNegate %220 
                              Uniform f32_4* %222 = OpAccessChain %19 %76 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFAdd %221 %223 
                                                      OpStore %9 %224 
                                       f32_4 %225 = OpLoad %212 
                                       f32_4 %226 = OpLoad %84 
                                       f32_4 %227 = OpVectorShuffle %226 %226 0 0 0 0 
                                       f32_4 %228 = OpFMul %225 %227 
                                       f32_4 %229 = OpLoad %204 
                                       f32_4 %230 = OpFAdd %228 %229 
                                                      OpStore %204 %230 
                                       f32_4 %231 = OpLoad %212 
                                       f32_4 %232 = OpLoad %212 
                                       f32_4 %233 = OpFMul %231 %232 
                                       f32_4 %234 = OpLoad %102 
                                       f32_4 %235 = OpFAdd %233 %234 
                                                      OpStore %102 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %9 
                                       f32_4 %238 = OpFMul %236 %237 
                                       f32_4 %239 = OpLoad %102 
                                       f32_4 %240 = OpFAdd %238 %239 
                                                      OpStore %102 %240 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpLoad %84 
                                       f32_4 %243 = OpVectorShuffle %242 %242 2 2 2 2 
                                       f32_4 %244 = OpFMul %241 %243 
                                       f32_4 %245 = OpLoad %204 
                                       f32_4 %246 = OpFAdd %244 %245 
                                                      OpStore %9 %246 
                                       f32_4 %247 = OpLoad %102 
                                       f32_4 %250 = OpExtInst %1 40 %247 %249 
                                                      OpStore %84 %250 
                                       f32_4 %251 = OpLoad %84 
                                       f32_4 %252 = OpExtInst %1 32 %251 
                                                      OpStore %102 %252 
                                       f32_4 %253 = OpLoad %84 
                              Uniform f32_4* %254 = OpAccessChain %19 %86 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpFMul %253 %255 
                                       f32_4 %258 = OpFAdd %256 %257 
                                                      OpStore %84 %258 
                                       f32_4 %259 = OpLoad %84 
                                       f32_4 %260 = OpFDiv %257 %259 
                                                      OpStore %84 %260 
                                       f32_4 %261 = OpLoad %9 
                                       f32_4 %262 = OpLoad %102 
                                       f32_4 %263 = OpFMul %261 %262 
                                                      OpStore %9 %263 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpExtInst %1 40 %264 %197 
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
                                 Output f32* %315 = OpAccessChain %126 %68 %50 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFNegate %316 
                                 Output f32* %318 = OpAccessChain %126 %68 %50 
                                                      OpStore %318 %317 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %93 %205 %208 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpMemberDecorate %53 0 RelaxedPrecision 
                                                      OpMemberDecorate %53 0 Offset 53 
                                                      OpMemberDecorate %53 1 Offset 53 
                                                      OpMemberDecorate %53 2 Offset 53 
                                                      OpMemberDecorate %53 3 Offset 53 
                                                      OpMemberDecorate %53 4 Offset 53 
                                                      OpMemberDecorate %53 5 RelaxedPrecision 
                                                      OpMemberDecorate %53 5 Offset 53 
                                                      OpMemberDecorate %53 6 RelaxedPrecision 
                                                      OpMemberDecorate %53 6 Offset 53 
                                                      OpDecorate %53 Block 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %83 SpecId 83 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeStruct %7 %7 %51 %52 %52 %7 %6 
                                              %54 = OpTypePointer Uniform %53 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %55 = OpVariable Uniform 
                                          i32 %56 = OpConstant 6 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                                         bool %77 = OpConstantFalse 
                                         bool %83 = OpSpecConstantFalse 
                                          u32 %86 = OpConstant 1 
                                              %90 = OpTypePointer Private %52 
                               Private f32_3* %91 = OpVariable Private 
                                              %92 = OpTypePointer Input %52 
                                 Input f32_3* %93 = OpVariable Input 
                                          i32 %96 = OpConstant 2 
                                              %97 = OpTypePointer Uniform %7 
                                         i32 %119 = OpConstant 3 
                              Private f32_3* %124 = OpVariable Private 
                                             %125 = OpTypePointer Function %52 
                                         i32 %135 = OpConstant 4 
                                             %136 = OpTypePointer Uniform %52 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                             %168 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %169 = OpTypeSampledImage %168 
                                             %170 = OpTypePointer UniformConstant %169 
 UniformConstant read_only Texture3DSampled* %171 = OpVariable UniformConstant 
                              Private f32_3* %182 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %195 = OpConstant 5 
                                             %204 = OpTypePointer Output %7 
                               Output f32_4* %205 = OpVariable Output 
                                Input f32_3* %208 = OpVariable Input 
                                             %217 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %126 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %58 = OpAccessChain %55 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %49 %60 
                                 Private f32* %62 = OpAccessChain %20 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %64 %35 
                                                      OpStore %32 %65 
                                         bool %66 = OpLoad %32 
                                          i32 %67 = OpSelect %66 %40 %39 
                                          i32 %68 = OpIMul %67 %42 
                                         bool %69 = OpINotEqual %68 %39 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                 Uniform f32* %73 = OpAccessChain %55 %40 %28 
                                          f32 %74 = OpLoad %73 
                                         bool %76 = OpFOrdEqual %74 %75 
                                                      OpStore %32 %76 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                         bool %80 = OpLoad %32 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %82 
                                              %82 = OpLabel 
                                                      OpBranch %79 
                                              %79 = OpLabel 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %177 
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %55 %40 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdEqual %88 %75 
                                                      OpStore %32 %89 
                                        f32_3 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 1 1 1 
                               Uniform f32_4* %98 = OpAccessChain %55 %96 %40 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFMul %95 %100 
                                                      OpStore %91 %101 
                              Uniform f32_4* %102 = OpAccessChain %55 %96 %39 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %93 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %91 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %91 %109 
                              Uniform f32_4* %110 = OpAccessChain %55 %96 %96 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %93 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpFAdd %115 %116 
                                                      OpStore %91 %117 
                                       f32_3 %118 = OpLoad %91 
                              Uniform f32_4* %120 = OpAccessChain %55 %96 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %118 %122 
                                                      OpStore %91 %123 
                                        bool %127 = OpLoad %32 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %131 
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %91 
                                                      OpStore %126 %130 
                                                      OpBranch %129 
                                             %131 = OpLabel 
                                       f32_3 %132 = OpLoad %93 
                                                      OpStore %126 %132 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_3 %133 = OpLoad %126 
                                                      OpStore %124 %133 
                                       f32_3 %134 = OpLoad %124 
                              Uniform f32_3* %137 = OpAccessChain %55 %135 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_3 %140 = OpFAdd %134 %139 
                                                      OpStore %124 %140 
                                       f32_3 %142 = OpLoad %124 
                              Uniform f32_3* %143 = OpAccessChain %55 %119 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %141 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %141 %147 
                                Private f32* %148 = OpAccessChain %141 %86 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %124 %28 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %55 %40 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %152 
                                Private f32* %161 = OpAccessChain %91 %28 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %91 %28 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %124 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpExtInst %1 40 %163 %165 
                                Private f32* %167 = OpAccessChain %141 %28 
                                                      OpStore %167 %166 
                  read_only Texture3DSampled %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %141 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                                      OpStore %20 %176 
                                                      OpBranch %85 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %20 %28 
                                                      OpStore %178 %75 
                                Private f32* %179 = OpAccessChain %20 %86 
                                                      OpStore %179 %75 
                                Private f32* %180 = OpAccessChain %20 %155 
                                                      OpStore %180 %75 
                                Private f32* %181 = OpAccessChain %20 %22 
                                                      OpStore %181 %75 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                       f32_4 %183 = OpLoad %20 
                              Uniform f32_4* %184 = OpAccessChain %55 %39 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                Private f32* %187 = OpAccessChain %182 %28 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %182 %28 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpExtInst %1 43 %189 %35 %75 
                                Private f32* %191 = OpAccessChain %182 %28 
                                                      OpStore %191 %190 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %196 = OpAccessChain %55 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %192 %199 
                                       f32_3 %200 = OpLoad %182 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 0 
                                       f32_3 %202 = OpLoad %192 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %182 %203 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %209 = OpLoad %208 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %182 
                                       f32_3 %212 = OpFAdd %210 %211 
                                       f32_4 %213 = OpLoad %205 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
                                                      OpStore %205 %214 
                                Private f32* %215 = OpAccessChain %9 %22 
                                         f32 %216 = OpLoad %215 
                                 Output f32* %218 = OpAccessChain %205 %22 
                                                      OpStore %218 %216 
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
; Bound: 422
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %126 %138 %139 %152 %189 %192 %195 %413 
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
                                                      OpMemberDecorate %124 0 BuiltIn 124 
                                                      OpMemberDecorate %124 1 BuiltIn 124 
                                                      OpMemberDecorate %124 2 BuiltIn 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %195 Location 195 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
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
                                              %90 = OpTypeVector %6 3 
                              Private f32_4* %102 = OpVariable Private 
                                         i32 %105 = OpConstant 14 
                                             %123 = OpTypeArray %6 %50 
                                             %124 = OpTypeStruct %7 %6 %123 
                                             %125 = OpTypePointer Output %124 
        Output struct {f32_4; f32; f32[1];}* %126 = OpVariable Output 
                                             %134 = OpTypePointer Output %7 
                                             %136 = OpTypeVector %6 2 
                                             %137 = OpTypePointer Output %136 
                               Output f32_2* %138 = OpVariable Output 
                                Input f32_4* %139 = OpVariable Input 
                                         i32 %142 = OpConstant 17 
                                             %151 = OpTypePointer Input %90 
                                Input f32_3* %152 = OpVariable Input 
                                         i32 %154 = OpConstant 13 
                                         u32 %171 = OpConstant 2 
                                Private f32* %173 = OpVariable Private 
                                             %188 = OpTypePointer Output %90 
                               Output f32_3* %189 = OpVariable Output 
                               Output f32_3* %192 = OpVariable Output 
                               Output f32_4* %195 = OpVariable Output 
                                         f32 %196 = OpConstant 3.67402E-40 
                                       f32_4 %197 = OpConstantComposite %196 %196 %196 %196 
                                             %198 = OpTypePointer Private %90 
                              Private f32_3* %199 = OpVariable Private 
                              Private f32_4* %216 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %223 = OpConstant 8 
                                         i32 %229 = OpConstant 9 
                                         i32 %235 = OpConstant 10 
                                         i32 %241 = OpConstant 11 
                                         u32 %250 = OpConstant 3 
                                         i32 %252 = OpConstant 5 
                                         i32 %258 = OpConstant 6 
                                         i32 %264 = OpConstant 7 
                                       f32_3 %274 = OpConstantComposite %196 %196 %196 
                              Private f32_3* %276 = OpVariable Private 
                                         f32 %280 = OpConstant 3.67402E-40 
                                       f32_3 %281 = OpConstantComposite %280 %280 %280 
                                         f32 %286 = OpConstant 3.67402E-40 
                                       f32_3 %287 = OpConstantComposite %286 %286 %286 
                                         f32 %289 = OpConstant 3.67402E-40 
                                       f32_3 %290 = OpConstantComposite %289 %289 %289 
                              Private f32_4* %300 = OpVariable Private 
                              Private f32_4* %308 = OpVariable Private 
                                         f32 %344 = OpConstant 3.67402E-40 
                                       f32_4 %345 = OpConstantComposite %344 %344 %344 %344 
                                       f32_4 %353 = OpConstantComposite %46 %46 %46 %46 
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
                               Uniform f32_4* %91 = OpAccessChain %19 %62 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %49 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %9 %101 
                                       f32_4 %103 = OpLoad %84 
                                       f32_4 %104 = OpVectorShuffle %103 %103 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %19 %105 %63 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %104 %107 
                                                      OpStore %102 %108 
                              Uniform f32_4* %109 = OpAccessChain %19 %105 %68 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %84 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %102 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %102 %115 
                              Uniform f32_4* %116 = OpAccessChain %19 %105 %76 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %84 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %102 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %102 %122 
                              Uniform f32_4* %127 = OpAccessChain %19 %105 %86 
                                       f32_4 %128 = OpLoad %127 
                                       f32_4 %129 = OpLoad %84 
                                       f32_4 %130 = OpVectorShuffle %129 %129 3 3 3 3 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %102 
                                       f32_4 %133 = OpFAdd %131 %132 
                               Output f32_4* %135 = OpAccessChain %126 %68 
                                                      OpStore %135 %133 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              Uniform f32_4* %143 = OpAccessChain %19 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_2 %146 = OpFMul %141 %145 
                              Uniform f32_4* %147 = OpAccessChain %19 %142 
                                       f32_4 %148 = OpLoad %147 
                                       f32_2 %149 = OpVectorShuffle %148 %148 2 3 
                                       f32_2 %150 = OpFAdd %146 %149 
                                                      OpStore %138 %150 
                                       f32_3 %153 = OpLoad %152 
                              Uniform f32_4* %155 = OpAccessChain %19 %154 %68 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                         f32 %158 = OpDot %153 %157 
                                Private f32* %159 = OpAccessChain %84 %27 
                                                      OpStore %159 %158 
                                       f32_3 %160 = OpLoad %152 
                              Uniform f32_4* %161 = OpAccessChain %19 %154 %63 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                         f32 %164 = OpDot %160 %163 
                                Private f32* %165 = OpAccessChain %84 %50 
                                                      OpStore %165 %164 
                                       f32_3 %166 = OpLoad %152 
                              Uniform f32_4* %167 = OpAccessChain %19 %154 %76 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %166 %169 
                                Private f32* %172 = OpAccessChain %84 %171 
                                                      OpStore %172 %170 
                                       f32_4 %174 = OpLoad %84 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_4 %176 = OpLoad %84 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                         f32 %178 = OpDot %175 %177 
                                                      OpStore %173 %178 
                                         f32 %179 = OpLoad %173 
                                         f32 %180 = OpExtInst %1 32 %179 
                                                      OpStore %173 %180 
                                         f32 %181 = OpLoad %173 
                                       f32_3 %182 = OpCompositeConstruct %181 %181 %181 
                                       f32_4 %183 = OpLoad %84 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %84 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %84 %187 
                                       f32_4 %190 = OpLoad %84 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                                      OpStore %189 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                                      OpStore %192 %194 
                                                      OpStore %195 %197 
                                Private f32* %200 = OpAccessChain %84 %50 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %84 %50 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %199 %27 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %84 %27 
                                         f32 %207 = OpLoad %206 
                                Private f32* %208 = OpAccessChain %84 %27 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpFMul %207 %209 
                                Private f32* %211 = OpAccessChain %199 %27 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFNegate %212 
                                         f32 %214 = OpFAdd %210 %213 
                                Private f32* %215 = OpAccessChain %199 %27 
                                                      OpStore %215 %214 
                                       f32_4 %217 = OpLoad %84 
                                       f32_4 %218 = OpVectorShuffle %217 %217 1 2 2 0 
                                       f32_4 %219 = OpLoad %84 
                                       f32_4 %220 = OpVectorShuffle %219 %219 0 1 2 2 
                                       f32_4 %221 = OpFMul %218 %220 
                                                      OpStore %216 %221 
                              Uniform f32_4* %224 = OpAccessChain %19 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %216 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %222 %27 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %19 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %216 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %222 %50 
                                                      OpStore %234 %233 
                              Uniform f32_4* %236 = OpAccessChain %19 %235 
                                       f32_4 %237 = OpLoad %236 
                                       f32_4 %238 = OpLoad %216 
                                         f32 %239 = OpDot %237 %238 
                                Private f32* %240 = OpAccessChain %222 %171 
                                                      OpStore %240 %239 
                              Uniform f32_4* %242 = OpAccessChain %19 %241 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpLoad %199 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_3 %248 = OpLoad %222 
                                       f32_3 %249 = OpFAdd %247 %248 
                                                      OpStore %199 %249 
                                Private f32* %251 = OpAccessChain %84 %250 
                                                      OpStore %251 %46 
                              Uniform f32_4* %253 = OpAccessChain %19 %252 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %84 
                                         f32 %256 = OpDot %254 %255 
                                Private f32* %257 = OpAccessChain %222 %27 
                                                      OpStore %257 %256 
                              Uniform f32_4* %259 = OpAccessChain %19 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_4 %261 = OpLoad %84 
                                         f32 %262 = OpDot %260 %261 
                                Private f32* %263 = OpAccessChain %222 %50 
                                                      OpStore %263 %262 
                              Uniform f32_4* %265 = OpAccessChain %19 %264 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpLoad %84 
                                         f32 %268 = OpDot %266 %267 
                                Private f32* %269 = OpAccessChain %222 %171 
                                                      OpStore %269 %268 
                                       f32_3 %270 = OpLoad %199 
                                       f32_3 %271 = OpLoad %222 
                                       f32_3 %272 = OpFAdd %270 %271 
                                                      OpStore %199 %272 
                                       f32_3 %273 = OpLoad %199 
                                       f32_3 %275 = OpExtInst %1 40 %273 %274 
                                                      OpStore %199 %275 
                                       f32_3 %277 = OpLoad %199 
                                       f32_3 %278 = OpExtInst %1 30 %277 
                                                      OpStore %276 %278 
                                       f32_3 %279 = OpLoad %276 
                                       f32_3 %282 = OpFMul %279 %281 
                                                      OpStore %276 %282 
                                       f32_3 %283 = OpLoad %276 
                                       f32_3 %284 = OpExtInst %1 29 %283 
                                                      OpStore %276 %284 
                                       f32_3 %285 = OpLoad %276 
                                       f32_3 %288 = OpFMul %285 %287 
                                       f32_3 %291 = OpFAdd %288 %290 
                                                      OpStore %276 %291 
                                       f32_3 %292 = OpLoad %276 
                                       f32_3 %293 = OpExtInst %1 40 %292 %274 
                                                      OpStore %276 %293 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpVectorShuffle %294 %294 1 1 1 1 
                                       f32_4 %296 = OpFNegate %295 
                              Uniform f32_4* %297 = OpAccessChain %19 %63 
                                       f32_4 %298 = OpLoad %297 
                                       f32_4 %299 = OpFAdd %296 %298 
                                                      OpStore %102 %299 
                                       f32_4 %301 = OpLoad %84 
                                       f32_4 %302 = OpVectorShuffle %301 %301 1 1 1 1 
                                       f32_4 %303 = OpLoad %102 
                                       f32_4 %304 = OpFMul %302 %303 
                                                      OpStore %300 %304 
                                       f32_4 %305 = OpLoad %102 
                                       f32_4 %306 = OpLoad %102 
                                       f32_4 %307 = OpFMul %305 %306 
                                                      OpStore %102 %307 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %310 = OpVectorShuffle %309 %309 0 0 0 0 
                                       f32_4 %311 = OpFNegate %310 
                              Uniform f32_4* %312 = OpAccessChain %19 %68 
                                       f32_4 %313 = OpLoad %312 
                                       f32_4 %314 = OpFAdd %311 %313 
                                                      OpStore %308 %314 
                                       f32_4 %315 = OpLoad %9 
                                       f32_4 %316 = OpVectorShuffle %315 %315 2 2 2 2 
                                       f32_4 %317 = OpFNegate %316 
                              Uniform f32_4* %318 = OpAccessChain %19 %76 
                                       f32_4 %319 = OpLoad %318 
                                       f32_4 %320 = OpFAdd %317 %319 
                                                      OpStore %9 %320 
                                       f32_4 %321 = OpLoad %308 
                                       f32_4 %322 = OpLoad %84 
                                       f32_4 %323 = OpVectorShuffle %322 %322 0 0 0 0 
                                       f32_4 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %300 
                                       f32_4 %326 = OpFAdd %324 %325 
                                                      OpStore %300 %326 
                                       f32_4 %327 = OpLoad %308 
                                       f32_4 %328 = OpLoad %308 
                                       f32_4 %329 = OpFMul %327 %328 
                                       f32_4 %330 = OpLoad %102 
                                       f32_4 %331 = OpFAdd %329 %330 
                                                      OpStore %102 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpLoad %9 
                                       f32_4 %334 = OpFMul %332 %333 
                                       f32_4 %335 = OpLoad %102 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %102 %336 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpLoad %84 
                                       f32_4 %339 = OpVectorShuffle %338 %338 2 2 2 2 
                                       f32_4 %340 = OpFMul %337 %339 
                                       f32_4 %341 = OpLoad %300 
                                       f32_4 %342 = OpFAdd %340 %341 
                                                      OpStore %9 %342 
                                       f32_4 %343 = OpLoad %102 
                                       f32_4 %346 = OpExtInst %1 40 %343 %345 
                                                      OpStore %84 %346 
                                       f32_4 %347 = OpLoad %84 
                                       f32_4 %348 = OpExtInst %1 32 %347 
                                                      OpStore %102 %348 
                                       f32_4 %349 = OpLoad %84 
                              Uniform f32_4* %350 = OpAccessChain %19 %86 
                                       f32_4 %351 = OpLoad %350 
                                       f32_4 %352 = OpFMul %349 %351 
                                       f32_4 %354 = OpFAdd %352 %353 
                                                      OpStore %84 %354 
                                       f32_4 %355 = OpLoad %84 
                                       f32_4 %356 = OpFDiv %353 %355 
                                                      OpStore %84 %356 
                                       f32_4 %357 = OpLoad %9 
                                       f32_4 %358 = OpLoad %102 
                                       f32_4 %359 = OpFMul %357 %358 
                                                      OpStore %9 %359 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %361 = OpExtInst %1 40 %360 %197 
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
                                       f32_3 %409 = OpLoad %276 
                                       f32_3 %410 = OpFAdd %408 %409 
                                       f32_4 %411 = OpLoad %9 
                                       f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
                                                      OpStore %9 %412 
                                       f32_4 %414 = OpLoad %9 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
                                                      OpStore %413 %415 
                                 Output f32* %417 = OpAccessChain %126 %68 %50 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFNegate %418 
                                 Output f32* %420 = OpAccessChain %126 %68 %50 
                                                      OpStore %420 %419 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %93 %205 %208 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpMemberDecorate %53 0 RelaxedPrecision 
                                                      OpMemberDecorate %53 0 Offset 53 
                                                      OpMemberDecorate %53 1 Offset 53 
                                                      OpMemberDecorate %53 2 Offset 53 
                                                      OpMemberDecorate %53 3 Offset 53 
                                                      OpMemberDecorate %53 4 Offset 53 
                                                      OpMemberDecorate %53 5 RelaxedPrecision 
                                                      OpMemberDecorate %53 5 Offset 53 
                                                      OpMemberDecorate %53 6 RelaxedPrecision 
                                                      OpMemberDecorate %53 6 Offset 53 
                                                      OpDecorate %53 Block 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %83 SpecId 83 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeStruct %7 %7 %51 %52 %52 %7 %6 
                                              %54 = OpTypePointer Uniform %53 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %55 = OpVariable Uniform 
                                          i32 %56 = OpConstant 6 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                                         bool %77 = OpConstantFalse 
                                         bool %83 = OpSpecConstantFalse 
                                          u32 %86 = OpConstant 1 
                                              %90 = OpTypePointer Private %52 
                               Private f32_3* %91 = OpVariable Private 
                                              %92 = OpTypePointer Input %52 
                                 Input f32_3* %93 = OpVariable Input 
                                          i32 %96 = OpConstant 2 
                                              %97 = OpTypePointer Uniform %7 
                                         i32 %119 = OpConstant 3 
                              Private f32_3* %124 = OpVariable Private 
                                             %125 = OpTypePointer Function %52 
                                         i32 %135 = OpConstant 4 
                                             %136 = OpTypePointer Uniform %52 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                             %168 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %169 = OpTypeSampledImage %168 
                                             %170 = OpTypePointer UniformConstant %169 
 UniformConstant read_only Texture3DSampled* %171 = OpVariable UniformConstant 
                              Private f32_3* %182 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                         i32 %195 = OpConstant 5 
                                             %204 = OpTypePointer Output %7 
                               Output f32_4* %205 = OpVariable Output 
                                Input f32_3* %208 = OpVariable Input 
                                             %217 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %126 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %58 = OpAccessChain %55 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %49 %60 
                                 Private f32* %62 = OpAccessChain %20 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %64 %35 
                                                      OpStore %32 %65 
                                         bool %66 = OpLoad %32 
                                          i32 %67 = OpSelect %66 %40 %39 
                                          i32 %68 = OpIMul %67 %42 
                                         bool %69 = OpINotEqual %68 %39 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                 Uniform f32* %73 = OpAccessChain %55 %40 %28 
                                          f32 %74 = OpLoad %73 
                                         bool %76 = OpFOrdEqual %74 %75 
                                                      OpStore %32 %76 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                         bool %80 = OpLoad %32 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %82 
                                              %82 = OpLabel 
                                                      OpBranch %79 
                                              %79 = OpLabel 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %177 
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %55 %40 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdEqual %88 %75 
                                                      OpStore %32 %89 
                                        f32_3 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 1 1 1 
                               Uniform f32_4* %98 = OpAccessChain %55 %96 %40 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFMul %95 %100 
                                                      OpStore %91 %101 
                              Uniform f32_4* %102 = OpAccessChain %55 %96 %39 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %93 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %91 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %91 %109 
                              Uniform f32_4* %110 = OpAccessChain %55 %96 %96 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %93 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpFAdd %115 %116 
                                                      OpStore %91 %117 
                                       f32_3 %118 = OpLoad %91 
                              Uniform f32_4* %120 = OpAccessChain %55 %96 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %118 %122 
                                                      OpStore %91 %123 
                                        bool %127 = OpLoad %32 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %131 
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %91 
                                                      OpStore %126 %130 
                                                      OpBranch %129 
                                             %131 = OpLabel 
                                       f32_3 %132 = OpLoad %93 
                                                      OpStore %126 %132 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_3 %133 = OpLoad %126 
                                                      OpStore %124 %133 
                                       f32_3 %134 = OpLoad %124 
                              Uniform f32_3* %137 = OpAccessChain %55 %135 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_3 %140 = OpFAdd %134 %139 
                                                      OpStore %124 %140 
                                       f32_3 %142 = OpLoad %124 
                              Uniform f32_3* %143 = OpAccessChain %55 %119 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %141 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %141 %147 
                                Private f32* %148 = OpAccessChain %141 %86 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %124 %28 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %55 %40 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %152 
                                Private f32* %161 = OpAccessChain %91 %28 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %91 %28 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %124 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpExtInst %1 40 %163 %165 
                                Private f32* %167 = OpAccessChain %141 %28 
                                                      OpStore %167 %166 
                  read_only Texture3DSampled %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %141 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                                      OpStore %20 %176 
                                                      OpBranch %85 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %20 %28 
                                                      OpStore %178 %75 
                                Private f32* %179 = OpAccessChain %20 %86 
                                                      OpStore %179 %75 
                                Private f32* %180 = OpAccessChain %20 %155 
                                                      OpStore %180 %75 
                                Private f32* %181 = OpAccessChain %20 %22 
                                                      OpStore %181 %75 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                       f32_4 %183 = OpLoad %20 
                              Uniform f32_4* %184 = OpAccessChain %55 %39 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                Private f32* %187 = OpAccessChain %182 %28 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %182 %28 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpExtInst %1 43 %189 %35 %75 
                                Private f32* %191 = OpAccessChain %182 %28 
                                                      OpStore %191 %190 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_4* %196 = OpAccessChain %55 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %192 %199 
                                       f32_3 %200 = OpLoad %182 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 0 
                                       f32_3 %202 = OpLoad %192 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %182 %203 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %209 = OpLoad %208 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %182 
                                       f32_3 %212 = OpFAdd %210 %211 
                                       f32_4 %213 = OpLoad %205 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
                                                      OpStore %205 %214 
                                Private f32* %215 = OpAccessChain %9 %22 
                                         f32 %216 = OpLoad %215 
                                 Output f32* %218 = OpAccessChain %205 %22 
                                                      OpStore %218 %216 
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
float u_xlat18;
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = (-u_xlat1.x) + u_xlat4.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb4 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb4){
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = min(u_xlat1.x, u_xlat7);
    u_xlat1.x = (u_xlatb4) ? u_xlat7 : u_xlat1.x;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 353
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %133 %139 %140 %153 %190 %193 %196 %314 %334 %346 
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
                                                      OpMemberDecorate %131 0 BuiltIn 131 
                                                      OpMemberDecorate %131 1 BuiltIn 131 
                                                      OpMemberDecorate %131 2 BuiltIn 131 
                                                      OpDecorate %131 Block 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %153 Location 153 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %258 RelaxedPrecision 
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
                                              %90 = OpTypeVector %6 3 
                              Private f32_4* %102 = OpVariable Private 
                                         i32 %105 = OpConstant 8 
                                             %130 = OpTypeArray %6 %50 
                                             %131 = OpTypeStruct %7 %6 %130 
                                             %132 = OpTypePointer Output %131 
        Output struct {f32_4; f32; f32[1];}* %133 = OpVariable Output 
                                             %135 = OpTypePointer Output %7 
                                             %137 = OpTypeVector %6 2 
                                             %138 = OpTypePointer Output %137 
                               Output f32_2* %139 = OpVariable Output 
                                Input f32_4* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 11 
                                             %152 = OpTypePointer Input %90 
                                Input f32_3* %153 = OpVariable Input 
                                         i32 %155 = OpConstant 7 
                                         u32 %172 = OpConstant 2 
                                Private f32* %174 = OpVariable Private 
                                             %189 = OpTypePointer Output %90 
                               Output f32_3* %190 = OpVariable Output 
                               Output f32_3* %193 = OpVariable Output 
                               Output f32_4* %196 = OpVariable Output 
                                         f32 %197 = OpConstant 3.67402E-40 
                                       f32_4 %198 = OpConstantComposite %197 %197 %197 %197 
                              Private f32_4* %199 = OpVariable Private 
                              Private f32_4* %206 = OpVariable Private 
                              Private f32_4* %214 = OpVariable Private 
                                         f32 %250 = OpConstant 3.67402E-40 
                                       f32_4 %251 = OpConstantComposite %250 %250 %250 %250 
                                         i32 %256 = OpConstant 4 
                                       f32_4 %260 = OpConstantComposite %46 %46 %46 %46 
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
                               Uniform f32_4* %91 = OpAccessChain %19 %62 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %49 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %9 %101 
                                       f32_4 %103 = OpLoad %84 
                                       f32_4 %104 = OpVectorShuffle %103 %103 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %19 %105 %63 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %104 %107 
                                                      OpStore %102 %108 
                              Uniform f32_4* %109 = OpAccessChain %19 %105 %68 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %84 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %102 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %102 %115 
                              Uniform f32_4* %116 = OpAccessChain %19 %105 %76 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %84 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %102 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %102 %122 
                              Uniform f32_4* %123 = OpAccessChain %19 %105 %86 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpLoad %84 
                                       f32_4 %126 = OpVectorShuffle %125 %125 3 3 3 3 
                                       f32_4 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %102 
                                       f32_4 %129 = OpFAdd %127 %128 
                                                      OpStore %84 %129 
                                       f32_4 %134 = OpLoad %84 
                               Output f32_4* %136 = OpAccessChain %133 %68 
                                                      OpStore %136 %134 
                                       f32_4 %141 = OpLoad %140 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                              Uniform f32_4* %144 = OpAccessChain %19 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %142 %146 
                              Uniform f32_4* %148 = OpAccessChain %19 %143 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_2 %151 = OpFAdd %147 %150 
                                                      OpStore %139 %151 
                                       f32_3 %154 = OpLoad %153 
                              Uniform f32_4* %156 = OpAccessChain %19 %155 %68 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpDot %154 %158 
                                Private f32* %160 = OpAccessChain %102 %27 
                                                      OpStore %160 %159 
                                       f32_3 %161 = OpLoad %153 
                              Uniform f32_4* %162 = OpAccessChain %19 %155 %63 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %161 %164 
                                Private f32* %166 = OpAccessChain %102 %50 
                                                      OpStore %166 %165 
                                       f32_3 %167 = OpLoad %153 
                              Uniform f32_4* %168 = OpAccessChain %19 %155 %76 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %167 %170 
                                Private f32* %173 = OpAccessChain %102 %172 
                                                      OpStore %173 %171 
                                       f32_4 %175 = OpLoad %102 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_4 %177 = OpLoad %102 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                         f32 %179 = OpDot %176 %178 
                                                      OpStore %174 %179 
                                         f32 %180 = OpLoad %174 
                                         f32 %181 = OpExtInst %1 32 %180 
                                                      OpStore %174 %181 
                                         f32 %182 = OpLoad %174 
                                       f32_3 %183 = OpCompositeConstruct %182 %182 %182 
                                       f32_4 %184 = OpLoad %102 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %102 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %102 %188 
                                       f32_4 %191 = OpLoad %102 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                                      OpStore %190 %192 
                                       f32_4 %194 = OpLoad %9 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                                                      OpStore %193 %195 
                                                      OpStore %196 %198 
                                       f32_4 %200 = OpLoad %9 
                                       f32_4 %201 = OpVectorShuffle %200 %200 1 1 1 1 
                                       f32_4 %202 = OpFNegate %201 
                              Uniform f32_4* %203 = OpAccessChain %19 %76 
                                       f32_4 %204 = OpLoad %203 
                                       f32_4 %205 = OpFAdd %202 %204 
                                                      OpStore %199 %205 
                                       f32_4 %207 = OpLoad %102 
                                       f32_4 %208 = OpVectorShuffle %207 %207 1 1 1 1 
                                       f32_4 %209 = OpLoad %199 
                                       f32_4 %210 = OpFMul %208 %209 
                                                      OpStore %206 %210 
                                       f32_4 %211 = OpLoad %199 
                                       f32_4 %212 = OpLoad %199 
                                       f32_4 %213 = OpFMul %211 %212 
                                                      OpStore %199 %213 
                                       f32_4 %215 = OpLoad %9 
                                       f32_4 %216 = OpVectorShuffle %215 %215 0 0 0 0 
                                       f32_4 %217 = OpFNegate %216 
                              Uniform f32_4* %218 = OpAccessChain %19 %63 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpFAdd %217 %219 
                                                      OpStore %214 %220 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpVectorShuffle %221 %221 2 2 2 2 
                                       f32_4 %223 = OpFNegate %222 
                              Uniform f32_4* %224 = OpAccessChain %19 %86 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpFAdd %223 %225 
                                                      OpStore %9 %226 
                                       f32_4 %227 = OpLoad %214 
                                       f32_4 %228 = OpLoad %102 
                                       f32_4 %229 = OpVectorShuffle %228 %228 0 0 0 0 
                                       f32_4 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %206 
                                       f32_4 %232 = OpFAdd %230 %231 
                                                      OpStore %206 %232 
                                       f32_4 %233 = OpLoad %214 
                                       f32_4 %234 = OpLoad %214 
                                       f32_4 %235 = OpFMul %233 %234 
                                       f32_4 %236 = OpLoad %199 
                                       f32_4 %237 = OpFAdd %235 %236 
                                                      OpStore %199 %237 
                                       f32_4 %238 = OpLoad %9 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpFMul %238 %239 
                                       f32_4 %241 = OpLoad %199 
                                       f32_4 %242 = OpFAdd %240 %241 
                                                      OpStore %199 %242 
                                       f32_4 %243 = OpLoad %9 
                                       f32_4 %244 = OpLoad %102 
                                       f32_4 %245 = OpVectorShuffle %244 %244 2 2 2 2 
                                       f32_4 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %206 
                                       f32_4 %248 = OpFAdd %246 %247 
                                                      OpStore %9 %248 
                                       f32_4 %249 = OpLoad %199 
                                       f32_4 %252 = OpExtInst %1 40 %249 %251 
                                                      OpStore %102 %252 
                                       f32_4 %253 = OpLoad %102 
                                       f32_4 %254 = OpExtInst %1 32 %253 
                                                      OpStore %199 %254 
                                       f32_4 %255 = OpLoad %102 
                              Uniform f32_4* %257 = OpAccessChain %19 %256 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpFMul %255 %258 
                                       f32_4 %261 = OpFAdd %259 %260 
                                                      OpStore %102 %261 
                                       f32_4 %262 = OpLoad %102 
                                       f32_4 %263 = OpFDiv %260 %262 
                                                      OpStore %102 %263 
                                       f32_4 %264 = OpLoad %9 
                                       f32_4 %265 = OpLoad %199 
                                       f32_4 %266 = OpFMul %264 %265 
                                                      OpStore %9 %266 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpExtInst %1 40 %267 %198 
                                                      OpStore %9 %268 
                                       f32_4 %269 = OpLoad %102 
                                       f32_4 %270 = OpLoad %9 
                                       f32_4 %271 = OpFMul %269 %270 
                                                      OpStore %9 %271 
                                       f32_4 %272 = OpLoad %9 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                              Uniform f32_4* %275 = OpAccessChain %19 %274 %63 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpFMul %273 %277 
                                       f32_4 %279 = OpLoad %102 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %102 %280 
                              Uniform f32_4* %281 = OpAccessChain %19 %274 %68 
                                       f32_4 %282 = OpLoad %281 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_4 %284 = OpLoad %9 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 0 0 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_4 %287 = OpLoad %102 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %102 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %102 %291 
                              Uniform f32_4* %292 = OpAccessChain %19 %274 %76 
                                       f32_4 %293 = OpLoad %292 
                                       f32_3 %294 = OpVectorShuffle %293 %293 0 1 2 
                                       f32_4 %295 = OpLoad %9 
                                       f32_3 %296 = OpVectorShuffle %295 %295 2 2 2 
                                       f32_3 %297 = OpFMul %294 %296 
                                       f32_4 %298 = OpLoad %102 
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
                                                      OpStore %346 %198 
                                 Output f32* %348 = OpAccessChain %133 %68 %50 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFNegate %349 
                                 Output f32* %351 = OpAccessChain %133 %68 %50 
                                                      OpStore %351 %350 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %263 %315 %318 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %52 ArrayStride 52 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 RelaxedPrecision 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 RelaxedPrecision 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 RelaxedPrecision 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpMemberDecorate %54 10 RelaxedPrecision 
                                                      OpMemberDecorate %54 10 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %160 SpecId 160 
                                                      OpDecorate %241 DescriptorSet 241 
                                                      OpDecorate %241 Binding 241 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %270 DescriptorSet 270 
                                                      OpDecorate %270 Binding 270 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %315 Location 315 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %318 Location 318 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                              %50 = OpTypeVector %6 3 
                                          u32 %51 = OpConstant 4 
                                              %52 = OpTypeArray %7 %51 
                                              %53 = OpTypeArray %7 %51 
                                              %54 = OpTypeStruct %50 %7 %7 %7 %52 %7 %53 %50 %50 %7 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 10 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %50 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %50 
                                 Input f32_3* %77 = OpVariable Input 
                                              %80 = OpTypePointer Uniform %50 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                                          u32 %86 = OpConstant 2 
                                          u32 %92 = OpConstant 1 
                                          i32 %94 = OpConstant 2 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %105 = OpTypePointer Uniform %7 
                                         f32 %146 = OpConstant 3.67402E-40 
                               Private bool* %149 = OpVariable Private 
                                         i32 %150 = OpConstant 5 
                                        bool %154 = OpConstantFalse 
                                        bool %160 = OpSpecConstantFalse 
                               Private bool* %163 = OpVariable Private 
                                         i32 %169 = OpConstant 6 
                                             %195 = OpTypePointer Function %50 
                                         i32 %205 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
                                         i32 %212 = OpConstant 7 
                                             %218 = OpTypePointer Private %15 
                              Private f32_2* %219 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
                                         f32 %224 = OpConstant 3.67402E-40 
                                Private f32* %227 = OpVariable Private 
                                         f32 %230 = OpConstant 3.67402E-40 
                                             %238 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %239 = OpTypeSampledImage %238 
                                             %240 = OpTypePointer UniformConstant %239 
 UniformConstant read_only Texture3DSampled* %241 = OpVariable UniformConstant 
                              Private f32_3* %252 = OpVariable Private 
                                             %262 = OpTypePointer Input %7 
                                Input f32_4* %263 = OpVariable Input 
                                Private f32* %269 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %270 = OpVariable UniformConstant 
                              Private f32_3* %275 = OpVariable Private 
                                             %291 = OpTypePointer Function %6 
                                         i32 %305 = OpConstant 9 
                                             %314 = OpTypePointer Output %7 
                               Output f32_4* %315 = OpVariable Output 
                                Input f32_3* %318 = OpVariable Input 
                                             %327 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %196 = OpVariable Function 
                               Function f32* %292 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpFNegate %78 
                               Uniform f32_3* %81 = OpAccessChain %56 %39 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFAdd %79 %82 
                                                      OpStore %75 %83 
                                 Uniform f32* %87 = OpAccessChain %56 %85 %39 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %84 %28 
                                                      OpStore %89 %88 
                                 Uniform f32* %90 = OpAccessChain %56 %85 %40 %86 
                                          f32 %91 = OpLoad %90 
                                 Private f32* %93 = OpAccessChain %84 %92 
                                                      OpStore %93 %91 
                                 Uniform f32* %95 = OpAccessChain %56 %85 %94 %86 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %97 = OpAccessChain %84 %86 
                                                      OpStore %97 %96 
                                        f32_3 %98 = OpLoad %75 
                                        f32_3 %99 = OpLoad %84 
                                         f32 %100 = OpDot %98 %99 
                                Private f32* %101 = OpAccessChain %75 %28 
                                                      OpStore %101 %100 
                                       f32_3 %103 = OpLoad %77 
                              Uniform f32_4* %106 = OpAccessChain %56 %104 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %103 %109 
                                                      OpStore %102 %110 
                                       f32_3 %111 = OpLoad %102 
                                       f32_3 %112 = OpLoad %102 
                                         f32 %113 = OpDot %111 %112 
                                Private f32* %114 = OpAccessChain %102 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %102 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpExtInst %1 31 %116 
                                Private f32* %118 = OpAccessChain %102 %28 
                                                      OpStore %118 %117 
                                Private f32* %119 = OpAccessChain %75 %28 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                Private f32* %122 = OpAccessChain %102 %28 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFAdd %121 %123 
                                Private f32* %125 = OpAccessChain %102 %28 
                                                      OpStore %125 %124 
                                Uniform f32* %126 = OpAccessChain %56 %104 %22 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %102 %28 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %75 %28 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFAdd %130 %132 
                                Private f32* %134 = OpAccessChain %75 %28 
                                                      OpStore %134 %133 
                                Private f32* %135 = OpAccessChain %75 %28 
                                         f32 %136 = OpLoad %135 
                                Uniform f32* %137 = OpAccessChain %56 %94 %86 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFMul %136 %138 
                                Uniform f32* %140 = OpAccessChain %56 %94 %22 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFAdd %139 %141 
                                Private f32* %143 = OpAccessChain %75 %28 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %75 %28 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 43 %145 %35 %146 
                                Private f32* %148 = OpAccessChain %75 %28 
                                                      OpStore %148 %147 
                                Uniform f32* %151 = OpAccessChain %56 %150 %28 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdEqual %152 %146 
                                                      OpStore %149 %153 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %156 
                                             %155 = OpLabel 
                                        bool %157 = OpLoad %149 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %159 
                                             %158 = OpLabel 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %247 
                                             %161 = OpLabel 
                                Uniform f32* %164 = OpAccessChain %56 %150 %92 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %146 
                                                      OpStore %163 %166 
                                       f32_3 %167 = OpLoad %77 
                                       f32_3 %168 = OpVectorShuffle %167 %167 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %56 %169 %40 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %168 %172 
                                                      OpStore %84 %173 
                              Uniform f32_4* %174 = OpAccessChain %56 %169 %39 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpLoad %77 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_3 %180 = OpLoad %84 
                                       f32_3 %181 = OpFAdd %179 %180 
                                                      OpStore %84 %181 
                              Uniform f32_4* %182 = OpAccessChain %56 %169 %94 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpLoad %77 
                                       f32_3 %186 = OpVectorShuffle %185 %185 2 2 2 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %84 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %84 %189 
                                       f32_3 %190 = OpLoad %84 
                              Uniform f32_4* %191 = OpAccessChain %56 %169 %104 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                                      OpStore %84 %194 
                                        bool %197 = OpLoad %163 
                                                      OpSelectionMerge %199 None 
                                                      OpBranchConditional %197 %198 %201 
                                             %198 = OpLabel 
                                       f32_3 %200 = OpLoad %84 
                                                      OpStore %196 %200 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                       f32_3 %202 = OpLoad %77 
                                                      OpStore %196 %202 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                       f32_3 %203 = OpLoad %196 
                                                      OpStore %84 %203 
                                       f32_3 %204 = OpLoad %84 
                              Uniform f32_3* %206 = OpAccessChain %56 %205 
                                       f32_3 %207 = OpLoad %206 
                                       f32_3 %208 = OpFNegate %207 
                                       f32_3 %209 = OpFAdd %204 %208 
                                                      OpStore %84 %209 
                                       f32_3 %211 = OpLoad %84 
                              Uniform f32_3* %213 = OpAccessChain %56 %212 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFMul %211 %214 
                                       f32_4 %216 = OpLoad %210 
                                       f32_4 %217 = OpVectorShuffle %216 %215 0 4 5 6 
                                                      OpStore %210 %217 
                                Private f32* %220 = OpAccessChain %210 %92 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpFMul %221 %222 
                                         f32 %225 = OpFAdd %223 %224 
                                Private f32* %226 = OpAccessChain %219 %28 
                                                      OpStore %226 %225 
                                Uniform f32* %228 = OpAccessChain %56 %150 %86 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                         f32 %232 = OpFAdd %231 %224 
                                                      OpStore %227 %232 
                                         f32 %233 = OpLoad %227 
                                Private f32* %234 = OpAccessChain %219 %28 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 40 %233 %235 
                                Private f32* %237 = OpAccessChain %210 %28 
                                                      OpStore %237 %236 
                  read_only Texture3DSampled %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %210 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 2 3 
                                       f32_4 %245 = OpImageSampleImplicitLod %242 %244 
                                                      OpStore %210 %245 
                                       f32_4 %246 = OpLoad %210 
                                                      OpStore %20 %246 
                                                      OpBranch %162 
                                             %247 = OpLabel 
                                Private f32* %248 = OpAccessChain %20 %28 
                                                      OpStore %248 %146 
                                Private f32* %249 = OpAccessChain %20 %92 
                                                      OpStore %249 %146 
                                Private f32* %250 = OpAccessChain %20 %86 
                                                      OpStore %250 %146 
                                Private f32* %251 = OpAccessChain %20 %22 
                                                      OpStore %251 %146 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                       f32_4 %253 = OpLoad %20 
                              Uniform f32_4* %254 = OpAccessChain %56 %40 
                                       f32_4 %255 = OpLoad %254 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %252 %28 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %252 %28 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %35 %146 
                                Private f32* %261 = OpAccessChain %252 %28 
                                                      OpStore %261 %260 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %266 = OpLoad %263 
                                       f32_2 %267 = OpVectorShuffle %266 %266 3 3 
                                       f32_2 %268 = OpFDiv %265 %267 
                                                      OpStore %219 %268 
                  read_only Texture2DSampled %271 = OpLoad %270 
                                       f32_2 %272 = OpLoad %219 
                                       f32_4 %273 = OpImageSampleImplicitLod %271 %272 
                                         f32 %274 = OpCompositeExtract %273 0 
                                                      OpStore %269 %274 
                                Private f32* %276 = OpAccessChain %75 %28 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %269 
                                         f32 %279 = OpFAdd %277 %278 
                                Private f32* %280 = OpAccessChain %275 %28 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %275 %28 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpExtInst %1 43 %282 %35 %146 
                                Private f32* %284 = OpAccessChain %275 %28 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %275 %28 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %252 %28 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpExtInst %1 37 %286 %288 
                                Private f32* %290 = OpAccessChain %252 %28 
                                                      OpStore %290 %289 
                                        bool %293 = OpLoad %149 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %293 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %252 %28 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %292 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                Private f32* %299 = OpAccessChain %275 %28 
                                         f32 %300 = OpLoad %299 
                                                      OpStore %292 %300 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %301 = OpLoad %292 
                                Private f32* %302 = OpAccessChain %252 %28 
                                                      OpStore %302 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %56 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFMul %304 %308 
                                                      OpStore %275 %309 
                                       f32_3 %310 = OpLoad %252 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpLoad %275 
                                       f32_3 %313 = OpFMul %311 %312 
                                                      OpStore %252 %313 
                                       f32_4 %316 = OpLoad %9 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %319 = OpLoad %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %252 
                                       f32_3 %322 = OpFAdd %320 %321 
                                       f32_4 %323 = OpLoad %315 
                                       f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
                                                      OpStore %315 %324 
                                Private f32* %325 = OpAccessChain %9 %22 
                                         f32 %326 = OpLoad %325 
                                 Output f32* %328 = OpAccessChain %315 %22 
                                                      OpStore %328 %326 
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = (-u_xlat1.x) + u_xlat4.x;
    u_xlat1.x = unity_ShadowFadeCenterAndType.w * u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _LightShadowData.z + _LightShadowData.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb4 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb4){
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
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat1.x = u_xlat1.x + u_xlat10_2.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = min(u_xlat1.x, u_xlat7);
    u_xlat1.x = (u_xlatb4) ? u_xlat7 : u_xlat1.x;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 455
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %49 %133 %139 %140 %153 %190 %193 %196 %417 %436 %448 
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
                                                      OpMemberDecorate %131 0 BuiltIn 131 
                                                      OpMemberDecorate %131 1 BuiltIn 131 
                                                      OpMemberDecorate %131 2 BuiltIn 131 
                                                      OpDecorate %131 Block 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %153 Location 153 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
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
                                              %90 = OpTypeVector %6 3 
                              Private f32_4* %102 = OpVariable Private 
                                         i32 %105 = OpConstant 15 
                                             %130 = OpTypeArray %6 %50 
                                             %131 = OpTypeStruct %7 %6 %130 
                                             %132 = OpTypePointer Output %131 
        Output struct {f32_4; f32; f32[1];}* %133 = OpVariable Output 
                                             %135 = OpTypePointer Output %7 
                                             %137 = OpTypeVector %6 2 
                                             %138 = OpTypePointer Output %137 
                               Output f32_2* %139 = OpVariable Output 
                                Input f32_4* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 18 
                                             %152 = OpTypePointer Input %90 
                                Input f32_3* %153 = OpVariable Input 
                                         i32 %155 = OpConstant 14 
                                         u32 %172 = OpConstant 2 
                                Private f32* %174 = OpVariable Private 
                                             %189 = OpTypePointer Output %90 
                               Output f32_3* %190 = OpVariable Output 
                               Output f32_3* %193 = OpVariable Output 
                               Output f32_4* %196 = OpVariable Output 
                                         f32 %197 = OpConstant 3.67402E-40 
                                       f32_4 %198 = OpConstantComposite %197 %197 %197 %197 
                                             %199 = OpTypePointer Private %90 
                              Private f32_3* %200 = OpVariable Private 
                              Private f32_4* %217 = OpVariable Private 
                              Private f32_3* %223 = OpVariable Private 
                                         i32 %224 = OpConstant 9 
                                         i32 %230 = OpConstant 10 
                                         i32 %236 = OpConstant 11 
                                         i32 %242 = OpConstant 12 
                                         u32 %251 = OpConstant 3 
                                         i32 %253 = OpConstant 6 
                                         i32 %259 = OpConstant 7 
                                         i32 %265 = OpConstant 8 
                                       f32_3 %276 = OpConstantComposite %197 %197 %197 
                              Private f32_3* %278 = OpVariable Private 
                                         f32 %282 = OpConstant 3.67402E-40 
                                       f32_3 %283 = OpConstantComposite %282 %282 %282 
                                         f32 %288 = OpConstant 3.67402E-40 
                                       f32_3 %289 = OpConstantComposite %288 %288 %288 
                                         f32 %291 = OpConstant 3.67402E-40 
                                       f32_3 %292 = OpConstantComposite %291 %291 %291 
                              Private f32_4* %296 = OpVariable Private 
                              Private f32_4* %303 = OpVariable Private 
                              Private f32_4* %311 = OpVariable Private 
                                         f32 %347 = OpConstant 3.67402E-40 
                                       f32_4 %348 = OpConstantComposite %347 %347 %347 %347 
                                         i32 %353 = OpConstant 4 
                                       f32_4 %357 = OpConstantComposite %46 %46 %46 %46 
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
                               Uniform f32_4* %91 = OpAccessChain %19 %62 %86 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_4 %94 = OpLoad %49 
                                        f32_3 %95 = OpVectorShuffle %94 %94 3 3 3 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %9 %101 
                                       f32_4 %103 = OpLoad %84 
                                       f32_4 %104 = OpVectorShuffle %103 %103 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %19 %105 %63 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %104 %107 
                                                      OpStore %102 %108 
                              Uniform f32_4* %109 = OpAccessChain %19 %105 %68 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %84 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %102 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %102 %115 
                              Uniform f32_4* %116 = OpAccessChain %19 %105 %76 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %84 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %102 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %102 %122 
                              Uniform f32_4* %123 = OpAccessChain %19 %105 %86 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpLoad %84 
                                       f32_4 %126 = OpVectorShuffle %125 %125 3 3 3 3 
                                       f32_4 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %102 
                                       f32_4 %129 = OpFAdd %127 %128 
                                                      OpStore %84 %129 
                                       f32_4 %134 = OpLoad %84 
                               Output f32_4* %136 = OpAccessChain %133 %68 
                                                      OpStore %136 %134 
                                       f32_4 %141 = OpLoad %140 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 1 
                              Uniform f32_4* %144 = OpAccessChain %19 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %142 %146 
                              Uniform f32_4* %148 = OpAccessChain %19 %143 
                                       f32_4 %149 = OpLoad %148 
                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
                                       f32_2 %151 = OpFAdd %147 %150 
                                                      OpStore %139 %151 
                                       f32_3 %154 = OpLoad %153 
                              Uniform f32_4* %156 = OpAccessChain %19 %155 %68 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpDot %154 %158 
                                Private f32* %160 = OpAccessChain %102 %27 
                                                      OpStore %160 %159 
                                       f32_3 %161 = OpLoad %153 
                              Uniform f32_4* %162 = OpAccessChain %19 %155 %63 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %161 %164 
                                Private f32* %166 = OpAccessChain %102 %50 
                                                      OpStore %166 %165 
                                       f32_3 %167 = OpLoad %153 
                              Uniform f32_4* %168 = OpAccessChain %19 %155 %76 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %167 %170 
                                Private f32* %173 = OpAccessChain %102 %172 
                                                      OpStore %173 %171 
                                       f32_4 %175 = OpLoad %102 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_4 %177 = OpLoad %102 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                         f32 %179 = OpDot %176 %178 
                                                      OpStore %174 %179 
                                         f32 %180 = OpLoad %174 
                                         f32 %181 = OpExtInst %1 32 %180 
                                                      OpStore %174 %181 
                                         f32 %182 = OpLoad %174 
                                       f32_3 %183 = OpCompositeConstruct %182 %182 %182 
                                       f32_4 %184 = OpLoad %102 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %102 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %102 %188 
                                       f32_4 %191 = OpLoad %102 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                                      OpStore %190 %192 
                                       f32_4 %194 = OpLoad %9 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                                                      OpStore %193 %195 
                                                      OpStore %196 %198 
                                Private f32* %201 = OpAccessChain %102 %50 
                                         f32 %202 = OpLoad %201 
                                Private f32* %203 = OpAccessChain %102 %50 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFMul %202 %204 
                                Private f32* %206 = OpAccessChain %200 %27 
                                                      OpStore %206 %205 
                                Private f32* %207 = OpAccessChain %102 %27 
                                         f32 %208 = OpLoad %207 
                                Private f32* %209 = OpAccessChain %102 %27 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFMul %208 %210 
                                Private f32* %212 = OpAccessChain %200 %27 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFNegate %213 
                                         f32 %215 = OpFAdd %211 %214 
                                Private f32* %216 = OpAccessChain %200 %27 
                                                      OpStore %216 %215 
                                       f32_4 %218 = OpLoad %102 
                                       f32_4 %219 = OpVectorShuffle %218 %218 1 2 2 0 
                                       f32_4 %220 = OpLoad %102 
                                       f32_4 %221 = OpVectorShuffle %220 %220 0 1 2 2 
                                       f32_4 %222 = OpFMul %219 %221 
                                                      OpStore %217 %222 
                              Uniform f32_4* %225 = OpAccessChain %19 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %217 
                                         f32 %228 = OpDot %226 %227 
                                Private f32* %229 = OpAccessChain %223 %27 
                                                      OpStore %229 %228 
                              Uniform f32_4* %231 = OpAccessChain %19 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %217 
                                         f32 %234 = OpDot %232 %233 
                                Private f32* %235 = OpAccessChain %223 %50 
                                                      OpStore %235 %234 
                              Uniform f32_4* %237 = OpAccessChain %19 %236 
                                       f32_4 %238 = OpLoad %237 
                                       f32_4 %239 = OpLoad %217 
                                         f32 %240 = OpDot %238 %239 
                                Private f32* %241 = OpAccessChain %223 %172 
                                                      OpStore %241 %240 
                              Uniform f32_4* %243 = OpAccessChain %19 %242 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpLoad %200 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %245 %247 
                                       f32_3 %249 = OpLoad %223 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %200 %250 
                                Private f32* %252 = OpAccessChain %102 %251 
                                                      OpStore %252 %46 
                              Uniform f32_4* %254 = OpAccessChain %19 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %102 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %217 %27 
                                                      OpStore %258 %257 
                              Uniform f32_4* %260 = OpAccessChain %19 %259 
                                       f32_4 %261 = OpLoad %260 
                                       f32_4 %262 = OpLoad %102 
                                         f32 %263 = OpDot %261 %262 
                                Private f32* %264 = OpAccessChain %217 %50 
                                                      OpStore %264 %263 
                              Uniform f32_4* %266 = OpAccessChain %19 %265 
                                       f32_4 %267 = OpLoad %266 
                                       f32_4 %268 = OpLoad %102 
                                         f32 %269 = OpDot %267 %268 
                                Private f32* %270 = OpAccessChain %217 %172 
                                                      OpStore %270 %269 
                                       f32_3 %271 = OpLoad %200 
                                       f32_4 %272 = OpLoad %217 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFAdd %271 %273 
                                                      OpStore %200 %274 
                                       f32_3 %275 = OpLoad %200 
                                       f32_3 %277 = OpExtInst %1 40 %275 %276 
                                                      OpStore %200 %277 
                                       f32_3 %279 = OpLoad %200 
                                       f32_3 %280 = OpExtInst %1 30 %279 
                                                      OpStore %278 %280 
                                       f32_3 %281 = OpLoad %278 
                                       f32_3 %284 = OpFMul %281 %283 
                                                      OpStore %278 %284 
                                       f32_3 %285 = OpLoad %278 
                                       f32_3 %286 = OpExtInst %1 29 %285 
                                                      OpStore %278 %286 
                                       f32_3 %287 = OpLoad %278 
                                       f32_3 %290 = OpFMul %287 %289 
                                       f32_3 %293 = OpFAdd %290 %292 
                                                      OpStore %278 %293 
                                       f32_3 %294 = OpLoad %278 
                                       f32_3 %295 = OpExtInst %1 40 %294 %276 
                                                      OpStore %278 %295 
                                       f32_4 %297 = OpLoad %9 
                                       f32_4 %298 = OpVectorShuffle %297 %297 1 1 1 1 
                                       f32_4 %299 = OpFNegate %298 
                              Uniform f32_4* %300 = OpAccessChain %19 %76 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %299 %301 
                                                      OpStore %296 %302 
                                       f32_4 %304 = OpLoad %102 
                                       f32_4 %305 = OpVectorShuffle %304 %304 1 1 1 1 
                                       f32_4 %306 = OpLoad %296 
                                       f32_4 %307 = OpFMul %305 %306 
                                                      OpStore %303 %307 
                                       f32_4 %308 = OpLoad %296 
                                       f32_4 %309 = OpLoad %296 
                                       f32_4 %310 = OpFMul %308 %309 
                                                      OpStore %296 %310 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %313 = OpVectorShuffle %312 %312 0 0 0 0 
                                       f32_4 %314 = OpFNegate %313 
                              Uniform f32_4* %315 = OpAccessChain %19 %63 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpFAdd %314 %316 
                                                      OpStore %311 %317 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpVectorShuffle %318 %318 2 2 2 2 
                                       f32_4 %320 = OpFNegate %319 
                              Uniform f32_4* %321 = OpAccessChain %19 %86 
                                       f32_4 %322 = OpLoad %321 
                                       f32_4 %323 = OpFAdd %320 %322 
                                                      OpStore %9 %323 
                                       f32_4 %324 = OpLoad %311 
                                       f32_4 %325 = OpLoad %102 
                                       f32_4 %326 = OpVectorShuffle %325 %325 0 0 0 0 
                                       f32_4 %327 = OpFMul %324 %326 
                                       f32_4 %328 = OpLoad %303 
                                       f32_4 %329 = OpFAdd %327 %328 
                                                      OpStore %303 %329 
                                       f32_4 %330 = OpLoad %311 
                                       f32_4 %331 = OpLoad %311 
                                       f32_4 %332 = OpFMul %330 %331 
                                       f32_4 %333 = OpLoad %296 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %296 %334 
                                       f32_4 %335 = OpLoad %9 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpFMul %335 %336 
                                       f32_4 %338 = OpLoad %296 
                                       f32_4 %339 = OpFAdd %337 %338 
                                                      OpStore %296 %339 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %341 = OpLoad %102 
                                       f32_4 %342 = OpVectorShuffle %341 %341 2 2 2 2 
                                       f32_4 %343 = OpFMul %340 %342 
                                       f32_4 %344 = OpLoad %303 
                                       f32_4 %345 = OpFAdd %343 %344 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %296 
                                       f32_4 %349 = OpExtInst %1 40 %346 %348 
                                                      OpStore %102 %349 
                                       f32_4 %350 = OpLoad %102 
                                       f32_4 %351 = OpExtInst %1 32 %350 
                                                      OpStore %296 %351 
                                       f32_4 %352 = OpLoad %102 
                              Uniform f32_4* %354 = OpAccessChain %19 %353 
                                       f32_4 %355 = OpLoad %354 
                                       f32_4 %356 = OpFMul %352 %355 
                                       f32_4 %358 = OpFAdd %356 %357 
                                                      OpStore %102 %358 
                                       f32_4 %359 = OpLoad %102 
                                       f32_4 %360 = OpFDiv %357 %359 
                                                      OpStore %102 %360 
                                       f32_4 %361 = OpLoad %9 
                                       f32_4 %362 = OpLoad %296 
                                       f32_4 %363 = OpFMul %361 %362 
                                                      OpStore %9 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_4 %365 = OpExtInst %1 40 %364 %198 
                                                      OpStore %9 %365 
                                       f32_4 %366 = OpLoad %102 
                                       f32_4 %367 = OpLoad %9 
                                       f32_4 %368 = OpFMul %366 %367 
                                                      OpStore %9 %368 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 1 1 1 
                              Uniform f32_4* %372 = OpAccessChain %19 %371 %63 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpFMul %370 %374 
                                       f32_4 %376 = OpLoad %102 
                                       f32_4 %377 = OpVectorShuffle %376 %375 4 5 6 3 
                                                      OpStore %102 %377 
                              Uniform f32_4* %378 = OpAccessChain %19 %371 %68 
                                       f32_4 %379 = OpLoad %378 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_4 %381 = OpLoad %9 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 0 0 
                                       f32_3 %383 = OpFMul %380 %382 
                                       f32_4 %384 = OpLoad %102 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %102 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %102 %388 
                              Uniform f32_4* %389 = OpAccessChain %19 %371 %76 
                                       f32_4 %390 = OpLoad %389 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 2 2 2 
                                       f32_3 %394 = OpFMul %391 %393 
                                       f32_4 %395 = OpLoad %102 
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
                                       f32_3 %413 = OpLoad %278 
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
                                Private f32* %429 = OpAccessChain %9 %251 
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
                                                      OpStore %448 %198 
                                 Output f32* %450 = OpAccessChain %133 %68 %50 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFNegate %451 
                                 Output f32* %453 = OpAccessChain %133 %68 %50 
                                                      OpStore %453 %452 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %263 %315 %318 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %52 ArrayStride 52 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 RelaxedPrecision 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 RelaxedPrecision 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 RelaxedPrecision 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpMemberDecorate %54 10 RelaxedPrecision 
                                                      OpMemberDecorate %54 10 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %160 SpecId 160 
                                                      OpDecorate %241 DescriptorSet 241 
                                                      OpDecorate %241 Binding 241 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %270 DescriptorSet 270 
                                                      OpDecorate %270 Binding 270 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %315 Location 315 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %318 Location 318 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                              %50 = OpTypeVector %6 3 
                                          u32 %51 = OpConstant 4 
                                              %52 = OpTypeArray %7 %51 
                                              %53 = OpTypeArray %7 %51 
                                              %54 = OpTypeStruct %50 %7 %7 %7 %52 %7 %53 %50 %50 %7 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 10 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %50 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %50 
                                 Input f32_3* %77 = OpVariable Input 
                                              %80 = OpTypePointer Uniform %50 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                                          u32 %86 = OpConstant 2 
                                          u32 %92 = OpConstant 1 
                                          i32 %94 = OpConstant 2 
                              Private f32_3* %102 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %105 = OpTypePointer Uniform %7 
                                         f32 %146 = OpConstant 3.67402E-40 
                               Private bool* %149 = OpVariable Private 
                                         i32 %150 = OpConstant 5 
                                        bool %154 = OpConstantFalse 
                                        bool %160 = OpSpecConstantFalse 
                               Private bool* %163 = OpVariable Private 
                                         i32 %169 = OpConstant 6 
                                             %195 = OpTypePointer Function %50 
                                         i32 %205 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
                                         i32 %212 = OpConstant 7 
                                             %218 = OpTypePointer Private %15 
                              Private f32_2* %219 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
                                         f32 %224 = OpConstant 3.67402E-40 
                                Private f32* %227 = OpVariable Private 
                                         f32 %230 = OpConstant 3.67402E-40 
                                             %238 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %239 = OpTypeSampledImage %238 
                                             %240 = OpTypePointer UniformConstant %239 
 UniformConstant read_only Texture3DSampled* %241 = OpVariable UniformConstant 
                              Private f32_3* %252 = OpVariable Private 
                                             %262 = OpTypePointer Input %7 
                                Input f32_4* %263 = OpVariable Input 
                                Private f32* %269 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %270 = OpVariable UniformConstant 
                              Private f32_3* %275 = OpVariable Private 
                                             %291 = OpTypePointer Function %6 
                                         i32 %305 = OpConstant 9 
                                             %314 = OpTypePointer Output %7 
                               Output f32_4* %315 = OpVariable Output 
                                Input f32_3* %318 = OpVariable Input 
                                             %327 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %196 = OpVariable Function 
                               Function f32* %292 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpFNegate %78 
                               Uniform f32_3* %81 = OpAccessChain %56 %39 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFAdd %79 %82 
                                                      OpStore %75 %83 
                                 Uniform f32* %87 = OpAccessChain %56 %85 %39 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %84 %28 
                                                      OpStore %89 %88 
                                 Uniform f32* %90 = OpAccessChain %56 %85 %40 %86 
                                          f32 %91 = OpLoad %90 
                                 Private f32* %93 = OpAccessChain %84 %92 
                                                      OpStore %93 %91 
                                 Uniform f32* %95 = OpAccessChain %56 %85 %94 %86 
                                          f32 %96 = OpLoad %95 
                                 Private f32* %97 = OpAccessChain %84 %86 
                                                      OpStore %97 %96 
                                        f32_3 %98 = OpLoad %75 
                                        f32_3 %99 = OpLoad %84 
                                         f32 %100 = OpDot %98 %99 
                                Private f32* %101 = OpAccessChain %75 %28 
                                                      OpStore %101 %100 
                                       f32_3 %103 = OpLoad %77 
                              Uniform f32_4* %106 = OpAccessChain %56 %104 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %103 %109 
                                                      OpStore %102 %110 
                                       f32_3 %111 = OpLoad %102 
                                       f32_3 %112 = OpLoad %102 
                                         f32 %113 = OpDot %111 %112 
                                Private f32* %114 = OpAccessChain %102 %28 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %102 %28 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpExtInst %1 31 %116 
                                Private f32* %118 = OpAccessChain %102 %28 
                                                      OpStore %118 %117 
                                Private f32* %119 = OpAccessChain %75 %28 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                Private f32* %122 = OpAccessChain %102 %28 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFAdd %121 %123 
                                Private f32* %125 = OpAccessChain %102 %28 
                                                      OpStore %125 %124 
                                Uniform f32* %126 = OpAccessChain %56 %104 %22 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %102 %28 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Private f32* %131 = OpAccessChain %75 %28 
                                         f32 %132 = OpLoad %131 
                                         f32 %133 = OpFAdd %130 %132 
                                Private f32* %134 = OpAccessChain %75 %28 
                                                      OpStore %134 %133 
                                Private f32* %135 = OpAccessChain %75 %28 
                                         f32 %136 = OpLoad %135 
                                Uniform f32* %137 = OpAccessChain %56 %94 %86 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFMul %136 %138 
                                Uniform f32* %140 = OpAccessChain %56 %94 %22 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFAdd %139 %141 
                                Private f32* %143 = OpAccessChain %75 %28 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %75 %28 
                                         f32 %145 = OpLoad %144 
                                         f32 %147 = OpExtInst %1 43 %145 %35 %146 
                                Private f32* %148 = OpAccessChain %75 %28 
                                                      OpStore %148 %147 
                                Uniform f32* %151 = OpAccessChain %56 %150 %28 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdEqual %152 %146 
                                                      OpStore %149 %153 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %154 %155 %156 
                                             %155 = OpLabel 
                                        bool %157 = OpLoad %149 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %159 
                                             %158 = OpLabel 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %247 
                                             %161 = OpLabel 
                                Uniform f32* %164 = OpAccessChain %56 %150 %92 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %146 
                                                      OpStore %163 %166 
                                       f32_3 %167 = OpLoad %77 
                                       f32_3 %168 = OpVectorShuffle %167 %167 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %56 %169 %40 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %168 %172 
                                                      OpStore %84 %173 
                              Uniform f32_4* %174 = OpAccessChain %56 %169 %39 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpLoad %77 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_3 %180 = OpLoad %84 
                                       f32_3 %181 = OpFAdd %179 %180 
                                                      OpStore %84 %181 
                              Uniform f32_4* %182 = OpAccessChain %56 %169 %94 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpLoad %77 
                                       f32_3 %186 = OpVectorShuffle %185 %185 2 2 2 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %84 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %84 %189 
                                       f32_3 %190 = OpLoad %84 
                              Uniform f32_4* %191 = OpAccessChain %56 %169 %104 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFAdd %190 %193 
                                                      OpStore %84 %194 
                                        bool %197 = OpLoad %163 
                                                      OpSelectionMerge %199 None 
                                                      OpBranchConditional %197 %198 %201 
                                             %198 = OpLabel 
                                       f32_3 %200 = OpLoad %84 
                                                      OpStore %196 %200 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                       f32_3 %202 = OpLoad %77 
                                                      OpStore %196 %202 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                       f32_3 %203 = OpLoad %196 
                                                      OpStore %84 %203 
                                       f32_3 %204 = OpLoad %84 
                              Uniform f32_3* %206 = OpAccessChain %56 %205 
                                       f32_3 %207 = OpLoad %206 
                                       f32_3 %208 = OpFNegate %207 
                                       f32_3 %209 = OpFAdd %204 %208 
                                                      OpStore %84 %209 
                                       f32_3 %211 = OpLoad %84 
                              Uniform f32_3* %213 = OpAccessChain %56 %212 
                                       f32_3 %214 = OpLoad %213 
                                       f32_3 %215 = OpFMul %211 %214 
                                       f32_4 %216 = OpLoad %210 
                                       f32_4 %217 = OpVectorShuffle %216 %215 0 4 5 6 
                                                      OpStore %210 %217 
                                Private f32* %220 = OpAccessChain %210 %92 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpFMul %221 %222 
                                         f32 %225 = OpFAdd %223 %224 
                                Private f32* %226 = OpAccessChain %219 %28 
                                                      OpStore %226 %225 
                                Uniform f32* %228 = OpAccessChain %56 %150 %86 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                         f32 %232 = OpFAdd %231 %224 
                                                      OpStore %227 %232 
                                         f32 %233 = OpLoad %227 
                                Private f32* %234 = OpAccessChain %219 %28 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 40 %233 %235 
                                Private f32* %237 = OpAccessChain %210 %28 
                                                      OpStore %237 %236 
                  read_only Texture3DSampled %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %210 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 2 3 
                                       f32_4 %245 = OpImageSampleImplicitLod %242 %244 
                                                      OpStore %210 %245 
                                       f32_4 %246 = OpLoad %210 
                                                      OpStore %20 %246 
                                                      OpBranch %162 
                                             %247 = OpLabel 
                                Private f32* %248 = OpAccessChain %20 %28 
                                                      OpStore %248 %146 
                                Private f32* %249 = OpAccessChain %20 %92 
                                                      OpStore %249 %146 
                                Private f32* %250 = OpAccessChain %20 %86 
                                                      OpStore %250 %146 
                                Private f32* %251 = OpAccessChain %20 %22 
                                                      OpStore %251 %146 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                       f32_4 %253 = OpLoad %20 
                              Uniform f32_4* %254 = OpAccessChain %56 %40 
                                       f32_4 %255 = OpLoad %254 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %252 %28 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %252 %28 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %35 %146 
                                Private f32* %261 = OpAccessChain %252 %28 
                                                      OpStore %261 %260 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_4 %266 = OpLoad %263 
                                       f32_2 %267 = OpVectorShuffle %266 %266 3 3 
                                       f32_2 %268 = OpFDiv %265 %267 
                                                      OpStore %219 %268 
                  read_only Texture2DSampled %271 = OpLoad %270 
                                       f32_2 %272 = OpLoad %219 
                                       f32_4 %273 = OpImageSampleImplicitLod %271 %272 
                                         f32 %274 = OpCompositeExtract %273 0 
                                                      OpStore %269 %274 
                                Private f32* %276 = OpAccessChain %75 %28 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpLoad %269 
                                         f32 %279 = OpFAdd %277 %278 
                                Private f32* %280 = OpAccessChain %275 %28 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %275 %28 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpExtInst %1 43 %282 %35 %146 
                                Private f32* %284 = OpAccessChain %275 %28 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %275 %28 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %252 %28 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpExtInst %1 37 %286 %288 
                                Private f32* %290 = OpAccessChain %252 %28 
                                                      OpStore %290 %289 
                                        bool %293 = OpLoad %149 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %293 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %252 %28 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %292 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                Private f32* %299 = OpAccessChain %275 %28 
                                         f32 %300 = OpLoad %299 
                                                      OpStore %292 %300 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %301 = OpLoad %292 
                                Private f32* %302 = OpAccessChain %252 %28 
                                                      OpStore %302 %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                              Uniform f32_4* %306 = OpAccessChain %56 %305 
                                       f32_4 %307 = OpLoad %306 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %309 = OpFMul %304 %308 
                                                      OpStore %275 %309 
                                       f32_3 %310 = OpLoad %252 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpLoad %275 
                                       f32_3 %313 = OpFMul %311 %312 
                                                      OpStore %252 %313 
                                       f32_4 %316 = OpLoad %9 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %319 = OpLoad %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %252 
                                       f32_3 %322 = OpFAdd %320 %321 
                                       f32_4 %323 = OpLoad %315 
                                       f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
                                                      OpStore %315 %324 
                                Private f32* %325 = OpAccessChain %9 %22 
                                         f32 %326 = OpLoad %325 
                                 Output f32* %328 = OpAccessChain %315 %22 
                                                      OpStore %328 %326 
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
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 102767
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                 Output f32* %184 = OpAccessChain %120 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %120 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 258
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %246 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 RelaxedPrecision 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 RelaxedPrecision 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 RelaxedPrecision 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %120 SpecId 120 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %225 DescriptorSet 225 
                                                      OpDecorate %225 Binding 225 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 Location 246 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeArray %7 %50 
                                              %54 = OpTypeStruct %7 %7 %51 %52 %52 %7 %53 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 7 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %52 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %52 
                                 Input f32_3* %77 = OpVariable Input 
                                          i32 %80 = OpConstant 6 
                                              %81 = OpTypePointer Uniform %7 
                                          i32 %94 = OpConstant 2 
                                         i32 %104 = OpConstant 3 
                               Private bool* %109 = OpVariable Private 
                                         f32 %112 = OpConstant 3.67402E-40 
                                        bool %114 = OpConstantFalse 
                                        bool %120 = OpSpecConstantFalse 
                                         u32 %123 = OpConstant 1 
                              Private f32_3* %127 = OpVariable Private 
                                             %155 = OpTypePointer Function %52 
                                         i32 %165 = OpConstant 4 
                                             %166 = OpTypePointer Uniform %52 
                              Private f32_4* %171 = OpVariable Private 
                                Private f32* %178 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                                         f32 %183 = OpConstant 3.67402E-40 
                                         u32 %185 = OpConstant 2 
                                         f32 %188 = OpConstant 3.67402E-40 
                                             %197 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %198 = OpTypeSampledImage %197 
                                             %199 = OpTypePointer UniformConstant %198 
 UniformConstant read_only Texture3DSampled* %200 = OpVariable UniformConstant 
                              Private f32_3* %211 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %225 = OpVariable UniformConstant 
                                         i32 %240 = OpConstant 5 
                                             %245 = OpTypePointer Output %7 
                               Output f32_4* %246 = OpVariable Output 
                                             %255 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %156 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %56 %80 %40 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %79 %84 
                                                      OpStore %75 %85 
                               Uniform f32_4* %86 = OpAccessChain %56 %80 %39 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpLoad %77 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 0 0 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_3 %92 = OpLoad %75 
                                        f32_3 %93 = OpFAdd %91 %92 
                                                      OpStore %75 %93 
                               Uniform f32_4* %95 = OpAccessChain %56 %80 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %77 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %75 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %75 %102 
                                       f32_3 %103 = OpLoad %75 
                              Uniform f32_4* %105 = OpAccessChain %56 %80 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %75 %108 
                                Uniform f32* %110 = OpAccessChain %56 %40 %28 
                                         f32 %111 = OpLoad %110 
                                        bool %113 = OpFOrdEqual %111 %112 
                                                      OpStore %109 %113 
                                                      OpSelectionMerge %116 None 
                                                      OpBranchConditional %114 %115 %116 
                                             %115 = OpLabel 
                                        bool %117 = OpLoad %109 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpBranch %116 
                                             %116 = OpLabel 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %206 
                                             %121 = OpLabel 
                                Uniform f32* %124 = OpAccessChain %56 %40 %123 
                                         f32 %125 = OpLoad %124 
                                        bool %126 = OpFOrdEqual %125 %112 
                                                      OpStore %109 %126 
                                       f32_3 %128 = OpLoad %77 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                              Uniform f32_4* %130 = OpAccessChain %56 %94 %40 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFMul %129 %132 
                                                      OpStore %127 %133 
                              Uniform f32_4* %134 = OpAccessChain %56 %94 %39 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpLoad %77 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_3 %140 = OpLoad %127 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %127 %141 
                              Uniform f32_4* %142 = OpAccessChain %56 %94 %94 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %77 
                                       f32_3 %146 = OpVectorShuffle %145 %145 2 2 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_3 %148 = OpLoad %127 
                                       f32_3 %149 = OpFAdd %147 %148 
                                                      OpStore %127 %149 
                                       f32_3 %150 = OpLoad %127 
                              Uniform f32_4* %151 = OpAccessChain %56 %94 %104 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %150 %153 
                                                      OpStore %127 %154 
                                        bool %157 = OpLoad %109 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %161 
                                             %158 = OpLabel 
                                       f32_3 %160 = OpLoad %127 
                                                      OpStore %156 %160 
                                                      OpBranch %159 
                                             %161 = OpLabel 
                                       f32_3 %162 = OpLoad %77 
                                                      OpStore %156 %162 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                       f32_3 %163 = OpLoad %156 
                                                      OpStore %127 %163 
                                       f32_3 %164 = OpLoad %127 
                              Uniform f32_3* %167 = OpAccessChain %56 %165 
                                       f32_3 %168 = OpLoad %167 
                                       f32_3 %169 = OpFNegate %168 
                                       f32_3 %170 = OpFAdd %164 %169 
                                                      OpStore %127 %170 
                                       f32_3 %172 = OpLoad %127 
                              Uniform f32_3* %173 = OpAccessChain %56 %104 
                                       f32_3 %174 = OpLoad %173 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %171 
                                       f32_4 %177 = OpVectorShuffle %176 %175 0 4 5 6 
                                                      OpStore %171 %177 
                                Private f32* %179 = OpAccessChain %171 %123 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpFMul %180 %181 
                                         f32 %184 = OpFAdd %182 %183 
                                                      OpStore %178 %184 
                                Uniform f32* %186 = OpAccessChain %56 %40 %185 
                                         f32 %187 = OpLoad %186 
                                         f32 %189 = OpFMul %187 %188 
                                         f32 %190 = OpFAdd %189 %183 
                                Private f32* %191 = OpAccessChain %127 %28 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %178 
                                Private f32* %193 = OpAccessChain %127 %28 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpExtInst %1 40 %192 %194 
                                Private f32* %196 = OpAccessChain %171 %28 
                                                      OpStore %196 %195 
                  read_only Texture3DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %171 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 2 3 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                                      OpStore %171 %204 
                                       f32_4 %205 = OpLoad %171 
                                                      OpStore %20 %205 
                                                      OpBranch %122 
                                             %206 = OpLabel 
                                Private f32* %207 = OpAccessChain %20 %28 
                                                      OpStore %207 %112 
                                Private f32* %208 = OpAccessChain %20 %123 
                                                      OpStore %208 %112 
                                Private f32* %209 = OpAccessChain %20 %185 
                                                      OpStore %209 %112 
                                Private f32* %210 = OpAccessChain %20 %22 
                                                      OpStore %210 %112 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_4 %212 = OpLoad %20 
                              Uniform f32_4* %213 = OpAccessChain %56 %39 
                                       f32_4 %214 = OpLoad %213 
                                         f32 %215 = OpDot %212 %214 
                                Private f32* %216 = OpAccessChain %211 %28 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %211 %28 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpExtInst %1 43 %218 %35 %112 
                                Private f32* %220 = OpAccessChain %211 %28 
                                                      OpStore %220 %219 
                                       f32_3 %221 = OpLoad %75 
                                       f32_3 %222 = OpLoad %75 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %75 %28 
                                                      OpStore %224 %223 
                  read_only Texture2DSampled %226 = OpLoad %225 
                                       f32_3 %227 = OpLoad %75 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 0 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                         f32 %230 = OpCompositeExtract %229 3 
                                Private f32* %231 = OpAccessChain %75 %28 
                                                      OpStore %231 %230 
                                Private f32* %232 = OpAccessChain %211 %28 
                                         f32 %233 = OpLoad %232 
                                Private f32* %234 = OpAccessChain %75 %28 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                Private f32* %237 = OpAccessChain %75 %28 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %9 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                              Uniform f32_4* %241 = OpAccessChain %56 %240 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpFMul %239 %243 
                                                      OpStore %211 %244 
                                       f32_3 %247 = OpLoad %75 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                                       f32_3 %249 = OpLoad %211 
                                       f32_3 %250 = OpFMul %248 %249 
                                       f32_4 %251 = OpLoad %246 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %246 %252 
                                Private f32* %253 = OpAccessChain %9 %22 
                                         f32 %254 = OpLoad %253 
                                 Output f32* %256 = OpAccessChain %246 %22 
                                                      OpStore %256 %254 
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                 Output f32* %184 = OpAccessChain %120 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %120 %60 %48 
                                                      OpStore %187 %186 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %93 %198 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpMemberDecorate %53 0 RelaxedPrecision 
                                                      OpMemberDecorate %53 0 Offset 53 
                                                      OpMemberDecorate %53 1 Offset 53 
                                                      OpMemberDecorate %53 2 Offset 53 
                                                      OpMemberDecorate %53 3 Offset 53 
                                                      OpMemberDecorate %53 4 Offset 53 
                                                      OpMemberDecorate %53 5 RelaxedPrecision 
                                                      OpMemberDecorate %53 5 Offset 53 
                                                      OpMemberDecorate %53 6 RelaxedPrecision 
                                                      OpMemberDecorate %53 6 Offset 53 
                                                      OpDecorate %53 Block 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %83 SpecId 83 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %171 DescriptorSet 171 
                                                      OpDecorate %171 Binding 171 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 Location 198 
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
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeStruct %7 %7 %51 %52 %52 %7 %6 
                                              %54 = OpTypePointer Uniform %53 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %55 = OpVariable Uniform 
                                          i32 %56 = OpConstant 6 
                                              %57 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                                         bool %77 = OpConstantFalse 
                                         bool %83 = OpSpecConstantFalse 
                                          u32 %86 = OpConstant 1 
                                              %90 = OpTypePointer Private %52 
                               Private f32_3* %91 = OpVariable Private 
                                              %92 = OpTypePointer Input %52 
                                 Input f32_3* %93 = OpVariable Input 
                                          i32 %96 = OpConstant 2 
                                              %97 = OpTypePointer Uniform %7 
                                         i32 %119 = OpConstant 3 
                              Private f32_3* %124 = OpVariable Private 
                                             %125 = OpTypePointer Function %52 
                                         i32 %135 = OpConstant 4 
                                             %136 = OpTypePointer Uniform %52 
                              Private f32_4* %141 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                             %168 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %169 = OpTypeSampledImage %168 
                                             %170 = OpTypePointer UniformConstant %169 
 UniformConstant read_only Texture3DSampled* %171 = OpVariable UniformConstant 
                                Private f32* %182 = OpVariable Private 
                              Private f32_3* %189 = OpVariable Private 
                                         i32 %192 = OpConstant 5 
                                             %197 = OpTypePointer Output %7 
                               Output f32_4* %198 = OpVariable Output 
                                             %207 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %126 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %58 = OpAccessChain %55 %56 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFNegate %59 
                                          f32 %61 = OpFAdd %49 %60 
                                 Private f32* %62 = OpAccessChain %20 %28 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdLessThan %64 %35 
                                                      OpStore %32 %65 
                                         bool %66 = OpLoad %32 
                                          i32 %67 = OpSelect %66 %40 %39 
                                          i32 %68 = OpIMul %67 %42 
                                         bool %69 = OpINotEqual %68 %39 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                 Uniform f32* %73 = OpAccessChain %55 %40 %28 
                                          f32 %74 = OpLoad %73 
                                         bool %76 = OpFOrdEqual %74 %75 
                                                      OpStore %32 %76 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                         bool %80 = OpLoad %32 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpBranch %82 
                                              %82 = OpLabel 
                                                      OpBranch %79 
                                              %79 = OpLabel 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %177 
                                              %84 = OpLabel 
                                 Uniform f32* %87 = OpAccessChain %55 %40 %86 
                                          f32 %88 = OpLoad %87 
                                         bool %89 = OpFOrdEqual %88 %75 
                                                      OpStore %32 %89 
                                        f32_3 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 1 1 1 
                               Uniform f32_4* %98 = OpAccessChain %55 %96 %40 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFMul %95 %100 
                                                      OpStore %91 %101 
                              Uniform f32_4* %102 = OpAccessChain %55 %96 %39 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %93 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %91 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %91 %109 
                              Uniform f32_4* %110 = OpAccessChain %55 %96 %96 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %93 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_3 %116 = OpLoad %91 
                                       f32_3 %117 = OpFAdd %115 %116 
                                                      OpStore %91 %117 
                                       f32_3 %118 = OpLoad %91 
                              Uniform f32_4* %120 = OpAccessChain %55 %96 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %118 %122 
                                                      OpStore %91 %123 
                                        bool %127 = OpLoad %32 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %131 
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %91 
                                                      OpStore %126 %130 
                                                      OpBranch %129 
                                             %131 = OpLabel 
                                       f32_3 %132 = OpLoad %93 
                                                      OpStore %126 %132 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_3 %133 = OpLoad %126 
                                                      OpStore %124 %133 
                                       f32_3 %134 = OpLoad %124 
                              Uniform f32_3* %137 = OpAccessChain %55 %135 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_3 %140 = OpFAdd %134 %139 
                                                      OpStore %124 %140 
                                       f32_3 %142 = OpLoad %124 
                              Uniform f32_3* %143 = OpAccessChain %55 %119 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %141 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %141 %147 
                                Private f32* %148 = OpAccessChain %141 %86 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %124 %28 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %55 %40 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %152 
                                Private f32* %161 = OpAccessChain %91 %28 
                                                      OpStore %161 %160 
                                Private f32* %162 = OpAccessChain %91 %28 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %124 %28 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpExtInst %1 40 %163 %165 
                                Private f32* %167 = OpAccessChain %141 %28 
                                                      OpStore %167 %166 
                  read_only Texture3DSampled %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %141 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
                                       f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                                      OpStore %141 %175 
                                       f32_4 %176 = OpLoad %141 
                                                      OpStore %20 %176 
                                                      OpBranch %85 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %20 %28 
                                                      OpStore %178 %75 
                                Private f32* %179 = OpAccessChain %20 %86 
                                                      OpStore %179 %75 
                                Private f32* %180 = OpAccessChain %20 %155 
                                                      OpStore %180 %75 
                                Private f32* %181 = OpAccessChain %20 %22 
                                                      OpStore %181 %75 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                       f32_4 %183 = OpLoad %20 
                              Uniform f32_4* %184 = OpAccessChain %55 %39 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                                      OpStore %182 %186 
                                         f32 %187 = OpLoad %182 
                                         f32 %188 = OpExtInst %1 43 %187 %35 %75 
                                                      OpStore %182 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              Uniform f32_4* %193 = OpAccessChain %55 %192 
                                       f32_4 %194 = OpLoad %193 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                                       f32_3 %196 = OpFMul %191 %195 
                                                      OpStore %189 %196 
                                         f32 %199 = OpLoad %182 
                                       f32_3 %200 = OpCompositeConstruct %199 %199 %199 
                                       f32_3 %201 = OpLoad %189 
                                       f32_3 %202 = OpFMul %200 %201 
                                       f32_4 %203 = OpLoad %198 
                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                                      OpStore %198 %204 
                                Private f32* %205 = OpAccessChain %9 %22 
                                         f32 %206 = OpLoad %205 
                                 Output f32* %208 = OpAccessChain %198 %22 
                                                      OpStore %208 %206 
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                 Output f32* %184 = OpAccessChain %120 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %120 %60 %48 
                                                      OpStore %187 %186 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %71 %283 
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
                                                      OpDecorate %48 ArrayStride 48 
                                                      OpDecorate %50 ArrayStride 50 
                                                      OpMemberDecorate %51 0 RelaxedPrecision 
                                                      OpMemberDecorate %51 0 Offset 51 
                                                      OpMemberDecorate %51 1 Offset 51 
                                                      OpMemberDecorate %51 2 Offset 51 
                                                      OpMemberDecorate %51 3 Offset 51 
                                                      OpMemberDecorate %51 4 Offset 51 
                                                      OpMemberDecorate %51 5 RelaxedPrecision 
                                                      OpMemberDecorate %51 5 Offset 51 
                                                      OpMemberDecorate %51 6 Offset 51 
                                                      OpMemberDecorate %51 7 RelaxedPrecision 
                                                      OpMemberDecorate %51 7 Offset 51 
                                                      OpDecorate %51 Block 
                                                      OpDecorate %53 DescriptorSet 53 
                                                      OpDecorate %53 Binding 53 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %71 Location 71 
                                                      OpDecorate %110 SpecId 110 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %240 DescriptorSet 240 
                                                      OpDecorate %240 Binding 240 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %258 DescriptorSet 258 
                                                      OpDecorate %258 Binding 258 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %283 Location 283 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
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
                                          u32 %47 = OpConstant 4 
                                              %48 = OpTypeArray %7 %47 
                                              %49 = OpTypeVector %6 3 
                                              %50 = OpTypeArray %7 %47 
                                              %51 = OpTypeStruct %7 %7 %48 %49 %49 %7 %50 %6 
                                              %52 = OpTypePointer Uniform %51 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %53 = OpVariable Uniform 
                                          i32 %54 = OpConstant 7 
                                              %55 = OpTypePointer Uniform %6 
                               Private f32_4* %69 = OpVariable Private 
                                              %70 = OpTypePointer Input %49 
                                 Input f32_3* %71 = OpVariable Input 
                                          i32 %74 = OpConstant 6 
                                              %75 = OpTypePointer Uniform %7 
                                          i32 %86 = OpConstant 2 
                                          i32 %95 = OpConstant 3 
                                          u32 %99 = OpConstant 0 
                                         f32 %102 = OpConstant 3.67402E-40 
                                        bool %104 = OpConstantFalse 
                                        bool %110 = OpSpecConstantFalse 
                                         u32 %113 = OpConstant 1 
                                             %117 = OpTypePointer Private %49 
                              Private f32_3* %118 = OpVariable Private 
                              Private f32_4* %146 = OpVariable Private 
                                             %147 = OpTypePointer Function %49 
                                         i32 %160 = OpConstant 4 
                                             %161 = OpTypePointer Uniform %49 
                                         f32 %177 = OpConstant 3.67402E-40 
                                         f32 %179 = OpConstant 3.67402E-40 
                                             %182 = OpTypePointer Private %15 
                              Private f32_2* %183 = OpVariable Private 
                                         u32 %184 = OpConstant 2 
                                         f32 %187 = OpConstant 3.67402E-40 
                                             %197 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %198 = OpTypeSampledImage %197 
                                             %199 = OpTypePointer UniformConstant %198 
 UniformConstant read_only Texture3DSampled* %200 = OpVariable UniformConstant 
                              Private f32_4* %205 = OpVariable Private 
                                Private f32* %212 = OpVariable Private 
                               Private bool* %219 = OpVariable Private 
                              Private f32_3* %223 = OpVariable Private 
                                             %224 = OpTypePointer Function %6 
                                       f32_2 %238 = OpConstantComposite %187 %187 
 UniformConstant read_only Texture2DSampled* %240 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %258 = OpVariable UniformConstant 
                                         i32 %277 = OpConstant 5 
                                             %282 = OpTypePointer Output %7 
                               Output f32_4* %283 = OpVariable Output 
                                             %292 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %148 = OpVariable Function 
                               Function f32* %225 = OpVariable Function 
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
                                 Uniform f32* %56 = OpAccessChain %53 %54 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFNegate %57 
                                          f32 %59 = OpFAdd %46 %58 
                                                      OpStore %21 %59 
                                          f32 %60 = OpLoad %21 
                                         bool %61 = OpFOrdLessThan %60 %32 
                                                      OpStore %30 %61 
                                         bool %62 = OpLoad %30 
                                          i32 %63 = OpSelect %62 %37 %36 
                                          i32 %64 = OpIMul %63 %39 
                                         bool %65 = OpINotEqual %64 %36 
                                                      OpSelectionMerge %67 None 
                                                      OpBranchConditional %65 %66 %67 
                                              %66 = OpLabel 
                                                      OpKill
                                              %67 = OpLabel 
                                        f32_3 %72 = OpLoad %71 
                                        f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                               Uniform f32_4* %76 = OpAccessChain %53 %74 %37 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpFMul %73 %77 
                                                      OpStore %69 %78 
                               Uniform f32_4* %79 = OpAccessChain %53 %74 %36 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpLoad %71 
                                        f32_4 %82 = OpVectorShuffle %81 %81 0 0 0 0 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %69 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %69 %85 
                               Uniform f32_4* %87 = OpAccessChain %53 %74 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpLoad %71 
                                        f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %69 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %69 %93 
                                        f32_4 %94 = OpLoad %69 
                               Uniform f32_4* %96 = OpAccessChain %53 %74 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFAdd %94 %97 
                                                      OpStore %69 %98 
                                Uniform f32* %100 = OpAccessChain %53 %37 %99 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdEqual %101 %102 
                                                      OpStore %30 %103 
                                                      OpSelectionMerge %106 None 
                                                      OpBranchConditional %104 %105 %106 
                                             %105 = OpLabel 
                                        bool %107 = OpLoad %30 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %109 
                                             %108 = OpLabel 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                                      OpBranch %106 
                                             %106 = OpLabel 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %207 
                                             %111 = OpLabel 
                                Uniform f32* %114 = OpAccessChain %53 %37 %113 
                                         f32 %115 = OpLoad %114 
                                        bool %116 = OpFOrdEqual %115 %102 
                                                      OpStore %30 %116 
                                       f32_3 %119 = OpLoad %71 
                                       f32_3 %120 = OpVectorShuffle %119 %119 1 1 1 
                              Uniform f32_4* %121 = OpAccessChain %53 %86 %37 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFMul %120 %123 
                                                      OpStore %118 %124 
                              Uniform f32_4* %125 = OpAccessChain %53 %86 %36 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpLoad %71 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 0 0 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_3 %131 = OpLoad %118 
                                       f32_3 %132 = OpFAdd %130 %131 
                                                      OpStore %118 %132 
                              Uniform f32_4* %133 = OpAccessChain %53 %86 %86 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpLoad %71 
                                       f32_3 %137 = OpVectorShuffle %136 %136 2 2 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_3 %139 = OpLoad %118 
                                       f32_3 %140 = OpFAdd %138 %139 
                                                      OpStore %118 %140 
                                       f32_3 %141 = OpLoad %118 
                              Uniform f32_4* %142 = OpAccessChain %53 %86 %95 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFAdd %141 %144 
                                                      OpStore %118 %145 
                                        bool %149 = OpLoad %30 
                                                      OpSelectionMerge %151 None 
                                                      OpBranchConditional %149 %150 %153 
                                             %150 = OpLabel 
                                       f32_3 %152 = OpLoad %118 
                                                      OpStore %148 %152 
                                                      OpBranch %151 
                                             %153 = OpLabel 
                                       f32_3 %154 = OpLoad %71 
                                                      OpStore %148 %154 
                                                      OpBranch %151 
                                             %151 = OpLabel 
                                       f32_3 %155 = OpLoad %148 
                                       f32_4 %156 = OpLoad %146 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %146 %157 
                                       f32_4 %158 = OpLoad %146 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_3* %162 = OpAccessChain %53 %160 
                                       f32_3 %163 = OpLoad %162 
                                       f32_3 %164 = OpFNegate %163 
                                       f32_3 %165 = OpFAdd %159 %164 
                                       f32_4 %166 = OpLoad %146 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %146 %167 
                                       f32_4 %168 = OpLoad %146 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_3* %170 = OpAccessChain %53 %95 
                                       f32_3 %171 = OpLoad %170 
                                       f32_3 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %146 
                                       f32_4 %174 = OpVectorShuffle %173 %172 0 4 5 6 
                                                      OpStore %146 %174 
                                Private f32* %175 = OpAccessChain %146 %113 
                                         f32 %176 = OpLoad %175 
                                         f32 %178 = OpFMul %176 %177 
                                         f32 %180 = OpFAdd %178 %179 
                                Private f32* %181 = OpAccessChain %118 %99 
                                                      OpStore %181 %180 
                                Uniform f32* %185 = OpAccessChain %53 %37 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %188 = OpFMul %186 %187 
                                         f32 %189 = OpFAdd %188 %179 
                                Private f32* %190 = OpAccessChain %183 %99 
                                                      OpStore %190 %189 
                                Private f32* %191 = OpAccessChain %118 %99 
                                         f32 %192 = OpLoad %191 
                                Private f32* %193 = OpAccessChain %183 %99 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpExtInst %1 40 %192 %194 
                                Private f32* %196 = OpAccessChain %146 %99 
                                                      OpStore %196 %195 
                  read_only Texture3DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %146 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 2 3 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                                      OpStore %146 %204 
                                       f32_4 %206 = OpLoad %146 
                                                      OpStore %205 %206 
                                                      OpBranch %112 
                                             %207 = OpLabel 
                                Private f32* %208 = OpAccessChain %205 %99 
                                                      OpStore %208 %102 
                                Private f32* %209 = OpAccessChain %205 %113 
                                                      OpStore %209 %102 
                                Private f32* %210 = OpAccessChain %205 %184 
                                                      OpStore %210 %102 
                                Private f32* %211 = OpAccessChain %205 %23 
                                                      OpStore %211 %102 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                       f32_4 %213 = OpLoad %205 
                              Uniform f32_4* %214 = OpAccessChain %53 %36 
                                       f32_4 %215 = OpLoad %214 
                                         f32 %216 = OpDot %213 %215 
                                                      OpStore %212 %216 
                                         f32 %217 = OpLoad %212 
                                         f32 %218 = OpExtInst %1 43 %217 %32 %102 
                                                      OpStore %212 %218 
                                Private f32* %220 = OpAccessChain %69 %184 
                                         f32 %221 = OpLoad %220 
                                        bool %222 = OpFOrdLessThan %32 %221 
                                                      OpStore %219 %222 
                                        bool %226 = OpLoad %219 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %229 
                                             %227 = OpLabel 
                                                      OpStore %225 %102 
                                                      OpBranch %228 
                                             %229 = OpLabel 
                                                      OpStore %225 %32 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                         f32 %230 = OpLoad %225 
                                Private f32* %231 = OpAccessChain %223 %99 
                                                      OpStore %231 %230 
                                       f32_4 %232 = OpLoad %69 
                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
                                       f32_4 %234 = OpLoad %69 
                                       f32_2 %235 = OpVectorShuffle %234 %234 3 3 
                                       f32_2 %236 = OpFDiv %233 %235 
                                                      OpStore %183 %236 
                                       f32_2 %237 = OpLoad %183 
                                       f32_2 %239 = OpFAdd %237 %238 
                                                      OpStore %183 %239 
                  read_only Texture2DSampled %241 = OpLoad %240 
                                       f32_2 %242 = OpLoad %183 
                                       f32_4 %243 = OpImageSampleImplicitLod %241 %242 
                                         f32 %244 = OpCompositeExtract %243 3 
                                Private f32* %245 = OpAccessChain %183 %99 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %183 %99 
                                         f32 %247 = OpLoad %246 
                                Private f32* %248 = OpAccessChain %223 %99 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %247 %249 
                                Private f32* %251 = OpAccessChain %223 %99 
                                                      OpStore %251 %250 
                                       f32_4 %252 = OpLoad %69 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_4 %254 = OpLoad %69 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %183 %99 
                                                      OpStore %257 %256 
                  read_only Texture2DSampled %259 = OpLoad %258 
                                       f32_2 %260 = OpLoad %183 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 0 
                                       f32_4 %262 = OpImageSampleImplicitLod %259 %261 
                                         f32 %263 = OpCompositeExtract %262 3 
                                Private f32* %264 = OpAccessChain %183 %99 
                                                      OpStore %264 %263 
                                Private f32* %265 = OpAccessChain %183 %99 
                                         f32 %266 = OpLoad %265 
                                Private f32* %267 = OpAccessChain %223 %99 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %266 %268 
                                Private f32* %270 = OpAccessChain %223 %99 
                                                      OpStore %270 %269 
                                         f32 %271 = OpLoad %212 
                                Private f32* %272 = OpAccessChain %223 %99 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %271 %273 
                                                      OpStore %212 %274 
                                       f32_4 %275 = OpLoad %9 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %53 %277 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFMul %276 %280 
                                                      OpStore %223 %281 
                                         f32 %284 = OpLoad %212 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                       f32_3 %286 = OpLoad %223 
                                       f32_3 %287 = OpFMul %285 %286 
                                       f32_4 %288 = OpLoad %283 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %283 %289 
                                Private f32* %290 = OpAccessChain %9 %23 
                                         f32 %291 = OpLoad %290 
                                 Output f32* %293 = OpAccessChain %283 %23 
                                                      OpStore %293 %291 
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                 Output f32* %184 = OpAccessChain %120 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %120 %60 %48 
                                                      OpStore %187 %186 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %258 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 RelaxedPrecision 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 RelaxedPrecision 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 RelaxedPrecision 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %120 SpecId 120 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %224 DescriptorSet 224 
                                                      OpDecorate %224 Binding 224 
                                                      OpDecorate %233 DescriptorSet 233 
                                                      OpDecorate %233 Binding 233 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %258 Location 258 
                                                      OpDecorate %261 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeArray %7 %50 
                                              %54 = OpTypeStruct %7 %7 %51 %52 %52 %7 %53 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 7 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %52 
                               Private f32_3* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %52 
                                 Input f32_3* %77 = OpVariable Input 
                                          i32 %80 = OpConstant 6 
                                              %81 = OpTypePointer Uniform %7 
                                          i32 %94 = OpConstant 2 
                                         i32 %104 = OpConstant 3 
                               Private bool* %109 = OpVariable Private 
                                         f32 %112 = OpConstant 3.67402E-40 
                                        bool %114 = OpConstantFalse 
                                        bool %120 = OpSpecConstantFalse 
                                         u32 %123 = OpConstant 1 
                              Private f32_3* %127 = OpVariable Private 
                                             %155 = OpTypePointer Function %52 
                                         i32 %165 = OpConstant 4 
                                             %166 = OpTypePointer Uniform %52 
                              Private f32_4* %171 = OpVariable Private 
                                Private f32* %178 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                                         f32 %183 = OpConstant 3.67402E-40 
                                         u32 %185 = OpConstant 2 
                                         f32 %188 = OpConstant 3.67402E-40 
                                             %197 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %198 = OpTypeSampledImage %197 
                                             %199 = OpTypePointer UniformConstant %198 
 UniformConstant read_only Texture3DSampled* %200 = OpVariable UniformConstant 
                              Private f32_3* %211 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %224 = OpVariable UniformConstant 
                                             %230 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %231 = OpTypeSampledImage %230 
                                             %232 = OpTypePointer UniformConstant %231 
UniformConstant read_only TextureCubeSampled* %233 = OpVariable UniformConstant 
                                         i32 %252 = OpConstant 5 
                                             %257 = OpTypePointer Output %7 
                               Output f32_4* %258 = OpVariable Output 
                                             %267 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %156 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %56 %80 %40 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %79 %84 
                                                      OpStore %75 %85 
                               Uniform f32_4* %86 = OpAccessChain %56 %80 %39 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpLoad %77 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 0 0 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_3 %92 = OpLoad %75 
                                        f32_3 %93 = OpFAdd %91 %92 
                                                      OpStore %75 %93 
                               Uniform f32_4* %95 = OpAccessChain %56 %80 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpLoad %77 
                                        f32_3 %99 = OpVectorShuffle %98 %98 2 2 2 
                                       f32_3 %100 = OpFMul %97 %99 
                                       f32_3 %101 = OpLoad %75 
                                       f32_3 %102 = OpFAdd %100 %101 
                                                      OpStore %75 %102 
                                       f32_3 %103 = OpLoad %75 
                              Uniform f32_4* %105 = OpAccessChain %56 %80 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %103 %107 
                                                      OpStore %75 %108 
                                Uniform f32* %110 = OpAccessChain %56 %40 %28 
                                         f32 %111 = OpLoad %110 
                                        bool %113 = OpFOrdEqual %111 %112 
                                                      OpStore %109 %113 
                                                      OpSelectionMerge %116 None 
                                                      OpBranchConditional %114 %115 %116 
                                             %115 = OpLabel 
                                        bool %117 = OpLoad %109 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpBranch %116 
                                             %116 = OpLabel 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %206 
                                             %121 = OpLabel 
                                Uniform f32* %124 = OpAccessChain %56 %40 %123 
                                         f32 %125 = OpLoad %124 
                                        bool %126 = OpFOrdEqual %125 %112 
                                                      OpStore %109 %126 
                                       f32_3 %128 = OpLoad %77 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                              Uniform f32_4* %130 = OpAccessChain %56 %94 %40 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFMul %129 %132 
                                                      OpStore %127 %133 
                              Uniform f32_4* %134 = OpAccessChain %56 %94 %39 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpLoad %77 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_3 %140 = OpLoad %127 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %127 %141 
                              Uniform f32_4* %142 = OpAccessChain %56 %94 %94 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %77 
                                       f32_3 %146 = OpVectorShuffle %145 %145 2 2 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_3 %148 = OpLoad %127 
                                       f32_3 %149 = OpFAdd %147 %148 
                                                      OpStore %127 %149 
                                       f32_3 %150 = OpLoad %127 
                              Uniform f32_4* %151 = OpAccessChain %56 %94 %104 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %150 %153 
                                                      OpStore %127 %154 
                                        bool %157 = OpLoad %109 
                                                      OpSelectionMerge %159 None 
                                                      OpBranchConditional %157 %158 %161 
                                             %158 = OpLabel 
                                       f32_3 %160 = OpLoad %127 
                                                      OpStore %156 %160 
                                                      OpBranch %159 
                                             %161 = OpLabel 
                                       f32_3 %162 = OpLoad %77 
                                                      OpStore %156 %162 
                                                      OpBranch %159 
                                             %159 = OpLabel 
                                       f32_3 %163 = OpLoad %156 
                                                      OpStore %127 %163 
                                       f32_3 %164 = OpLoad %127 
                              Uniform f32_3* %167 = OpAccessChain %56 %165 
                                       f32_3 %168 = OpLoad %167 
                                       f32_3 %169 = OpFNegate %168 
                                       f32_3 %170 = OpFAdd %164 %169 
                                                      OpStore %127 %170 
                                       f32_3 %172 = OpLoad %127 
                              Uniform f32_3* %173 = OpAccessChain %56 %104 
                                       f32_3 %174 = OpLoad %173 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %171 
                                       f32_4 %177 = OpVectorShuffle %176 %175 0 4 5 6 
                                                      OpStore %171 %177 
                                Private f32* %179 = OpAccessChain %171 %123 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpFMul %180 %181 
                                         f32 %184 = OpFAdd %182 %183 
                                                      OpStore %178 %184 
                                Uniform f32* %186 = OpAccessChain %56 %40 %185 
                                         f32 %187 = OpLoad %186 
                                         f32 %189 = OpFMul %187 %188 
                                         f32 %190 = OpFAdd %189 %183 
                                Private f32* %191 = OpAccessChain %127 %28 
                                                      OpStore %191 %190 
                                         f32 %192 = OpLoad %178 
                                Private f32* %193 = OpAccessChain %127 %28 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpExtInst %1 40 %192 %194 
                                Private f32* %196 = OpAccessChain %171 %28 
                                                      OpStore %196 %195 
                  read_only Texture3DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %171 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 2 3 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                                      OpStore %171 %204 
                                       f32_4 %205 = OpLoad %171 
                                                      OpStore %20 %205 
                                                      OpBranch %122 
                                             %206 = OpLabel 
                                Private f32* %207 = OpAccessChain %20 %28 
                                                      OpStore %207 %112 
                                Private f32* %208 = OpAccessChain %20 %123 
                                                      OpStore %208 %112 
                                Private f32* %209 = OpAccessChain %20 %185 
                                                      OpStore %209 %112 
                                Private f32* %210 = OpAccessChain %20 %22 
                                                      OpStore %210 %112 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_4 %212 = OpLoad %20 
                              Uniform f32_4* %213 = OpAccessChain %56 %39 
                                       f32_4 %214 = OpLoad %213 
                                         f32 %215 = OpDot %212 %214 
                                Private f32* %216 = OpAccessChain %211 %28 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %211 %28 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpExtInst %1 43 %218 %35 %112 
                                Private f32* %220 = OpAccessChain %211 %28 
                                                      OpStore %220 %219 
                                       f32_3 %221 = OpLoad %75 
                                       f32_3 %222 = OpLoad %75 
                                         f32 %223 = OpDot %221 %222 
                                                      OpStore %178 %223 
                  read_only Texture2DSampled %225 = OpLoad %224 
                                         f32 %226 = OpLoad %178 
                                       f32_2 %227 = OpCompositeConstruct %226 %226 
                                       f32_4 %228 = OpImageSampleImplicitLod %225 %227 
                                         f32 %229 = OpCompositeExtract %228 3 
                                                      OpStore %178 %229 
                read_only TextureCubeSampled %234 = OpLoad %233 
                                       f32_3 %235 = OpLoad %75 
                                       f32_4 %236 = OpImageSampleImplicitLod %234 %235 
                                         f32 %237 = OpCompositeExtract %236 3 
                                Private f32* %238 = OpAccessChain %75 %28 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %75 %28 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpLoad %178 
                                         f32 %242 = OpFMul %240 %241 
                                Private f32* %243 = OpAccessChain %75 %28 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %211 %28 
                                         f32 %245 = OpLoad %244 
                                Private f32* %246 = OpAccessChain %75 %28 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFMul %245 %247 
                                Private f32* %249 = OpAccessChain %75 %28 
                                                      OpStore %249 %248 
                                       f32_4 %250 = OpLoad %9 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %253 = OpAccessChain %56 %252 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFMul %251 %255 
                                                      OpStore %211 %256 
                                       f32_3 %259 = OpLoad %75 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 0 0 
                                       f32_3 %261 = OpLoad %211 
                                       f32_3 %262 = OpFMul %260 %261 
                                       f32_4 %263 = OpLoad %258 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                      OpStore %258 %264 
                                Private f32* %265 = OpAccessChain %9 %22 
                                         f32 %266 = OpLoad %265 
                                 Output f32* %268 = OpAccessChain %258 %22 
                                                      OpStore %268 %266 
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
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
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
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %88 %120 %132 %133 %146 %174 %180 
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
                                                      OpDecorate %88 Location 88 
                                                      OpMemberDecorate %118 0 BuiltIn 118 
                                                      OpMemberDecorate %118 1 BuiltIn 118 
                                                      OpMemberDecorate %118 2 BuiltIn 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %132 Location 132 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %174 Location 174 
                                                      OpDecorate %180 Location 180 
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
                                              %86 = OpTypeVector %6 3 
                                              %87 = OpTypePointer Output %86 
                                Output f32_3* %88 = OpVariable Output 
                                             %117 = OpTypeArray %6 %48 
                                             %118 = OpTypeStruct %7 %6 %117 
                                             %119 = OpTypePointer Output %118 
        Output struct {f32_4; f32; f32[1];}* %120 = OpVariable Output 
                                             %128 = OpTypePointer Output %7 
                                             %130 = OpTypeVector %6 2 
                                             %131 = OpTypePointer Output %130 
                               Output f32_2* %132 = OpVariable Output 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 5 
                                             %145 = OpTypePointer Input %86 
                                Input f32_3* %146 = OpVariable Input 
                                         u32 %164 = OpConstant 2 
                                Private f32* %166 = OpVariable Private 
                               Output f32_3* %174 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
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
                               Uniform f32_4* %89 = OpAccessChain %17 %60 %30 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_4 %92 = OpLoad %47 
                                        f32_3 %93 = OpVectorShuffle %92 %92 3 3 3 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                                      OpStore %88 %97 
                                        f32_4 %98 = OpLoad %81 
                                        f32_4 %99 = OpVectorShuffle %98 %98 1 1 1 1 
                              Uniform f32_4* %100 = OpAccessChain %17 %73 %61 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFMul %99 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %17 %73 %60 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %81 
                                       f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %110 = OpAccessChain %17 %73 %73 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %81 
                                       f32_4 %113 = OpVectorShuffle %112 %112 2 2 2 2 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpFAdd %114 %115 
                                                      OpStore %9 %116 
                              Uniform f32_4* %121 = OpAccessChain %17 %73 %30 
                                       f32_4 %122 = OpLoad %121 
                                       f32_4 %123 = OpLoad %81 
                                       f32_4 %124 = OpVectorShuffle %123 %123 3 3 3 3 
                                       f32_4 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %9 
                                       f32_4 %127 = OpFAdd %125 %126 
                               Output f32_4* %129 = OpAccessChain %120 %60 
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
                                       f32_3 %147 = OpLoad %146 
                              Uniform f32_4* %148 = OpAccessChain %17 %61 %60 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %9 %25 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %146 
                              Uniform f32_4* %154 = OpAccessChain %17 %61 %61 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %158 = OpAccessChain %9 %48 
                                                      OpStore %158 %157 
                                       f32_3 %159 = OpLoad %146 
                              Uniform f32_4* %160 = OpAccessChain %17 %61 %73 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %165 = OpAccessChain %9 %164 
                                                      OpStore %165 %163 
                                       f32_4 %167 = OpLoad %9 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %171 = OpDot %168 %170 
                                                      OpStore %166 %171 
                                         f32 %172 = OpLoad %166 
                                         f32 %173 = OpExtInst %1 32 %172 
                                                      OpStore %166 %173 
                                         f32 %175 = OpLoad %166 
                                       f32_3 %176 = OpCompositeConstruct %175 %175 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFMul %176 %178 
                                                      OpStore %174 %179 
                                                      OpStore %180 %182 
                                 Output f32* %184 = OpAccessChain %120 %60 %48 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %120 %60 %48 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 253
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %77 %241 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 ArrayStride 51 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpMemberDecorate %54 0 RelaxedPrecision 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 RelaxedPrecision 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 RelaxedPrecision 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %120 SpecId 120 
                                                      OpDecorate %200 DescriptorSet 200 
                                                      OpDecorate %200 Binding 200 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %221 DescriptorSet 221 
                                                      OpDecorate %221 Binding 221 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %241 Location 241 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
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
                                          f32 %26 = OpConstant 3.67402E-40 
                                          u32 %28 = OpConstant 0 
                                              %30 = OpTypeBool 
                                              %31 = OpTypePointer Private %30 
                                Private bool* %32 = OpVariable Private 
                                          f32 %35 = OpConstant 3.67402E-40 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 0 
                                          i32 %40 = OpConstant 1 
                                          i32 %42 = OpConstant -1 
                                          u32 %50 = OpConstant 4 
                                              %51 = OpTypeArray %7 %50 
                                              %52 = OpTypeVector %6 3 
                                              %53 = OpTypeArray %7 %50 
                                              %54 = OpTypeStruct %7 %7 %51 %52 %52 %7 %53 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 7 
                                              %58 = OpTypePointer Uniform %6 
                                              %74 = OpTypePointer Private %15 
                               Private f32_2* %75 = OpVariable Private 
                                              %76 = OpTypePointer Input %52 
                                 Input f32_3* %77 = OpVariable Input 
                                          i32 %80 = OpConstant 6 
                                              %81 = OpTypePointer Uniform %7 
                                          i32 %94 = OpConstant 2 
                                         i32 %104 = OpConstant 3 
                               Private bool* %109 = OpVariable Private 
                                         f32 %112 = OpConstant 3.67402E-40 
                                        bool %114 = OpConstantFalse 
                                        bool %120 = OpSpecConstantFalse 
                                         u32 %123 = OpConstant 1 
                                             %127 = OpTypePointer Private %52 
                              Private f32_3* %128 = OpVariable Private 
                                             %156 = OpTypePointer Function %52 
                                         i32 %166 = OpConstant 4 
                                             %167 = OpTypePointer Uniform %52 
                              Private f32_4* %172 = OpVariable Private 
                                Private f32* %179 = OpVariable Private 
                                         f32 %182 = OpConstant 3.67402E-40 
                                         f32 %184 = OpConstant 3.67402E-40 
                                Private f32* %186 = OpVariable Private 
                                         u32 %187 = OpConstant 2 
                                         f32 %190 = OpConstant 3.67402E-40 
                                             %197 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %198 = OpTypeSampledImage %197 
                                             %199 = OpTypePointer UniformConstant %198 
 UniformConstant read_only Texture3DSampled* %200 = OpVariable UniformConstant 
                              Private f32_3* %211 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %221 = OpVariable UniformConstant 
                                         i32 %235 = OpConstant 5 
                                             %240 = OpTypePointer Output %7 
                               Output f32_4* %241 = OpVariable Output 
                                             %250 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %157 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %27 = OpFAdd %25 %26 
                                 Private f32* %29 = OpAccessChain %20 %28 
                                                      OpStore %29 %27 
                                 Private f32* %33 = OpAccessChain %20 %28 
                                          f32 %34 = OpLoad %33 
                                         bool %36 = OpFOrdLessThan %34 %35 
                                                      OpStore %32 %36 
                                         bool %37 = OpLoad %32 
                                          i32 %41 = OpSelect %37 %40 %39 
                                          i32 %43 = OpIMul %41 %42 
                                         bool %44 = OpINotEqual %43 %39 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %46 
                                              %45 = OpLabel 
                                                      OpKill
                                              %46 = OpLabel 
                                 Private f32* %48 = OpAccessChain %9 %22 
                                          f32 %49 = OpLoad %48 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %49 %61 
                                 Private f32* %63 = OpAccessChain %20 %28 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %20 %28 
                                          f32 %65 = OpLoad %64 
                                         bool %66 = OpFOrdLessThan %65 %35 
                                                      OpStore %32 %66 
                                         bool %67 = OpLoad %32 
                                          i32 %68 = OpSelect %67 %40 %39 
                                          i32 %69 = OpIMul %68 %42 
                                         bool %70 = OpINotEqual %69 %39 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                                      OpKill
                                              %72 = OpLabel 
                                        f32_3 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 1 1 
                               Uniform f32_4* %82 = OpAccessChain %56 %80 %40 
                                        f32_4 %83 = OpLoad %82 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                        f32_2 %85 = OpFMul %79 %84 
                                                      OpStore %75 %85 
                               Uniform f32_4* %86 = OpAccessChain %56 %80 %39 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_3 %89 = OpLoad %77 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 0 
                                        f32_2 %91 = OpFMul %88 %90 
                                        f32_2 %92 = OpLoad %75 
                                        f32_2 %93 = OpFAdd %91 %92 
                                                      OpStore %75 %93 
                               Uniform f32_4* %95 = OpAccessChain %56 %80 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                        f32_3 %98 = OpLoad %77 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 2 
                                       f32_2 %100 = OpFMul %97 %99 
                                       f32_2 %101 = OpLoad %75 
                                       f32_2 %102 = OpFAdd %100 %101 
                                                      OpStore %75 %102 
                                       f32_2 %103 = OpLoad %75 
                              Uniform f32_4* %105 = OpAccessChain %56 %80 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %103 %107 
                                                      OpStore %75 %108 
                                Uniform f32* %110 = OpAccessChain %56 %40 %28 
                                         f32 %111 = OpLoad %110 
                                        bool %113 = OpFOrdEqual %111 %112 
                                                      OpStore %109 %113 
                                                      OpSelectionMerge %116 None 
                                                      OpBranchConditional %114 %115 %116 
                                             %115 = OpLabel 
                                        bool %117 = OpLoad %109 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpBranch %116 
                                             %116 = OpLabel 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %206 
                                             %121 = OpLabel 
                                Uniform f32* %124 = OpAccessChain %56 %40 %123 
                                         f32 %125 = OpLoad %124 
                                        bool %126 = OpFOrdEqual %125 %112 
                                                      OpStore %109 %126 
                                       f32_3 %129 = OpLoad %77 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %56 %94 %40 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %128 %134 
                              Uniform f32_4* %135 = OpAccessChain %56 %94 %39 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %77 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_3 %141 = OpLoad %128 
                                       f32_3 %142 = OpFAdd %140 %141 
                                                      OpStore %128 %142 
                              Uniform f32_4* %143 = OpAccessChain %56 %94 %94 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpLoad %77 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_3 %149 = OpLoad %128 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %128 %150 
                                       f32_3 %151 = OpLoad %128 
                              Uniform f32_4* %152 = OpAccessChain %56 %94 %104 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFAdd %151 %154 
                                                      OpStore %128 %155 
                                        bool %158 = OpLoad %109 
                                                      OpSelectionMerge %160 None 
                                                      OpBranchConditional %158 %159 %162 
                                             %159 = OpLabel 
                                       f32_3 %161 = OpLoad %128 
                                                      OpStore %157 %161 
                                                      OpBranch %160 
                                             %162 = OpLabel 
                                       f32_3 %163 = OpLoad %77 
                                                      OpStore %157 %163 
                                                      OpBranch %160 
                                             %160 = OpLabel 
                                       f32_3 %164 = OpLoad %157 
                                                      OpStore %128 %164 
                                       f32_3 %165 = OpLoad %128 
                              Uniform f32_3* %168 = OpAccessChain %56 %166 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFNegate %169 
                                       f32_3 %171 = OpFAdd %165 %170 
                                                      OpStore %128 %171 
                                       f32_3 %173 = OpLoad %128 
                              Uniform f32_3* %174 = OpAccessChain %56 %104 
                                       f32_3 %175 = OpLoad %174 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %172 
                                       f32_4 %178 = OpVectorShuffle %177 %176 0 4 5 6 
                                                      OpStore %172 %178 
                                Private f32* %180 = OpAccessChain %172 %123 
                                         f32 %181 = OpLoad %180 
                                         f32 %183 = OpFMul %181 %182 
                                         f32 %185 = OpFAdd %183 %184 
                                                      OpStore %179 %185 
                                Uniform f32* %188 = OpAccessChain %56 %40 %187 
                                         f32 %189 = OpLoad %188 
                                         f32 %191 = OpFMul %189 %190 
                                         f32 %192 = OpFAdd %191 %184 
                                                      OpStore %186 %192 
                                         f32 %193 = OpLoad %186 
                                         f32 %194 = OpLoad %179 
                                         f32 %195 = OpExtInst %1 40 %193 %194 
                                Private f32* %196 = OpAccessChain %172 %28 
                                                      OpStore %196 %195 
                  read_only Texture3DSampled %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %172 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 2 3 
                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                                      OpStore %172 %204 
                                       f32_4 %205 = OpLoad %172 
                                                      OpStore %20 %205 
                                                      OpBranch %122 
                                             %206 = OpLabel 
                                Private f32* %207 = OpAccessChain %20 %28 
                                                      OpStore %207 %112 
                                Private f32* %208 = OpAccessChain %20 %123 
                                                      OpStore %208 %112 
                                Private f32* %209 = OpAccessChain %20 %187 
                                                      OpStore %209 %112 
                                Private f32* %210 = OpAccessChain %20 %22 
                                                      OpStore %210 %112 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_4 %212 = OpLoad %20 
                              Uniform f32_4* %213 = OpAccessChain %56 %39 
                                       f32_4 %214 = OpLoad %213 
                                         f32 %215 = OpDot %212 %214 
                                Private f32* %216 = OpAccessChain %211 %28 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %211 %28 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpExtInst %1 43 %218 %35 %112 
                                Private f32* %220 = OpAccessChain %211 %28 
                                                      OpStore %220 %219 
                  read_only Texture2DSampled %222 = OpLoad %221 
                                       f32_2 %223 = OpLoad %75 
                                       f32_4 %224 = OpImageSampleImplicitLod %222 %223 
                                         f32 %225 = OpCompositeExtract %224 3 
                                Private f32* %226 = OpAccessChain %75 %28 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %211 %28 
                                         f32 %228 = OpLoad %227 
                                Private f32* %229 = OpAccessChain %75 %28 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFMul %228 %230 
                                Private f32* %232 = OpAccessChain %75 %28 
                                                      OpStore %232 %231 
                                       f32_4 %233 = OpLoad %9 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %56 %235 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFMul %234 %238 
                                                      OpStore %211 %239 
                                       f32_2 %242 = OpLoad %75 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpLoad %211 
                                       f32_3 %245 = OpFMul %243 %244 
                                       f32_4 %246 = OpLoad %241 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %241 %247 
                                Private f32* %248 = OpAccessChain %9 %22 
                                         f32 %249 = OpLoad %248 
                                 Output f32* %251 = OpAccessChain %241 %22 
                                                      OpStore %251 %249 
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
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 171281
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
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat1.xyz : u_xlat0.xyz;
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
    vs_TEXCOORD1 = vec4(0.0, 0.0, 0.0, 0.0);
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
float u_xlat1;
bool u_xlatb1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = u_xlat10_0.w + (-_Cutoff);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
    u_xlatb6 = u_xlat6<0.0;
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = unity_OneOverOutputBoost;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
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
; Bound: 234
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %76 %126 %202 %213 %214 %226 
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
                                                      OpDecorate %126 Location 126 
                                                      OpMemberDecorate %200 0 BuiltIn 200 
                                                      OpMemberDecorate %200 1 BuiltIn 200 
                                                      OpMemberDecorate %200 2 BuiltIn 200 
                                                      OpDecorate %200 Block 
                                                      OpDecorate %213 Location 213 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate %226 Location 226 
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
                                Input f32_4* %126 = OpVariable Input 
                                         i32 %129 = OpConstant 3 
                                         i32 %157 = OpConstant 0 
                                         i32 %158 = OpConstant 1 
                                             %199 = OpTypeArray %6 %48 
                                             %200 = OpTypeStruct %7 %6 %199 
                                             %201 = OpTypePointer Output %200 
        Output struct {f32_4; f32; f32[1];}* %202 = OpVariable Output 
                                             %210 = OpTypePointer Output %7 
                                             %212 = OpTypePointer Output %77 
                               Output f32_2* %213 = OpVariable Output 
                                Input f32_4* %214 = OpVariable Input 
                                         i32 %217 = OpConstant 7 
                               Output f32_4* %226 = OpVariable Output 
                                       f32_4 %227 = OpConstantComposite %61 %61 %61 %61 
                                             %228 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %68 = OpVariable Function 
                              Function f32_3* %98 = OpVariable Function 
                               Function f32* %119 = OpVariable Function 
                             Function f32_3* %140 = OpVariable Function 
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
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %9 %115 
                                Private f32* %116 = OpAccessChain %9 %62 
                                         f32 %117 = OpLoad %116 
                                        bool %118 = OpFOrdLessThan %61 %117 
                                                      OpStore %60 %118 
                                        bool %120 = OpLoad %60 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %123 
                                             %121 = OpLabel 
                                                      OpStore %119 %72 
                                                      OpBranch %122 
                                             %123 = OpLabel 
                                                      OpStore %119 %61 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                         f32 %124 = OpLoad %119 
                                Private f32* %125 = OpAccessChain %66 %62 
                                                      OpStore %125 %124 
                                       f32_4 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                              Uniform f32_4* %130 = OpAccessChain %17 %129 
                                       f32_4 %131 = OpLoad %130 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                                       f32_2 %133 = OpFMul %128 %132 
                              Uniform f32_4* %134 = OpAccessChain %17 %129 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 2 3 
                                       f32_2 %137 = OpFAdd %133 %136 
                                       f32_4 %138 = OpLoad %66 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 2 3 
                                                      OpStore %66 %139 
                              Uniform u32_4* %141 = OpAccessChain %17 %99 
                                       u32_4 %142 = OpLoad %141 
                                         u32 %143 = OpCompositeExtract %142 1 
                                        bool %144 = OpINotEqual %143 %25 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %149 
                                             %145 = OpLabel 
                                       f32_4 %147 = OpLoad %66 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                                      OpStore %140 %148 
                                                      OpBranch %146 
                                             %149 = OpLabel 
                                       f32_4 %150 = OpLoad %9 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                                      OpStore %140 %151 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                       f32_3 %152 = OpLoad %140 
                                       f32_4 %153 = OpLoad %9 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                                       f32_4 %156 = OpVectorShuffle %155 %155 1 1 1 1 
                              Uniform f32_4* %159 = OpAccessChain %17 %157 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_4 %161 = OpFMul %156 %160 
                                                      OpStore %66 %161 
                              Uniform f32_4* %162 = OpAccessChain %17 %157 %157 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 0 0 0 0 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %66 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %66 %168 
                              Uniform f32_4* %169 = OpAccessChain %17 %157 %80 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %171 2 2 2 2 
                                       f32_4 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad %66 
                                       f32_4 %175 = OpFAdd %173 %174 
                                                      OpStore %9 %175 
                                       f32_4 %176 = OpLoad %9 
                              Uniform f32_4* %177 = OpAccessChain %17 %157 %129 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFAdd %176 %178 
                                                      OpStore %9 %179 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 1 1 1 
                              Uniform f32_4* %182 = OpAccessChain %17 %158 %158 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %66 %184 
                              Uniform f32_4* %185 = OpAccessChain %17 %158 %157 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %9 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %66 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %66 %191 
                              Uniform f32_4* %192 = OpAccessChain %17 %158 %80 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %9 
                                       f32_4 %195 = OpVectorShuffle %194 %194 2 2 2 2 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %66 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %66 %198 
                              Uniform f32_4* %203 = OpAccessChain %17 %158 %129 
                                       f32_4 %204 = OpLoad %203 
                                       f32_4 %205 = OpLoad %9 
                                       f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
                                       f32_4 %207 = OpFMul %204 %206 
                                       f32_4 %208 = OpLoad %66 
                                       f32_4 %209 = OpFAdd %207 %208 
                               Output f32_4* %211 = OpAccessChain %202 %157 
                                                      OpStore %211 %209 
                                       f32_4 %215 = OpLoad %214 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                              Uniform f32_4* %218 = OpAccessChain %17 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
                                       f32_2 %221 = OpFMul %216 %220 
                              Uniform f32_4* %222 = OpAccessChain %17 %217 
                                       f32_4 %223 = OpLoad %222 
                                       f32_2 %224 = OpVectorShuffle %223 %223 2 3 
                                       f32_2 %225 = OpFAdd %221 %224 
                                                      OpStore %213 %225 
                                                      OpStore %226 %227 
                                 Output f32* %229 = OpAccessChain %202 %157 %48 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFNegate %230 
                                 Output f32* %232 = OpAccessChain %202 %157 %48 
                                                      OpStore %232 %231 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 146
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %132 
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
                                                    OpMemberDecorate %48 3 RelaxedPrecision 
                                                    OpMemberDecorate %48 3 Offset 48 
                                                    OpDecorate %48 Block 
                                                    OpDecorate %50 DescriptorSet 50 
                                                    OpDecorate %50 Binding 50 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %132 RelaxedPrecision 
                                                    OpDecorate %132 Location 132 
                                                    OpDecorate %143 RelaxedPrecision 
                                                    OpDecorate %144 RelaxedPrecision 
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
                                            %48 = OpTypeStruct %47 %6 %6 %6 
                                            %49 = OpTypePointer Uniform %48 
    Uniform struct {u32_4; f32; f32; f32;}* %50 = OpVariable Uniform 
                                        i32 %51 = OpConstant 3 
                                            %52 = OpTypePointer Uniform %6 
                             Private f32_4* %57 = OpVariable Private 
                                            %58 = OpTypeVector %6 3 
                              Private bool* %64 = OpVariable Private 
                               Private f32* %74 = OpVariable Private 
                                        f32 %78 = OpConstant 3.67402E-40 
                                            %80 = OpTypePointer Private %58 
                             Private f32_3* %81 = OpVariable Private 
                                        i32 %90 = OpConstant 2 
                                           %103 = OpTypePointer Function %58 
                                           %105 = OpTypeVector %28 4 
                                           %106 = OpTypePointer Uniform %47 
                                       u32 %110 = OpConstant 0 
                                     f32_3 %116 = OpConstantComposite %32 %32 %32 
                                           %120 = OpTypePointer Function %6 
                                           %131 = OpTypePointer Output %7 
                             Output f32_4* %132 = OpVariable Output 
                                           %133 = OpTypePointer Function %7 
                                     f32_4 %141 = OpConstantComposite %32 %32 %32 %78 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                           Function f32_3* %104 = OpVariable Function 
                             Function f32* %121 = OpVariable Function 
                           Function f32_4* %134 = OpVariable Function 
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
                                      f32_4 %59 = OpLoad %9 
                                      f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                      f32_3 %61 = OpExtInst %1 30 %60 
                                      f32_4 %62 = OpLoad %57 
                                      f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                    OpStore %57 %63 
                                        f32 %65 = OpLoad %21 
                                       bool %66 = OpFOrdLessThan %65 %32 
                                                    OpStore %64 %66 
                                       bool %67 = OpLoad %64 
                                        i32 %68 = OpSelect %67 %37 %36 
                                        i32 %69 = OpIMul %68 %39 
                                       bool %70 = OpINotEqual %69 %36 
                                                    OpSelectionMerge %72 None 
                                                    OpBranchConditional %70 %71 %72 
                                            %71 = OpLabel 
                                                    OpKill
                                            %72 = OpLabel 
                               Uniform f32* %75 = OpAccessChain %50 %37 
                                        f32 %76 = OpLoad %75 
                                                    OpStore %74 %76 
                                        f32 %77 = OpLoad %74 
                                        f32 %79 = OpExtInst %1 43 %77 %32 %78 
                                                    OpStore %74 %79 
                                      f32_4 %82 = OpLoad %57 
                                      f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32 %84 = OpLoad %74 
                                      f32_3 %85 = OpCompositeConstruct %84 %84 %84 
                                      f32_3 %86 = OpFMul %83 %85 
                                                    OpStore %81 %86 
                                      f32_3 %87 = OpLoad %81 
                                      f32_3 %88 = OpExtInst %1 29 %87 
                                                    OpStore %81 %88 
                                      f32_3 %89 = OpLoad %81 
                               Uniform f32* %91 = OpAccessChain %50 %90 
                                        f32 %92 = OpLoad %91 
                               Uniform f32* %93 = OpAccessChain %50 %90 
                                        f32 %94 = OpLoad %93 
                               Uniform f32* %95 = OpAccessChain %50 %90 
                                        f32 %96 = OpLoad %95 
                                      f32_3 %97 = OpCompositeConstruct %92 %94 %96 
                                        f32 %98 = OpCompositeExtract %97 0 
                                        f32 %99 = OpCompositeExtract %97 1 
                                       f32 %100 = OpCompositeExtract %97 2 
                                     f32_3 %101 = OpCompositeConstruct %98 %99 %100 
                                     f32_3 %102 = OpExtInst %1 37 %89 %101 
                                                    OpStore %81 %102 
                            Uniform u32_4* %107 = OpAccessChain %50 %36 
                                     u32_4 %108 = OpLoad %107 
                                       u32 %109 = OpCompositeExtract %108 0 
                                      bool %111 = OpINotEqual %109 %110 
                                                    OpSelectionMerge %113 None 
                                                    OpBranchConditional %111 %112 %115 
                                           %112 = OpLabel 
                                     f32_3 %114 = OpLoad %81 
                                                    OpStore %104 %114 
                                                    OpBranch %113 
                                           %115 = OpLabel 
                                                    OpStore %104 %116 
                                                    OpBranch %113 
                                           %113 = OpLabel 
                                     f32_3 %117 = OpLoad %104 
                                     f32_4 %118 = OpLoad %57 
                                     f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                    OpStore %57 %119 
                            Uniform u32_4* %122 = OpAccessChain %50 %36 
                                     u32_4 %123 = OpLoad %122 
                                       u32 %124 = OpCompositeExtract %123 0 
                                      bool %125 = OpINotEqual %124 %110 
                                                    OpSelectionMerge %127 None 
                                                    OpBranchConditional %125 %126 %128 
                                           %126 = OpLabel 
                                                    OpStore %121 %78 
                                                    OpBranch %127 
                                           %128 = OpLabel 
                                                    OpStore %121 %32 
                                                    OpBranch %127 
                                           %127 = OpLabel 
                                       f32 %129 = OpLoad %121 
                              Private f32* %130 = OpAccessChain %57 %23 
                                                    OpStore %130 %129 
                            Uniform u32_4* %135 = OpAccessChain %50 %36 
                                     u32_4 %136 = OpLoad %135 
                                       u32 %137 = OpCompositeExtract %136 1 
                                      bool %138 = OpINotEqual %137 %110 
                                                    OpSelectionMerge %140 None 
                                                    OpBranchConditional %138 %139 %142 
                                           %139 = OpLabel 
                                                    OpStore %134 %141 
                                                    OpBranch %140 
                                           %142 = OpLabel 
                                     f32_4 %143 = OpLoad %57 
                                                    OpStore %134 %143 
                                                    OpBranch %140 
                                           %140 = OpLabel 
                                     f32_4 %144 = OpLoad %134 
                                                    OpStore %132 %144 
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
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  Stencil {
   Ref 1
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 229727
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
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat1.x = in_POSITION0.z + -0.0625;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + vec4(0.0, 0.0, 0.0250000004, 0.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0 + vec4(0.0, 0.0, -0.0625, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0 = (-vs_TEXCOORD1.y) * 0.333333343 + 1.0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat0 * u_xlat10_1.w + -0.100000001;
    u_xlat0 = u_xlat0 * u_xlat10_1.w;
    SV_Target0.w = u_xlat0;
    u_xlatb0 = u_xlat2<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = vec3(0.0500000007, 0.0250000004, 0.0250000004);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 115
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %89 %101 %102 %105 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %87 0 BuiltIn 87 
                                              OpMemberDecorate %87 1 BuiltIn 87 
                                              OpMemberDecorate %87 2 BuiltIn 87 
                                              OpDecorate %87 Block 
                                              OpDecorate %101 Location 101 
                                              OpDecorate %102 Location 102 
                                              OpDecorate %105 Location 105 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                       Private f32_4* %35 = OpVariable Private 
                                  u32 %36 = OpConstant 2 
                                      %37 = OpTypePointer Input %6 
                                  f32 %40 = OpConstant 3.67402E-40 
                                  u32 %42 = OpConstant 0 
                                      %43 = OpTypePointer Private %6 
                                  i32 %45 = OpConstant 2 
                                  i32 %53 = OpConstant 3 
                                  f32 %62 = OpConstant 3.67402E-40 
                                  f32 %63 = OpConstant 3.67402E-40 
                                f32_4 %64 = OpConstantComposite %62 %62 %63 %62 
                                  u32 %85 = OpConstant 1 
                                      %86 = OpTypeArray %6 %85 
                                      %87 = OpTypeStruct %7 %6 %86 
                                      %88 = OpTypePointer Output %87 
 Output struct {f32_4; f32; f32[1];}* %89 = OpVariable Output 
                                      %97 = OpTypePointer Output %7 
                                      %99 = OpTypeVector %6 2 
                                     %100 = OpTypePointer Output %99 
                       Output f32_2* %101 = OpVariable Output 
                        Input f32_4* %102 = OpVariable Input 
                       Output f32_4* %105 = OpVariable Output 
                               f32_4 %107 = OpConstantComposite %62 %62 %40 %62 
                                     %109 = OpTypePointer Output %6 
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
                           Input f32* %38 = OpAccessChain %11 %36 
                                  f32 %39 = OpLoad %38 
                                  f32 %41 = OpFAdd %39 %40 
                         Private f32* %44 = OpAccessChain %35 %42 
                                              OpStore %44 %41 
                       Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                f32_4 %47 = OpLoad %46 
                                f32_4 %48 = OpLoad %35 
                                f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
                                f32_4 %50 = OpFMul %47 %49 
                                f32_4 %51 = OpLoad %9 
                                f32_4 %52 = OpFAdd %50 %51 
                                              OpStore %9 %52 
                       Uniform f32_4* %54 = OpAccessChain %20 %22 %53 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %11 
                                f32_4 %57 = OpVectorShuffle %56 %56 3 3 3 3 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %9 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %9 %60 
                                f32_4 %61 = OpLoad %9 
                                f32_4 %65 = OpFAdd %61 %64 
                                              OpStore %9 %65 
                                f32_4 %66 = OpLoad %9 
                                f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %23 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpFMul %67 %69 
                                              OpStore %35 %70 
                       Uniform f32_4* %71 = OpAccessChain %20 %23 %22 
                                f32_4 %72 = OpLoad %71 
                                f32_4 %73 = OpLoad %9 
                                f32_4 %74 = OpVectorShuffle %73 %73 0 0 0 0 
                                f32_4 %75 = OpFMul %72 %74 
                                f32_4 %76 = OpLoad %35 
                                f32_4 %77 = OpFAdd %75 %76 
                                              OpStore %35 %77 
                       Uniform f32_4* %78 = OpAccessChain %20 %23 %45 
                                f32_4 %79 = OpLoad %78 
                                f32_4 %80 = OpLoad %9 
                                f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                f32_4 %82 = OpFMul %79 %81 
                                f32_4 %83 = OpLoad %35 
                                f32_4 %84 = OpFAdd %82 %83 
                                              OpStore %35 %84 
                       Uniform f32_4* %90 = OpAccessChain %20 %23 %53 
                                f32_4 %91 = OpLoad %90 
                                f32_4 %92 = OpLoad %9 
                                f32_4 %93 = OpVectorShuffle %92 %92 3 3 3 3 
                                f32_4 %94 = OpFMul %91 %93 
                                f32_4 %95 = OpLoad %35 
                                f32_4 %96 = OpFAdd %94 %95 
                        Output f32_4* %98 = OpAccessChain %89 %22 
                                              OpStore %98 %96 
                               f32_4 %103 = OpLoad %102 
                               f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                              OpStore %101 %104 
                               f32_4 %106 = OpLoad %11 
                               f32_4 %108 = OpFAdd %106 %107 
                                              OpStore %105 %108 
                         Output f32* %110 = OpAccessChain %89 %22 %85 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpFNegate %111 
                         Output f32* %113 = OpAccessChain %89 %22 %85 
                                              OpStore %113 %112 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 77
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %33 %74 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 DescriptorSet 29 
                                                    OpDecorate %29 Binding 29 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %33 Location 33 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %74 Location 74 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeVector %6 4 
                                            %10 = OpTypePointer Input %9 
                               Input f32_4* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 1 
                                            %14 = OpTypePointer Input %6 
                                        f32 %18 = OpConstant 3.67402E-40 
                                        f32 %20 = OpConstant 3.67402E-40 
                                        f32 %23 = OpConstant 3.67402E-40 
                               Private f32* %25 = OpVariable Private 
                                            %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %27 = OpTypeSampledImage %26 
                                            %28 = OpTypePointer UniformConstant %27 
UniformConstant read_only Texture2DSampled* %29 = OpVariable UniformConstant 
                                            %31 = OpTypeVector %6 2 
                                            %32 = OpTypePointer Input %31 
                               Input f32_2* %33 = OpVariable Input 
                                        u32 %36 = OpConstant 3 
                               Private f32* %38 = OpVariable Private 
                                        f32 %42 = OpConstant 3.67402E-40 
                                            %44 = OpTypePointer Private %9 
                             Private f32_4* %45 = OpVariable Private 
                                            %50 = OpTypeBool 
                                            %51 = OpTypePointer Private %50 
                              Private bool* %52 = OpVariable Private 
                                            %56 = OpTypeInt 32 1 
                                        i32 %57 = OpConstant 0 
                                        i32 %58 = OpConstant 1 
                                        i32 %60 = OpConstant -1 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        u32 %67 = OpConstant 0 
                                        f32 %69 = OpConstant 3.67402E-40 
                                        u32 %71 = OpConstant 2 
                                            %73 = OpTypePointer Output %9 
                              Output f32_4* %74 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                                        f32 %17 = OpFNegate %16 
                                        f32 %19 = OpFMul %17 %18 
                                        f32 %21 = OpFAdd %19 %20 
                                                    OpStore %8 %21 
                                        f32 %22 = OpLoad %8 
                                        f32 %24 = OpExtInst %1 43 %22 %23 %20 
                                                    OpStore %8 %24 
                 read_only Texture2DSampled %30 = OpLoad %29 
                                      f32_2 %34 = OpLoad %33 
                                      f32_4 %35 = OpImageSampleImplicitLod %30 %34 
                                        f32 %37 = OpCompositeExtract %35 3 
                                                    OpStore %25 %37 
                                        f32 %39 = OpLoad %8 
                                        f32 %40 = OpLoad %25 
                                        f32 %41 = OpFMul %39 %40 
                                        f32 %43 = OpFAdd %41 %42 
                                                    OpStore %38 %43 
                                        f32 %46 = OpLoad %25 
                                        f32 %47 = OpLoad %8 
                                        f32 %48 = OpFMul %46 %47 
                               Private f32* %49 = OpAccessChain %45 %36 
                                                    OpStore %49 %48 
                                        f32 %53 = OpLoad %38 
                                       bool %54 = OpFOrdLessThan %53 %23 
                                                    OpStore %52 %54 
                                       bool %55 = OpLoad %52 
                                        i32 %59 = OpSelect %55 %58 %57 
                                        i32 %61 = OpIMul %59 %60 
                                       bool %62 = OpINotEqual %61 %57 
                                                    OpSelectionMerge %64 None 
                                                    OpBranchConditional %62 %63 %64 
                                            %63 = OpLabel 
                                                    OpKill
                                            %64 = OpLabel 
                               Private f32* %68 = OpAccessChain %45 %67 
                                                    OpStore %68 %66 
                               Private f32* %70 = OpAccessChain %45 %13 
                                                    OpStore %70 %69 
                               Private f32* %72 = OpAccessChain %45 %71 
                                                    OpStore %72 %69 
                                      f32_4 %75 = OpLoad %45 
                                                    OpStore %74 %75 
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