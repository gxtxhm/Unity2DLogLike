//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Special/Rat Blender" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_SubTex ("Blend Tex", 2D) = "white" { }
_BlendTex ("Yeah", 2D) = "black" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_BlendMin ("Blend min", Range(0, 1)) = 0
_BaseWorldPosition ("Base Pos", Vector) = (0,0,0,0)
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
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 61789
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %46 %261 %264 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %141 SpecId 141 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeStruct %7 %7 %18 %10 %10 %7 %6 %7 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                               Private f32_4* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_2* %46 = OpVariable Input 
                               Private f32_4* %49 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %56 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                          u32 %62 = OpConstant 0 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                               Private f32_4* %77 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 3 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 0 
                                         i32 %104 = OpConstant 1 
                                         i32 %106 = OpConstant -1 
                                             %112 = OpTypePointer Private %10 
                              Private f32_3* %113 = OpVariable Private 
                                         i32 %116 = OpConstant 8 
                                        bool %135 = OpConstantFalse 
                                        bool %141 = OpSpecConstantFalse 
                                         u32 %144 = OpConstant 1 
                              Private f32_3* %148 = OpVariable Private 
                                         i32 %151 = OpConstant 2 
                                         i32 %173 = OpConstant 3 
                                             %178 = OpTypePointer Function %10 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %10 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %224 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %225 = OpTypeSampledImage %224 
                                             %226 = OpTypePointer UniformConstant %225 
 UniformConstant read_only Texture3DSampled* %227 = OpVariable UniformConstant 
                              Private f32_4* %232 = OpVariable Private 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %251 = OpConstant 5 
                                             %260 = OpTypePointer Output %7 
                               Output f32_4* %261 = OpVariable Output 
                                Input f32_3* %264 = OpVariable Input 
                                             %273 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFNegate %27 
                                        f32_2 %29 = OpFAdd %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_2 %47 = OpLoad %46 
                                        f32_4 %48 = OpImageSampleImplicitLod %44 %47 
                                                      OpStore %39 %48 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                      OpStore %49 %54 
                   read_only Texture2DSampled %58 = OpLoad %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                          f32 %63 = OpCompositeExtract %61 0 
                                                      OpStore %56 %63 
                                          f32 %64 = OpLoad %56 
                                 Uniform f32* %67 = OpAccessChain %21 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 40 %64 %68 
                                 Private f32* %70 = OpAccessChain %9 %62 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %62 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %9 %62 
                                                      OpStore %76 %75 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpLoad %49 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %77 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                        f32_4 %84 = OpLoad %77 
                                        f32_4 %85 = OpFMul %83 %84 
                                        f32_4 %86 = OpLoad %39 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                 Private f32* %90 = OpAccessChain %9 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %88 %62 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %88 %62 
                                          f32 %99 = OpLoad %98 
                                        bool %101 = OpFOrdLessThan %99 %100 
                                                      OpStore %97 %101 
                                        bool %102 = OpLoad %97 
                                         i32 %105 = OpSelect %102 %104 %103 
                                         i32 %107 = OpIMul %105 %106 
                                        bool %108 = OpINotEqual %107 %103 
                                                      OpSelectionMerge %110 None 
                                                      OpBranchConditional %108 %109 %110 
                                             %109 = OpLabel 
                                                      OpKill
                                             %110 = OpLabel 
                                Private f32* %114 = OpAccessChain %9 %89 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %21 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                Private f32* %121 = OpAccessChain %113 %62 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %113 %62 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdLessThan %123 %100 
                                                      OpStore %97 %124 
                                        bool %125 = OpLoad %97 
                                         i32 %126 = OpSelect %125 %104 %103 
                                         i32 %127 = OpIMul %126 %106 
                                        bool %128 = OpINotEqual %127 %103 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpKill
                                             %130 = OpLabel 
                                Uniform f32* %132 = OpAccessChain %21 %104 %62 
                                         f32 %133 = OpLoad %132 
                                        bool %134 = OpFOrdEqual %133 %74 
                                                      OpStore %97 %134 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                        bool %138 = OpLoad %97 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %234 
                                             %142 = OpLabel 
                                Uniform f32* %145 = OpAccessChain %21 %104 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdEqual %146 %74 
                                                      OpStore %97 %147 
                                       f32_3 %149 = OpLoad %12 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 1 1 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 %104 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %150 %154 
                                                      OpStore %148 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %151 %103 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %12 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_3 %162 = OpLoad %148 
                                       f32_3 %163 = OpFAdd %161 %162 
                                                      OpStore %148 %163 
                              Uniform f32_4* %164 = OpAccessChain %21 %151 %151 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpLoad %12 
                                       f32_3 %168 = OpVectorShuffle %167 %167 2 2 2 
                                       f32_3 %169 = OpFMul %166 %168 
                                       f32_3 %170 = OpLoad %148 
                                       f32_3 %171 = OpFAdd %169 %170 
                                                      OpStore %148 %171 
                                       f32_3 %172 = OpLoad %148 
                              Uniform f32_4* %174 = OpAccessChain %21 %151 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %172 %176 
                                                      OpStore %148 %177 
                                        bool %180 = OpLoad %97 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %148 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %12 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                       f32_4 %187 = OpLoad %88 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %88 %188 
                                       f32_4 %189 = OpLoad %88 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                       f32_4 %197 = OpLoad %88 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %88 %198 
                                       f32_4 %199 = OpLoad %88 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_3* %201 = OpAccessChain %21 %173 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %88 
                                       f32_4 %205 = OpVectorShuffle %204 %203 0 4 5 6 
                                                      OpStore %88 %205 
                                Private f32* %206 = OpAccessChain %88 %144 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %34 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %148 %62 
                                                      OpStore %211 %210 
                                Uniform f32* %214 = OpAccessChain %21 %104 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %209 
                                                      OpStore %212 %218 
                                Private f32* %219 = OpAccessChain %148 %62 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                Private f32* %223 = OpAccessChain %88 %62 
                                                      OpStore %223 %222 
                  read_only Texture3DSampled %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %88 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 2 3 
                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
                                                      OpStore %88 %231 
                                       f32_4 %233 = OpLoad %88 
                                                      OpStore %232 %233 
                                                      OpBranch %143 
                                             %234 = OpLabel 
                                Private f32* %235 = OpAccessChain %232 %62 
                                                      OpStore %235 %74 
                                Private f32* %236 = OpAccessChain %232 %144 
                                                      OpStore %236 %74 
                                Private f32* %237 = OpAccessChain %232 %213 
                                                      OpStore %237 %74 
                                Private f32* %238 = OpAccessChain %232 %89 
                                                      OpStore %238 %74 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %239 = OpLoad %232 
                              Uniform f32_4* %240 = OpAccessChain %21 %103 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %113 %62 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %113 %62 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 43 %245 %100 %74 
                                Private f32* %247 = OpAccessChain %113 %62 
                                                      OpStore %247 %246 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %21 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_3 %255 = OpFMul %250 %254 
                                                      OpStore %248 %255 
                                       f32_3 %256 = OpLoad %113 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 0 0 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %113 %259 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %265 = OpLoad %264 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_3 %267 = OpLoad %113 
                                       f32_3 %268 = OpFAdd %266 %267 
                                       f32_4 %269 = OpLoad %261 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %261 %270 
                                Private f32* %271 = OpAccessChain %9 %89 
                                         f32 %272 = OpLoad %271 
                                 Output f32* %274 = OpAccessChain %261 %89 
                                                      OpStore %274 %272 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %46 %261 %264 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %141 SpecId 141 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeStruct %7 %7 %18 %10 %10 %7 %6 %7 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                               Private f32_4* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_2* %46 = OpVariable Input 
                               Private f32_4* %49 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %56 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                          u32 %62 = OpConstant 0 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                               Private f32_4* %77 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 3 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 0 
                                         i32 %104 = OpConstant 1 
                                         i32 %106 = OpConstant -1 
                                             %112 = OpTypePointer Private %10 
                              Private f32_3* %113 = OpVariable Private 
                                         i32 %116 = OpConstant 8 
                                        bool %135 = OpConstantFalse 
                                        bool %141 = OpSpecConstantFalse 
                                         u32 %144 = OpConstant 1 
                              Private f32_3* %148 = OpVariable Private 
                                         i32 %151 = OpConstant 2 
                                         i32 %173 = OpConstant 3 
                                             %178 = OpTypePointer Function %10 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %10 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %224 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %225 = OpTypeSampledImage %224 
                                             %226 = OpTypePointer UniformConstant %225 
 UniformConstant read_only Texture3DSampled* %227 = OpVariable UniformConstant 
                              Private f32_4* %232 = OpVariable Private 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %251 = OpConstant 5 
                                             %260 = OpTypePointer Output %7 
                               Output f32_4* %261 = OpVariable Output 
                                Input f32_3* %264 = OpVariable Input 
                                             %273 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFNegate %27 
                                        f32_2 %29 = OpFAdd %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_2 %47 = OpLoad %46 
                                        f32_4 %48 = OpImageSampleImplicitLod %44 %47 
                                                      OpStore %39 %48 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                      OpStore %49 %54 
                   read_only Texture2DSampled %58 = OpLoad %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                          f32 %63 = OpCompositeExtract %61 0 
                                                      OpStore %56 %63 
                                          f32 %64 = OpLoad %56 
                                 Uniform f32* %67 = OpAccessChain %21 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 40 %64 %68 
                                 Private f32* %70 = OpAccessChain %9 %62 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %62 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %9 %62 
                                                      OpStore %76 %75 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpLoad %49 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %77 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                        f32_4 %84 = OpLoad %77 
                                        f32_4 %85 = OpFMul %83 %84 
                                        f32_4 %86 = OpLoad %39 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                 Private f32* %90 = OpAccessChain %9 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %88 %62 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %88 %62 
                                          f32 %99 = OpLoad %98 
                                        bool %101 = OpFOrdLessThan %99 %100 
                                                      OpStore %97 %101 
                                        bool %102 = OpLoad %97 
                                         i32 %105 = OpSelect %102 %104 %103 
                                         i32 %107 = OpIMul %105 %106 
                                        bool %108 = OpINotEqual %107 %103 
                                                      OpSelectionMerge %110 None 
                                                      OpBranchConditional %108 %109 %110 
                                             %109 = OpLabel 
                                                      OpKill
                                             %110 = OpLabel 
                                Private f32* %114 = OpAccessChain %9 %89 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %21 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                Private f32* %121 = OpAccessChain %113 %62 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %113 %62 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdLessThan %123 %100 
                                                      OpStore %97 %124 
                                        bool %125 = OpLoad %97 
                                         i32 %126 = OpSelect %125 %104 %103 
                                         i32 %127 = OpIMul %126 %106 
                                        bool %128 = OpINotEqual %127 %103 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpKill
                                             %130 = OpLabel 
                                Uniform f32* %132 = OpAccessChain %21 %104 %62 
                                         f32 %133 = OpLoad %132 
                                        bool %134 = OpFOrdEqual %133 %74 
                                                      OpStore %97 %134 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                        bool %138 = OpLoad %97 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %234 
                                             %142 = OpLabel 
                                Uniform f32* %145 = OpAccessChain %21 %104 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdEqual %146 %74 
                                                      OpStore %97 %147 
                                       f32_3 %149 = OpLoad %12 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 1 1 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 %104 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %150 %154 
                                                      OpStore %148 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %151 %103 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %12 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_3 %162 = OpLoad %148 
                                       f32_3 %163 = OpFAdd %161 %162 
                                                      OpStore %148 %163 
                              Uniform f32_4* %164 = OpAccessChain %21 %151 %151 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpLoad %12 
                                       f32_3 %168 = OpVectorShuffle %167 %167 2 2 2 
                                       f32_3 %169 = OpFMul %166 %168 
                                       f32_3 %170 = OpLoad %148 
                                       f32_3 %171 = OpFAdd %169 %170 
                                                      OpStore %148 %171 
                                       f32_3 %172 = OpLoad %148 
                              Uniform f32_4* %174 = OpAccessChain %21 %151 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %172 %176 
                                                      OpStore %148 %177 
                                        bool %180 = OpLoad %97 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %148 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %12 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                       f32_4 %187 = OpLoad %88 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %88 %188 
                                       f32_4 %189 = OpLoad %88 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                       f32_4 %197 = OpLoad %88 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %88 %198 
                                       f32_4 %199 = OpLoad %88 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_3* %201 = OpAccessChain %21 %173 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %88 
                                       f32_4 %205 = OpVectorShuffle %204 %203 0 4 5 6 
                                                      OpStore %88 %205 
                                Private f32* %206 = OpAccessChain %88 %144 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %34 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %148 %62 
                                                      OpStore %211 %210 
                                Uniform f32* %214 = OpAccessChain %21 %104 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %209 
                                                      OpStore %212 %218 
                                Private f32* %219 = OpAccessChain %148 %62 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                Private f32* %223 = OpAccessChain %88 %62 
                                                      OpStore %223 %222 
                  read_only Texture3DSampled %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %88 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 2 3 
                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
                                                      OpStore %88 %231 
                                       f32_4 %233 = OpLoad %88 
                                                      OpStore %232 %233 
                                                      OpBranch %143 
                                             %234 = OpLabel 
                                Private f32* %235 = OpAccessChain %232 %62 
                                                      OpStore %235 %74 
                                Private f32* %236 = OpAccessChain %232 %144 
                                                      OpStore %236 %74 
                                Private f32* %237 = OpAccessChain %232 %213 
                                                      OpStore %237 %74 
                                Private f32* %238 = OpAccessChain %232 %89 
                                                      OpStore %238 %74 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %239 = OpLoad %232 
                              Uniform f32_4* %240 = OpAccessChain %21 %103 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %113 %62 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %113 %62 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 43 %245 %100 %74 
                                Private f32* %247 = OpAccessChain %113 %62 
                                                      OpStore %247 %246 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %21 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_3 %255 = OpFMul %250 %254 
                                                      OpStore %248 %255 
                                       f32_3 %256 = OpLoad %113 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 0 0 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %113 %259 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %265 = OpLoad %264 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_3 %267 = OpLoad %113 
                                       f32_3 %268 = OpFAdd %266 %267 
                                       f32_4 %269 = OpLoad %261 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %261 %270 
                                Private f32* %271 = OpAccessChain %9 %89 
                                         f32 %272 = OpLoad %271 
                                 Output f32* %274 = OpAccessChain %261 %89 
                                                      OpStore %274 %272 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 399
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %332 %384 %387 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 RelaxedPrecision 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 RelaxedPrecision 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpMemberDecorate %20 10 Offset 20 
                                                      OpMemberDecorate %20 11 Offset 20 
                                                      OpMemberDecorate %20 12 RelaxedPrecision 
                                                      OpMemberDecorate %20 12 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %214 SpecId 214 
                                                      OpDecorate %311 DescriptorSet 311 
                                                      OpDecorate %311 Binding 311 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %332 Location 332 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 DescriptorSet 339 
                                                      OpDecorate %339 Binding 339 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %384 Location 384 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %387 Location 387 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %10 %7 %7 %7 %18 %7 %19 %10 %10 %7 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 11 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 10 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 12 
                                             %135 = OpTypePointer Uniform %10 
                              Private f32_4* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 4 
                                         u32 %141 = OpConstant 2 
                                         u32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant 2 
                              Private f32_3* %158 = OpVariable Private 
                                         i32 %160 = OpConstant 3 
                               Private bool* %203 = OpVariable Private 
                                         i32 %204 = OpConstant 5 
                                        bool %208 = OpConstantFalse 
                                        bool %214 = OpSpecConstantFalse 
                               Private bool* %217 = OpVariable Private 
                                         i32 %223 = OpConstant 6 
                                             %260 = OpTypePointer Function %10 
                                         i32 %274 = OpConstant 8 
                                         i32 %283 = OpConstant 7 
                                             %289 = OpTypePointer Private %13 
                              Private f32_2* %290 = OpVariable Private 
                                         f32 %294 = OpConstant 3.67402E-40 
                                Private f32* %297 = OpVariable Private 
                                         f32 %300 = OpConstant 3.67402E-40 
                                             %308 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %309 = OpTypeSampledImage %308 
                                             %310 = OpTypePointer UniformConstant %309 
 UniformConstant read_only Texture3DSampled* %311 = OpVariable UniformConstant 
                                             %331 = OpTypePointer Input %7 
                                Input f32_4* %332 = OpVariable Input 
                                Private f32* %338 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %339 = OpVariable UniformConstant 
                              Private f32_3* %344 = OpVariable Private 
                                             %360 = OpTypePointer Function %6 
                                         i32 %374 = OpConstant 9 
                                             %383 = OpTypePointer Output %7 
                               Output f32_4* %384 = OpVariable Output 
                                Input f32_3* %387 = OpVariable Input 
                                             %396 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %261 = OpVariable Function 
                               Function f32* %361 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpFNegate %133 
                              Uniform f32_3* %136 = OpAccessChain %22 %105 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFAdd %134 %137 
                                                      OpStore %90 %138 
                                Uniform f32* %142 = OpAccessChain %22 %140 %105 %141 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %139 %63 
                                                      OpStore %144 %143 
                                Uniform f32* %145 = OpAccessChain %22 %140 %106 %141 
                                         f32 %146 = OpLoad %145 
                                Private f32* %148 = OpAccessChain %139 %147 
                                                      OpStore %148 %146 
                                Uniform f32* %150 = OpAccessChain %22 %140 %149 %141 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %139 %141 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %90 
                                       f32_4 %154 = OpLoad %139 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %153 %155 
                                Private f32* %157 = OpAccessChain %90 %63 
                                                      OpStore %157 %156 
                                       f32_3 %159 = OpLoad %12 
                              Uniform f32_4* %161 = OpAccessChain %22 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFNegate %163 
                                       f32_3 %165 = OpFAdd %159 %164 
                                                      OpStore %158 %165 
                                       f32_3 %166 = OpLoad %158 
                                       f32_3 %167 = OpLoad %158 
                                         f32 %168 = OpDot %166 %167 
                                Private f32* %169 = OpAccessChain %158 %63 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %158 %63 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpExtInst %1 31 %171 
                                Private f32* %173 = OpAccessChain %158 %63 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %90 %63 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %158 %63 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                Private f32* %180 = OpAccessChain %158 %63 
                                                      OpStore %180 %179 
                                Uniform f32* %181 = OpAccessChain %22 %160 %91 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %158 %63 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                Private f32* %186 = OpAccessChain %90 %63 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %189 = OpAccessChain %90 %63 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %90 %63 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %22 %149 %141 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Uniform f32* %195 = OpAccessChain %22 %149 %91 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFAdd %194 %196 
                                Private f32* %198 = OpAccessChain %90 %63 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %90 %63 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpExtInst %1 43 %200 %102 %75 
                                Private f32* %202 = OpAccessChain %90 %63 
                                                      OpStore %202 %201 
                                Uniform f32* %205 = OpAccessChain %22 %204 %63 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdEqual %206 %75 
                                                      OpStore %203 %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %210 
                                             %209 = OpLabel 
                                        bool %211 = OpLoad %203 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %211 %212 %213 
                                             %212 = OpLabel 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %317 
                                             %215 = OpLabel 
                                Uniform f32* %218 = OpAccessChain %22 %204 %147 
                                         f32 %219 = OpLoad %218 
                                        bool %220 = OpFOrdEqual %219 %75 
                                                      OpStore %217 %220 
                                       f32_3 %221 = OpLoad %12 
                                       f32_3 %222 = OpVectorShuffle %221 %221 1 1 1 
                              Uniform f32_4* %224 = OpAccessChain %22 %223 %106 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %222 %226 
                                       f32_4 %228 = OpLoad %139 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %139 %229 
                              Uniform f32_4* %230 = OpAccessChain %22 %223 %105 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpLoad %12 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %139 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %139 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %139 %240 
                              Uniform f32_4* %241 = OpAccessChain %22 %223 %149 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %12 
                                       f32_3 %245 = OpVectorShuffle %244 %244 2 2 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %139 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %139 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %139 %251 
                                       f32_4 %252 = OpLoad %139 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %22 %223 %160 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %253 %256 
                                       f32_4 %258 = OpLoad %139 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %139 %259 
                                        bool %262 = OpLoad %217 
                                                      OpSelectionMerge %264 None 
                                                      OpBranchConditional %262 %263 %267 
                                             %263 = OpLabel 
                                       f32_4 %265 = OpLoad %139 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %261 %266 
                                                      OpBranch %264 
                                             %267 = OpLabel 
                                       f32_3 %268 = OpLoad %12 
                                                      OpStore %261 %268 
                                                      OpBranch %264 
                                             %264 = OpLabel 
                                       f32_3 %269 = OpLoad %261 
                                       f32_4 %270 = OpLoad %139 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %139 %271 
                                       f32_4 %272 = OpLoad %139 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_3* %275 = OpAccessChain %22 %274 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %273 %277 
                                       f32_4 %279 = OpLoad %139 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %139 %280 
                                       f32_4 %281 = OpLoad %139 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                              Uniform f32_3* %284 = OpAccessChain %22 %283 
                                       f32_3 %285 = OpLoad %284 
                                       f32_3 %286 = OpFMul %282 %285 
                                       f32_4 %287 = OpLoad %139 
                                       f32_4 %288 = OpVectorShuffle %287 %286 0 4 5 6 
                                                      OpStore %139 %288 
                                Private f32* %291 = OpAccessChain %139 %147 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %292 %35 
                                         f32 %295 = OpFAdd %293 %294 
                                Private f32* %296 = OpAccessChain %290 %63 
                                                      OpStore %296 %295 
                                Uniform f32* %298 = OpAccessChain %22 %204 %141 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %294 
                                                      OpStore %297 %302 
                                         f32 %303 = OpLoad %297 
                                Private f32* %304 = OpAccessChain %290 %63 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 40 %303 %305 
                                Private f32* %307 = OpAccessChain %139 %63 
                                                      OpStore %307 %306 
                  read_only Texture3DSampled %312 = OpLoad %311 
                                       f32_4 %313 = OpLoad %139 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 2 3 
                                       f32_4 %315 = OpImageSampleImplicitLod %312 %314 
                                                      OpStore %139 %315 
                                       f32_4 %316 = OpLoad %139 
                                                      OpStore %78 %316 
                                                      OpBranch %216 
                                             %317 = OpLabel 
                                Private f32* %318 = OpAccessChain %78 %63 
                                                      OpStore %318 %75 
                                Private f32* %319 = OpAccessChain %78 %147 
                                                      OpStore %319 %75 
                                Private f32* %320 = OpAccessChain %78 %141 
                                                      OpStore %320 %75 
                                Private f32* %321 = OpAccessChain %78 %91 
                                                      OpStore %321 %75 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_4 %322 = OpLoad %78 
                              Uniform f32_4* %323 = OpAccessChain %22 %106 
                                       f32_4 %324 = OpLoad %323 
                                         f32 %325 = OpDot %322 %324 
                                Private f32* %326 = OpAccessChain %114 %63 
                                                      OpStore %326 %325 
                                Private f32* %327 = OpAccessChain %114 %63 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpExtInst %1 43 %328 %102 %75 
                                Private f32* %330 = OpAccessChain %114 %63 
                                                      OpStore %330 %329 
                                       f32_4 %333 = OpLoad %332 
                                       f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                                       f32_4 %335 = OpLoad %332 
                                       f32_2 %336 = OpVectorShuffle %335 %335 3 3 
                                       f32_2 %337 = OpFDiv %334 %336 
                                                      OpStore %290 %337 
                  read_only Texture2DSampled %340 = OpLoad %339 
                                       f32_2 %341 = OpLoad %290 
                                       f32_4 %342 = OpImageSampleImplicitLod %340 %341 
                                         f32 %343 = OpCompositeExtract %342 0 
                                                      OpStore %338 %343 
                                Private f32* %345 = OpAccessChain %90 %63 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpLoad %338 
                                         f32 %348 = OpFAdd %346 %347 
                                Private f32* %349 = OpAccessChain %344 %63 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %344 %63 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %102 %75 
                                Private f32* %353 = OpAccessChain %344 %63 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %344 %63 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %114 %63 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 37 %355 %357 
                                Private f32* %359 = OpAccessChain %114 %63 
                                                      OpStore %359 %358 
                                        bool %362 = OpLoad %203 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %367 
                                             %363 = OpLabel 
                                Private f32* %365 = OpAccessChain %114 %63 
                                         f32 %366 = OpLoad %365 
                                                      OpStore %361 %366 
                                                      OpBranch %364 
                                             %367 = OpLabel 
                                Private f32* %368 = OpAccessChain %344 %63 
                                         f32 %369 = OpLoad %368 
                                                      OpStore %361 %369 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                         f32 %370 = OpLoad %361 
                                Private f32* %371 = OpAccessChain %114 %63 
                                                      OpStore %371 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                              Uniform f32_4* %375 = OpAccessChain %22 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %373 %377 
                                                      OpStore %344 %378 
                                       f32_3 %379 = OpLoad %114 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 0 0 
                                       f32_3 %381 = OpLoad %344 
                                       f32_3 %382 = OpFMul %380 %381 
                                                      OpStore %114 %382 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %388 = OpLoad %387 
                                       f32_3 %389 = OpFMul %386 %388 
                                       f32_3 %390 = OpLoad %114 
                                       f32_3 %391 = OpFAdd %389 %390 
                                       f32_4 %392 = OpLoad %384 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %384 %393 
                                Private f32* %394 = OpAccessChain %9 %91 
                                         f32 %395 = OpLoad %394 
                                 Output f32* %397 = OpAccessChain %384 %91 
                                                      OpStore %397 %395 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 399
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %332 %384 %387 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 RelaxedPrecision 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 RelaxedPrecision 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpMemberDecorate %20 10 Offset 20 
                                                      OpMemberDecorate %20 11 Offset 20 
                                                      OpMemberDecorate %20 12 RelaxedPrecision 
                                                      OpMemberDecorate %20 12 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %214 SpecId 214 
                                                      OpDecorate %311 DescriptorSet 311 
                                                      OpDecorate %311 Binding 311 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %332 Location 332 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 DescriptorSet 339 
                                                      OpDecorate %339 Binding 339 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %384 Location 384 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %387 Location 387 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %10 %7 %7 %7 %18 %7 %19 %10 %10 %7 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 11 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 10 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 12 
                                             %135 = OpTypePointer Uniform %10 
                              Private f32_4* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 4 
                                         u32 %141 = OpConstant 2 
                                         u32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant 2 
                              Private f32_3* %158 = OpVariable Private 
                                         i32 %160 = OpConstant 3 
                               Private bool* %203 = OpVariable Private 
                                         i32 %204 = OpConstant 5 
                                        bool %208 = OpConstantFalse 
                                        bool %214 = OpSpecConstantFalse 
                               Private bool* %217 = OpVariable Private 
                                         i32 %223 = OpConstant 6 
                                             %260 = OpTypePointer Function %10 
                                         i32 %274 = OpConstant 8 
                                         i32 %283 = OpConstant 7 
                                             %289 = OpTypePointer Private %13 
                              Private f32_2* %290 = OpVariable Private 
                                         f32 %294 = OpConstant 3.67402E-40 
                                Private f32* %297 = OpVariable Private 
                                         f32 %300 = OpConstant 3.67402E-40 
                                             %308 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %309 = OpTypeSampledImage %308 
                                             %310 = OpTypePointer UniformConstant %309 
 UniformConstant read_only Texture3DSampled* %311 = OpVariable UniformConstant 
                                             %331 = OpTypePointer Input %7 
                                Input f32_4* %332 = OpVariable Input 
                                Private f32* %338 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %339 = OpVariable UniformConstant 
                              Private f32_3* %344 = OpVariable Private 
                                             %360 = OpTypePointer Function %6 
                                         i32 %374 = OpConstant 9 
                                             %383 = OpTypePointer Output %7 
                               Output f32_4* %384 = OpVariable Output 
                                Input f32_3* %387 = OpVariable Input 
                                             %396 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %261 = OpVariable Function 
                               Function f32* %361 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpFNegate %133 
                              Uniform f32_3* %136 = OpAccessChain %22 %105 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFAdd %134 %137 
                                                      OpStore %90 %138 
                                Uniform f32* %142 = OpAccessChain %22 %140 %105 %141 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %139 %63 
                                                      OpStore %144 %143 
                                Uniform f32* %145 = OpAccessChain %22 %140 %106 %141 
                                         f32 %146 = OpLoad %145 
                                Private f32* %148 = OpAccessChain %139 %147 
                                                      OpStore %148 %146 
                                Uniform f32* %150 = OpAccessChain %22 %140 %149 %141 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %139 %141 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %90 
                                       f32_4 %154 = OpLoad %139 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %153 %155 
                                Private f32* %157 = OpAccessChain %90 %63 
                                                      OpStore %157 %156 
                                       f32_3 %159 = OpLoad %12 
                              Uniform f32_4* %161 = OpAccessChain %22 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFNegate %163 
                                       f32_3 %165 = OpFAdd %159 %164 
                                                      OpStore %158 %165 
                                       f32_3 %166 = OpLoad %158 
                                       f32_3 %167 = OpLoad %158 
                                         f32 %168 = OpDot %166 %167 
                                Private f32* %169 = OpAccessChain %158 %63 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %158 %63 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpExtInst %1 31 %171 
                                Private f32* %173 = OpAccessChain %158 %63 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %90 %63 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %158 %63 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                Private f32* %180 = OpAccessChain %158 %63 
                                                      OpStore %180 %179 
                                Uniform f32* %181 = OpAccessChain %22 %160 %91 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %158 %63 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                Private f32* %186 = OpAccessChain %90 %63 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %189 = OpAccessChain %90 %63 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %90 %63 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %22 %149 %141 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Uniform f32* %195 = OpAccessChain %22 %149 %91 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFAdd %194 %196 
                                Private f32* %198 = OpAccessChain %90 %63 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %90 %63 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpExtInst %1 43 %200 %102 %75 
                                Private f32* %202 = OpAccessChain %90 %63 
                                                      OpStore %202 %201 
                                Uniform f32* %205 = OpAccessChain %22 %204 %63 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdEqual %206 %75 
                                                      OpStore %203 %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %210 
                                             %209 = OpLabel 
                                        bool %211 = OpLoad %203 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %211 %212 %213 
                                             %212 = OpLabel 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %317 
                                             %215 = OpLabel 
                                Uniform f32* %218 = OpAccessChain %22 %204 %147 
                                         f32 %219 = OpLoad %218 
                                        bool %220 = OpFOrdEqual %219 %75 
                                                      OpStore %217 %220 
                                       f32_3 %221 = OpLoad %12 
                                       f32_3 %222 = OpVectorShuffle %221 %221 1 1 1 
                              Uniform f32_4* %224 = OpAccessChain %22 %223 %106 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %222 %226 
                                       f32_4 %228 = OpLoad %139 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %139 %229 
                              Uniform f32_4* %230 = OpAccessChain %22 %223 %105 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpLoad %12 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %139 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %139 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %139 %240 
                              Uniform f32_4* %241 = OpAccessChain %22 %223 %149 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %12 
                                       f32_3 %245 = OpVectorShuffle %244 %244 2 2 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %139 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %139 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %139 %251 
                                       f32_4 %252 = OpLoad %139 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %22 %223 %160 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %253 %256 
                                       f32_4 %258 = OpLoad %139 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %139 %259 
                                        bool %262 = OpLoad %217 
                                                      OpSelectionMerge %264 None 
                                                      OpBranchConditional %262 %263 %267 
                                             %263 = OpLabel 
                                       f32_4 %265 = OpLoad %139 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %261 %266 
                                                      OpBranch %264 
                                             %267 = OpLabel 
                                       f32_3 %268 = OpLoad %12 
                                                      OpStore %261 %268 
                                                      OpBranch %264 
                                             %264 = OpLabel 
                                       f32_3 %269 = OpLoad %261 
                                       f32_4 %270 = OpLoad %139 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %139 %271 
                                       f32_4 %272 = OpLoad %139 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_3* %275 = OpAccessChain %22 %274 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %273 %277 
                                       f32_4 %279 = OpLoad %139 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %139 %280 
                                       f32_4 %281 = OpLoad %139 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                              Uniform f32_3* %284 = OpAccessChain %22 %283 
                                       f32_3 %285 = OpLoad %284 
                                       f32_3 %286 = OpFMul %282 %285 
                                       f32_4 %287 = OpLoad %139 
                                       f32_4 %288 = OpVectorShuffle %287 %286 0 4 5 6 
                                                      OpStore %139 %288 
                                Private f32* %291 = OpAccessChain %139 %147 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %292 %35 
                                         f32 %295 = OpFAdd %293 %294 
                                Private f32* %296 = OpAccessChain %290 %63 
                                                      OpStore %296 %295 
                                Uniform f32* %298 = OpAccessChain %22 %204 %141 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %294 
                                                      OpStore %297 %302 
                                         f32 %303 = OpLoad %297 
                                Private f32* %304 = OpAccessChain %290 %63 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 40 %303 %305 
                                Private f32* %307 = OpAccessChain %139 %63 
                                                      OpStore %307 %306 
                  read_only Texture3DSampled %312 = OpLoad %311 
                                       f32_4 %313 = OpLoad %139 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 2 3 
                                       f32_4 %315 = OpImageSampleImplicitLod %312 %314 
                                                      OpStore %139 %315 
                                       f32_4 %316 = OpLoad %139 
                                                      OpStore %78 %316 
                                                      OpBranch %216 
                                             %317 = OpLabel 
                                Private f32* %318 = OpAccessChain %78 %63 
                                                      OpStore %318 %75 
                                Private f32* %319 = OpAccessChain %78 %147 
                                                      OpStore %319 %75 
                                Private f32* %320 = OpAccessChain %78 %141 
                                                      OpStore %320 %75 
                                Private f32* %321 = OpAccessChain %78 %91 
                                                      OpStore %321 %75 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_4 %322 = OpLoad %78 
                              Uniform f32_4* %323 = OpAccessChain %22 %106 
                                       f32_4 %324 = OpLoad %323 
                                         f32 %325 = OpDot %322 %324 
                                Private f32* %326 = OpAccessChain %114 %63 
                                                      OpStore %326 %325 
                                Private f32* %327 = OpAccessChain %114 %63 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpExtInst %1 43 %328 %102 %75 
                                Private f32* %330 = OpAccessChain %114 %63 
                                                      OpStore %330 %329 
                                       f32_4 %333 = OpLoad %332 
                                       f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                                       f32_4 %335 = OpLoad %332 
                                       f32_2 %336 = OpVectorShuffle %335 %335 3 3 
                                       f32_2 %337 = OpFDiv %334 %336 
                                                      OpStore %290 %337 
                  read_only Texture2DSampled %340 = OpLoad %339 
                                       f32_2 %341 = OpLoad %290 
                                       f32_4 %342 = OpImageSampleImplicitLod %340 %341 
                                         f32 %343 = OpCompositeExtract %342 0 
                                                      OpStore %338 %343 
                                Private f32* %345 = OpAccessChain %90 %63 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpLoad %338 
                                         f32 %348 = OpFAdd %346 %347 
                                Private f32* %349 = OpAccessChain %344 %63 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %344 %63 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %102 %75 
                                Private f32* %353 = OpAccessChain %344 %63 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %344 %63 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %114 %63 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 37 %355 %357 
                                Private f32* %359 = OpAccessChain %114 %63 
                                                      OpStore %359 %358 
                                        bool %362 = OpLoad %203 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %367 
                                             %363 = OpLabel 
                                Private f32* %365 = OpAccessChain %114 %63 
                                         f32 %366 = OpLoad %365 
                                                      OpStore %361 %366 
                                                      OpBranch %364 
                                             %367 = OpLabel 
                                Private f32* %368 = OpAccessChain %344 %63 
                                         f32 %369 = OpLoad %368 
                                                      OpStore %361 %369 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                         f32 %370 = OpLoad %361 
                                Private f32* %371 = OpAccessChain %114 %63 
                                                      OpStore %371 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                              Uniform f32_4* %375 = OpAccessChain %22 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %373 %377 
                                                      OpStore %344 %378 
                                       f32_3 %379 = OpLoad %114 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 0 0 
                                       f32_3 %381 = OpLoad %344 
                                       f32_3 %382 = OpFMul %380 %381 
                                                      OpStore %114 %382 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %388 = OpLoad %387 
                                       f32_3 %389 = OpFMul %386 %388 
                                       f32_3 %390 = OpLoad %114 
                                       f32_3 %391 = OpFAdd %389 %390 
                                       f32_4 %392 = OpLoad %384 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %384 %393 
                                Private f32* %394 = OpAccessChain %9 %91 
                                         f32 %395 = OpLoad %394 
                                 Output f32* %397 = OpAccessChain %384 %91 
                                                      OpStore %397 %395 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %46 %261 %264 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %141 SpecId 141 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeStruct %7 %7 %18 %10 %10 %7 %6 %7 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                               Private f32_4* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_2* %46 = OpVariable Input 
                               Private f32_4* %49 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %56 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                          u32 %62 = OpConstant 0 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                               Private f32_4* %77 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 3 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 0 
                                         i32 %104 = OpConstant 1 
                                         i32 %106 = OpConstant -1 
                                             %112 = OpTypePointer Private %10 
                              Private f32_3* %113 = OpVariable Private 
                                         i32 %116 = OpConstant 8 
                                        bool %135 = OpConstantFalse 
                                        bool %141 = OpSpecConstantFalse 
                                         u32 %144 = OpConstant 1 
                              Private f32_3* %148 = OpVariable Private 
                                         i32 %151 = OpConstant 2 
                                         i32 %173 = OpConstant 3 
                                             %178 = OpTypePointer Function %10 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %10 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %224 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %225 = OpTypeSampledImage %224 
                                             %226 = OpTypePointer UniformConstant %225 
 UniformConstant read_only Texture3DSampled* %227 = OpVariable UniformConstant 
                              Private f32_4* %232 = OpVariable Private 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %251 = OpConstant 5 
                                             %260 = OpTypePointer Output %7 
                               Output f32_4* %261 = OpVariable Output 
                                Input f32_3* %264 = OpVariable Input 
                                             %273 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFNegate %27 
                                        f32_2 %29 = OpFAdd %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_2 %47 = OpLoad %46 
                                        f32_4 %48 = OpImageSampleImplicitLod %44 %47 
                                                      OpStore %39 %48 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                      OpStore %49 %54 
                   read_only Texture2DSampled %58 = OpLoad %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                          f32 %63 = OpCompositeExtract %61 0 
                                                      OpStore %56 %63 
                                          f32 %64 = OpLoad %56 
                                 Uniform f32* %67 = OpAccessChain %21 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 40 %64 %68 
                                 Private f32* %70 = OpAccessChain %9 %62 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %62 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %9 %62 
                                                      OpStore %76 %75 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpLoad %49 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %77 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                        f32_4 %84 = OpLoad %77 
                                        f32_4 %85 = OpFMul %83 %84 
                                        f32_4 %86 = OpLoad %39 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                 Private f32* %90 = OpAccessChain %9 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %88 %62 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %88 %62 
                                          f32 %99 = OpLoad %98 
                                        bool %101 = OpFOrdLessThan %99 %100 
                                                      OpStore %97 %101 
                                        bool %102 = OpLoad %97 
                                         i32 %105 = OpSelect %102 %104 %103 
                                         i32 %107 = OpIMul %105 %106 
                                        bool %108 = OpINotEqual %107 %103 
                                                      OpSelectionMerge %110 None 
                                                      OpBranchConditional %108 %109 %110 
                                             %109 = OpLabel 
                                                      OpKill
                                             %110 = OpLabel 
                                Private f32* %114 = OpAccessChain %9 %89 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %21 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                Private f32* %121 = OpAccessChain %113 %62 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %113 %62 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdLessThan %123 %100 
                                                      OpStore %97 %124 
                                        bool %125 = OpLoad %97 
                                         i32 %126 = OpSelect %125 %104 %103 
                                         i32 %127 = OpIMul %126 %106 
                                        bool %128 = OpINotEqual %127 %103 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpKill
                                             %130 = OpLabel 
                                Uniform f32* %132 = OpAccessChain %21 %104 %62 
                                         f32 %133 = OpLoad %132 
                                        bool %134 = OpFOrdEqual %133 %74 
                                                      OpStore %97 %134 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                        bool %138 = OpLoad %97 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %234 
                                             %142 = OpLabel 
                                Uniform f32* %145 = OpAccessChain %21 %104 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdEqual %146 %74 
                                                      OpStore %97 %147 
                                       f32_3 %149 = OpLoad %12 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 1 1 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 %104 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %150 %154 
                                                      OpStore %148 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %151 %103 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %12 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_3 %162 = OpLoad %148 
                                       f32_3 %163 = OpFAdd %161 %162 
                                                      OpStore %148 %163 
                              Uniform f32_4* %164 = OpAccessChain %21 %151 %151 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpLoad %12 
                                       f32_3 %168 = OpVectorShuffle %167 %167 2 2 2 
                                       f32_3 %169 = OpFMul %166 %168 
                                       f32_3 %170 = OpLoad %148 
                                       f32_3 %171 = OpFAdd %169 %170 
                                                      OpStore %148 %171 
                                       f32_3 %172 = OpLoad %148 
                              Uniform f32_4* %174 = OpAccessChain %21 %151 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %172 %176 
                                                      OpStore %148 %177 
                                        bool %180 = OpLoad %97 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %148 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %12 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                       f32_4 %187 = OpLoad %88 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %88 %188 
                                       f32_4 %189 = OpLoad %88 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                       f32_4 %197 = OpLoad %88 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %88 %198 
                                       f32_4 %199 = OpLoad %88 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_3* %201 = OpAccessChain %21 %173 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %88 
                                       f32_4 %205 = OpVectorShuffle %204 %203 0 4 5 6 
                                                      OpStore %88 %205 
                                Private f32* %206 = OpAccessChain %88 %144 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %34 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %148 %62 
                                                      OpStore %211 %210 
                                Uniform f32* %214 = OpAccessChain %21 %104 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %209 
                                                      OpStore %212 %218 
                                Private f32* %219 = OpAccessChain %148 %62 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                Private f32* %223 = OpAccessChain %88 %62 
                                                      OpStore %223 %222 
                  read_only Texture3DSampled %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %88 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 2 3 
                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
                                                      OpStore %88 %231 
                                       f32_4 %233 = OpLoad %88 
                                                      OpStore %232 %233 
                                                      OpBranch %143 
                                             %234 = OpLabel 
                                Private f32* %235 = OpAccessChain %232 %62 
                                                      OpStore %235 %74 
                                Private f32* %236 = OpAccessChain %232 %144 
                                                      OpStore %236 %74 
                                Private f32* %237 = OpAccessChain %232 %213 
                                                      OpStore %237 %74 
                                Private f32* %238 = OpAccessChain %232 %89 
                                                      OpStore %238 %74 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %239 = OpLoad %232 
                              Uniform f32_4* %240 = OpAccessChain %21 %103 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %113 %62 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %113 %62 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 43 %245 %100 %74 
                                Private f32* %247 = OpAccessChain %113 %62 
                                                      OpStore %247 %246 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %21 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_3 %255 = OpFMul %250 %254 
                                                      OpStore %248 %255 
                                       f32_3 %256 = OpLoad %113 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 0 0 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %113 %259 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %265 = OpLoad %264 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_3 %267 = OpLoad %113 
                                       f32_3 %268 = OpFAdd %266 %267 
                                       f32_4 %269 = OpLoad %261 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %261 %270 
                                Private f32* %271 = OpAccessChain %9 %89 
                                         f32 %272 = OpLoad %271 
                                 Output f32* %274 = OpAccessChain %261 %89 
                                                      OpStore %274 %272 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %46 %261 %264 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %141 SpecId 141 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 Location 261 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeStruct %7 %7 %18 %10 %10 %7 %6 %7 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                               Private f32_4* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_2* %46 = OpVariable Input 
                               Private f32_4* %49 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %56 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                          u32 %62 = OpConstant 0 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                               Private f32_4* %77 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 3 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 0 
                                         i32 %104 = OpConstant 1 
                                         i32 %106 = OpConstant -1 
                                             %112 = OpTypePointer Private %10 
                              Private f32_3* %113 = OpVariable Private 
                                         i32 %116 = OpConstant 8 
                                        bool %135 = OpConstantFalse 
                                        bool %141 = OpSpecConstantFalse 
                                         u32 %144 = OpConstant 1 
                              Private f32_3* %148 = OpVariable Private 
                                         i32 %151 = OpConstant 2 
                                         i32 %173 = OpConstant 3 
                                             %178 = OpTypePointer Function %10 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %10 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %224 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %225 = OpTypeSampledImage %224 
                                             %226 = OpTypePointer UniformConstant %225 
 UniformConstant read_only Texture3DSampled* %227 = OpVariable UniformConstant 
                              Private f32_4* %232 = OpVariable Private 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %251 = OpConstant 5 
                                             %260 = OpTypePointer Output %7 
                               Output f32_4* %261 = OpVariable Output 
                                Input f32_3* %264 = OpVariable Input 
                                             %273 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFNegate %27 
                                        f32_2 %29 = OpFAdd %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_2 %47 = OpLoad %46 
                                        f32_4 %48 = OpImageSampleImplicitLod %44 %47 
                                                      OpStore %39 %48 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                      OpStore %49 %54 
                   read_only Texture2DSampled %58 = OpLoad %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                          f32 %63 = OpCompositeExtract %61 0 
                                                      OpStore %56 %63 
                                          f32 %64 = OpLoad %56 
                                 Uniform f32* %67 = OpAccessChain %21 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 40 %64 %68 
                                 Private f32* %70 = OpAccessChain %9 %62 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %62 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %9 %62 
                                                      OpStore %76 %75 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpLoad %49 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %77 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                        f32_4 %84 = OpLoad %77 
                                        f32_4 %85 = OpFMul %83 %84 
                                        f32_4 %86 = OpLoad %39 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                 Private f32* %90 = OpAccessChain %9 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %88 %62 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %88 %62 
                                          f32 %99 = OpLoad %98 
                                        bool %101 = OpFOrdLessThan %99 %100 
                                                      OpStore %97 %101 
                                        bool %102 = OpLoad %97 
                                         i32 %105 = OpSelect %102 %104 %103 
                                         i32 %107 = OpIMul %105 %106 
                                        bool %108 = OpINotEqual %107 %103 
                                                      OpSelectionMerge %110 None 
                                                      OpBranchConditional %108 %109 %110 
                                             %109 = OpLabel 
                                                      OpKill
                                             %110 = OpLabel 
                                Private f32* %114 = OpAccessChain %9 %89 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %21 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                Private f32* %121 = OpAccessChain %113 %62 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %113 %62 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdLessThan %123 %100 
                                                      OpStore %97 %124 
                                        bool %125 = OpLoad %97 
                                         i32 %126 = OpSelect %125 %104 %103 
                                         i32 %127 = OpIMul %126 %106 
                                        bool %128 = OpINotEqual %127 %103 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpKill
                                             %130 = OpLabel 
                                Uniform f32* %132 = OpAccessChain %21 %104 %62 
                                         f32 %133 = OpLoad %132 
                                        bool %134 = OpFOrdEqual %133 %74 
                                                      OpStore %97 %134 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                        bool %138 = OpLoad %97 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %234 
                                             %142 = OpLabel 
                                Uniform f32* %145 = OpAccessChain %21 %104 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdEqual %146 %74 
                                                      OpStore %97 %147 
                                       f32_3 %149 = OpLoad %12 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 1 1 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 %104 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %150 %154 
                                                      OpStore %148 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %151 %103 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %12 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 0 0 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_3 %162 = OpLoad %148 
                                       f32_3 %163 = OpFAdd %161 %162 
                                                      OpStore %148 %163 
                              Uniform f32_4* %164 = OpAccessChain %21 %151 %151 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpLoad %12 
                                       f32_3 %168 = OpVectorShuffle %167 %167 2 2 2 
                                       f32_3 %169 = OpFMul %166 %168 
                                       f32_3 %170 = OpLoad %148 
                                       f32_3 %171 = OpFAdd %169 %170 
                                                      OpStore %148 %171 
                                       f32_3 %172 = OpLoad %148 
                              Uniform f32_4* %174 = OpAccessChain %21 %151 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %172 %176 
                                                      OpStore %148 %177 
                                        bool %180 = OpLoad %97 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %148 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %12 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                       f32_4 %187 = OpLoad %88 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %88 %188 
                                       f32_4 %189 = OpLoad %88 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                       f32_4 %197 = OpLoad %88 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %88 %198 
                                       f32_4 %199 = OpLoad %88 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_3* %201 = OpAccessChain %21 %173 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %88 
                                       f32_4 %205 = OpVectorShuffle %204 %203 0 4 5 6 
                                                      OpStore %88 %205 
                                Private f32* %206 = OpAccessChain %88 %144 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFMul %207 %34 
                                         f32 %210 = OpFAdd %208 %209 
                                Private f32* %211 = OpAccessChain %148 %62 
                                                      OpStore %211 %210 
                                Uniform f32* %214 = OpAccessChain %21 %104 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %209 
                                                      OpStore %212 %218 
                                Private f32* %219 = OpAccessChain %148 %62 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                Private f32* %223 = OpAccessChain %88 %62 
                                                      OpStore %223 %222 
                  read_only Texture3DSampled %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %88 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 2 3 
                                       f32_4 %231 = OpImageSampleImplicitLod %228 %230 
                                                      OpStore %88 %231 
                                       f32_4 %233 = OpLoad %88 
                                                      OpStore %232 %233 
                                                      OpBranch %143 
                                             %234 = OpLabel 
                                Private f32* %235 = OpAccessChain %232 %62 
                                                      OpStore %235 %74 
                                Private f32* %236 = OpAccessChain %232 %144 
                                                      OpStore %236 %74 
                                Private f32* %237 = OpAccessChain %232 %213 
                                                      OpStore %237 %74 
                                Private f32* %238 = OpAccessChain %232 %89 
                                                      OpStore %238 %74 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %239 = OpLoad %232 
                              Uniform f32_4* %240 = OpAccessChain %21 %103 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %113 %62 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %113 %62 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 43 %245 %100 %74 
                                Private f32* %247 = OpAccessChain %113 %62 
                                                      OpStore %247 %246 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %21 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                       f32_3 %255 = OpFMul %250 %254 
                                                      OpStore %248 %255 
                                       f32_3 %256 = OpLoad %113 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 0 0 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %113 %259 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %265 = OpLoad %264 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_3 %267 = OpLoad %113 
                                       f32_3 %268 = OpFAdd %266 %267 
                                       f32_4 %269 = OpLoad %261 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %261 %270 
                                Private f32* %271 = OpAccessChain %9 %89 
                                         f32 %272 = OpLoad %271 
                                 Output f32* %274 = OpAccessChain %261 %89 
                                                      OpStore %274 %272 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 399
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %332 %384 %387 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 RelaxedPrecision 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 RelaxedPrecision 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpMemberDecorate %20 10 Offset 20 
                                                      OpMemberDecorate %20 11 Offset 20 
                                                      OpMemberDecorate %20 12 RelaxedPrecision 
                                                      OpMemberDecorate %20 12 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %214 SpecId 214 
                                                      OpDecorate %311 DescriptorSet 311 
                                                      OpDecorate %311 Binding 311 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %332 Location 332 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 DescriptorSet 339 
                                                      OpDecorate %339 Binding 339 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %384 Location 384 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %387 Location 387 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %10 %7 %7 %7 %18 %7 %19 %10 %10 %7 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 11 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 10 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 12 
                                             %135 = OpTypePointer Uniform %10 
                              Private f32_4* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 4 
                                         u32 %141 = OpConstant 2 
                                         u32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant 2 
                              Private f32_3* %158 = OpVariable Private 
                                         i32 %160 = OpConstant 3 
                               Private bool* %203 = OpVariable Private 
                                         i32 %204 = OpConstant 5 
                                        bool %208 = OpConstantFalse 
                                        bool %214 = OpSpecConstantFalse 
                               Private bool* %217 = OpVariable Private 
                                         i32 %223 = OpConstant 6 
                                             %260 = OpTypePointer Function %10 
                                         i32 %274 = OpConstant 8 
                                         i32 %283 = OpConstant 7 
                                             %289 = OpTypePointer Private %13 
                              Private f32_2* %290 = OpVariable Private 
                                         f32 %294 = OpConstant 3.67402E-40 
                                Private f32* %297 = OpVariable Private 
                                         f32 %300 = OpConstant 3.67402E-40 
                                             %308 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %309 = OpTypeSampledImage %308 
                                             %310 = OpTypePointer UniformConstant %309 
 UniformConstant read_only Texture3DSampled* %311 = OpVariable UniformConstant 
                                             %331 = OpTypePointer Input %7 
                                Input f32_4* %332 = OpVariable Input 
                                Private f32* %338 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %339 = OpVariable UniformConstant 
                              Private f32_3* %344 = OpVariable Private 
                                             %360 = OpTypePointer Function %6 
                                         i32 %374 = OpConstant 9 
                                             %383 = OpTypePointer Output %7 
                               Output f32_4* %384 = OpVariable Output 
                                Input f32_3* %387 = OpVariable Input 
                                             %396 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %261 = OpVariable Function 
                               Function f32* %361 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpFNegate %133 
                              Uniform f32_3* %136 = OpAccessChain %22 %105 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFAdd %134 %137 
                                                      OpStore %90 %138 
                                Uniform f32* %142 = OpAccessChain %22 %140 %105 %141 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %139 %63 
                                                      OpStore %144 %143 
                                Uniform f32* %145 = OpAccessChain %22 %140 %106 %141 
                                         f32 %146 = OpLoad %145 
                                Private f32* %148 = OpAccessChain %139 %147 
                                                      OpStore %148 %146 
                                Uniform f32* %150 = OpAccessChain %22 %140 %149 %141 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %139 %141 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %90 
                                       f32_4 %154 = OpLoad %139 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %153 %155 
                                Private f32* %157 = OpAccessChain %90 %63 
                                                      OpStore %157 %156 
                                       f32_3 %159 = OpLoad %12 
                              Uniform f32_4* %161 = OpAccessChain %22 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFNegate %163 
                                       f32_3 %165 = OpFAdd %159 %164 
                                                      OpStore %158 %165 
                                       f32_3 %166 = OpLoad %158 
                                       f32_3 %167 = OpLoad %158 
                                         f32 %168 = OpDot %166 %167 
                                Private f32* %169 = OpAccessChain %158 %63 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %158 %63 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpExtInst %1 31 %171 
                                Private f32* %173 = OpAccessChain %158 %63 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %90 %63 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %158 %63 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                Private f32* %180 = OpAccessChain %158 %63 
                                                      OpStore %180 %179 
                                Uniform f32* %181 = OpAccessChain %22 %160 %91 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %158 %63 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                Private f32* %186 = OpAccessChain %90 %63 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %189 = OpAccessChain %90 %63 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %90 %63 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %22 %149 %141 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Uniform f32* %195 = OpAccessChain %22 %149 %91 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFAdd %194 %196 
                                Private f32* %198 = OpAccessChain %90 %63 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %90 %63 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpExtInst %1 43 %200 %102 %75 
                                Private f32* %202 = OpAccessChain %90 %63 
                                                      OpStore %202 %201 
                                Uniform f32* %205 = OpAccessChain %22 %204 %63 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdEqual %206 %75 
                                                      OpStore %203 %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %210 
                                             %209 = OpLabel 
                                        bool %211 = OpLoad %203 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %211 %212 %213 
                                             %212 = OpLabel 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %317 
                                             %215 = OpLabel 
                                Uniform f32* %218 = OpAccessChain %22 %204 %147 
                                         f32 %219 = OpLoad %218 
                                        bool %220 = OpFOrdEqual %219 %75 
                                                      OpStore %217 %220 
                                       f32_3 %221 = OpLoad %12 
                                       f32_3 %222 = OpVectorShuffle %221 %221 1 1 1 
                              Uniform f32_4* %224 = OpAccessChain %22 %223 %106 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %222 %226 
                                       f32_4 %228 = OpLoad %139 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %139 %229 
                              Uniform f32_4* %230 = OpAccessChain %22 %223 %105 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpLoad %12 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %139 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %139 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %139 %240 
                              Uniform f32_4* %241 = OpAccessChain %22 %223 %149 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %12 
                                       f32_3 %245 = OpVectorShuffle %244 %244 2 2 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %139 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %139 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %139 %251 
                                       f32_4 %252 = OpLoad %139 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %22 %223 %160 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %253 %256 
                                       f32_4 %258 = OpLoad %139 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %139 %259 
                                        bool %262 = OpLoad %217 
                                                      OpSelectionMerge %264 None 
                                                      OpBranchConditional %262 %263 %267 
                                             %263 = OpLabel 
                                       f32_4 %265 = OpLoad %139 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %261 %266 
                                                      OpBranch %264 
                                             %267 = OpLabel 
                                       f32_3 %268 = OpLoad %12 
                                                      OpStore %261 %268 
                                                      OpBranch %264 
                                             %264 = OpLabel 
                                       f32_3 %269 = OpLoad %261 
                                       f32_4 %270 = OpLoad %139 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %139 %271 
                                       f32_4 %272 = OpLoad %139 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_3* %275 = OpAccessChain %22 %274 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %273 %277 
                                       f32_4 %279 = OpLoad %139 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %139 %280 
                                       f32_4 %281 = OpLoad %139 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                              Uniform f32_3* %284 = OpAccessChain %22 %283 
                                       f32_3 %285 = OpLoad %284 
                                       f32_3 %286 = OpFMul %282 %285 
                                       f32_4 %287 = OpLoad %139 
                                       f32_4 %288 = OpVectorShuffle %287 %286 0 4 5 6 
                                                      OpStore %139 %288 
                                Private f32* %291 = OpAccessChain %139 %147 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %292 %35 
                                         f32 %295 = OpFAdd %293 %294 
                                Private f32* %296 = OpAccessChain %290 %63 
                                                      OpStore %296 %295 
                                Uniform f32* %298 = OpAccessChain %22 %204 %141 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %294 
                                                      OpStore %297 %302 
                                         f32 %303 = OpLoad %297 
                                Private f32* %304 = OpAccessChain %290 %63 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 40 %303 %305 
                                Private f32* %307 = OpAccessChain %139 %63 
                                                      OpStore %307 %306 
                  read_only Texture3DSampled %312 = OpLoad %311 
                                       f32_4 %313 = OpLoad %139 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 2 3 
                                       f32_4 %315 = OpImageSampleImplicitLod %312 %314 
                                                      OpStore %139 %315 
                                       f32_4 %316 = OpLoad %139 
                                                      OpStore %78 %316 
                                                      OpBranch %216 
                                             %317 = OpLabel 
                                Private f32* %318 = OpAccessChain %78 %63 
                                                      OpStore %318 %75 
                                Private f32* %319 = OpAccessChain %78 %147 
                                                      OpStore %319 %75 
                                Private f32* %320 = OpAccessChain %78 %141 
                                                      OpStore %320 %75 
                                Private f32* %321 = OpAccessChain %78 %91 
                                                      OpStore %321 %75 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_4 %322 = OpLoad %78 
                              Uniform f32_4* %323 = OpAccessChain %22 %106 
                                       f32_4 %324 = OpLoad %323 
                                         f32 %325 = OpDot %322 %324 
                                Private f32* %326 = OpAccessChain %114 %63 
                                                      OpStore %326 %325 
                                Private f32* %327 = OpAccessChain %114 %63 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpExtInst %1 43 %328 %102 %75 
                                Private f32* %330 = OpAccessChain %114 %63 
                                                      OpStore %330 %329 
                                       f32_4 %333 = OpLoad %332 
                                       f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                                       f32_4 %335 = OpLoad %332 
                                       f32_2 %336 = OpVectorShuffle %335 %335 3 3 
                                       f32_2 %337 = OpFDiv %334 %336 
                                                      OpStore %290 %337 
                  read_only Texture2DSampled %340 = OpLoad %339 
                                       f32_2 %341 = OpLoad %290 
                                       f32_4 %342 = OpImageSampleImplicitLod %340 %341 
                                         f32 %343 = OpCompositeExtract %342 0 
                                                      OpStore %338 %343 
                                Private f32* %345 = OpAccessChain %90 %63 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpLoad %338 
                                         f32 %348 = OpFAdd %346 %347 
                                Private f32* %349 = OpAccessChain %344 %63 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %344 %63 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %102 %75 
                                Private f32* %353 = OpAccessChain %344 %63 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %344 %63 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %114 %63 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 37 %355 %357 
                                Private f32* %359 = OpAccessChain %114 %63 
                                                      OpStore %359 %358 
                                        bool %362 = OpLoad %203 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %367 
                                             %363 = OpLabel 
                                Private f32* %365 = OpAccessChain %114 %63 
                                         f32 %366 = OpLoad %365 
                                                      OpStore %361 %366 
                                                      OpBranch %364 
                                             %367 = OpLabel 
                                Private f32* %368 = OpAccessChain %344 %63 
                                         f32 %369 = OpLoad %368 
                                                      OpStore %361 %369 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                         f32 %370 = OpLoad %361 
                                Private f32* %371 = OpAccessChain %114 %63 
                                                      OpStore %371 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                              Uniform f32_4* %375 = OpAccessChain %22 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %373 %377 
                                                      OpStore %344 %378 
                                       f32_3 %379 = OpLoad %114 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 0 0 
                                       f32_3 %381 = OpLoad %344 
                                       f32_3 %382 = OpFMul %380 %381 
                                                      OpStore %114 %382 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %388 = OpLoad %387 
                                       f32_3 %389 = OpFMul %386 %388 
                                       f32_3 %390 = OpLoad %114 
                                       f32_3 %391 = OpFAdd %389 %390 
                                       f32_4 %392 = OpLoad %384 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %384 %393 
                                Private f32* %394 = OpAccessChain %9 %91 
                                         f32 %395 = OpLoad %394 
                                 Output f32* %397 = OpAccessChain %384 %91 
                                                      OpStore %397 %395 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 399
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %332 %384 %387 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 RelaxedPrecision 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 RelaxedPrecision 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpMemberDecorate %20 10 Offset 20 
                                                      OpMemberDecorate %20 11 Offset 20 
                                                      OpMemberDecorate %20 12 RelaxedPrecision 
                                                      OpMemberDecorate %20 12 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %214 SpecId 214 
                                                      OpDecorate %311 DescriptorSet 311 
                                                      OpDecorate %311 Binding 311 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %332 Location 332 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %339 DescriptorSet 339 
                                                      OpDecorate %339 Binding 339 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %384 Location 384 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %387 Location 387 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %10 %7 %7 %7 %18 %7 %19 %10 %10 %7 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 11 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 10 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 12 
                                             %135 = OpTypePointer Uniform %10 
                              Private f32_4* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 4 
                                         u32 %141 = OpConstant 2 
                                         u32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant 2 
                              Private f32_3* %158 = OpVariable Private 
                                         i32 %160 = OpConstant 3 
                               Private bool* %203 = OpVariable Private 
                                         i32 %204 = OpConstant 5 
                                        bool %208 = OpConstantFalse 
                                        bool %214 = OpSpecConstantFalse 
                               Private bool* %217 = OpVariable Private 
                                         i32 %223 = OpConstant 6 
                                             %260 = OpTypePointer Function %10 
                                         i32 %274 = OpConstant 8 
                                         i32 %283 = OpConstant 7 
                                             %289 = OpTypePointer Private %13 
                              Private f32_2* %290 = OpVariable Private 
                                         f32 %294 = OpConstant 3.67402E-40 
                                Private f32* %297 = OpVariable Private 
                                         f32 %300 = OpConstant 3.67402E-40 
                                             %308 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %309 = OpTypeSampledImage %308 
                                             %310 = OpTypePointer UniformConstant %309 
 UniformConstant read_only Texture3DSampled* %311 = OpVariable UniformConstant 
                                             %331 = OpTypePointer Input %7 
                                Input f32_4* %332 = OpVariable Input 
                                Private f32* %338 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %339 = OpVariable UniformConstant 
                              Private f32_3* %344 = OpVariable Private 
                                             %360 = OpTypePointer Function %6 
                                         i32 %374 = OpConstant 9 
                                             %383 = OpTypePointer Output %7 
                               Output f32_4* %384 = OpVariable Output 
                                Input f32_3* %387 = OpVariable Input 
                                             %396 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %261 = OpVariable Function 
                               Function f32* %361 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpFNegate %133 
                              Uniform f32_3* %136 = OpAccessChain %22 %105 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFAdd %134 %137 
                                                      OpStore %90 %138 
                                Uniform f32* %142 = OpAccessChain %22 %140 %105 %141 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %139 %63 
                                                      OpStore %144 %143 
                                Uniform f32* %145 = OpAccessChain %22 %140 %106 %141 
                                         f32 %146 = OpLoad %145 
                                Private f32* %148 = OpAccessChain %139 %147 
                                                      OpStore %148 %146 
                                Uniform f32* %150 = OpAccessChain %22 %140 %149 %141 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %139 %141 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %90 
                                       f32_4 %154 = OpLoad %139 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %153 %155 
                                Private f32* %157 = OpAccessChain %90 %63 
                                                      OpStore %157 %156 
                                       f32_3 %159 = OpLoad %12 
                              Uniform f32_4* %161 = OpAccessChain %22 %160 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFNegate %163 
                                       f32_3 %165 = OpFAdd %159 %164 
                                                      OpStore %158 %165 
                                       f32_3 %166 = OpLoad %158 
                                       f32_3 %167 = OpLoad %158 
                                         f32 %168 = OpDot %166 %167 
                                Private f32* %169 = OpAccessChain %158 %63 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %158 %63 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpExtInst %1 31 %171 
                                Private f32* %173 = OpAccessChain %158 %63 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %90 %63 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                Private f32* %177 = OpAccessChain %158 %63 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFAdd %176 %178 
                                Private f32* %180 = OpAccessChain %158 %63 
                                                      OpStore %180 %179 
                                Uniform f32* %181 = OpAccessChain %22 %160 %91 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %158 %63 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %182 %184 
                                Private f32* %186 = OpAccessChain %90 %63 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFAdd %185 %187 
                                Private f32* %189 = OpAccessChain %90 %63 
                                                      OpStore %189 %188 
                                Private f32* %190 = OpAccessChain %90 %63 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %22 %149 %141 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFMul %191 %193 
                                Uniform f32* %195 = OpAccessChain %22 %149 %91 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFAdd %194 %196 
                                Private f32* %198 = OpAccessChain %90 %63 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %90 %63 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpExtInst %1 43 %200 %102 %75 
                                Private f32* %202 = OpAccessChain %90 %63 
                                                      OpStore %202 %201 
                                Uniform f32* %205 = OpAccessChain %22 %204 %63 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdEqual %206 %75 
                                                      OpStore %203 %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %210 
                                             %209 = OpLabel 
                                        bool %211 = OpLoad %203 
                                                      OpSelectionMerge %213 None 
                                                      OpBranchConditional %211 %212 %213 
                                             %212 = OpLabel 
                                                      OpBranch %213 
                                             %213 = OpLabel 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %317 
                                             %215 = OpLabel 
                                Uniform f32* %218 = OpAccessChain %22 %204 %147 
                                         f32 %219 = OpLoad %218 
                                        bool %220 = OpFOrdEqual %219 %75 
                                                      OpStore %217 %220 
                                       f32_3 %221 = OpLoad %12 
                                       f32_3 %222 = OpVectorShuffle %221 %221 1 1 1 
                              Uniform f32_4* %224 = OpAccessChain %22 %223 %106 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %222 %226 
                                       f32_4 %228 = OpLoad %139 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %139 %229 
                              Uniform f32_4* %230 = OpAccessChain %22 %223 %105 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpLoad %12 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                       f32_3 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %139 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %139 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %139 %240 
                              Uniform f32_4* %241 = OpAccessChain %22 %223 %149 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %12 
                                       f32_3 %245 = OpVectorShuffle %244 %244 2 2 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %139 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %139 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %139 %251 
                                       f32_4 %252 = OpLoad %139 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %22 %223 %160 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFAdd %253 %256 
                                       f32_4 %258 = OpLoad %139 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
                                                      OpStore %139 %259 
                                        bool %262 = OpLoad %217 
                                                      OpSelectionMerge %264 None 
                                                      OpBranchConditional %262 %263 %267 
                                             %263 = OpLabel 
                                       f32_4 %265 = OpLoad %139 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %261 %266 
                                                      OpBranch %264 
                                             %267 = OpLabel 
                                       f32_3 %268 = OpLoad %12 
                                                      OpStore %261 %268 
                                                      OpBranch %264 
                                             %264 = OpLabel 
                                       f32_3 %269 = OpLoad %261 
                                       f32_4 %270 = OpLoad %139 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
                                                      OpStore %139 %271 
                                       f32_4 %272 = OpLoad %139 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                              Uniform f32_3* %275 = OpAccessChain %22 %274 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %273 %277 
                                       f32_4 %279 = OpLoad %139 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %139 %280 
                                       f32_4 %281 = OpLoad %139 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                              Uniform f32_3* %284 = OpAccessChain %22 %283 
                                       f32_3 %285 = OpLoad %284 
                                       f32_3 %286 = OpFMul %282 %285 
                                       f32_4 %287 = OpLoad %139 
                                       f32_4 %288 = OpVectorShuffle %287 %286 0 4 5 6 
                                                      OpStore %139 %288 
                                Private f32* %291 = OpAccessChain %139 %147 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %292 %35 
                                         f32 %295 = OpFAdd %293 %294 
                                Private f32* %296 = OpAccessChain %290 %63 
                                                      OpStore %296 %295 
                                Uniform f32* %298 = OpAccessChain %22 %204 %141 
                                         f32 %299 = OpLoad %298 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %294 
                                                      OpStore %297 %302 
                                         f32 %303 = OpLoad %297 
                                Private f32* %304 = OpAccessChain %290 %63 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpExtInst %1 40 %303 %305 
                                Private f32* %307 = OpAccessChain %139 %63 
                                                      OpStore %307 %306 
                  read_only Texture3DSampled %312 = OpLoad %311 
                                       f32_4 %313 = OpLoad %139 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 2 3 
                                       f32_4 %315 = OpImageSampleImplicitLod %312 %314 
                                                      OpStore %139 %315 
                                       f32_4 %316 = OpLoad %139 
                                                      OpStore %78 %316 
                                                      OpBranch %216 
                                             %317 = OpLabel 
                                Private f32* %318 = OpAccessChain %78 %63 
                                                      OpStore %318 %75 
                                Private f32* %319 = OpAccessChain %78 %147 
                                                      OpStore %319 %75 
                                Private f32* %320 = OpAccessChain %78 %141 
                                                      OpStore %320 %75 
                                Private f32* %321 = OpAccessChain %78 %91 
                                                      OpStore %321 %75 
                                                      OpBranch %216 
                                             %216 = OpLabel 
                                       f32_4 %322 = OpLoad %78 
                              Uniform f32_4* %323 = OpAccessChain %22 %106 
                                       f32_4 %324 = OpLoad %323 
                                         f32 %325 = OpDot %322 %324 
                                Private f32* %326 = OpAccessChain %114 %63 
                                                      OpStore %326 %325 
                                Private f32* %327 = OpAccessChain %114 %63 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpExtInst %1 43 %328 %102 %75 
                                Private f32* %330 = OpAccessChain %114 %63 
                                                      OpStore %330 %329 
                                       f32_4 %333 = OpLoad %332 
                                       f32_2 %334 = OpVectorShuffle %333 %333 0 1 
                                       f32_4 %335 = OpLoad %332 
                                       f32_2 %336 = OpVectorShuffle %335 %335 3 3 
                                       f32_2 %337 = OpFDiv %334 %336 
                                                      OpStore %290 %337 
                  read_only Texture2DSampled %340 = OpLoad %339 
                                       f32_2 %341 = OpLoad %290 
                                       f32_4 %342 = OpImageSampleImplicitLod %340 %341 
                                         f32 %343 = OpCompositeExtract %342 0 
                                                      OpStore %338 %343 
                                Private f32* %345 = OpAccessChain %90 %63 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpLoad %338 
                                         f32 %348 = OpFAdd %346 %347 
                                Private f32* %349 = OpAccessChain %344 %63 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %344 %63 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 43 %351 %102 %75 
                                Private f32* %353 = OpAccessChain %344 %63 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %344 %63 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %114 %63 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 37 %355 %357 
                                Private f32* %359 = OpAccessChain %114 %63 
                                                      OpStore %359 %358 
                                        bool %362 = OpLoad %203 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %367 
                                             %363 = OpLabel 
                                Private f32* %365 = OpAccessChain %114 %63 
                                         f32 %366 = OpLoad %365 
                                                      OpStore %361 %366 
                                                      OpBranch %364 
                                             %367 = OpLabel 
                                Private f32* %368 = OpAccessChain %344 %63 
                                         f32 %369 = OpLoad %368 
                                                      OpStore %361 %369 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                         f32 %370 = OpLoad %361 
                                Private f32* %371 = OpAccessChain %114 %63 
                                                      OpStore %371 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                              Uniform f32_4* %375 = OpAccessChain %22 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %373 %377 
                                                      OpStore %344 %378 
                                       f32_3 %379 = OpLoad %114 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 0 0 
                                       f32_3 %381 = OpLoad %344 
                                       f32_3 %382 = OpFMul %380 %381 
                                                      OpStore %114 %382 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %388 = OpLoad %387 
                                       f32_3 %389 = OpFMul %386 %388 
                                       f32_3 %390 = OpLoad %114 
                                       f32_3 %391 = OpFAdd %389 %390 
                                       f32_4 %392 = OpLoad %384 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %384 %393 
                                Private f32* %394 = OpAccessChain %9 %91 
                                         f32 %395 = OpLoad %394 
                                 Output f32* %397 = OpAccessChain %384 %91 
                                                      OpStore %397 %395 
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
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 67911
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 325
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %313 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 RelaxedPrecision 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 RelaxedPrecision 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %173 SpecId 173 
                                                      OpDecorate %268 DescriptorSet 268 
                                                      OpDecorate %268 Binding 268 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %292 DescriptorSet 292 
                                                      OpDecorate %292 Binding 292 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %313 Location 313 
                                                      OpDecorate %316 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %7 %7 %18 %10 %10 %7 %19 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 8 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 7 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 9 
                                         i32 %135 = OpConstant 6 
                                         i32 %148 = OpConstant 2 
                                         i32 %158 = OpConstant 3 
                               Private bool* %163 = OpVariable Private 
                                        bool %167 = OpConstantFalse 
                                        bool %173 = OpSpecConstantFalse 
                                         u32 %176 = OpConstant 1 
                              Private f32_4* %180 = OpVariable Private 
                                             %219 = OpTypePointer Function %10 
                                         i32 %233 = OpConstant 4 
                                             %234 = OpTypePointer Uniform %10 
                                Private f32* %248 = OpVariable Private 
                                         f32 %252 = OpConstant 3.67402E-40 
                                Private f32* %254 = OpVariable Private 
                                         u32 %255 = OpConstant 2 
                                         f32 %258 = OpConstant 3.67402E-40 
                                             %265 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %266 = OpTypeSampledImage %265 
                                             %267 = OpTypePointer UniformConstant %266 
 UniformConstant read_only Texture3DSampled* %268 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %292 = OpVariable UniformConstant 
                                         i32 %307 = OpConstant 5 
                                             %312 = OpTypePointer Output %7 
                               Output f32_4* %313 = OpVariable Output 
                                             %322 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %220 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %22 %135 %106 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %134 %138 
                                                      OpStore %90 %139 
                              Uniform f32_4* %140 = OpAccessChain %22 %135 %105 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %12 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 0 0 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_3 %146 = OpLoad %90 
                                       f32_3 %147 = OpFAdd %145 %146 
                                                      OpStore %90 %147 
                              Uniform f32_4* %149 = OpAccessChain %22 %135 %148 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %12 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %90 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %90 %156 
                                       f32_3 %157 = OpLoad %90 
                              Uniform f32_4* %159 = OpAccessChain %22 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %90 %162 
                                Uniform f32* %164 = OpAccessChain %22 %106 %63 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %75 
                                                      OpStore %163 %166 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                        bool %170 = OpLoad %163 
                                                      OpSelectionMerge %172 None 
                                                      OpBranchConditional %170 %171 %172 
                                             %171 = OpLabel 
                                                      OpBranch %172 
                                             %172 = OpLabel 
                                                      OpBranch %169 
                                             %169 = OpLabel 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %274 
                                             %174 = OpLabel 
                                Uniform f32* %177 = OpAccessChain %22 %106 %176 
                                         f32 %178 = OpLoad %177 
                                        bool %179 = OpFOrdEqual %178 %75 
                                                      OpStore %163 %179 
                                       f32_3 %181 = OpLoad %12 
                                       f32_3 %182 = OpVectorShuffle %181 %181 1 1 1 
                              Uniform f32_4* %183 = OpAccessChain %22 %148 %106 
                                       f32_4 %184 = OpLoad %183 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %180 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %180 %188 
                              Uniform f32_4* %189 = OpAccessChain %22 %148 %105 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %192 = OpLoad %12 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %180 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFAdd %194 %196 
                                       f32_4 %198 = OpLoad %180 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %180 %199 
                              Uniform f32_4* %200 = OpAccessChain %22 %148 %148 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpLoad %12 
                                       f32_3 %204 = OpVectorShuffle %203 %203 2 2 2 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %180 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %180 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %180 %210 
                                       f32_4 %211 = OpLoad %180 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                              Uniform f32_4* %213 = OpAccessChain %22 %148 %158 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFAdd %212 %215 
                                       f32_4 %217 = OpLoad %180 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                      OpStore %180 %218 
                                        bool %221 = OpLoad %163 
                                                      OpSelectionMerge %223 None 
                                                      OpBranchConditional %221 %222 %226 
                                             %222 = OpLabel 
                                       f32_4 %224 = OpLoad %180 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                                      OpStore %220 %225 
                                                      OpBranch %223 
                                             %226 = OpLabel 
                                       f32_3 %227 = OpLoad %12 
                                                      OpStore %220 %227 
                                                      OpBranch %223 
                                             %223 = OpLabel 
                                       f32_3 %228 = OpLoad %220 
                                       f32_4 %229 = OpLoad %180 
                                       f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                      OpStore %180 %230 
                                       f32_4 %231 = OpLoad %180 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                              Uniform f32_3* %235 = OpAccessChain %22 %233 
                                       f32_3 %236 = OpLoad %235 
                                       f32_3 %237 = OpFNegate %236 
                                       f32_3 %238 = OpFAdd %232 %237 
                                       f32_4 %239 = OpLoad %180 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %180 %240 
                                       f32_4 %241 = OpLoad %180 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_3* %243 = OpAccessChain %22 %158 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %180 
                                       f32_4 %247 = OpVectorShuffle %246 %245 0 4 5 6 
                                                      OpStore %180 %247 
                                Private f32* %249 = OpAccessChain %180 %176 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %250 %35 
                                         f32 %253 = OpFAdd %251 %252 
                                                      OpStore %248 %253 
                                Uniform f32* %256 = OpAccessChain %22 %106 %255 
                                         f32 %257 = OpLoad %256 
                                         f32 %259 = OpFMul %257 %258 
                                         f32 %260 = OpFAdd %259 %252 
                                                      OpStore %254 %260 
                                         f32 %261 = OpLoad %248 
                                         f32 %262 = OpLoad %254 
                                         f32 %263 = OpExtInst %1 40 %261 %262 
                                Private f32* %264 = OpAccessChain %180 %63 
                                                      OpStore %264 %263 
                  read_only Texture3DSampled %269 = OpLoad %268 
                                       f32_4 %270 = OpLoad %180 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 2 3 
                                       f32_4 %272 = OpImageSampleImplicitLod %269 %271 
                                                      OpStore %180 %272 
                                       f32_4 %273 = OpLoad %180 
                                                      OpStore %78 %273 
                                                      OpBranch %175 
                                             %274 = OpLabel 
                                Private f32* %275 = OpAccessChain %78 %63 
                                                      OpStore %275 %75 
                                Private f32* %276 = OpAccessChain %78 %176 
                                                      OpStore %276 %75 
                                Private f32* %277 = OpAccessChain %78 %255 
                                                      OpStore %277 %75 
                                Private f32* %278 = OpAccessChain %78 %91 
                                                      OpStore %278 %75 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_4 %279 = OpLoad %78 
                              Uniform f32_4* %280 = OpAccessChain %22 %105 
                                       f32_4 %281 = OpLoad %280 
                                         f32 %282 = OpDot %279 %281 
                                Private f32* %283 = OpAccessChain %114 %63 
                                                      OpStore %283 %282 
                                Private f32* %284 = OpAccessChain %114 %63 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpExtInst %1 43 %285 %102 %75 
                                Private f32* %287 = OpAccessChain %114 %63 
                                                      OpStore %287 %286 
                                       f32_3 %288 = OpLoad %90 
                                       f32_3 %289 = OpLoad %90 
                                         f32 %290 = OpDot %288 %289 
                                Private f32* %291 = OpAccessChain %90 %63 
                                                      OpStore %291 %290 
                  read_only Texture2DSampled %293 = OpLoad %292 
                                       f32_3 %294 = OpLoad %90 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 0 
                                       f32_4 %296 = OpImageSampleImplicitLod %293 %295 
                                         f32 %297 = OpCompositeExtract %296 3 
                                Private f32* %298 = OpAccessChain %90 %63 
                                                      OpStore %298 %297 
                                Private f32* %299 = OpAccessChain %114 %63 
                                         f32 %300 = OpLoad %299 
                                Private f32* %301 = OpAccessChain %90 %63 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %90 %63 
                                                      OpStore %304 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                              Uniform f32_4* %308 = OpAccessChain %22 %307 
                                       f32_4 %309 = OpLoad %308 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpFMul %306 %310 
                                                      OpStore %114 %311 
                                       f32_3 %314 = OpLoad %90 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 0 0 
                                       f32_3 %316 = OpLoad %114 
                                       f32_3 %317 = OpFMul %315 %316 
                                       f32_4 %318 = OpLoad %313 
                                       f32_4 %319 = OpVectorShuffle %318 %317 4 5 6 3 
                                                      OpStore %313 %319 
                                Private f32* %320 = OpAccessChain %9 %91 
                                         f32 %321 = OpLoad %320 
                                 Output f32* %323 = OpAccessChain %313 %91 
                                                      OpStore %323 %321 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 264
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %46 %252 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 RelaxedPrecision 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %138 SpecId 138 
                                                      OpDecorate %225 DescriptorSet 225 
                                                      OpDecorate %225 Binding 225 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %252 Location 252 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeStruct %7 %7 %18 %10 %10 %7 %6 %7 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                              %24 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                               Private f32_4* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                              %45 = OpTypePointer Input %13 
                                 Input f32_2* %46 = OpVariable Input 
                               Private f32_4* %49 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %56 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %57 = OpVariable UniformConstant 
                                          u32 %62 = OpConstant 0 
                                          i32 %65 = OpConstant 6 
                                              %66 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                               Private f32_4* %77 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                          u32 %89 = OpConstant 3 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                         f32 %100 = OpConstant 3.67402E-40 
                                         i32 %103 = OpConstant 0 
                                         i32 %104 = OpConstant 1 
                                         i32 %106 = OpConstant -1 
                                Private f32* %112 = OpVariable Private 
                                         i32 %115 = OpConstant 8 
                                        bool %132 = OpConstantFalse 
                                        bool %138 = OpSpecConstantFalse 
                                         u32 %141 = OpConstant 1 
                                             %145 = OpTypePointer Private %10 
                              Private f32_3* %146 = OpVariable Private 
                                         i32 %149 = OpConstant 2 
                                         i32 %171 = OpConstant 3 
                                             %176 = OpTypePointer Function %10 
                                         i32 %189 = OpConstant 4 
                                             %190 = OpTypePointer Uniform %10 
                                         f32 %207 = OpConstant 3.67402E-40 
                                Private f32* %210 = OpVariable Private 
                                         u32 %211 = OpConstant 2 
                                         f32 %214 = OpConstant 3.67402E-40 
                                             %222 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %223 = OpTypeSampledImage %222 
                                             %224 = OpTypePointer UniformConstant %223 
 UniformConstant read_only Texture3DSampled* %225 = OpVariable UniformConstant 
                              Private f32_4* %230 = OpVariable Private 
                              Private f32_3* %243 = OpVariable Private 
                                         i32 %246 = OpConstant 5 
                                             %251 = OpTypePointer Output %7 
                               Output f32_4* %252 = OpVariable Output 
                                             %261 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %177 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                        f32_2 %28 = OpFNegate %27 
                                        f32_2 %29 = OpFAdd %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_2 %47 = OpLoad %46 
                                        f32_4 %48 = OpImageSampleImplicitLod %44 %47 
                                                      OpStore %39 %48 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %54 = OpImageSampleImplicitLod %51 %53 
                                                      OpStore %49 %54 
                   read_only Texture2DSampled %58 = OpLoad %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                                          f32 %63 = OpCompositeExtract %61 0 
                                                      OpStore %56 %63 
                                          f32 %64 = OpLoad %56 
                                 Uniform f32* %67 = OpAccessChain %21 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 40 %64 %68 
                                 Private f32* %70 = OpAccessChain %9 %62 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %62 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpFNegate %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %9 %62 
                                                      OpStore %76 %75 
                                        f32_4 %78 = OpLoad %39 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpLoad %49 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %77 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                        f32_4 %84 = OpLoad %77 
                                        f32_4 %85 = OpFMul %83 %84 
                                        f32_4 %86 = OpLoad %39 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                 Private f32* %90 = OpAccessChain %9 %89 
                                          f32 %91 = OpLoad %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %88 %62 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %88 %62 
                                          f32 %99 = OpLoad %98 
                                        bool %101 = OpFOrdLessThan %99 %100 
                                                      OpStore %97 %101 
                                        bool %102 = OpLoad %97 
                                         i32 %105 = OpSelect %102 %104 %103 
                                         i32 %107 = OpIMul %105 %106 
                                        bool %108 = OpINotEqual %107 %103 
                                                      OpSelectionMerge %110 None 
                                                      OpBranchConditional %108 %109 %110 
                                             %109 = OpLabel 
                                                      OpKill
                                             %110 = OpLabel 
                                Private f32* %113 = OpAccessChain %9 %89 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %21 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %112 %119 
                                         f32 %120 = OpLoad %112 
                                        bool %121 = OpFOrdLessThan %120 %100 
                                                      OpStore %97 %121 
                                        bool %122 = OpLoad %97 
                                         i32 %123 = OpSelect %122 %104 %103 
                                         i32 %124 = OpIMul %123 %106 
                                        bool %125 = OpINotEqual %124 %103 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %127 
                                             %126 = OpLabel 
                                                      OpKill
                                             %127 = OpLabel 
                                Uniform f32* %129 = OpAccessChain %21 %104 %62 
                                         f32 %130 = OpLoad %129 
                                        bool %131 = OpFOrdEqual %130 %74 
                                                      OpStore %97 %131 
                                                      OpSelectionMerge %134 None 
                                                      OpBranchConditional %132 %133 %134 
                                             %133 = OpLabel 
                                        bool %135 = OpLoad %97 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpBranch %134 
                                             %134 = OpLabel 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %232 
                                             %139 = OpLabel 
                                Uniform f32* %142 = OpAccessChain %21 %104 %141 
                                         f32 %143 = OpLoad %142 
                                        bool %144 = OpFOrdEqual %143 %74 
                                                      OpStore %97 %144 
                                       f32_3 %147 = OpLoad %12 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 1 1 
                              Uniform f32_4* %150 = OpAccessChain %21 %149 %104 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFMul %148 %152 
                                                      OpStore %146 %153 
                              Uniform f32_4* %154 = OpAccessChain %21 %149 %103 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpLoad %12 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 0 0 
                                       f32_3 %159 = OpFMul %156 %158 
                                       f32_3 %160 = OpLoad %146 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %146 %161 
                              Uniform f32_4* %162 = OpAccessChain %21 %149 %149 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpLoad %12 
                                       f32_3 %166 = OpVectorShuffle %165 %165 2 2 2 
                                       f32_3 %167 = OpFMul %164 %166 
                                       f32_3 %168 = OpLoad %146 
                                       f32_3 %169 = OpFAdd %167 %168 
                                                      OpStore %146 %169 
                                       f32_3 %170 = OpLoad %146 
                              Uniform f32_4* %172 = OpAccessChain %21 %149 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFAdd %170 %174 
                                                      OpStore %146 %175 
                                        bool %178 = OpLoad %97 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %182 
                                             %179 = OpLabel 
                                       f32_3 %181 = OpLoad %146 
                                                      OpStore %177 %181 
                                                      OpBranch %180 
                                             %182 = OpLabel 
                                       f32_3 %183 = OpLoad %12 
                                                      OpStore %177 %183 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                       f32_3 %184 = OpLoad %177 
                                       f32_4 %185 = OpLoad %88 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                      OpStore %88 %186 
                                       f32_4 %187 = OpLoad %88 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_3* %191 = OpAccessChain %21 %189 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %188 %193 
                                       f32_4 %195 = OpLoad %88 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %88 %196 
                                       f32_4 %197 = OpLoad %88 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              Uniform f32_3* %199 = OpAccessChain %21 %171 
                                       f32_3 %200 = OpLoad %199 
                                       f32_3 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %88 
                                       f32_4 %203 = OpVectorShuffle %202 %201 0 4 5 6 
                                                      OpStore %88 %203 
                                Private f32* %204 = OpAccessChain %88 %141 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFMul %205 %34 
                                         f32 %208 = OpFAdd %206 %207 
                                Private f32* %209 = OpAccessChain %146 %62 
                                                      OpStore %209 %208 
                                Uniform f32* %212 = OpAccessChain %21 %104 %211 
                                         f32 %213 = OpLoad %212 
                                         f32 %215 = OpFMul %213 %214 
                                         f32 %216 = OpFAdd %215 %207 
                                                      OpStore %210 %216 
                                Private f32* %217 = OpAccessChain %146 %62 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpLoad %210 
                                         f32 %220 = OpExtInst %1 40 %218 %219 
                                Private f32* %221 = OpAccessChain %88 %62 
                                                      OpStore %221 %220 
                  read_only Texture3DSampled %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %88 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 2 3 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                                      OpStore %88 %229 
                                       f32_4 %231 = OpLoad %88 
                                                      OpStore %230 %231 
                                                      OpBranch %140 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %230 %62 
                                                      OpStore %233 %74 
                                Private f32* %234 = OpAccessChain %230 %141 
                                                      OpStore %234 %74 
                                Private f32* %235 = OpAccessChain %230 %211 
                                                      OpStore %235 %74 
                                Private f32* %236 = OpAccessChain %230 %89 
                                                      OpStore %236 %74 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                       f32_4 %237 = OpLoad %230 
                              Uniform f32_4* %238 = OpAccessChain %21 %103 
                                       f32_4 %239 = OpLoad %238 
                                         f32 %240 = OpDot %237 %239 
                                                      OpStore %112 %240 
                                         f32 %241 = OpLoad %112 
                                         f32 %242 = OpExtInst %1 43 %241 %100 %74 
                                                      OpStore %112 %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                              Uniform f32_4* %247 = OpAccessChain %21 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %245 %249 
                                                      OpStore %243 %250 
                                         f32 %253 = OpLoad %112 
                                       f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                                       f32_3 %255 = OpLoad %243 
                                       f32_3 %256 = OpFMul %254 %255 
                                       f32_4 %257 = OpLoad %252 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %252 %258 
                                Private f32* %259 = OpAccessChain %9 %89 
                                         f32 %260 = OpLoad %259 
                                 Output f32* %262 = OpAccessChain %252 %89 
                                                      OpStore %262 %260 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
bool u_xlatb2;
float u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 347
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %335 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 RelaxedPrecision 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 RelaxedPrecision 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %166 SpecId 166 
                                                      OpDecorate %255 DescriptorSet 255 
                                                      OpDecorate %255 Binding 255 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %294 DescriptorSet 294 
                                                      OpDecorate %294 Binding 294 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %310 DescriptorSet 310 
                                                      OpDecorate %310 Binding 310 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %335 Location 335 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %7 %7 %18 %10 %10 %7 %19 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 8 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 7 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                               Private f32_4* %89 = OpVariable Private 
                                          u32 %90 = OpConstant 3 
                                          f32 %93 = OpConstant 3.67402E-40 
                                              %96 = OpTypeBool 
                                              %97 = OpTypePointer Private %96 
                                Private bool* %98 = OpVariable Private 
                                         f32 %101 = OpConstant 3.67402E-40 
                                         i32 %104 = OpConstant 0 
                                         i32 %105 = OpConstant 1 
                                         i32 %107 = OpConstant -1 
                                Private f32* %113 = OpVariable Private 
                                         i32 %116 = OpConstant 9 
                                         i32 %132 = OpConstant 6 
                                         i32 %143 = OpConstant 2 
                                         i32 %152 = OpConstant 3 
                               Private bool* %156 = OpVariable Private 
                                        bool %160 = OpConstantFalse 
                                        bool %166 = OpSpecConstantFalse 
                                         u32 %169 = OpConstant 1 
                                             %173 = OpTypePointer Private %10 
                              Private f32_3* %174 = OpVariable Private 
                              Private f32_4* %202 = OpVariable Private 
                                             %203 = OpTypePointer Function %10 
                                         i32 %216 = OpConstant 4 
                                             %217 = OpTypePointer Uniform %10 
                                         f32 %234 = OpConstant 3.67402E-40 
                                             %237 = OpTypePointer Private %13 
                              Private f32_2* %238 = OpVariable Private 
                                         u32 %239 = OpConstant 2 
                                         f32 %242 = OpConstant 3.67402E-40 
                                             %252 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %253 = OpTypeSampledImage %252 
                                             %254 = OpTypePointer UniformConstant %253 
 UniformConstant read_only Texture3DSampled* %255 = OpVariable UniformConstant 
                               Private bool* %272 = OpVariable Private 
                              Private f32_3* %276 = OpVariable Private 
                                             %277 = OpTypePointer Function %6 
                                       f32_2 %291 = OpConstantComposite %242 %242 
                                Private f32* %293 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %294 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %310 = OpVariable UniformConstant 
                                         i32 %329 = OpConstant 5 
                                             %334 = OpTypePointer Output %7 
                               Output f32_4* %335 = OpVariable Output 
                                             %344 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %204 = OpVariable Function 
                               Function f32* %278 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %91 = OpAccessChain %9 %90 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFAdd %92 %93 
                                 Private f32* %95 = OpAccessChain %89 %63 
                                                      OpStore %95 %94 
                                 Private f32* %99 = OpAccessChain %89 %63 
                                         f32 %100 = OpLoad %99 
                                        bool %102 = OpFOrdLessThan %100 %101 
                                                      OpStore %98 %102 
                                        bool %103 = OpLoad %98 
                                         i32 %106 = OpSelect %103 %105 %104 
                                         i32 %108 = OpIMul %106 %107 
                                        bool %109 = OpINotEqual %108 %104 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpKill
                                             %111 = OpLabel 
                                Private f32* %114 = OpAccessChain %9 %90 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %22 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                         f32 %120 = OpFAdd %115 %119 
                                                      OpStore %113 %120 
                                         f32 %121 = OpLoad %113 
                                        bool %122 = OpFOrdLessThan %121 %101 
                                                      OpStore %98 %122 
                                        bool %123 = OpLoad %98 
                                         i32 %124 = OpSelect %123 %105 %104 
                                         i32 %125 = OpIMul %124 %107 
                                        bool %126 = OpINotEqual %125 %104 
                                                      OpSelectionMerge %128 None 
                                                      OpBranchConditional %126 %127 %128 
                                             %127 = OpLabel 
                                                      OpKill
                                             %128 = OpLabel 
                                       f32_3 %130 = OpLoad %12 
                                       f32_4 %131 = OpVectorShuffle %130 %130 1 1 1 1 
                              Uniform f32_4* %133 = OpAccessChain %22 %132 %105 
                                       f32_4 %134 = OpLoad %133 
                                       f32_4 %135 = OpFMul %131 %134 
                                                      OpStore %89 %135 
                              Uniform f32_4* %136 = OpAccessChain %22 %132 %104 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpLoad %12 
                                       f32_4 %139 = OpVectorShuffle %138 %138 0 0 0 0 
                                       f32_4 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %89 
                                       f32_4 %142 = OpFAdd %140 %141 
                                                      OpStore %89 %142 
                              Uniform f32_4* %144 = OpAccessChain %22 %132 %143 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpLoad %12 
                                       f32_4 %147 = OpVectorShuffle %146 %146 2 2 2 2 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %89 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %89 %150 
                                       f32_4 %151 = OpLoad %89 
                              Uniform f32_4* %153 = OpAccessChain %22 %132 %152 
                                       f32_4 %154 = OpLoad %153 
                                       f32_4 %155 = OpFAdd %151 %154 
                                                      OpStore %89 %155 
                                Uniform f32* %157 = OpAccessChain %22 %105 %63 
                                         f32 %158 = OpLoad %157 
                                        bool %159 = OpFOrdEqual %158 %75 
                                                      OpStore %156 %159 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %162 
                                             %161 = OpLabel 
                                        bool %163 = OpLoad %156 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %163 %164 %165 
                                             %164 = OpLabel 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                                      OpSelectionMerge %168 None 
                                                      OpBranchConditional %166 %167 %261 
                                             %167 = OpLabel 
                                Uniform f32* %170 = OpAccessChain %22 %105 %169 
                                         f32 %171 = OpLoad %170 
                                        bool %172 = OpFOrdEqual %171 %75 
                                                      OpStore %156 %172 
                                       f32_3 %175 = OpLoad %12 
                                       f32_3 %176 = OpVectorShuffle %175 %175 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %22 %143 %105 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFMul %176 %179 
                                                      OpStore %174 %180 
                              Uniform f32_4* %181 = OpAccessChain %22 %143 %104 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpLoad %12 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 0 0 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_3 %187 = OpLoad %174 
                                       f32_3 %188 = OpFAdd %186 %187 
                                                      OpStore %174 %188 
                              Uniform f32_4* %189 = OpAccessChain %22 %143 %143 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %192 = OpLoad %12 
                                       f32_3 %193 = OpVectorShuffle %192 %192 2 2 2 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_3 %195 = OpLoad %174 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %174 %196 
                                       f32_3 %197 = OpLoad %174 
                              Uniform f32_4* %198 = OpAccessChain %22 %143 %152 
                                       f32_4 %199 = OpLoad %198 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_3 %201 = OpFAdd %197 %200 
                                                      OpStore %174 %201 
                                        bool %205 = OpLoad %156 
                                                      OpSelectionMerge %207 None 
                                                      OpBranchConditional %205 %206 %209 
                                             %206 = OpLabel 
                                       f32_3 %208 = OpLoad %174 
                                                      OpStore %204 %208 
                                                      OpBranch %207 
                                             %209 = OpLabel 
                                       f32_3 %210 = OpLoad %12 
                                                      OpStore %204 %210 
                                                      OpBranch %207 
                                             %207 = OpLabel 
                                       f32_3 %211 = OpLoad %204 
                                       f32_4 %212 = OpLoad %202 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %202 %213 
                                       f32_4 %214 = OpLoad %202 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                              Uniform f32_3* %218 = OpAccessChain %22 %216 
                                       f32_3 %219 = OpLoad %218 
                                       f32_3 %220 = OpFNegate %219 
                                       f32_3 %221 = OpFAdd %215 %220 
                                       f32_4 %222 = OpLoad %202 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %202 %223 
                                       f32_4 %224 = OpLoad %202 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_3* %226 = OpAccessChain %22 %152 
                                       f32_3 %227 = OpLoad %226 
                                       f32_3 %228 = OpFMul %225 %227 
                                       f32_4 %229 = OpLoad %202 
                                       f32_4 %230 = OpVectorShuffle %229 %228 0 4 5 6 
                                                      OpStore %202 %230 
                                Private f32* %231 = OpAccessChain %202 %169 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFMul %232 %35 
                                         f32 %235 = OpFAdd %233 %234 
                                Private f32* %236 = OpAccessChain %174 %63 
                                                      OpStore %236 %235 
                                Uniform f32* %240 = OpAccessChain %22 %105 %239 
                                         f32 %241 = OpLoad %240 
                                         f32 %243 = OpFMul %241 %242 
                                         f32 %244 = OpFAdd %243 %234 
                                Private f32* %245 = OpAccessChain %238 %63 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %174 %63 
                                         f32 %247 = OpLoad %246 
                                Private f32* %248 = OpAccessChain %238 %63 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpExtInst %1 40 %247 %249 
                                Private f32* %251 = OpAccessChain %202 %63 
                                                      OpStore %251 %250 
                  read_only Texture3DSampled %256 = OpLoad %255 
                                       f32_4 %257 = OpLoad %202 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 2 3 
                                       f32_4 %259 = OpImageSampleImplicitLod %256 %258 
                                                      OpStore %202 %259 
                                       f32_4 %260 = OpLoad %202 
                                                      OpStore %78 %260 
                                                      OpBranch %168 
                                             %261 = OpLabel 
                                Private f32* %262 = OpAccessChain %78 %63 
                                                      OpStore %262 %75 
                                Private f32* %263 = OpAccessChain %78 %169 
                                                      OpStore %263 %75 
                                Private f32* %264 = OpAccessChain %78 %239 
                                                      OpStore %264 %75 
                                Private f32* %265 = OpAccessChain %78 %90 
                                                      OpStore %265 %75 
                                                      OpBranch %168 
                                             %168 = OpLabel 
                                       f32_4 %266 = OpLoad %78 
                              Uniform f32_4* %267 = OpAccessChain %22 %104 
                                       f32_4 %268 = OpLoad %267 
                                         f32 %269 = OpDot %266 %268 
                                                      OpStore %113 %269 
                                         f32 %270 = OpLoad %113 
                                         f32 %271 = OpExtInst %1 43 %270 %101 %75 
                                                      OpStore %113 %271 
                                Private f32* %273 = OpAccessChain %89 %239 
                                         f32 %274 = OpLoad %273 
                                        bool %275 = OpFOrdLessThan %101 %274 
                                                      OpStore %272 %275 
                                        bool %279 = OpLoad %272 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %279 %280 %282 
                                             %280 = OpLabel 
                                                      OpStore %278 %75 
                                                      OpBranch %281 
                                             %282 = OpLabel 
                                                      OpStore %278 %101 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %283 = OpLoad %278 
                                Private f32* %284 = OpAccessChain %276 %63 
                                                      OpStore %284 %283 
                                       f32_4 %285 = OpLoad %89 
                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                       f32_4 %287 = OpLoad %89 
                                       f32_2 %288 = OpVectorShuffle %287 %287 3 3 
                                       f32_2 %289 = OpFDiv %286 %288 
                                                      OpStore %238 %289 
                                       f32_2 %290 = OpLoad %238 
                                       f32_2 %292 = OpFAdd %290 %291 
                                                      OpStore %238 %292 
                  read_only Texture2DSampled %295 = OpLoad %294 
                                       f32_2 %296 = OpLoad %238 
                                       f32_4 %297 = OpImageSampleImplicitLod %295 %296 
                                         f32 %298 = OpCompositeExtract %297 3 
                                                      OpStore %293 %298 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %276 %63 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFMul %299 %301 
                                Private f32* %303 = OpAccessChain %276 %63 
                                                      OpStore %303 %302 
                                       f32_4 %304 = OpLoad %89 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_4 %306 = OpLoad %89 
                                       f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
                                         f32 %308 = OpDot %305 %307 
                                Private f32* %309 = OpAccessChain %89 %63 
                                                      OpStore %309 %308 
                  read_only Texture2DSampled %311 = OpLoad %310 
                                       f32_4 %312 = OpLoad %89 
                                       f32_2 %313 = OpVectorShuffle %312 %312 0 0 
                                       f32_4 %314 = OpImageSampleImplicitLod %311 %313 
                                         f32 %315 = OpCompositeExtract %314 3 
                                Private f32* %316 = OpAccessChain %89 %63 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %89 %63 
                                         f32 %318 = OpLoad %317 
                                Private f32* %319 = OpAccessChain %276 %63 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFMul %318 %320 
                                Private f32* %322 = OpAccessChain %276 %63 
                                                      OpStore %322 %321 
                                         f32 %323 = OpLoad %113 
                                Private f32* %324 = OpAccessChain %276 %63 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFMul %323 %325 
                                                      OpStore %113 %326 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                              Uniform f32_4* %330 = OpAccessChain %22 %329 
                                       f32_4 %331 = OpLoad %330 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFMul %328 %332 
                                                      OpStore %276 %333 
                                         f32 %336 = OpLoad %113 
                                       f32_3 %337 = OpCompositeConstruct %336 %336 %336 
                                       f32_3 %338 = OpLoad %276 
                                       f32_3 %339 = OpFMul %337 %338 
                                       f32_4 %340 = OpLoad %335 
                                       f32_4 %341 = OpVectorShuffle %340 %339 4 5 6 3 
                                                      OpStore %335 %341 
                                Private f32* %342 = OpAccessChain %9 %90 
                                         f32 %343 = OpLoad %342 
                                 Output f32* %345 = OpAccessChain %335 %90 
                                                      OpStore %345 %343 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 337
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %325 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 RelaxedPrecision 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 RelaxedPrecision 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %173 SpecId 173 
                                                      OpDecorate %268 DescriptorSet 268 
                                                      OpDecorate %268 Binding 268 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %291 DescriptorSet 291 
                                                      OpDecorate %291 Binding 291 
                                                      OpDecorate %300 DescriptorSet 300 
                                                      OpDecorate %300 Binding 300 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %325 Location 325 
                                                      OpDecorate %328 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %7 %7 %18 %10 %10 %7 %19 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 8 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 7 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %10 
                               Private f32_3* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                              Private f32_3* %114 = OpVariable Private 
                                         i32 %117 = OpConstant 9 
                                         i32 %135 = OpConstant 6 
                                         i32 %148 = OpConstant 2 
                                         i32 %158 = OpConstant 3 
                               Private bool* %163 = OpVariable Private 
                                        bool %167 = OpConstantFalse 
                                        bool %173 = OpSpecConstantFalse 
                                         u32 %176 = OpConstant 1 
                              Private f32_4* %180 = OpVariable Private 
                                             %219 = OpTypePointer Function %10 
                                         i32 %233 = OpConstant 4 
                                             %234 = OpTypePointer Uniform %10 
                                Private f32* %248 = OpVariable Private 
                                         f32 %252 = OpConstant 3.67402E-40 
                                Private f32* %254 = OpVariable Private 
                                         u32 %255 = OpConstant 2 
                                         f32 %258 = OpConstant 3.67402E-40 
                                             %265 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %266 = OpTypeSampledImage %265 
                                             %267 = OpTypePointer UniformConstant %266 
 UniformConstant read_only Texture3DSampled* %268 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %291 = OpVariable UniformConstant 
                                             %297 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %298 = OpTypeSampledImage %297 
                                             %299 = OpTypePointer UniformConstant %298 
UniformConstant read_only TextureCubeSampled* %300 = OpVariable UniformConstant 
                                         i32 %319 = OpConstant 5 
                                             %324 = OpTypePointer Output %7 
                               Output f32_4* %325 = OpVariable Output 
                                             %334 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %220 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %115 = OpAccessChain %9 %91 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %118 = OpAccessChain %22 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                         f32 %121 = OpFAdd %116 %120 
                                Private f32* %122 = OpAccessChain %114 %63 
                                                      OpStore %122 %121 
                                Private f32* %123 = OpAccessChain %114 %63 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdLessThan %124 %102 
                                                      OpStore %99 %125 
                                        bool %126 = OpLoad %99 
                                         i32 %127 = OpSelect %126 %106 %105 
                                         i32 %128 = OpIMul %127 %108 
                                        bool %129 = OpINotEqual %128 %105 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                       f32_3 %133 = OpLoad %12 
                                       f32_3 %134 = OpVectorShuffle %133 %133 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %22 %135 %106 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %134 %138 
                                                      OpStore %90 %139 
                              Uniform f32_4* %140 = OpAccessChain %22 %135 %105 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %12 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 0 0 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_3 %146 = OpLoad %90 
                                       f32_3 %147 = OpFAdd %145 %146 
                                                      OpStore %90 %147 
                              Uniform f32_4* %149 = OpAccessChain %22 %135 %148 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %12 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %90 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %90 %156 
                                       f32_3 %157 = OpLoad %90 
                              Uniform f32_4* %159 = OpAccessChain %22 %135 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %157 %161 
                                                      OpStore %90 %162 
                                Uniform f32* %164 = OpAccessChain %22 %106 %63 
                                         f32 %165 = OpLoad %164 
                                        bool %166 = OpFOrdEqual %165 %75 
                                                      OpStore %163 %166 
                                                      OpSelectionMerge %169 None 
                                                      OpBranchConditional %167 %168 %169 
                                             %168 = OpLabel 
                                        bool %170 = OpLoad %163 
                                                      OpSelectionMerge %172 None 
                                                      OpBranchConditional %170 %171 %172 
                                             %171 = OpLabel 
                                                      OpBranch %172 
                                             %172 = OpLabel 
                                                      OpBranch %169 
                                             %169 = OpLabel 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %274 
                                             %174 = OpLabel 
                                Uniform f32* %177 = OpAccessChain %22 %106 %176 
                                         f32 %178 = OpLoad %177 
                                        bool %179 = OpFOrdEqual %178 %75 
                                                      OpStore %163 %179 
                                       f32_3 %181 = OpLoad %12 
                                       f32_3 %182 = OpVectorShuffle %181 %181 1 1 1 
                              Uniform f32_4* %183 = OpAccessChain %22 %148 %106 
                                       f32_4 %184 = OpLoad %183 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %180 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %180 %188 
                              Uniform f32_4* %189 = OpAccessChain %22 %148 %105 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %192 = OpLoad %12 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %180 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                       f32_3 %197 = OpFAdd %194 %196 
                                       f32_4 %198 = OpLoad %180 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %180 %199 
                              Uniform f32_4* %200 = OpAccessChain %22 %148 %148 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpLoad %12 
                                       f32_3 %204 = OpVectorShuffle %203 %203 2 2 2 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %180 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %180 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %180 %210 
                                       f32_4 %211 = OpLoad %180 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                              Uniform f32_4* %213 = OpAccessChain %22 %148 %158 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFAdd %212 %215 
                                       f32_4 %217 = OpLoad %180 
                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 6 3 
                                                      OpStore %180 %218 
                                        bool %221 = OpLoad %163 
                                                      OpSelectionMerge %223 None 
                                                      OpBranchConditional %221 %222 %226 
                                             %222 = OpLabel 
                                       f32_4 %224 = OpLoad %180 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                                      OpStore %220 %225 
                                                      OpBranch %223 
                                             %226 = OpLabel 
                                       f32_3 %227 = OpLoad %12 
                                                      OpStore %220 %227 
                                                      OpBranch %223 
                                             %223 = OpLabel 
                                       f32_3 %228 = OpLoad %220 
                                       f32_4 %229 = OpLoad %180 
                                       f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                                      OpStore %180 %230 
                                       f32_4 %231 = OpLoad %180 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                              Uniform f32_3* %235 = OpAccessChain %22 %233 
                                       f32_3 %236 = OpLoad %235 
                                       f32_3 %237 = OpFNegate %236 
                                       f32_3 %238 = OpFAdd %232 %237 
                                       f32_4 %239 = OpLoad %180 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
                                                      OpStore %180 %240 
                                       f32_4 %241 = OpLoad %180 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_3* %243 = OpAccessChain %22 %158 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %180 
                                       f32_4 %247 = OpVectorShuffle %246 %245 0 4 5 6 
                                                      OpStore %180 %247 
                                Private f32* %249 = OpAccessChain %180 %176 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFMul %250 %35 
                                         f32 %253 = OpFAdd %251 %252 
                                                      OpStore %248 %253 
                                Uniform f32* %256 = OpAccessChain %22 %106 %255 
                                         f32 %257 = OpLoad %256 
                                         f32 %259 = OpFMul %257 %258 
                                         f32 %260 = OpFAdd %259 %252 
                                                      OpStore %254 %260 
                                         f32 %261 = OpLoad %248 
                                         f32 %262 = OpLoad %254 
                                         f32 %263 = OpExtInst %1 40 %261 %262 
                                Private f32* %264 = OpAccessChain %180 %63 
                                                      OpStore %264 %263 
                  read_only Texture3DSampled %269 = OpLoad %268 
                                       f32_4 %270 = OpLoad %180 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 2 3 
                                       f32_4 %272 = OpImageSampleImplicitLod %269 %271 
                                                      OpStore %180 %272 
                                       f32_4 %273 = OpLoad %180 
                                                      OpStore %78 %273 
                                                      OpBranch %175 
                                             %274 = OpLabel 
                                Private f32* %275 = OpAccessChain %78 %63 
                                                      OpStore %275 %75 
                                Private f32* %276 = OpAccessChain %78 %176 
                                                      OpStore %276 %75 
                                Private f32* %277 = OpAccessChain %78 %255 
                                                      OpStore %277 %75 
                                Private f32* %278 = OpAccessChain %78 %91 
                                                      OpStore %278 %75 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_4 %279 = OpLoad %78 
                              Uniform f32_4* %280 = OpAccessChain %22 %105 
                                       f32_4 %281 = OpLoad %280 
                                         f32 %282 = OpDot %279 %281 
                                Private f32* %283 = OpAccessChain %114 %63 
                                                      OpStore %283 %282 
                                Private f32* %284 = OpAccessChain %114 %63 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpExtInst %1 43 %285 %102 %75 
                                Private f32* %287 = OpAccessChain %114 %63 
                                                      OpStore %287 %286 
                                       f32_3 %288 = OpLoad %90 
                                       f32_3 %289 = OpLoad %90 
                                         f32 %290 = OpDot %288 %289 
                                                      OpStore %248 %290 
                  read_only Texture2DSampled %292 = OpLoad %291 
                                         f32 %293 = OpLoad %248 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                       f32_4 %295 = OpImageSampleImplicitLod %292 %294 
                                         f32 %296 = OpCompositeExtract %295 3 
                                                      OpStore %248 %296 
                read_only TextureCubeSampled %301 = OpLoad %300 
                                       f32_3 %302 = OpLoad %90 
                                       f32_4 %303 = OpImageSampleImplicitLod %301 %302 
                                         f32 %304 = OpCompositeExtract %303 3 
                                Private f32* %305 = OpAccessChain %90 %63 
                                                      OpStore %305 %304 
                                Private f32* %306 = OpAccessChain %90 %63 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpLoad %248 
                                         f32 %309 = OpFMul %307 %308 
                                Private f32* %310 = OpAccessChain %90 %63 
                                                      OpStore %310 %309 
                                Private f32* %311 = OpAccessChain %114 %63 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %90 %63 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFMul %312 %314 
                                Private f32* %316 = OpAccessChain %90 %63 
                                                      OpStore %316 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
                              Uniform f32_4* %320 = OpAccessChain %22 %319 
                                       f32_4 %321 = OpLoad %320 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                       f32_3 %323 = OpFMul %318 %322 
                                                      OpStore %114 %323 
                                       f32_3 %326 = OpLoad %90 
                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
                                       f32_3 %328 = OpLoad %114 
                                       f32_3 %329 = OpFMul %327 %328 
                                       f32_4 %330 = OpLoad %325 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %325 %331 
                                Private f32* %332 = OpAccessChain %9 %91 
                                         f32 %333 = OpLoad %332 
                                 Output f32* %335 = OpAccessChain %325 %91 
                                                      OpStore %335 %333 
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
uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat16_2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture(_SubTex, u_xlat0.xy);
    u_xlat10_0 = texture(_BlendTex, u_xlat0.xy);
    u_xlat0.x = max(u_xlat10_0.x, _BlendMin);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
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
; Bound: 321
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %47 %309 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 RelaxedPrecision 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 RelaxedPrecision 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpMemberDecorate %20 9 RelaxedPrecision 
                                                      OpMemberDecorate %20 9 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %58 DescriptorSet 58 
                                                      OpDecorate %58 Binding 58 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %174 SpecId 174 
                                                      OpDecorate %269 DescriptorSet 269 
                                                      OpDecorate %269 Binding 269 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %289 DescriptorSet 289 
                                                      OpDecorate %289 Binding 289 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %312 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %7 %7 %18 %10 %10 %7 %19 %6 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 8 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %35 = OpConstant 3.67402E-40 
                                        f32_2 %36 = OpConstantComposite %35 %35 
                               Private f32_4* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypePointer Input %13 
                                 Input f32_2* %47 = OpVariable Input 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                              %56 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                          u32 %63 = OpConstant 0 
                                          i32 %66 = OpConstant 7 
                                              %67 = OpTypePointer Uniform %6 
                                          f32 %75 = OpConstant 3.67402E-40 
                               Private f32_4* %78 = OpVariable Private 
                                              %89 = OpTypePointer Private %13 
                               Private f32_2* %90 = OpVariable Private 
                                          u32 %91 = OpConstant 3 
                                          f32 %94 = OpConstant 3.67402E-40 
                                              %97 = OpTypeBool 
                                              %98 = OpTypePointer Private %97 
                                Private bool* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.67402E-40 
                                         i32 %105 = OpConstant 0 
                                         i32 %106 = OpConstant 1 
                                         i32 %108 = OpConstant -1 
                                             %114 = OpTypePointer Private %10 
                              Private f32_3* %115 = OpVariable Private 
                                         i32 %118 = OpConstant 9 
                                         i32 %136 = OpConstant 6 
                                         i32 %149 = OpConstant 2 
                                         i32 %159 = OpConstant 3 
                               Private bool* %164 = OpVariable Private 
                                        bool %168 = OpConstantFalse 
                                        bool %174 = OpSpecConstantFalse 
                                         u32 %177 = OpConstant 1 
                              Private f32_4* %181 = OpVariable Private 
                                             %220 = OpTypePointer Function %10 
                                         i32 %234 = OpConstant 4 
                                             %235 = OpTypePointer Uniform %10 
                                Private f32* %249 = OpVariable Private 
                                         f32 %253 = OpConstant 3.67402E-40 
                                Private f32* %255 = OpVariable Private 
                                         u32 %256 = OpConstant 2 
                                         f32 %259 = OpConstant 3.67402E-40 
                                             %266 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %267 = OpTypeSampledImage %266 
                                             %268 = OpTypePointer UniformConstant %267 
 UniformConstant read_only Texture3DSampled* %269 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %289 = OpVariable UniformConstant 
                                         i32 %303 = OpConstant 5 
                                             %308 = OpTypePointer Output %7 
                               Output f32_4* %309 = OpVariable Output 
                                             %318 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %221 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFNegate %28 
                                        f32_2 %30 = OpFAdd %15 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
                                                      OpStore %9 %32 
                                        f32_4 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %37 = OpFMul %34 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %48 = OpLoad %47 
                                        f32_4 %49 = OpImageSampleImplicitLod %45 %48 
                                                      OpStore %40 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                   read_only Texture2DSampled %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_4 %62 = OpImageSampleImplicitLod %59 %61 
                                          f32 %64 = OpCompositeExtract %62 0 
                                                      OpStore %57 %64 
                                          f32 %65 = OpLoad %57 
                                 Uniform f32* %68 = OpAccessChain %22 %66 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpExtInst %1 40 %65 %69 
                                 Private f32* %71 = OpAccessChain %9 %63 
                                                      OpStore %71 %70 
                                 Private f32* %72 = OpAccessChain %9 %63 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFNegate %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %9 %63 
                                                      OpStore %77 %76 
                                        f32_4 %79 = OpLoad %40 
                                        f32_4 %80 = OpFNegate %79 
                                        f32_4 %81 = OpLoad %50 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %78 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpLoad %78 
                                        f32_4 %86 = OpFMul %84 %85 
                                        f32_4 %87 = OpLoad %40 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                 Private f32* %92 = OpAccessChain %9 %91 
                                          f32 %93 = OpLoad %92 
                                          f32 %95 = OpFAdd %93 %94 
                                 Private f32* %96 = OpAccessChain %90 %63 
                                                      OpStore %96 %95 
                                Private f32* %100 = OpAccessChain %90 %63 
                                         f32 %101 = OpLoad %100 
                                        bool %103 = OpFOrdLessThan %101 %102 
                                                      OpStore %99 %103 
                                        bool %104 = OpLoad %99 
                                         i32 %107 = OpSelect %104 %106 %105 
                                         i32 %109 = OpIMul %107 %108 
                                        bool %110 = OpINotEqual %109 %105 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpKill
                                             %112 = OpLabel 
                                Private f32* %116 = OpAccessChain %9 %91 
                                         f32 %117 = OpLoad %116 
                                Uniform f32* %119 = OpAccessChain %22 %118 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                         f32 %122 = OpFAdd %117 %121 
                                Private f32* %123 = OpAccessChain %115 %63 
                                                      OpStore %123 %122 
                                Private f32* %124 = OpAccessChain %115 %63 
                                         f32 %125 = OpLoad %124 
                                        bool %126 = OpFOrdLessThan %125 %102 
                                                      OpStore %99 %126 
                                        bool %127 = OpLoad %99 
                                         i32 %128 = OpSelect %127 %106 %105 
                                         i32 %129 = OpIMul %128 %108 
                                        bool %130 = OpINotEqual %129 %105 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                                      OpKill
                                             %132 = OpLabel 
                                       f32_3 %134 = OpLoad %12 
                                       f32_2 %135 = OpVectorShuffle %134 %134 1 1 
                              Uniform f32_4* %137 = OpAccessChain %22 %136 %106 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                                       f32_2 %140 = OpFMul %135 %139 
                                                      OpStore %90 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %136 %105 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_3 %144 = OpLoad %12 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 0 
                                       f32_2 %146 = OpFMul %143 %145 
                                       f32_2 %147 = OpLoad %90 
                                       f32_2 %148 = OpFAdd %146 %147 
                                                      OpStore %90 %148 
                              Uniform f32_4* %150 = OpAccessChain %22 %136 %149 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
                                       f32_3 %153 = OpLoad %12 
                                       f32_2 %154 = OpVectorShuffle %153 %153 2 2 
                                       f32_2 %155 = OpFMul %152 %154 
                                       f32_2 %156 = OpLoad %90 
                                       f32_2 %157 = OpFAdd %155 %156 
                                                      OpStore %90 %157 
                                       f32_2 %158 = OpLoad %90 
                              Uniform f32_4* %160 = OpAccessChain %22 %136 %159 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFAdd %158 %162 
                                                      OpStore %90 %163 
                                Uniform f32* %165 = OpAccessChain %22 %106 %63 
                                         f32 %166 = OpLoad %165 
                                        bool %167 = OpFOrdEqual %166 %75 
                                                      OpStore %164 %167 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %170 
                                             %169 = OpLabel 
                                        bool %171 = OpLoad %164 
                                                      OpSelectionMerge %173 None 
                                                      OpBranchConditional %171 %172 %173 
                                             %172 = OpLabel 
                                                      OpBranch %173 
                                             %173 = OpLabel 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %275 
                                             %175 = OpLabel 
                                Uniform f32* %178 = OpAccessChain %22 %106 %177 
                                         f32 %179 = OpLoad %178 
                                        bool %180 = OpFOrdEqual %179 %75 
                                                      OpStore %164 %180 
                                       f32_3 %182 = OpLoad %12 
                                       f32_3 %183 = OpVectorShuffle %182 %182 1 1 1 
                              Uniform f32_4* %184 = OpAccessChain %22 %149 %106 
                                       f32_4 %185 = OpLoad %184 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %181 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %181 %189 
                              Uniform f32_4* %190 = OpAccessChain %22 %149 %105 
                                       f32_4 %191 = OpLoad %190 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpLoad %12 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %181 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpFAdd %195 %197 
                                       f32_4 %199 = OpLoad %181 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                                      OpStore %181 %200 
                              Uniform f32_4* %201 = OpAccessChain %22 %149 %149 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
                                       f32_3 %204 = OpLoad %12 
                                       f32_3 %205 = OpVectorShuffle %204 %204 2 2 2 
                                       f32_3 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %181 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpFAdd %206 %208 
                                       f32_4 %210 = OpLoad %181 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 5 6 3 
                                                      OpStore %181 %211 
                                       f32_4 %212 = OpLoad %181 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                              Uniform f32_4* %214 = OpAccessChain %22 %149 %159 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                                       f32_3 %217 = OpFAdd %213 %216 
                                       f32_4 %218 = OpLoad %181 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
                                                      OpStore %181 %219 
                                        bool %222 = OpLoad %164 
                                                      OpSelectionMerge %224 None 
                                                      OpBranchConditional %222 %223 %227 
                                             %223 = OpLabel 
                                       f32_4 %225 = OpLoad %181 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                                      OpStore %221 %226 
                                                      OpBranch %224 
                                             %227 = OpLabel 
                                       f32_3 %228 = OpLoad %12 
                                                      OpStore %221 %228 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                       f32_3 %229 = OpLoad %221 
                                       f32_4 %230 = OpLoad %181 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %181 %231 
                                       f32_4 %232 = OpLoad %181 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              Uniform f32_3* %236 = OpAccessChain %22 %234 
                                       f32_3 %237 = OpLoad %236 
                                       f32_3 %238 = OpFNegate %237 
                                       f32_3 %239 = OpFAdd %233 %238 
                                       f32_4 %240 = OpLoad %181 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %181 %241 
                                       f32_4 %242 = OpLoad %181 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                              Uniform f32_3* %244 = OpAccessChain %22 %159 
                                       f32_3 %245 = OpLoad %244 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %181 
                                       f32_4 %248 = OpVectorShuffle %247 %246 0 4 5 6 
                                                      OpStore %181 %248 
                                Private f32* %250 = OpAccessChain %181 %177 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpFMul %251 %35 
                                         f32 %254 = OpFAdd %252 %253 
                                                      OpStore %249 %254 
                                Uniform f32* %257 = OpAccessChain %22 %106 %256 
                                         f32 %258 = OpLoad %257 
                                         f32 %260 = OpFMul %258 %259 
                                         f32 %261 = OpFAdd %260 %253 
                                                      OpStore %255 %261 
                                         f32 %262 = OpLoad %255 
                                         f32 %263 = OpLoad %249 
                                         f32 %264 = OpExtInst %1 40 %262 %263 
                                Private f32* %265 = OpAccessChain %181 %63 
                                                      OpStore %265 %264 
                  read_only Texture3DSampled %270 = OpLoad %269 
                                       f32_4 %271 = OpLoad %181 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 2 3 
                                       f32_4 %273 = OpImageSampleImplicitLod %270 %272 
                                                      OpStore %181 %273 
                                       f32_4 %274 = OpLoad %181 
                                                      OpStore %78 %274 
                                                      OpBranch %176 
                                             %275 = OpLabel 
                                Private f32* %276 = OpAccessChain %78 %63 
                                                      OpStore %276 %75 
                                Private f32* %277 = OpAccessChain %78 %177 
                                                      OpStore %277 %75 
                                Private f32* %278 = OpAccessChain %78 %256 
                                                      OpStore %278 %75 
                                Private f32* %279 = OpAccessChain %78 %91 
                                                      OpStore %279 %75 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_4 %280 = OpLoad %78 
                              Uniform f32_4* %281 = OpAccessChain %22 %105 
                                       f32_4 %282 = OpLoad %281 
                                         f32 %283 = OpDot %280 %282 
                                Private f32* %284 = OpAccessChain %115 %63 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %115 %63 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpExtInst %1 43 %286 %102 %75 
                                Private f32* %288 = OpAccessChain %115 %63 
                                                      OpStore %288 %287 
                  read_only Texture2DSampled %290 = OpLoad %289 
                                       f32_2 %291 = OpLoad %90 
                                       f32_4 %292 = OpImageSampleImplicitLod %290 %291 
                                         f32 %293 = OpCompositeExtract %292 3 
                                Private f32* %294 = OpAccessChain %90 %63 
                                                      OpStore %294 %293 
                                Private f32* %295 = OpAccessChain %115 %63 
                                         f32 %296 = OpLoad %295 
                                Private f32* %297 = OpAccessChain %90 %63 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFMul %296 %298 
                                Private f32* %300 = OpAccessChain %90 %63 
                                                      OpStore %300 %299 
                                       f32_4 %301 = OpLoad %9 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                              Uniform f32_4* %304 = OpAccessChain %22 %303 
                                       f32_4 %305 = OpLoad %304 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                                       f32_3 %307 = OpFMul %302 %306 
                                                      OpStore %115 %307 
                                       f32_2 %310 = OpLoad %90 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 0 0 
                                       f32_3 %312 = OpLoad %115 
                                       f32_3 %313 = OpFMul %311 %312 
                                       f32_4 %314 = OpLoad %309 
                                       f32_4 %315 = OpVectorShuffle %314 %313 4 5 6 3 
                                                      OpStore %309 %315 
                                Private f32* %316 = OpAccessChain %9 %91 
                                         f32 %317 = OpLoad %316 
                                 Output f32* %319 = OpAccessChain %309 %91 
                                                      OpStore %319 %317 
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
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 164410
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
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.y = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlatb9 = 0.0<in_POSITION0.z;
    u_xlat1.z = u_xlatb9 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xz = in_POSITION0.xz;
    u_xlat0.xzw = (unity_MetaVertexControl.x) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlatb3 = 0.0<u_xlat0.w;
    u_xlat2.z = u_xlatb3 ? 9.99999975e-005 : float(0.0);
    u_xlat2.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat2.xyz : u_xlat0.xzw;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2 = u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _BlendMin;
uniform 	vec4 _BaseWorldPosition;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _SubTex;
uniform  sampler2D _BlendTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat16_0;
vec4 u_xlat10_0;
float u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat10_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_BaseWorldPosition.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.25, 0.25);
    u_xlat10_1 = texture(_BlendTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SubTex, u_xlat0.xy);
    u_xlat1 = max(u_xlat10_1.x, _BlendMin);
    u_xlat1 = (-u_xlat1) + 1.0;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 + (-u_xlat10_2);
    u_xlat0 = vec4(u_xlat1) * u_xlat16_0 + u_xlat10_2;
    u_xlat1 = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat9 = u_xlat0.w + (-_Cutoff);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlatb9 = u_xlat9<0.0;
    if((int(u_xlatb9) * int(0xffffffffu))!=0){discard;}
    u_xlat9 = unity_OneOverOutputBoost;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
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
; Bound: 267
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %47 %76 %158 %231 %242 %243 %256 %259 
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
                                                      OpDecorate %158 Location 158 
                                                      OpMemberDecorate %229 0 BuiltIn 229 
                                                      OpMemberDecorate %229 1 BuiltIn 229 
                                                      OpMemberDecorate %229 2 BuiltIn 229 
                                                      OpDecorate %229 Block 
                                                      OpDecorate %242 Location 242 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %256 Location 256 
                                                      OpDecorate %259 Location 259 
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
                                         i32 %137 = OpConstant 3 
                               Private bool* %145 = OpVariable Private 
                                         u32 %146 = OpConstant 3 
                              Private f32_4* %150 = OpVariable Private 
                                Input f32_4* %158 = OpVariable Input 
                                             %228 = OpTypeArray %6 %48 
                                             %229 = OpTypeStruct %7 %6 %228 
                                             %230 = OpTypePointer Output %229 
        Output struct {f32_4; f32; f32[1];}* %231 = OpVariable Output 
                                             %239 = OpTypePointer Output %7 
                                             %241 = OpTypePointer Output %77 
                               Output f32_2* %242 = OpVariable Output 
                                Input f32_4* %243 = OpVariable Input 
                                         i32 %246 = OpConstant 7 
                                             %255 = OpTypePointer Output %96 
                               Output f32_3* %256 = OpVariable Output 
                               Output f32_4* %259 = OpVariable Output 
                                             %261 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %68 = OpVariable Function 
                              Function f32_3* %98 = OpVariable Function 
                               Function f32* %151 = OpVariable Function 
                             Function f32_3* %171 = OpVariable Function 
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
                              Uniform f32_4* %138 = OpAccessChain %17 %118 %137 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %47 
                                       f32_4 %141 = OpVectorShuffle %140 %140 3 3 3 3 
                                       f32_4 %142 = OpFMul %139 %141 
                                       f32_4 %143 = OpLoad %66 
                                       f32_4 %144 = OpFAdd %142 %143 
                                                      OpStore %66 %144 
                                Private f32* %147 = OpAccessChain %9 %146 
                                         f32 %148 = OpLoad %147 
                                        bool %149 = OpFOrdLessThan %61 %148 
                                                      OpStore %145 %149 
                                        bool %152 = OpLoad %145 
                                                      OpSelectionMerge %154 None 
                                                      OpBranchConditional %152 %153 %155 
                                             %153 = OpLabel 
                                                      OpStore %151 %72 
                                                      OpBranch %154 
                                             %155 = OpLabel 
                                                      OpStore %151 %61 
                                                      OpBranch %154 
                                             %154 = OpLabel 
                                         f32 %156 = OpLoad %151 
                                Private f32* %157 = OpAccessChain %150 %62 
                                                      OpStore %157 %156 
                                       f32_4 %159 = OpLoad %158 
                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
                              Uniform f32_4* %161 = OpAccessChain %17 %137 
                                       f32_4 %162 = OpLoad %161 
                                       f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                                       f32_2 %164 = OpFMul %160 %163 
                              Uniform f32_4* %165 = OpAccessChain %17 %137 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 2 3 
                                       f32_2 %168 = OpFAdd %164 %167 
                                       f32_4 %169 = OpLoad %150 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %150 %170 
                              Uniform u32_4* %172 = OpAccessChain %17 %99 
                                       u32_4 %173 = OpLoad %172 
                                         u32 %174 = OpCompositeExtract %173 1 
                                        bool %175 = OpINotEqual %174 %25 
                                                      OpSelectionMerge %177 None 
                                                      OpBranchConditional %175 %176 %180 
                                             %176 = OpLabel 
                                       f32_4 %178 = OpLoad %150 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                                      OpStore %171 %179 
                                                      OpBranch %177 
                                             %180 = OpLabel 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 2 3 
                                                      OpStore %171 %182 
                                                      OpBranch %177 
                                             %177 = OpLabel 
                                       f32_3 %183 = OpLoad %171 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %9 %185 
                                       f32_4 %186 = OpLoad %9 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 1 1 1 
                              Uniform f32_4* %188 = OpAccessChain %17 %118 %119 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpFMul %187 %189 
                                                      OpStore %150 %190 
                              Uniform f32_4* %191 = OpAccessChain %17 %118 %118 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_4 %194 = OpVectorShuffle %193 %193 0 0 0 0 
                                       f32_4 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %150 
                                       f32_4 %197 = OpFAdd %195 %196 
                                                      OpStore %150 %197 
                              Uniform f32_4* %198 = OpAccessChain %17 %118 %80 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %9 
                                       f32_4 %201 = OpVectorShuffle %200 %200 2 2 2 2 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %150 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %9 %204 
                                       f32_4 %205 = OpLoad %9 
                              Uniform f32_4* %206 = OpAccessChain %17 %118 %137 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpFAdd %205 %207 
                                                      OpStore %9 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 1 1 1 1 
                              Uniform f32_4* %211 = OpAccessChain %17 %119 %119 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpFMul %210 %212 
                                                      OpStore %150 %213 
                              Uniform f32_4* %214 = OpAccessChain %17 %119 %118 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %216 0 0 0 0 
                                       f32_4 %218 = OpFMul %215 %217 
                                       f32_4 %219 = OpLoad %150 
                                       f32_4 %220 = OpFAdd %218 %219 
                                                      OpStore %150 %220 
                              Uniform f32_4* %221 = OpAccessChain %17 %119 %80 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %9 
                                       f32_4 %224 = OpVectorShuffle %223 %223 2 2 2 2 
                                       f32_4 %225 = OpFMul %222 %224 
                                       f32_4 %226 = OpLoad %150 
                                       f32_4 %227 = OpFAdd %225 %226 
                                                      OpStore %150 %227 
                              Uniform f32_4* %232 = OpAccessChain %17 %119 %137 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %234 3 3 3 3 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %150 
                                       f32_4 %238 = OpFAdd %236 %237 
                               Output f32_4* %240 = OpAccessChain %231 %118 
                                                      OpStore %240 %238 
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
                                       f32_4 %257 = OpLoad %66 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                                      OpStore %256 %258 
                                       f32_4 %260 = OpLoad %66 
                                                      OpStore %259 %260 
                                 Output f32* %262 = OpAccessChain %231 %118 %48 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFNegate %263 
                                 Output f32* %265 = OpAccessChain %231 %118 %48 
                                                      OpStore %265 %264 
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
                                                      OpEntryPoint Fragment %4 "main" %12 %73 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 RelaxedPrecision 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %70 DescriptorSet 70 
                                                      OpDecorate %70 Binding 70 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 Location 73 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                              %17 = OpTypeVector %16 4 
                                              %18 = OpTypeStruct %6 %7 %17 %6 %6 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32; f32_4; u32_4; f32; f32; f32;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          f32 %33 = OpConstant 3.67402E-40 
                                        f32_2 %34 = OpConstantComposite %33 %33 
                                              %38 = OpTypePointer Private %6 
                                 Private f32* %39 = OpVariable Private 
                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %41 = OpTypeSampledImage %40 
                                              %42 = OpTypePointer UniformConstant %41 
  UniformConstant read_only Texture2DSampled* %43 = OpVariable UniformConstant 
                                          u32 %48 = OpConstant 0 
                               Private f32_4* %50 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                          i32 %57 = OpConstant 0 
                                              %58 = OpTypePointer Uniform %6 
                                          f32 %66 = OpConstant 3.67402E-40 
                               Private f32_4* %69 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %70 = OpVariable UniformConstant 
                                              %72 = OpTypePointer Input %13 
                                 Input f32_2* %73 = OpVariable Input 
                               Private f32_4* %76 = OpVariable Private 
                                 Private f32* %87 = OpVariable Private 
                                          u32 %88 = OpConstant 3 
                                          f32 %91 = OpConstant 3.67402E-40 
                                              %93 = OpTypeBool 
                                              %94 = OpTypePointer Private %93 
                                Private bool* %95 = OpVariable Private 
                                          f32 %97 = OpConstant 3.67402E-40 
                                         i32 %101 = OpConstant -1 
                                Private f32* %107 = OpVariable Private 
                                         i32 %110 = OpConstant 5 
                               Private bool* %120 = OpVariable Private 
                                Private f32* %130 = OpVariable Private 
                                         i32 %131 = OpConstant 3 
                                         i32 %150 = OpConstant 4 
                              Private f32_4* %165 = OpVariable Private 
                                             %166 = OpTypePointer Function %10 
                                         i32 %168 = OpConstant 2 
                                             %169 = OpTypeVector %93 4 
                                             %170 = OpTypePointer Uniform %17 
                                       f32_3 %180 = OpConstantComposite %97 %97 %97 
                                             %184 = OpTypePointer Function %6 
                                             %195 = OpTypePointer Output %7 
                               Output f32_4* %196 = OpVariable Output 
                                             %197 = OpTypePointer Function %7 
                                       f32_4 %205 = OpConstantComposite %97 %97 %97 %66 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %167 = OpVariable Function 
                               Function f32* %185 = OpVariable Function 
                             Function f32_4* %198 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %24 = OpAccessChain %20 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                        f32_2 %27 = OpFNegate %26 
                                        f32_2 %28 = OpFAdd %15 %27 
                                        f32_4 %29 = OpLoad %9 
                                        f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                                      OpStore %9 %30 
                                        f32_4 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                        f32_2 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                                      OpStore %9 %37 
                   read_only Texture2DSampled %44 = OpLoad %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_4 %47 = OpImageSampleImplicitLod %44 %46 
                                          f32 %49 = OpCompositeExtract %47 0 
                                                      OpStore %39 %49 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %55 = OpImageSampleImplicitLod %52 %54 
                                                      OpStore %50 %55 
                                          f32 %56 = OpLoad %39 
                                 Uniform f32* %59 = OpAccessChain %20 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpExtInst %1 40 %56 %60 
                                 Private f32* %62 = OpAccessChain %9 %48 
                                                      OpStore %62 %61 
                                 Private f32* %63 = OpAccessChain %9 %48 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFNegate %64 
                                          f32 %67 = OpFAdd %65 %66 
                                 Private f32* %68 = OpAccessChain %9 %48 
                                                      OpStore %68 %67 
                   read_only Texture2DSampled %71 = OpLoad %70 
                                        f32_2 %74 = OpLoad %73 
                                        f32_4 %75 = OpImageSampleImplicitLod %71 %74 
                                                      OpStore %69 %75 
                                        f32_4 %77 = OpLoad %50 
                                        f32_4 %78 = OpLoad %69 
                                        f32_4 %79 = OpFNegate %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpVectorShuffle %81 %81 0 0 0 0 
                                        f32_4 %83 = OpLoad %76 
                                        f32_4 %84 = OpFMul %82 %83 
                                        f32_4 %85 = OpLoad %69 
                                        f32_4 %86 = OpFAdd %84 %85 
                                                      OpStore %9 %86 
                                 Private f32* %89 = OpAccessChain %9 %88 
                                          f32 %90 = OpLoad %89 
                                          f32 %92 = OpFAdd %90 %91 
                                                      OpStore %87 %92 
                                          f32 %96 = OpLoad %87 
                                         bool %98 = OpFOrdLessThan %96 %97 
                                                      OpStore %95 %98 
                                         bool %99 = OpLoad %95 
                                         i32 %100 = OpSelect %99 %22 %57 
                                         i32 %102 = OpIMul %100 %101 
                                        bool %103 = OpINotEqual %102 %57 
                                                      OpSelectionMerge %105 None 
                                                      OpBranchConditional %103 %104 %105 
                                             %104 = OpLabel 
                                                      OpKill
                                             %105 = OpLabel 
                                Private f32* %108 = OpAccessChain %9 %88 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %111 = OpAccessChain %20 %110 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                         f32 %114 = OpFAdd %109 %113 
                                                      OpStore %107 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpExtInst %1 30 %116 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %9 %119 
                                         f32 %121 = OpLoad %107 
                                        bool %122 = OpFOrdLessThan %121 %97 
                                                      OpStore %120 %122 
                                        bool %123 = OpLoad %120 
                                         i32 %124 = OpSelect %123 %22 %57 
                                         i32 %125 = OpIMul %124 %101 
                                        bool %126 = OpINotEqual %125 %57 
                                                      OpSelectionMerge %128 None 
                                                      OpBranchConditional %126 %127 %128 
                                             %127 = OpLabel 
                                                      OpKill
                                             %128 = OpLabel 
                                Uniform f32* %132 = OpAccessChain %20 %131 
                                         f32 %133 = OpLoad %132 
                                                      OpStore %130 %133 
                                         f32 %134 = OpLoad %130 
                                         f32 %135 = OpExtInst %1 43 %134 %97 %66 
                                                      OpStore %130 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                         f32 %138 = OpLoad %130 
                                       f32_3 %139 = OpCompositeConstruct %138 %138 %138 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %9 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %9 %142 
                                       f32_4 %143 = OpLoad %9 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpExtInst %1 29 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %9 %147 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                Uniform f32* %151 = OpAccessChain %20 %150 
                                         f32 %152 = OpLoad %151 
                                Uniform f32* %153 = OpAccessChain %20 %150 
                                         f32 %154 = OpLoad %153 
                                Uniform f32* %155 = OpAccessChain %20 %150 
                                         f32 %156 = OpLoad %155 
                                       f32_3 %157 = OpCompositeConstruct %152 %154 %156 
                                         f32 %158 = OpCompositeExtract %157 0 
                                         f32 %159 = OpCompositeExtract %157 1 
                                         f32 %160 = OpCompositeExtract %157 2 
                                       f32_3 %161 = OpCompositeConstruct %158 %159 %160 
                                       f32_3 %162 = OpExtInst %1 37 %149 %161 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                      OpStore %9 %164 
                              Uniform u32_4* %171 = OpAccessChain %20 %168 
                                       u32_4 %172 = OpLoad %171 
                                         u32 %173 = OpCompositeExtract %172 0 
                                        bool %174 = OpINotEqual %173 %48 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %167 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                                      OpStore %167 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %167 
                                       f32_4 %182 = OpLoad %165 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %165 %183 
                              Uniform u32_4* %186 = OpAccessChain %20 %168 
                                       u32_4 %187 = OpLoad %186 
                                         u32 %188 = OpCompositeExtract %187 0 
                                        bool %189 = OpINotEqual %188 %48 
                                                      OpSelectionMerge %191 None 
                                                      OpBranchConditional %189 %190 %192 
                                             %190 = OpLabel 
                                                      OpStore %185 %66 
                                                      OpBranch %191 
                                             %192 = OpLabel 
                                                      OpStore %185 %97 
                                                      OpBranch %191 
                                             %191 = OpLabel 
                                         f32 %193 = OpLoad %185 
                                Private f32* %194 = OpAccessChain %165 %88 
                                                      OpStore %194 %193 
                              Uniform u32_4* %199 = OpAccessChain %20 %168 
                                       u32_4 %200 = OpLoad %199 
                                         u32 %201 = OpCompositeExtract %200 1 
                                        bool %202 = OpINotEqual %201 %48 
                                                      OpSelectionMerge %204 None 
                                                      OpBranchConditional %202 %203 %206 
                                             %203 = OpLabel 
                                                      OpStore %198 %205 
                                                      OpBranch %204 
                                             %206 = OpLabel 
                                       f32_4 %207 = OpLoad %165 
                                                      OpStore %198 %207 
                                                      OpBranch %204 
                                             %204 = OpLabel 
                                       f32_4 %208 = OpLoad %198 
                                                      OpStore %196 %208 
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