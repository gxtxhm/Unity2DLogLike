//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Kvant/Tunnel/Surface_02" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_StepFactor ("Attenstep", Float) = 4
_Displacement ("Disp", Float) = 0
_DesatPhase ("Desat Phase", Float) = 0
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  Blend One One, One One
  ZTest Less
  ZWrite Off
  Offset 1, 1
  GpuProgramID 40438
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
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
    u_xlat6 = u_xlat6 * _StepFactor;
    u_xlat6 = floor(u_xlat6);
    u_xlat6 = u_xlat6 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat6 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat6));
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat6) * vec3(u_xlat6) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 259
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 %251 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %251 Location 251 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                               Output f32_3* %251 = OpVariable Output 
                                       f32_3 %252 = OpConstantComposite %54 %54 %54 
                                             %253 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                                      OpStore %251 %252 
                                 Output f32* %254 = OpAccessChain %197 %138 %38 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFNegate %255 
                                 Output f32* %257 = OpAccessChain %197 %138 %38 
                                                      OpStore %257 %256 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %55 %205 %238 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 RelaxedPrecision 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 RelaxedPrecision 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %45 SpecId 45 
                                                      OpDecorate %55 Location 55 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %238 Location 238 
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
                                              %22 = OpTypeBool 
                                              %23 = OpTypePointer Private %22 
                                Private bool* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %19 %26 
                                              %28 = OpTypeStruct %19 %19 %19 %27 %7 %7 %19 %6 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 2 
                                          u32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %6 
                                          f32 %37 = OpConstant 3.67402E-40 
                                         bool %39 = OpConstantFalse 
                                         bool %45 = OpSpecConstantFalse 
                                          u32 %48 = OpConstant 1 
                                              %52 = OpTypePointer Private %19 
                               Private f32_4* %53 = OpVariable Private 
                                              %54 = OpTypePointer Input %7 
                                 Input f32_3* %55 = OpVariable Input 
                                          i32 %58 = OpConstant 3 
                                          i32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Uniform %19 
                                          i32 %67 = OpConstant 0 
                                              %98 = OpTypePointer Function %7 
                                         i32 %112 = OpConstant 5 
                                             %113 = OpTypePointer Uniform %7 
                                         i32 %122 = OpConstant 4 
                                             %128 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                Private f32* %136 = OpVariable Private 
                                         u32 %137 = OpConstant 2 
                                         f32 %140 = OpConstant 3.67402E-40 
                                             %147 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %148 = OpTypeSampledImage %147 
                                             %149 = OpTypePointer UniformConstant %148 
 UniformConstant read_only Texture3DSampled* %150 = OpVariable UniformConstant 
                              Private f32_4* %155 = OpVariable Private 
                                         u32 %161 = OpConstant 3 
                              Private f32_3* %163 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         i32 %176 = OpConstant 7 
                                         i32 %187 = OpConstant 6 
                                Private f32* %192 = OpVariable Private 
                                Input f32_3* %205 = OpVariable Input 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_3 %214 = OpConstantComposite %211 %212 %213 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %229 = OpConstant 8 
                                             %237 = OpTypePointer Output %19 
                               Output f32_4* %238 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %99 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                 Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdEqual %36 %37 
                                                      OpStore %24 %38 
                                                      OpSelectionMerge %41 None 
                                                      OpBranchConditional %39 %40 %41 
                                              %40 = OpLabel 
                                         bool %42 = OpLoad %24 
                                                      OpSelectionMerge %44 None 
                                                      OpBranchConditional %42 %43 %44 
                                              %43 = OpLabel 
                                                      OpBranch %44 
                                              %44 = OpLabel 
                                                      OpBranch %41 
                                              %41 = OpLabel 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %157 
                                              %46 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %30 %32 %48 
                                          f32 %50 = OpLoad %49 
                                         bool %51 = OpFOrdEqual %50 %37 
                                                      OpStore %24 %51 
                                        f32_3 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %30 %58 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %57 %63 
                                        f32_4 %65 = OpLoad %53 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %53 %66 
                               Uniform f32_4* %68 = OpAccessChain %30 %58 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpLoad %55 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 0 0 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %53 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %53 %78 
                               Uniform f32_4* %79 = OpAccessChain %30 %58 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %55 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                                        f32_4 %90 = OpLoad %53 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %30 %58 %58 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %91 %94 
                                        f32_4 %96 = OpLoad %53 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %53 %97 
                                        bool %100 = OpLoad %24 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %105 
                                             %101 = OpLabel 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %99 %104 
                                                      OpBranch %102 
                                             %105 = OpLabel 
                                       f32_3 %106 = OpLoad %55 
                                                      OpStore %99 %106 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                       f32_3 %107 = OpLoad %99 
                                       f32_4 %108 = OpLoad %53 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %53 %109 
                                       f32_4 %110 = OpLoad %53 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                              Uniform f32_3* %114 = OpAccessChain %30 %112 
                                       f32_3 %115 = OpLoad %114 
                                       f32_3 %116 = OpFNegate %115 
                                       f32_3 %117 = OpFAdd %111 %116 
                                       f32_4 %118 = OpLoad %53 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %53 %119 
                                       f32_4 %120 = OpLoad %53 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              Uniform f32_3* %123 = OpAccessChain %30 %122 
                                       f32_3 %124 = OpLoad %123 
                                       f32_3 %125 = OpFMul %121 %124 
                                       f32_4 %126 = OpLoad %53 
                                       f32_4 %127 = OpVectorShuffle %126 %125 0 4 5 6 
                                                      OpStore %53 %127 
                                Private f32* %130 = OpAccessChain %53 %48 
                                         f32 %131 = OpLoad %130 
                                         f32 %133 = OpFMul %131 %132 
                                         f32 %135 = OpFAdd %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %138 = OpAccessChain %30 %32 %137 
                                         f32 %139 = OpLoad %138 
                                         f32 %141 = OpFMul %139 %140 
                                         f32 %142 = OpFAdd %141 %134 
                                                      OpStore %136 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpLoad %136 
                                         f32 %145 = OpExtInst %1 40 %143 %144 
                                Private f32* %146 = OpAccessChain %53 %33 
                                                      OpStore %146 %145 
                  read_only Texture3DSampled %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %53 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 2 3 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %53 %154 
                                       f32_4 %156 = OpLoad %53 
                                                      OpStore %155 %156 
                                                      OpBranch %47 
                                             %157 = OpLabel 
                                Private f32* %158 = OpAccessChain %155 %33 
                                                      OpStore %158 %37 
                                Private f32* %159 = OpAccessChain %155 %48 
                                                      OpStore %159 %37 
                                Private f32* %160 = OpAccessChain %155 %137 
                                                      OpStore %160 %37 
                                Private f32* %162 = OpAccessChain %155 %161 
                                                      OpStore %162 %37 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                       f32_4 %164 = OpLoad %155 
                              Uniform f32_4* %165 = OpAccessChain %30 %59 
                                       f32_4 %166 = OpLoad %165 
                                         f32 %167 = OpDot %164 %166 
                                Private f32* %168 = OpAccessChain %163 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %163 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpExtInst %1 43 %170 %171 %37 
                                Private f32* %173 = OpAccessChain %163 %33 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %163 %33 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %30 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 8 %180 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                Uniform f32* %183 = OpAccessChain %30 %176 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFDiv %182 %184 
                                                      OpStore %129 %185 
                                       f32_3 %186 = OpLoad %9 
                              Uniform f32_4* %188 = OpAccessChain %30 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %163 %191 
                              Uniform f32_4* %193 = OpAccessChain %30 %67 
                                       f32_4 %194 = OpLoad %193 
                                       f32_2 %195 = OpVectorShuffle %194 %194 2 2 
                                       f32_2 %196 = OpFNegate %195 
                                         f32 %197 = OpLoad %129 
                                       f32_2 %198 = OpCompositeConstruct %197 %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %192 %199 
                                         f32 %200 = OpLoad %192 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %163 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %163 %203 
                                       f32_3 %204 = OpLoad %9 
                                       f32_3 %206 = OpLoad %205 
                                       f32_3 %207 = OpFMul %204 %206 
                                       f32_3 %208 = OpLoad %163 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %163 %209 
                                       f32_3 %210 = OpLoad %163 
                                         f32 %215 = OpDot %210 %214 
                                                      OpStore %192 %215 
                                         f32 %216 = OpLoad %192 
                                         f32 %217 = OpLoad %192 
                                         f32 %218 = OpFMul %216 %217 
                                                      OpStore %192 %218 
                                         f32 %220 = OpLoad %192 
                                       f32_3 %221 = OpCompositeConstruct %220 %220 %220 
                                         f32 %222 = OpLoad %192 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %163 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %224 %226 
                                                      OpStore %219 %227 
                                Uniform f32* %230 = OpAccessChain %30 %229 
                                         f32 %231 = OpLoad %230 
                                       f32_3 %232 = OpCompositeConstruct %231 %231 %231 
                                       f32_3 %233 = OpLoad %219 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %228 %236 
                                       f32_3 %239 = OpLoad %228 
                                       f32_4 %240 = OpLoad %238 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %238 %241 
                                 Output f32* %243 = OpAccessChain %238 %161 
                                                      OpStore %243 %37 
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
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
    u_xlat6 = u_xlat6 * _StepFactor;
    u_xlat6 = floor(u_xlat6);
    u_xlat6 = u_xlat6 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat6 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat6));
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat6) * vec3(u_xlat6) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 259
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 %251 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %251 Location 251 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                               Output f32_3* %251 = OpVariable Output 
                                       f32_3 %252 = OpConstantComposite %54 %54 %54 
                                             %253 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                                      OpStore %251 %252 
                                 Output f32* %254 = OpAccessChain %197 %138 %38 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFNegate %255 
                                 Output f32* %257 = OpAccessChain %197 %138 %38 
                                                      OpStore %257 %256 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %55 %205 %238 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 RelaxedPrecision 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 RelaxedPrecision 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %45 SpecId 45 
                                                      OpDecorate %55 Location 55 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %238 Location 238 
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
                                              %22 = OpTypeBool 
                                              %23 = OpTypePointer Private %22 
                                Private bool* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %19 %26 
                                              %28 = OpTypeStruct %19 %19 %19 %27 %7 %7 %19 %6 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 2 
                                          u32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %6 
                                          f32 %37 = OpConstant 3.67402E-40 
                                         bool %39 = OpConstantFalse 
                                         bool %45 = OpSpecConstantFalse 
                                          u32 %48 = OpConstant 1 
                                              %52 = OpTypePointer Private %19 
                               Private f32_4* %53 = OpVariable Private 
                                              %54 = OpTypePointer Input %7 
                                 Input f32_3* %55 = OpVariable Input 
                                          i32 %58 = OpConstant 3 
                                          i32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Uniform %19 
                                          i32 %67 = OpConstant 0 
                                              %98 = OpTypePointer Function %7 
                                         i32 %112 = OpConstant 5 
                                             %113 = OpTypePointer Uniform %7 
                                         i32 %122 = OpConstant 4 
                                             %128 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                Private f32* %136 = OpVariable Private 
                                         u32 %137 = OpConstant 2 
                                         f32 %140 = OpConstant 3.67402E-40 
                                             %147 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %148 = OpTypeSampledImage %147 
                                             %149 = OpTypePointer UniformConstant %148 
 UniformConstant read_only Texture3DSampled* %150 = OpVariable UniformConstant 
                              Private f32_4* %155 = OpVariable Private 
                                         u32 %161 = OpConstant 3 
                              Private f32_3* %163 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         i32 %176 = OpConstant 7 
                                         i32 %187 = OpConstant 6 
                                Private f32* %192 = OpVariable Private 
                                Input f32_3* %205 = OpVariable Input 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_3 %214 = OpConstantComposite %211 %212 %213 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %229 = OpConstant 8 
                                             %237 = OpTypePointer Output %19 
                               Output f32_4* %238 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %99 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                 Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdEqual %36 %37 
                                                      OpStore %24 %38 
                                                      OpSelectionMerge %41 None 
                                                      OpBranchConditional %39 %40 %41 
                                              %40 = OpLabel 
                                         bool %42 = OpLoad %24 
                                                      OpSelectionMerge %44 None 
                                                      OpBranchConditional %42 %43 %44 
                                              %43 = OpLabel 
                                                      OpBranch %44 
                                              %44 = OpLabel 
                                                      OpBranch %41 
                                              %41 = OpLabel 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %157 
                                              %46 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %30 %32 %48 
                                          f32 %50 = OpLoad %49 
                                         bool %51 = OpFOrdEqual %50 %37 
                                                      OpStore %24 %51 
                                        f32_3 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %30 %58 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %57 %63 
                                        f32_4 %65 = OpLoad %53 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %53 %66 
                               Uniform f32_4* %68 = OpAccessChain %30 %58 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpLoad %55 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 0 0 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %53 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %53 %78 
                               Uniform f32_4* %79 = OpAccessChain %30 %58 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %55 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                                        f32_4 %90 = OpLoad %53 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %30 %58 %58 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %91 %94 
                                        f32_4 %96 = OpLoad %53 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %53 %97 
                                        bool %100 = OpLoad %24 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %105 
                                             %101 = OpLabel 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %99 %104 
                                                      OpBranch %102 
                                             %105 = OpLabel 
                                       f32_3 %106 = OpLoad %55 
                                                      OpStore %99 %106 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                       f32_3 %107 = OpLoad %99 
                                       f32_4 %108 = OpLoad %53 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %53 %109 
                                       f32_4 %110 = OpLoad %53 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                              Uniform f32_3* %114 = OpAccessChain %30 %112 
                                       f32_3 %115 = OpLoad %114 
                                       f32_3 %116 = OpFNegate %115 
                                       f32_3 %117 = OpFAdd %111 %116 
                                       f32_4 %118 = OpLoad %53 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %53 %119 
                                       f32_4 %120 = OpLoad %53 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              Uniform f32_3* %123 = OpAccessChain %30 %122 
                                       f32_3 %124 = OpLoad %123 
                                       f32_3 %125 = OpFMul %121 %124 
                                       f32_4 %126 = OpLoad %53 
                                       f32_4 %127 = OpVectorShuffle %126 %125 0 4 5 6 
                                                      OpStore %53 %127 
                                Private f32* %130 = OpAccessChain %53 %48 
                                         f32 %131 = OpLoad %130 
                                         f32 %133 = OpFMul %131 %132 
                                         f32 %135 = OpFAdd %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %138 = OpAccessChain %30 %32 %137 
                                         f32 %139 = OpLoad %138 
                                         f32 %141 = OpFMul %139 %140 
                                         f32 %142 = OpFAdd %141 %134 
                                                      OpStore %136 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpLoad %136 
                                         f32 %145 = OpExtInst %1 40 %143 %144 
                                Private f32* %146 = OpAccessChain %53 %33 
                                                      OpStore %146 %145 
                  read_only Texture3DSampled %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %53 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 2 3 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %53 %154 
                                       f32_4 %156 = OpLoad %53 
                                                      OpStore %155 %156 
                                                      OpBranch %47 
                                             %157 = OpLabel 
                                Private f32* %158 = OpAccessChain %155 %33 
                                                      OpStore %158 %37 
                                Private f32* %159 = OpAccessChain %155 %48 
                                                      OpStore %159 %37 
                                Private f32* %160 = OpAccessChain %155 %137 
                                                      OpStore %160 %37 
                                Private f32* %162 = OpAccessChain %155 %161 
                                                      OpStore %162 %37 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                       f32_4 %164 = OpLoad %155 
                              Uniform f32_4* %165 = OpAccessChain %30 %59 
                                       f32_4 %166 = OpLoad %165 
                                         f32 %167 = OpDot %164 %166 
                                Private f32* %168 = OpAccessChain %163 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %163 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpExtInst %1 43 %170 %171 %37 
                                Private f32* %173 = OpAccessChain %163 %33 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %163 %33 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %30 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 8 %180 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                Uniform f32* %183 = OpAccessChain %30 %176 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFDiv %182 %184 
                                                      OpStore %129 %185 
                                       f32_3 %186 = OpLoad %9 
                              Uniform f32_4* %188 = OpAccessChain %30 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %163 %191 
                              Uniform f32_4* %193 = OpAccessChain %30 %67 
                                       f32_4 %194 = OpLoad %193 
                                       f32_2 %195 = OpVectorShuffle %194 %194 2 2 
                                       f32_2 %196 = OpFNegate %195 
                                         f32 %197 = OpLoad %129 
                                       f32_2 %198 = OpCompositeConstruct %197 %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %192 %199 
                                         f32 %200 = OpLoad %192 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %163 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %163 %203 
                                       f32_3 %204 = OpLoad %9 
                                       f32_3 %206 = OpLoad %205 
                                       f32_3 %207 = OpFMul %204 %206 
                                       f32_3 %208 = OpLoad %163 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %163 %209 
                                       f32_3 %210 = OpLoad %163 
                                         f32 %215 = OpDot %210 %214 
                                                      OpStore %192 %215 
                                         f32 %216 = OpLoad %192 
                                         f32 %217 = OpLoad %192 
                                         f32 %218 = OpFMul %216 %217 
                                                      OpStore %192 %218 
                                         f32 %220 = OpLoad %192 
                                       f32_3 %221 = OpCompositeConstruct %220 %220 %220 
                                         f32 %222 = OpLoad %192 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %163 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %224 %226 
                                                      OpStore %219 %227 
                                Uniform f32* %230 = OpAccessChain %30 %229 
                                         f32 %231 = OpLoad %230 
                                       f32_3 %232 = OpCompositeConstruct %231 %231 %231 
                                       f32_3 %233 = OpLoad %219 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %228 %236 
                                       f32_3 %239 = OpLoad %228 
                                       f32_4 %240 = OpLoad %238 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %238 %241 
                                 Output f32* %243 = OpAccessChain %238 %161 
                                                      OpStore %243 %37 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat9) + u_xlat1.x;
    u_xlat9 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat9;
    u_xlat9 = u_xlat9 * _LightShadowData.z + _LightShadowData.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat7.x, u_xlat4.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat7.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat9 = u_xlat9 + u_xlat10_2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = min(u_xlat9, u_xlat4.x);
    u_xlat9 = (u_xlatb1) ? u_xlat4.x : u_xlat9;
    u_xlat9 = u_xlat9 * _StepFactor;
    u_xlat9 = floor(u_xlat9);
    u_xlat9 = u_xlat9 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat9 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat9));
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 301
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %34 %58 %70 %89 %173 %212 %217 %257 %263 %283 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 RelaxedPrecision 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpMemberDecorate %16 7 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %81 DescriptorSet 81 
                                                      OpDecorate %81 Binding 81 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %173 Location 173 
                                                      OpMemberDecorate %210 0 BuiltIn 210 
                                                      OpMemberDecorate %210 1 BuiltIn 210 
                                                      OpMemberDecorate %210 2 BuiltIn 210 
                                                      OpDecorate %210 Block 
                                                      OpDecorate %217 Location 217 
                                                      OpDecorate %257 Location 257 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %283 Location 283 
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
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %7 %12 %13 %14 %6 %15 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 4 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_4* %34 = OpVariable Input 
                                          i32 %37 = OpConstant 5 
                                          u32 %40 = OpConstant 1 
                               Private f32_4* %47 = OpVariable Private 
                                              %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %49 = OpTypeSampledImage %48 
                                              %50 = OpTypePointer UniformConstant %49 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                          f32 %55 = OpConstant 3.67402E-40 
                                 Input f32_4* %58 = OpVariable Input 
                                          i32 %62 = OpConstant 6 
                                 Input f32_4* %70 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %81 = OpVariable UniformConstant 
                                              %88 = OpTypePointer Input %30 
                                 Input f32_3* %89 = OpVariable Input 
                                         u32 %118 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                              Private f32_4* %142 = OpVariable Private 
                                         i32 %145 = OpConstant 1 
                                             %146 = OpTypePointer Uniform %7 
                                         i32 %150 = OpConstant 0 
                                         i32 %158 = OpConstant 2 
                              Private f32_4* %166 = OpVariable Private 
                                         i32 %168 = OpConstant 3 
                                             %172 = OpTypePointer Output %30 
                               Output f32_3* %173 = OpVariable Output 
                                             %209 = OpTypeArray %6 %40 
                                             %210 = OpTypeStruct %7 %6 %209 
                                             %211 = OpTypePointer Output %210 
        Output struct {f32_4; f32; f32[1];}* %212 = OpVariable Output 
                                             %214 = OpTypePointer Output %7 
                                             %216 = OpTypePointer Output %15 
                               Output f32_2* %217 = OpVariable Output 
                                         i32 %220 = OpConstant 7 
                               Output f32_3* %257 = OpVariable Output 
                               Output f32_3* %263 = OpVariable Output 
                                       f32_3 %264 = OpConstantComposite %55 %55 %55 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         u32 %275 = OpConstant 3 
                                       f32_2 %279 = OpConstantComposite %273 %273 
                               Output f32_4* %283 = OpVariable Output 
                                             %295 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                        f32_4 %35 = OpLoad %34 
                                        f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                 Uniform f32* %38 = OpAccessChain %18 %37 %27 
                                          f32 %39 = OpLoad %38 
                                 Uniform f32* %41 = OpAccessChain %18 %37 %40 
                                          f32 %42 = OpLoad %41 
                                        f32_2 %43 = OpCompositeConstruct %39 %42 
                                        f32_2 %44 = OpFAdd %36 %43 
                                        f32_3 %45 = OpLoad %32 
                                        f32_3 %46 = OpVectorShuffle %45 %44 3 4 2 
                                                      OpStore %32 %46 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_3 %53 = OpLoad %32 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %56 = OpImageSampleExplicitLod %52 %54 Lod %7 
                                                      OpStore %47 %56 
                                        f32_4 %57 = OpLoad %47 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFNegate %59 
                                        f32_4 %61 = OpFAdd %57 %60 
                                                      OpStore %47 %61 
                                 Uniform f32* %63 = OpAccessChain %18 %62 
                                          f32 %64 = OpLoad %63 
                                        f32_4 %65 = OpCompositeConstruct %64 %64 %64 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpFMul %65 %66 
                                        f32_4 %68 = OpLoad %58 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %47 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 Uniform f32* %73 = OpAccessChain %18 %37 %27 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %18 %37 %40 
                                          f32 %76 = OpLoad %75 
                                        f32_2 %77 = OpCompositeConstruct %74 %76 
                                        f32_2 %78 = OpFAdd %72 %77 
                                        f32_3 %79 = OpLoad %32 
                                        f32_3 %80 = OpVectorShuffle %79 %78 3 4 2 
                                                      OpStore %32 %80 
                   read_only Texture2DSampled %82 = OpLoad %81 
                                        f32_3 %83 = OpLoad %32 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                        f32_4 %85 = OpImageSampleExplicitLod %82 %84 Lod %7 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                      OpStore %32 %86 
                                        f32_3 %87 = OpLoad %32 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpFNegate %90 
                                        f32_3 %92 = OpFAdd %87 %91 
                                                      OpStore %32 %92 
                                 Uniform f32* %93 = OpAccessChain %18 %62 
                                          f32 %94 = OpLoad %93 
                                        f32_3 %95 = OpCompositeConstruct %94 %94 %94 
                                        f32_3 %96 = OpLoad %32 
                                        f32_3 %97 = OpFMul %95 %96 
                                        f32_3 %98 = OpLoad %89 
                                        f32_3 %99 = OpFAdd %97 %98 
                                                      OpStore %32 %99 
                                       f32_3 %100 = OpLoad %32 
                                Uniform f32* %101 = OpAccessChain %18 %20 
                                         f32 %102 = OpLoad %101 
                                Uniform f32* %103 = OpAccessChain %18 %20 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %18 %20 
                                         f32 %106 = OpLoad %105 
                                       f32_3 %107 = OpCompositeConstruct %102 %104 %106 
                                         f32 %108 = OpCompositeExtract %107 0 
                                         f32 %109 = OpCompositeExtract %107 1 
                                         f32 %110 = OpCompositeExtract %107 2 
                                       f32_3 %111 = OpCompositeConstruct %108 %109 %110 
                                       f32_3 %112 = OpFMul %100 %111 
                                       f32_4 %113 = OpLoad %47 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %47 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %47 %117 
                                Private f32* %119 = OpAccessChain %47 %118 
                                         f32 %120 = OpLoad %119 
                                Private f32* %121 = OpAccessChain %9 %27 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFDiv %120 %122 
                                Private f32* %124 = OpAccessChain %9 %27 
                                                      OpStore %124 %123 
                                Private f32* %125 = OpAccessChain %9 %27 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpExtInst %1 43 %126 %55 %127 
                                Private f32* %129 = OpAccessChain %9 %27 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %9 %27 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFNegate %131 
                                         f32 %133 = OpFAdd %132 %127 
                                Private f32* %134 = OpAccessChain %9 %27 
                                                      OpStore %134 %133 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 0 
                                       f32_4 %137 = OpLoad %47 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %47 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
                                                      OpStore %47 %141 
                                       f32_4 %143 = OpLoad %47 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %147 = OpAccessChain %18 %145 %145 
                                       f32_4 %148 = OpLoad %147 
                                       f32_4 %149 = OpFMul %144 %148 
                                                      OpStore %142 %149 
                              Uniform f32_4* %151 = OpAccessChain %18 %145 %150 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %47 
                                       f32_4 %154 = OpVectorShuffle %153 %153 0 0 0 0 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %142 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %142 %157 
                              Uniform f32_4* %159 = OpAccessChain %18 %145 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_4 %161 = OpLoad %47 
                                       f32_4 %162 = OpVectorShuffle %161 %161 2 2 2 2 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %142 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %142 %165 
                                       f32_4 %167 = OpLoad %142 
                              Uniform f32_4* %169 = OpAccessChain %18 %145 %168 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpFAdd %167 %170 
                                                      OpStore %166 %171 
                              Uniform f32_4* %174 = OpAccessChain %18 %145 %168 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_4 %177 = OpLoad %47 
                                       f32_3 %178 = OpVectorShuffle %177 %177 3 3 3 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %142 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %179 %181 
                                                      OpStore %173 %182 
                                       f32_4 %183 = OpLoad %166 
                                       f32_4 %184 = OpVectorShuffle %183 %183 1 1 1 1 
                              Uniform f32_4* %185 = OpAccessChain %18 %168 %145 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpFMul %184 %186 
                                                      OpStore %47 %187 
                              Uniform f32_4* %188 = OpAccessChain %18 %168 %150 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %166 
                                       f32_4 %191 = OpVectorShuffle %190 %190 0 0 0 0 
                                       f32_4 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %47 
                                       f32_4 %194 = OpFAdd %192 %193 
                                                      OpStore %47 %194 
                              Uniform f32_4* %195 = OpAccessChain %18 %168 %158 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %166 
                                       f32_4 %198 = OpVectorShuffle %197 %197 2 2 2 2 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %47 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %47 %201 
                              Uniform f32_4* %202 = OpAccessChain %18 %168 %168 
                                       f32_4 %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %166 
                                       f32_4 %205 = OpVectorShuffle %204 %204 3 3 3 3 
                                       f32_4 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %47 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %47 %208 
                                       f32_4 %213 = OpLoad %47 
                               Output f32_4* %215 = OpAccessChain %212 %150 
                                                      OpStore %215 %213 
                                       f32_4 %218 = OpLoad %34 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                              Uniform f32_4* %221 = OpAccessChain %18 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                                       f32_2 %224 = OpFMul %219 %223 
                              Uniform f32_4* %225 = OpAccessChain %18 %220 
                                       f32_4 %226 = OpLoad %225 
                                       f32_2 %227 = OpVectorShuffle %226 %226 2 3 
                                       f32_2 %228 = OpFAdd %224 %227 
                                                      OpStore %217 %228 
                                       f32_3 %229 = OpLoad %32 
                              Uniform f32_4* %230 = OpAccessChain %18 %158 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                         f32 %233 = OpDot %229 %232 
                                Private f32* %234 = OpAccessChain %142 %27 
                                                      OpStore %234 %233 
                                       f32_3 %235 = OpLoad %32 
                              Uniform f32_4* %236 = OpAccessChain %18 %158 %145 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                         f32 %239 = OpDot %235 %238 
                                Private f32* %240 = OpAccessChain %142 %40 
                                                      OpStore %240 %239 
                                       f32_3 %241 = OpLoad %32 
                              Uniform f32_4* %242 = OpAccessChain %18 %158 %158 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                         f32 %245 = OpDot %241 %244 
                                Private f32* %246 = OpAccessChain %142 %118 
                                                      OpStore %246 %245 
                                       f32_4 %247 = OpLoad %142 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_4 %249 = OpLoad %142 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                         f32 %251 = OpDot %248 %250 
                                Private f32* %252 = OpAccessChain %9 %27 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %9 %27 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpExtInst %1 32 %254 
                                Private f32* %256 = OpAccessChain %9 %27 
                                                      OpStore %256 %255 
                                       f32_4 %258 = OpLoad %9 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
                                       f32_4 %260 = OpLoad %142 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFMul %259 %261 
                                                      OpStore %257 %262 
                                                      OpStore %263 %264 
                                Private f32* %265 = OpAccessChain %47 %40 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %267 = OpAccessChain %18 %150 %27 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %266 %268 
                                Private f32* %270 = OpAccessChain %9 %27 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %9 %27 
                                         f32 %272 = OpLoad %271 
                                         f32 %274 = OpFMul %272 %273 
                                Private f32* %276 = OpAccessChain %9 %275 
                                                      OpStore %276 %274 
                                       f32_4 %277 = OpLoad %47 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 3 
                                       f32_2 %280 = OpFMul %278 %279 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 1 5 3 
                                                      OpStore %9 %282 
                                       f32_4 %284 = OpLoad %47 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_4 %286 = OpLoad %283 
                                       f32_4 %287 = OpVectorShuffle %286 %285 0 1 4 5 
                                                      OpStore %283 %287 
                                       f32_4 %288 = OpLoad %9 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_4 %290 = OpLoad %9 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 3 
                                       f32_2 %292 = OpFAdd %289 %291 
                                       f32_4 %293 = OpLoad %283 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 2 3 
                                                      OpStore %283 %294 
                                 Output f32* %296 = OpAccessChain %212 %150 %40 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFNegate %297 
                                 Output f32* %299 = OpAccessChain %212 %150 %40 
                                                      OpStore %299 %298 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 341
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %233 %301 %334 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 RelaxedPrecision 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 RelaxedPrecision 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 RelaxedPrecision 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpMemberDecorate %31 8 Offset 31 
                                                      OpMemberDecorate %31 9 Offset 31 
                                                      OpMemberDecorate %31 10 RelaxedPrecision 
                                                      OpMemberDecorate %31 10 Offset 31 
                                                      OpMemberDecorate %31 11 Offset 31 
                                                      OpMemberDecorate %31 12 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %119 SpecId 119 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 Location 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %334 Location 334 
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
                                              %23 = OpTypePointer Input %7 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %19 %28 
                                              %30 = OpTypeArray %19 %28 
                                              %31 = OpTypeStruct %7 %19 %19 %19 %19 %29 %19 %30 %7 %7 %19 %6 %6 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %19 
                               Private f32_4* %41 = OpVariable Private 
                                          i32 %42 = OpConstant 5 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Private %6 
                                          i32 %50 = OpConstant 1 
                                          u32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant 2 
                                 Private f32* %59 = OpVariable Private 
                                          i32 %65 = OpConstant 4 
                                              %66 = OpTypePointer Uniform %19 
                                          u32 %86 = OpConstant 3 
                                          i32 %95 = OpConstant 3 
                                         f32 %103 = OpConstant 3.67402E-40 
                                         f32 %104 = OpConstant 3.67402E-40 
                                             %106 = OpTypeBool 
                                             %107 = OpTypePointer Private %106 
                               Private bool* %108 = OpVariable Private 
                                         i32 %109 = OpConstant 6 
                                        bool %113 = OpConstantFalse 
                                        bool %119 = OpSpecConstantFalse 
                               Private bool* %122 = OpVariable Private 
                                         i32 %128 = OpConstant 7 
                              Private f32_3* %165 = OpVariable Private 
                                             %166 = OpTypePointer Function %7 
                                         i32 %177 = OpConstant 9 
                                         i32 %183 = OpConstant 8 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                             %232 = OpTypePointer Input %19 
                                Input f32_4* %233 = OpVariable Input 
                                Private f32* %241 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                Private f32* %248 = OpVariable Private 
                                             %259 = OpTypePointer Function %6 
                                         i32 %272 = OpConstant 11 
                                         i32 %283 = OpConstant 10 
                                Private f32* %288 = OpVariable Private 
                                Input f32_3* %301 = OpVariable Input 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                         f32 %309 = OpConstant 3.67402E-40 
                                       f32_3 %310 = OpConstantComposite %307 %308 %309 
                              Private f32_3* %315 = OpVariable Private 
                              Private f32_3* %324 = OpVariable Private 
                                         i32 %325 = OpConstant 12 
                                             %333 = OpTypePointer Output %19 
                               Output f32_4* %334 = OpVariable Output 
                                             %338 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %167 = OpVariable Function 
                               Function f32* %260 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpFNegate %25 
                               Uniform f32_3* %37 = OpAccessChain %33 %35 
                                        f32_3 %38 = OpLoad %37 
                                        f32_3 %39 = OpFAdd %26 %38 
                                                      OpStore %22 %39 
                                 Uniform f32* %45 = OpAccessChain %33 %42 %35 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %49 = OpAccessChain %41 %47 
                                                      OpStore %49 %46 
                                 Uniform f32* %51 = OpAccessChain %33 %42 %50 %43 
                                          f32 %52 = OpLoad %51 
                                 Private f32* %54 = OpAccessChain %41 %53 
                                                      OpStore %54 %52 
                                 Uniform f32* %56 = OpAccessChain %33 %42 %55 %43 
                                          f32 %57 = OpLoad %56 
                                 Private f32* %58 = OpAccessChain %41 %43 
                                                      OpStore %58 %57 
                                        f32_3 %60 = OpLoad %22 
                                        f32_4 %61 = OpLoad %41 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                          f32 %63 = OpDot %60 %62 
                                                      OpStore %59 %63 
                                        f32_3 %64 = OpLoad %24 
                               Uniform f32_4* %67 = OpAccessChain %33 %65 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFNegate %69 
                                        f32_3 %71 = OpFAdd %64 %70 
                                                      OpStore %22 %71 
                                        f32_3 %72 = OpLoad %22 
                                        f32_3 %73 = OpLoad %22 
                                          f32 %74 = OpDot %72 %73 
                                 Private f32* %75 = OpAccessChain %22 %47 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %22 %47 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 31 %77 
                                 Private f32* %79 = OpAccessChain %22 %47 
                                                      OpStore %79 %78 
                                          f32 %80 = OpLoad %59 
                                          f32 %81 = OpFNegate %80 
                                 Private f32* %82 = OpAccessChain %22 %47 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %81 %83 
                                 Private f32* %85 = OpAccessChain %22 %47 
                                                      OpStore %85 %84 
                                 Uniform f32* %87 = OpAccessChain %33 %65 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %22 %47 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %88 %90 
                                          f32 %92 = OpLoad %59 
                                          f32 %93 = OpFAdd %91 %92 
                                                      OpStore %59 %93 
                                          f32 %94 = OpLoad %59 
                                 Uniform f32* %96 = OpAccessChain %33 %95 %43 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %94 %97 
                                 Uniform f32* %99 = OpAccessChain %33 %95 %86 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                                      OpStore %59 %101 
                                         f32 %102 = OpLoad %59 
                                         f32 %105 = OpExtInst %1 43 %102 %103 %104 
                                                      OpStore %59 %105 
                                Uniform f32* %110 = OpAccessChain %33 %109 %47 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %104 
                                                      OpStore %108 %112 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %115 
                                             %114 = OpLabel 
                                        bool %116 = OpLoad %108 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %217 
                                             %120 = OpLabel 
                                Uniform f32* %123 = OpAccessChain %33 %109 %53 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdEqual %124 %104 
                                                      OpStore %122 %125 
                                       f32_3 %126 = OpLoad %24 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %33 %128 %50 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %41 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                                      OpStore %41 %134 
                              Uniform f32_4* %135 = OpAccessChain %33 %128 %35 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %24 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %41 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %41 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %41 %145 
                              Uniform f32_4* %146 = OpAccessChain %33 %128 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %24 
                                       f32_3 %150 = OpVectorShuffle %149 %149 2 2 2 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %41 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %41 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %41 %156 
                                       f32_4 %157 = OpLoad %41 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                              Uniform f32_4* %159 = OpAccessChain %33 %128 %95 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %158 %161 
                                       f32_4 %163 = OpLoad %41 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                      OpStore %41 %164 
                                        bool %168 = OpLoad %122 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %173 
                                             %169 = OpLabel 
                                       f32_4 %171 = OpLoad %41 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                                      OpStore %167 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                       f32_3 %174 = OpLoad %24 
                                                      OpStore %167 %174 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                       f32_3 %175 = OpLoad %167 
                                                      OpStore %165 %175 
                                       f32_3 %176 = OpLoad %165 
                              Uniform f32_3* %178 = OpAccessChain %33 %177 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFAdd %176 %180 
                                                      OpStore %165 %181 
                                       f32_3 %182 = OpLoad %165 
                              Uniform f32_3* %184 = OpAccessChain %33 %183 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %41 
                                       f32_4 %188 = OpVectorShuffle %187 %186 0 4 5 6 
                                                      OpStore %41 %188 
                                Private f32* %189 = OpAccessChain %41 %53 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %194 = OpFAdd %192 %193 
                                Private f32* %195 = OpAccessChain %165 %47 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %33 %109 %43 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %193 
                                                      OpStore %196 %201 
                                         f32 %202 = OpLoad %196 
                                Private f32* %203 = OpAccessChain %165 %47 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 40 %202 %204 
                                Private f32* %206 = OpAccessChain %41 %47 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %41 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %41 %214 
                                       f32_4 %216 = OpLoad %41 
                                                      OpStore %215 %216 
                                                      OpBranch %121 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %47 
                                                      OpStore %218 %104 
                                Private f32* %219 = OpAccessChain %215 %53 
                                                      OpStore %219 %104 
                                Private f32* %220 = OpAccessChain %215 %43 
                                                      OpStore %220 %104 
                                Private f32* %221 = OpAccessChain %215 %86 
                                                      OpStore %221 %104 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                       f32_4 %223 = OpLoad %215 
                              Uniform f32_4* %224 = OpAccessChain %33 %55 
                                       f32_4 %225 = OpLoad %224 
                                         f32 %226 = OpDot %223 %225 
                                Private f32* %227 = OpAccessChain %222 %47 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %222 %47 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpExtInst %1 43 %229 %103 %104 
                                Private f32* %231 = OpAccessChain %222 %47 
                                                      OpStore %231 %230 
                                       f32_4 %234 = OpLoad %233 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                       f32_4 %236 = OpLoad %233 
                                       f32_2 %237 = OpVectorShuffle %236 %236 3 3 
                                       f32_2 %238 = OpFDiv %235 %237 
                                       f32_3 %239 = OpLoad %165 
                                       f32_3 %240 = OpVectorShuffle %239 %238 3 4 2 
                                                      OpStore %165 %240 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_3 %244 = OpLoad %165 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 0 
                                                      OpStore %241 %247 
                                         f32 %249 = OpLoad %59 
                                         f32 %250 = OpLoad %241 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %248 %251 
                                         f32 %252 = OpLoad %248 
                                         f32 %253 = OpExtInst %1 43 %252 %103 %104 
                                                      OpStore %248 %253 
                                         f32 %254 = OpLoad %248 
                                Private f32* %255 = OpAccessChain %222 %47 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpExtInst %1 37 %254 %256 
                                Private f32* %258 = OpAccessChain %222 %47 
                                                      OpStore %258 %257 
                                        bool %261 = OpLoad %108 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %261 %262 %266 
                                             %262 = OpLabel 
                                Private f32* %264 = OpAccessChain %222 %47 
                                         f32 %265 = OpLoad %264 
                                                      OpStore %260 %265 
                                                      OpBranch %263 
                                             %266 = OpLabel 
                                         f32 %267 = OpLoad %248 
                                                      OpStore %260 %267 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %260 
                                Private f32* %269 = OpAccessChain %222 %47 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %222 %47 
                                         f32 %271 = OpLoad %270 
                                Uniform f32* %273 = OpAccessChain %33 %272 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %271 %274 
                                                      OpStore %59 %275 
                                         f32 %276 = OpLoad %59 
                                         f32 %277 = OpExtInst %1 8 %276 
                                                      OpStore %59 %277 
                                         f32 %278 = OpLoad %59 
                                Uniform f32* %279 = OpAccessChain %33 %272 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFDiv %278 %280 
                                                      OpStore %59 %281 
                                       f32_3 %282 = OpLoad %9 
                              Uniform f32_4* %284 = OpAccessChain %33 %283 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFMul %282 %286 
                                                      OpStore %222 %287 
                              Uniform f32_4* %289 = OpAccessChain %33 %50 
                                       f32_4 %290 = OpLoad %289 
                                       f32_2 %291 = OpVectorShuffle %290 %290 2 2 
                                       f32_2 %292 = OpFNegate %291 
                                         f32 %293 = OpLoad %59 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                         f32 %295 = OpDot %292 %294 
                                                      OpStore %288 %295 
                                         f32 %296 = OpLoad %288 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %222 
                                       f32_3 %299 = OpFMul %297 %298 
                                                      OpStore %222 %299 
                                       f32_3 %300 = OpLoad %9 
                                       f32_3 %302 = OpLoad %301 
                                       f32_3 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %222 
                                       f32_3 %305 = OpFAdd %303 %304 
                                                      OpStore %222 %305 
                                       f32_3 %306 = OpLoad %222 
                                         f32 %311 = OpDot %306 %310 
                                                      OpStore %288 %311 
                                         f32 %312 = OpLoad %288 
                                         f32 %313 = OpLoad %288 
                                         f32 %314 = OpFMul %312 %313 
                                                      OpStore %288 %314 
                                         f32 %316 = OpLoad %288 
                                       f32_3 %317 = OpCompositeConstruct %316 %316 %316 
                                         f32 %318 = OpLoad %288 
                                       f32_3 %319 = OpCompositeConstruct %318 %318 %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %222 
                                       f32_3 %322 = OpFNegate %321 
                                       f32_3 %323 = OpFAdd %320 %322 
                                                      OpStore %315 %323 
                                Uniform f32* %326 = OpAccessChain %33 %325 
                                         f32 %327 = OpLoad %326 
                                       f32_3 %328 = OpCompositeConstruct %327 %327 %327 
                                       f32_3 %329 = OpLoad %315 
                                       f32_3 %330 = OpFMul %328 %329 
                                       f32_3 %331 = OpLoad %222 
                                       f32_3 %332 = OpFAdd %330 %331 
                                                      OpStore %324 %332 
                                       f32_3 %335 = OpLoad %324 
                                       f32_4 %336 = OpLoad %334 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %334 %337 
                                 Output f32* %339 = OpAccessChain %334 %86 
                                                      OpStore %339 %104 
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat9) + u_xlat1.x;
    u_xlat9 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat9;
    u_xlat9 = u_xlat9 * _LightShadowData.z + _LightShadowData.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat7.x, u_xlat4.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat7.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat9 = u_xlat9 + u_xlat10_2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = min(u_xlat9, u_xlat4.x);
    u_xlat9 = (u_xlatb1) ? u_xlat4.x : u_xlat9;
    u_xlat9 = u_xlat9 * _StepFactor;
    u_xlat9 = floor(u_xlat9);
    u_xlat9 = u_xlat9 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat9 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat9));
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
                                                      OpEntryPoint Vertex %4 "main" %34 %58 %70 %89 %173 %212 %217 %257 %263 %283 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 RelaxedPrecision 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpMemberDecorate %16 7 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %81 DescriptorSet 81 
                                                      OpDecorate %81 Binding 81 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %173 Location 173 
                                                      OpMemberDecorate %210 0 BuiltIn 210 
                                                      OpMemberDecorate %210 1 BuiltIn 210 
                                                      OpMemberDecorate %210 2 BuiltIn 210 
                                                      OpDecorate %210 Block 
                                                      OpDecorate %217 Location 217 
                                                      OpDecorate %257 Location 257 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %283 Location 283 
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
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %7 %12 %13 %14 %6 %15 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 4 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_4* %34 = OpVariable Input 
                                          i32 %37 = OpConstant 5 
                                          u32 %40 = OpConstant 1 
                               Private f32_4* %47 = OpVariable Private 
                                              %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %49 = OpTypeSampledImage %48 
                                              %50 = OpTypePointer UniformConstant %49 
  UniformConstant read_only Texture2DSampled* %51 = OpVariable UniformConstant 
                                          f32 %55 = OpConstant 3.67402E-40 
                                 Input f32_4* %58 = OpVariable Input 
                                          i32 %62 = OpConstant 6 
                                 Input f32_4* %70 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %81 = OpVariable UniformConstant 
                                              %88 = OpTypePointer Input %30 
                                 Input f32_3* %89 = OpVariable Input 
                                         u32 %118 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                              Private f32_4* %142 = OpVariable Private 
                                         i32 %145 = OpConstant 1 
                                             %146 = OpTypePointer Uniform %7 
                                         i32 %150 = OpConstant 0 
                                         i32 %158 = OpConstant 2 
                              Private f32_4* %166 = OpVariable Private 
                                         i32 %168 = OpConstant 3 
                                             %172 = OpTypePointer Output %30 
                               Output f32_3* %173 = OpVariable Output 
                                             %209 = OpTypeArray %6 %40 
                                             %210 = OpTypeStruct %7 %6 %209 
                                             %211 = OpTypePointer Output %210 
        Output struct {f32_4; f32; f32[1];}* %212 = OpVariable Output 
                                             %214 = OpTypePointer Output %7 
                                             %216 = OpTypePointer Output %15 
                               Output f32_2* %217 = OpVariable Output 
                                         i32 %220 = OpConstant 7 
                               Output f32_3* %257 = OpVariable Output 
                               Output f32_3* %263 = OpVariable Output 
                                       f32_3 %264 = OpConstantComposite %55 %55 %55 
                                         f32 %273 = OpConstant 3.67402E-40 
                                         u32 %275 = OpConstant 3 
                                       f32_2 %279 = OpConstantComposite %273 %273 
                               Output f32_4* %283 = OpVariable Output 
                                             %295 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                        f32_4 %35 = OpLoad %34 
                                        f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                 Uniform f32* %38 = OpAccessChain %18 %37 %27 
                                          f32 %39 = OpLoad %38 
                                 Uniform f32* %41 = OpAccessChain %18 %37 %40 
                                          f32 %42 = OpLoad %41 
                                        f32_2 %43 = OpCompositeConstruct %39 %42 
                                        f32_2 %44 = OpFAdd %36 %43 
                                        f32_3 %45 = OpLoad %32 
                                        f32_3 %46 = OpVectorShuffle %45 %44 3 4 2 
                                                      OpStore %32 %46 
                   read_only Texture2DSampled %52 = OpLoad %51 
                                        f32_3 %53 = OpLoad %32 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_4 %56 = OpImageSampleExplicitLod %52 %54 Lod %7 
                                                      OpStore %47 %56 
                                        f32_4 %57 = OpLoad %47 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFNegate %59 
                                        f32_4 %61 = OpFAdd %57 %60 
                                                      OpStore %47 %61 
                                 Uniform f32* %63 = OpAccessChain %18 %62 
                                          f32 %64 = OpLoad %63 
                                        f32_4 %65 = OpCompositeConstruct %64 %64 %64 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpFMul %65 %66 
                                        f32_4 %68 = OpLoad %58 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %47 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 1 
                                 Uniform f32* %73 = OpAccessChain %18 %37 %27 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %18 %37 %40 
                                          f32 %76 = OpLoad %75 
                                        f32_2 %77 = OpCompositeConstruct %74 %76 
                                        f32_2 %78 = OpFAdd %72 %77 
                                        f32_3 %79 = OpLoad %32 
                                        f32_3 %80 = OpVectorShuffle %79 %78 3 4 2 
                                                      OpStore %32 %80 
                   read_only Texture2DSampled %82 = OpLoad %81 
                                        f32_3 %83 = OpLoad %32 
                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                        f32_4 %85 = OpImageSampleExplicitLod %82 %84 Lod %7 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                      OpStore %32 %86 
                                        f32_3 %87 = OpLoad %32 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpFNegate %90 
                                        f32_3 %92 = OpFAdd %87 %91 
                                                      OpStore %32 %92 
                                 Uniform f32* %93 = OpAccessChain %18 %62 
                                          f32 %94 = OpLoad %93 
                                        f32_3 %95 = OpCompositeConstruct %94 %94 %94 
                                        f32_3 %96 = OpLoad %32 
                                        f32_3 %97 = OpFMul %95 %96 
                                        f32_3 %98 = OpLoad %89 
                                        f32_3 %99 = OpFAdd %97 %98 
                                                      OpStore %32 %99 
                                       f32_3 %100 = OpLoad %32 
                                Uniform f32* %101 = OpAccessChain %18 %20 
                                         f32 %102 = OpLoad %101 
                                Uniform f32* %103 = OpAccessChain %18 %20 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %18 %20 
                                         f32 %106 = OpLoad %105 
                                       f32_3 %107 = OpCompositeConstruct %102 %104 %106 
                                         f32 %108 = OpCompositeExtract %107 0 
                                         f32 %109 = OpCompositeExtract %107 1 
                                         f32 %110 = OpCompositeExtract %107 2 
                                       f32_3 %111 = OpCompositeConstruct %108 %109 %110 
                                       f32_3 %112 = OpFMul %100 %111 
                                       f32_4 %113 = OpLoad %47 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %47 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %47 %117 
                                Private f32* %119 = OpAccessChain %47 %118 
                                         f32 %120 = OpLoad %119 
                                Private f32* %121 = OpAccessChain %9 %27 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFDiv %120 %122 
                                Private f32* %124 = OpAccessChain %9 %27 
                                                      OpStore %124 %123 
                                Private f32* %125 = OpAccessChain %9 %27 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpExtInst %1 43 %126 %55 %127 
                                Private f32* %129 = OpAccessChain %9 %27 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %9 %27 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFNegate %131 
                                         f32 %133 = OpFAdd %132 %127 
                                Private f32* %134 = OpAccessChain %9 %27 
                                                      OpStore %134 %133 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 0 
                                       f32_4 %137 = OpLoad %47 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %47 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
                                                      OpStore %47 %141 
                                       f32_4 %143 = OpLoad %47 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %147 = OpAccessChain %18 %145 %145 
                                       f32_4 %148 = OpLoad %147 
                                       f32_4 %149 = OpFMul %144 %148 
                                                      OpStore %142 %149 
                              Uniform f32_4* %151 = OpAccessChain %18 %145 %150 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %47 
                                       f32_4 %154 = OpVectorShuffle %153 %153 0 0 0 0 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %142 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %142 %157 
                              Uniform f32_4* %159 = OpAccessChain %18 %145 %158 
                                       f32_4 %160 = OpLoad %159 
                                       f32_4 %161 = OpLoad %47 
                                       f32_4 %162 = OpVectorShuffle %161 %161 2 2 2 2 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %142 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %142 %165 
                                       f32_4 %167 = OpLoad %142 
                              Uniform f32_4* %169 = OpAccessChain %18 %145 %168 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpFAdd %167 %170 
                                                      OpStore %166 %171 
                              Uniform f32_4* %174 = OpAccessChain %18 %145 %168 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_4 %177 = OpLoad %47 
                                       f32_3 %178 = OpVectorShuffle %177 %177 3 3 3 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %142 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %179 %181 
                                                      OpStore %173 %182 
                                       f32_4 %183 = OpLoad %166 
                                       f32_4 %184 = OpVectorShuffle %183 %183 1 1 1 1 
                              Uniform f32_4* %185 = OpAccessChain %18 %168 %145 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpFMul %184 %186 
                                                      OpStore %47 %187 
                              Uniform f32_4* %188 = OpAccessChain %18 %168 %150 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %166 
                                       f32_4 %191 = OpVectorShuffle %190 %190 0 0 0 0 
                                       f32_4 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %47 
                                       f32_4 %194 = OpFAdd %192 %193 
                                                      OpStore %47 %194 
                              Uniform f32_4* %195 = OpAccessChain %18 %168 %158 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %166 
                                       f32_4 %198 = OpVectorShuffle %197 %197 2 2 2 2 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %47 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %47 %201 
                              Uniform f32_4* %202 = OpAccessChain %18 %168 %168 
                                       f32_4 %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %166 
                                       f32_4 %205 = OpVectorShuffle %204 %204 3 3 3 3 
                                       f32_4 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %47 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %47 %208 
                                       f32_4 %213 = OpLoad %47 
                               Output f32_4* %215 = OpAccessChain %212 %150 
                                                      OpStore %215 %213 
                                       f32_4 %218 = OpLoad %34 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                              Uniform f32_4* %221 = OpAccessChain %18 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                                       f32_2 %224 = OpFMul %219 %223 
                              Uniform f32_4* %225 = OpAccessChain %18 %220 
                                       f32_4 %226 = OpLoad %225 
                                       f32_2 %227 = OpVectorShuffle %226 %226 2 3 
                                       f32_2 %228 = OpFAdd %224 %227 
                                                      OpStore %217 %228 
                                       f32_3 %229 = OpLoad %32 
                              Uniform f32_4* %230 = OpAccessChain %18 %158 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                         f32 %233 = OpDot %229 %232 
                                Private f32* %234 = OpAccessChain %142 %27 
                                                      OpStore %234 %233 
                                       f32_3 %235 = OpLoad %32 
                              Uniform f32_4* %236 = OpAccessChain %18 %158 %145 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                         f32 %239 = OpDot %235 %238 
                                Private f32* %240 = OpAccessChain %142 %40 
                                                      OpStore %240 %239 
                                       f32_3 %241 = OpLoad %32 
                              Uniform f32_4* %242 = OpAccessChain %18 %158 %158 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                         f32 %245 = OpDot %241 %244 
                                Private f32* %246 = OpAccessChain %142 %118 
                                                      OpStore %246 %245 
                                       f32_4 %247 = OpLoad %142 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_4 %249 = OpLoad %142 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                         f32 %251 = OpDot %248 %250 
                                Private f32* %252 = OpAccessChain %9 %27 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %9 %27 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpExtInst %1 32 %254 
                                Private f32* %256 = OpAccessChain %9 %27 
                                                      OpStore %256 %255 
                                       f32_4 %258 = OpLoad %9 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
                                       f32_4 %260 = OpLoad %142 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFMul %259 %261 
                                                      OpStore %257 %262 
                                                      OpStore %263 %264 
                                Private f32* %265 = OpAccessChain %47 %40 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %267 = OpAccessChain %18 %150 %27 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %266 %268 
                                Private f32* %270 = OpAccessChain %9 %27 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %9 %27 
                                         f32 %272 = OpLoad %271 
                                         f32 %274 = OpFMul %272 %273 
                                Private f32* %276 = OpAccessChain %9 %275 
                                                      OpStore %276 %274 
                                       f32_4 %277 = OpLoad %47 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 3 
                                       f32_2 %280 = OpFMul %278 %279 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %280 4 1 5 3 
                                                      OpStore %9 %282 
                                       f32_4 %284 = OpLoad %47 
                                       f32_2 %285 = OpVectorShuffle %284 %284 2 3 
                                       f32_4 %286 = OpLoad %283 
                                       f32_4 %287 = OpVectorShuffle %286 %285 0 1 4 5 
                                                      OpStore %283 %287 
                                       f32_4 %288 = OpLoad %9 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_4 %290 = OpLoad %9 
                                       f32_2 %291 = OpVectorShuffle %290 %290 0 3 
                                       f32_2 %292 = OpFAdd %289 %291 
                                       f32_4 %293 = OpLoad %283 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 2 3 
                                                      OpStore %283 %294 
                                 Output f32* %296 = OpAccessChain %212 %150 %40 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFNegate %297 
                                 Output f32* %299 = OpAccessChain %212 %150 %40 
                                                      OpStore %299 %298 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 341
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %233 %301 %334 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 RelaxedPrecision 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 RelaxedPrecision 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 RelaxedPrecision 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpMemberDecorate %31 8 Offset 31 
                                                      OpMemberDecorate %31 9 Offset 31 
                                                      OpMemberDecorate %31 10 RelaxedPrecision 
                                                      OpMemberDecorate %31 10 Offset 31 
                                                      OpMemberDecorate %31 11 Offset 31 
                                                      OpMemberDecorate %31 12 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %119 SpecId 119 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 Location 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %334 Location 334 
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
                                              %23 = OpTypePointer Input %7 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %19 %28 
                                              %30 = OpTypeArray %19 %28 
                                              %31 = OpTypeStruct %7 %19 %19 %19 %19 %29 %19 %30 %7 %7 %19 %6 %6 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %19 
                               Private f32_4* %41 = OpVariable Private 
                                          i32 %42 = OpConstant 5 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Private %6 
                                          i32 %50 = OpConstant 1 
                                          u32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant 2 
                                 Private f32* %59 = OpVariable Private 
                                          i32 %65 = OpConstant 4 
                                              %66 = OpTypePointer Uniform %19 
                                          u32 %86 = OpConstant 3 
                                          i32 %95 = OpConstant 3 
                                         f32 %103 = OpConstant 3.67402E-40 
                                         f32 %104 = OpConstant 3.67402E-40 
                                             %106 = OpTypeBool 
                                             %107 = OpTypePointer Private %106 
                               Private bool* %108 = OpVariable Private 
                                         i32 %109 = OpConstant 6 
                                        bool %113 = OpConstantFalse 
                                        bool %119 = OpSpecConstantFalse 
                               Private bool* %122 = OpVariable Private 
                                         i32 %128 = OpConstant 7 
                              Private f32_3* %165 = OpVariable Private 
                                             %166 = OpTypePointer Function %7 
                                         i32 %177 = OpConstant 9 
                                         i32 %183 = OpConstant 8 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                             %232 = OpTypePointer Input %19 
                                Input f32_4* %233 = OpVariable Input 
                                Private f32* %241 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                Private f32* %248 = OpVariable Private 
                                             %259 = OpTypePointer Function %6 
                                         i32 %272 = OpConstant 11 
                                         i32 %283 = OpConstant 10 
                                Private f32* %288 = OpVariable Private 
                                Input f32_3* %301 = OpVariable Input 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                         f32 %309 = OpConstant 3.67402E-40 
                                       f32_3 %310 = OpConstantComposite %307 %308 %309 
                              Private f32_3* %315 = OpVariable Private 
                              Private f32_3* %324 = OpVariable Private 
                                         i32 %325 = OpConstant 12 
                                             %333 = OpTypePointer Output %19 
                               Output f32_4* %334 = OpVariable Output 
                                             %338 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %167 = OpVariable Function 
                               Function f32* %260 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpFNegate %25 
                               Uniform f32_3* %37 = OpAccessChain %33 %35 
                                        f32_3 %38 = OpLoad %37 
                                        f32_3 %39 = OpFAdd %26 %38 
                                                      OpStore %22 %39 
                                 Uniform f32* %45 = OpAccessChain %33 %42 %35 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %49 = OpAccessChain %41 %47 
                                                      OpStore %49 %46 
                                 Uniform f32* %51 = OpAccessChain %33 %42 %50 %43 
                                          f32 %52 = OpLoad %51 
                                 Private f32* %54 = OpAccessChain %41 %53 
                                                      OpStore %54 %52 
                                 Uniform f32* %56 = OpAccessChain %33 %42 %55 %43 
                                          f32 %57 = OpLoad %56 
                                 Private f32* %58 = OpAccessChain %41 %43 
                                                      OpStore %58 %57 
                                        f32_3 %60 = OpLoad %22 
                                        f32_4 %61 = OpLoad %41 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                          f32 %63 = OpDot %60 %62 
                                                      OpStore %59 %63 
                                        f32_3 %64 = OpLoad %24 
                               Uniform f32_4* %67 = OpAccessChain %33 %65 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFNegate %69 
                                        f32_3 %71 = OpFAdd %64 %70 
                                                      OpStore %22 %71 
                                        f32_3 %72 = OpLoad %22 
                                        f32_3 %73 = OpLoad %22 
                                          f32 %74 = OpDot %72 %73 
                                 Private f32* %75 = OpAccessChain %22 %47 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %22 %47 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 31 %77 
                                 Private f32* %79 = OpAccessChain %22 %47 
                                                      OpStore %79 %78 
                                          f32 %80 = OpLoad %59 
                                          f32 %81 = OpFNegate %80 
                                 Private f32* %82 = OpAccessChain %22 %47 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %81 %83 
                                 Private f32* %85 = OpAccessChain %22 %47 
                                                      OpStore %85 %84 
                                 Uniform f32* %87 = OpAccessChain %33 %65 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %22 %47 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %88 %90 
                                          f32 %92 = OpLoad %59 
                                          f32 %93 = OpFAdd %91 %92 
                                                      OpStore %59 %93 
                                          f32 %94 = OpLoad %59 
                                 Uniform f32* %96 = OpAccessChain %33 %95 %43 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %94 %97 
                                 Uniform f32* %99 = OpAccessChain %33 %95 %86 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                                      OpStore %59 %101 
                                         f32 %102 = OpLoad %59 
                                         f32 %105 = OpExtInst %1 43 %102 %103 %104 
                                                      OpStore %59 %105 
                                Uniform f32* %110 = OpAccessChain %33 %109 %47 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %104 
                                                      OpStore %108 %112 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %115 
                                             %114 = OpLabel 
                                        bool %116 = OpLoad %108 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %217 
                                             %120 = OpLabel 
                                Uniform f32* %123 = OpAccessChain %33 %109 %53 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdEqual %124 %104 
                                                      OpStore %122 %125 
                                       f32_3 %126 = OpLoad %24 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %33 %128 %50 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %41 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                                      OpStore %41 %134 
                              Uniform f32_4* %135 = OpAccessChain %33 %128 %35 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %24 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %41 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %41 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %41 %145 
                              Uniform f32_4* %146 = OpAccessChain %33 %128 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %24 
                                       f32_3 %150 = OpVectorShuffle %149 %149 2 2 2 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %41 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %41 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %41 %156 
                                       f32_4 %157 = OpLoad %41 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                              Uniform f32_4* %159 = OpAccessChain %33 %128 %95 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %158 %161 
                                       f32_4 %163 = OpLoad %41 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                      OpStore %41 %164 
                                        bool %168 = OpLoad %122 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %173 
                                             %169 = OpLabel 
                                       f32_4 %171 = OpLoad %41 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                                      OpStore %167 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                       f32_3 %174 = OpLoad %24 
                                                      OpStore %167 %174 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                       f32_3 %175 = OpLoad %167 
                                                      OpStore %165 %175 
                                       f32_3 %176 = OpLoad %165 
                              Uniform f32_3* %178 = OpAccessChain %33 %177 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFAdd %176 %180 
                                                      OpStore %165 %181 
                                       f32_3 %182 = OpLoad %165 
                              Uniform f32_3* %184 = OpAccessChain %33 %183 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %41 
                                       f32_4 %188 = OpVectorShuffle %187 %186 0 4 5 6 
                                                      OpStore %41 %188 
                                Private f32* %189 = OpAccessChain %41 %53 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %194 = OpFAdd %192 %193 
                                Private f32* %195 = OpAccessChain %165 %47 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %33 %109 %43 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %193 
                                                      OpStore %196 %201 
                                         f32 %202 = OpLoad %196 
                                Private f32* %203 = OpAccessChain %165 %47 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 40 %202 %204 
                                Private f32* %206 = OpAccessChain %41 %47 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %41 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %41 %214 
                                       f32_4 %216 = OpLoad %41 
                                                      OpStore %215 %216 
                                                      OpBranch %121 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %47 
                                                      OpStore %218 %104 
                                Private f32* %219 = OpAccessChain %215 %53 
                                                      OpStore %219 %104 
                                Private f32* %220 = OpAccessChain %215 %43 
                                                      OpStore %220 %104 
                                Private f32* %221 = OpAccessChain %215 %86 
                                                      OpStore %221 %104 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                       f32_4 %223 = OpLoad %215 
                              Uniform f32_4* %224 = OpAccessChain %33 %55 
                                       f32_4 %225 = OpLoad %224 
                                         f32 %226 = OpDot %223 %225 
                                Private f32* %227 = OpAccessChain %222 %47 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %222 %47 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpExtInst %1 43 %229 %103 %104 
                                Private f32* %231 = OpAccessChain %222 %47 
                                                      OpStore %231 %230 
                                       f32_4 %234 = OpLoad %233 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                       f32_4 %236 = OpLoad %233 
                                       f32_2 %237 = OpVectorShuffle %236 %236 3 3 
                                       f32_2 %238 = OpFDiv %235 %237 
                                       f32_3 %239 = OpLoad %165 
                                       f32_3 %240 = OpVectorShuffle %239 %238 3 4 2 
                                                      OpStore %165 %240 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_3 %244 = OpLoad %165 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 0 
                                                      OpStore %241 %247 
                                         f32 %249 = OpLoad %59 
                                         f32 %250 = OpLoad %241 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %248 %251 
                                         f32 %252 = OpLoad %248 
                                         f32 %253 = OpExtInst %1 43 %252 %103 %104 
                                                      OpStore %248 %253 
                                         f32 %254 = OpLoad %248 
                                Private f32* %255 = OpAccessChain %222 %47 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpExtInst %1 37 %254 %256 
                                Private f32* %258 = OpAccessChain %222 %47 
                                                      OpStore %258 %257 
                                        bool %261 = OpLoad %108 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %261 %262 %266 
                                             %262 = OpLabel 
                                Private f32* %264 = OpAccessChain %222 %47 
                                         f32 %265 = OpLoad %264 
                                                      OpStore %260 %265 
                                                      OpBranch %263 
                                             %266 = OpLabel 
                                         f32 %267 = OpLoad %248 
                                                      OpStore %260 %267 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %260 
                                Private f32* %269 = OpAccessChain %222 %47 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %222 %47 
                                         f32 %271 = OpLoad %270 
                                Uniform f32* %273 = OpAccessChain %33 %272 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %271 %274 
                                                      OpStore %59 %275 
                                         f32 %276 = OpLoad %59 
                                         f32 %277 = OpExtInst %1 8 %276 
                                                      OpStore %59 %277 
                                         f32 %278 = OpLoad %59 
                                Uniform f32* %279 = OpAccessChain %33 %272 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFDiv %278 %280 
                                                      OpStore %59 %281 
                                       f32_3 %282 = OpLoad %9 
                              Uniform f32_4* %284 = OpAccessChain %33 %283 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFMul %282 %286 
                                                      OpStore %222 %287 
                              Uniform f32_4* %289 = OpAccessChain %33 %50 
                                       f32_4 %290 = OpLoad %289 
                                       f32_2 %291 = OpVectorShuffle %290 %290 2 2 
                                       f32_2 %292 = OpFNegate %291 
                                         f32 %293 = OpLoad %59 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                         f32 %295 = OpDot %292 %294 
                                                      OpStore %288 %295 
                                         f32 %296 = OpLoad %288 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %222 
                                       f32_3 %299 = OpFMul %297 %298 
                                                      OpStore %222 %299 
                                       f32_3 %300 = OpLoad %9 
                                       f32_3 %302 = OpLoad %301 
                                       f32_3 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %222 
                                       f32_3 %305 = OpFAdd %303 %304 
                                                      OpStore %222 %305 
                                       f32_3 %306 = OpLoad %222 
                                         f32 %311 = OpDot %306 %310 
                                                      OpStore %288 %311 
                                         f32 %312 = OpLoad %288 
                                         f32 %313 = OpLoad %288 
                                         f32 %314 = OpFMul %312 %313 
                                                      OpStore %288 %314 
                                         f32 %316 = OpLoad %288 
                                       f32_3 %317 = OpCompositeConstruct %316 %316 %316 
                                         f32 %318 = OpLoad %288 
                                       f32_3 %319 = OpCompositeConstruct %318 %318 %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %222 
                                       f32_3 %322 = OpFNegate %321 
                                       f32_3 %323 = OpFAdd %320 %322 
                                                      OpStore %315 %323 
                                Uniform f32* %326 = OpAccessChain %33 %325 
                                         f32 %327 = OpLoad %326 
                                       f32_3 %328 = OpCompositeConstruct %327 %327 %327 
                                       f32_3 %329 = OpLoad %315 
                                       f32_3 %330 = OpFMul %328 %329 
                                       f32_3 %331 = OpLoad %222 
                                       f32_3 %332 = OpFAdd %330 %331 
                                                      OpStore %324 %332 
                                       f32_3 %335 = OpLoad %324 
                                       f32_4 %336 = OpLoad %334 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %334 %337 
                                 Output f32* %339 = OpAccessChain %334 %86 
                                                      OpStore %339 %104 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat5.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat5.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat5.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat5.xy, 0.0);
    u_xlat5.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat5.xyz = vec3(_UseBuffer) * u_xlat5.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat5.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat2 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat0.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat1 * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
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
    u_xlat6 = u_xlat6 * _StepFactor;
    u_xlat6 = floor(u_xlat6);
    u_xlat6 = u_xlat6 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat6 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat6));
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat6) * vec3(u_xlat6) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 397
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %36 %60 %72 %91 %209 %220 %269 %272 %388 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpMemberDecorate %18 8 Offset 18 
                                                      OpMemberDecorate %18 9 Offset 18 
                                                      OpMemberDecorate %18 10 RelaxedPrecision 
                                                      OpMemberDecorate %18 10 Offset 18 
                                                      OpMemberDecorate %18 11 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %36 Location 36 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 DescriptorSet 53 
                                                      OpDecorate %53 Binding 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpMemberDecorate %207 0 BuiltIn 207 
                                                      OpMemberDecorate %207 1 BuiltIn 207 
                                                      OpMemberDecorate %207 2 BuiltIn 207 
                                                      OpDecorate %207 Block 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate %272 Location 272 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %388 Location 388 
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
                                              %17 = OpTypeVector %6 2 
                                              %18 = OpTypeStruct %7 %7 %7 %7 %12 %14 %15 %16 %6 %17 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 8 
                                              %23 = OpTypePointer Uniform %6 
                                          f32 %27 = OpConstant 3.67402E-40 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %7 
                                 Input f32_4* %36 = OpVariable Input 
                                          i32 %39 = OpConstant 9 
                                          u32 %42 = OpConstant 1 
                               Private f32_4* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypeSampledImage %50 
                                              %52 = OpTypePointer UniformConstant %51 
  UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
                                          f32 %57 = OpConstant 3.67402E-40 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %64 = OpConstant 10 
                                 Input f32_4* %72 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %83 = OpVariable UniformConstant 
                                              %90 = OpTypePointer Input %32 
                                 Input f32_3* %91 = OpVariable Input 
                                         u32 %120 = OpConstant 2 
                                         f32 %129 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
                                         i32 %147 = OpConstant 5 
                                         i32 %148 = OpConstant 1 
                                             %149 = OpTypePointer Uniform %7 
                                         i32 %153 = OpConstant 0 
                                         i32 %161 = OpConstant 2 
                              Private f32_4* %169 = OpVariable Private 
                                         i32 %171 = OpConstant 3 
                                         i32 %188 = OpConstant 7 
                                             %206 = OpTypeArray %6 %42 
                                             %207 = OpTypeStruct %7 %6 %206 
                                             %208 = OpTypePointer Output %207 
        Output struct {f32_4; f32; f32[1];}* %209 = OpVariable Output 
                                             %217 = OpTypePointer Output %7 
                                             %219 = OpTypePointer Output %17 
                               Output f32_2* %220 = OpVariable Output 
                                         i32 %223 = OpConstant 11 
                                         i32 %233 = OpConstant 6 
                                             %268 = OpTypePointer Output %32 
                               Output f32_3* %269 = OpVariable Output 
                               Output f32_3* %272 = OpVariable Output 
                              Private f32_4* %288 = OpVariable Private 
                                         f32 %324 = OpConstant 3.67402E-40 
                                       f32_4 %325 = OpConstantComposite %324 %324 %324 %324 
                                       f32_4 %333 = OpConstantComposite %129 %129 %129 %129 
                                       f32_4 %341 = OpConstantComposite %57 %57 %57 %57 
                                         i32 %348 = OpConstant 4 
                               Output f32_3* %388 = OpVariable Output 
                                             %391 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %24 = OpAccessChain %20 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFNegate %25 
                                          f32 %28 = OpFAdd %26 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                 Uniform f32* %40 = OpAccessChain %20 %39 %29 
                                          f32 %41 = OpLoad %40 
                                 Uniform f32* %43 = OpAccessChain %20 %39 %42 
                                          f32 %44 = OpLoad %43 
                                        f32_2 %45 = OpCompositeConstruct %41 %44 
                                        f32_2 %46 = OpFAdd %38 %45 
                                        f32_3 %47 = OpLoad %34 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %34 %48 
                   read_only Texture2DSampled %54 = OpLoad %53 
                                        f32_3 %55 = OpLoad %34 
                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                        f32_4 %58 = OpImageSampleExplicitLod %54 %56 Lod %7 
                                                      OpStore %49 %58 
                                        f32_4 %59 = OpLoad %49 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFNegate %61 
                                        f32_4 %63 = OpFAdd %59 %62 
                                                      OpStore %49 %63 
                                 Uniform f32* %65 = OpAccessChain %20 %64 
                                          f32 %66 = OpLoad %65 
                                        f32_4 %67 = OpCompositeConstruct %66 %66 %66 %66 
                                        f32_4 %68 = OpLoad %49 
                                        f32_4 %69 = OpFMul %67 %68 
                                        f32_4 %70 = OpLoad %60 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %49 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 Uniform f32* %75 = OpAccessChain %20 %39 %29 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %20 %39 %42 
                                          f32 %78 = OpLoad %77 
                                        f32_2 %79 = OpCompositeConstruct %76 %78 
                                        f32_2 %80 = OpFAdd %74 %79 
                                        f32_3 %81 = OpLoad %34 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %34 %82 
                   read_only Texture2DSampled %84 = OpLoad %83 
                                        f32_3 %85 = OpLoad %34 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpImageSampleExplicitLod %84 %86 Lod %7 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                                      OpStore %34 %88 
                                        f32_3 %89 = OpLoad %34 
                                        f32_3 %92 = OpLoad %91 
                                        f32_3 %93 = OpFNegate %92 
                                        f32_3 %94 = OpFAdd %89 %93 
                                                      OpStore %34 %94 
                                 Uniform f32* %95 = OpAccessChain %20 %64 
                                          f32 %96 = OpLoad %95 
                                        f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                        f32_3 %98 = OpLoad %34 
                                        f32_3 %99 = OpFMul %97 %98 
                                       f32_3 %100 = OpLoad %91 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %34 %101 
                                       f32_3 %102 = OpLoad %34 
                                Uniform f32* %103 = OpAccessChain %20 %22 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %20 %22 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %107 = OpAccessChain %20 %22 
                                         f32 %108 = OpLoad %107 
                                       f32_3 %109 = OpCompositeConstruct %104 %106 %108 
                                         f32 %110 = OpCompositeExtract %109 0 
                                         f32 %111 = OpCompositeExtract %109 1 
                                         f32 %112 = OpCompositeExtract %109 2 
                                       f32_3 %113 = OpCompositeConstruct %110 %111 %112 
                                       f32_3 %114 = OpFMul %102 %113 
                                       f32_4 %115 = OpLoad %49 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %49 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %49 %119 
                                Private f32* %121 = OpAccessChain %49 %120 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %9 %29 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFDiv %122 %124 
                                Private f32* %126 = OpAccessChain %9 %29 
                                                      OpStore %126 %125 
                                Private f32* %127 = OpAccessChain %9 %29 
                                         f32 %128 = OpLoad %127 
                                         f32 %130 = OpExtInst %1 43 %128 %57 %129 
                                Private f32* %131 = OpAccessChain %9 %29 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %29 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                         f32 %135 = OpFAdd %134 %129 
                                Private f32* %136 = OpAccessChain %9 %29 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                                       f32_4 %139 = OpLoad %49 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %138 %140 
                                       f32_4 %142 = OpLoad %49 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %49 %143 
                                       f32_4 %145 = OpLoad %49 
                                       f32_4 %146 = OpVectorShuffle %145 %145 1 1 1 1 
                              Uniform f32_4* %150 = OpAccessChain %20 %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                       f32_4 %152 = OpFMul %146 %151 
                                                      OpStore %144 %152 
                              Uniform f32_4* %154 = OpAccessChain %20 %147 %153 
                                       f32_4 %155 = OpLoad %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_4 %157 = OpVectorShuffle %156 %156 0 0 0 0 
                                       f32_4 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %144 
                                       f32_4 %160 = OpFAdd %158 %159 
                                                      OpStore %144 %160 
                              Uniform f32_4* %162 = OpAccessChain %20 %147 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpLoad %49 
                                       f32_4 %165 = OpVectorShuffle %164 %164 2 2 2 2 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %144 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %144 %168 
                                       f32_4 %170 = OpLoad %144 
                              Uniform f32_4* %172 = OpAccessChain %20 %147 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFAdd %170 %173 
                                                      OpStore %169 %174 
                              Uniform f32_4* %175 = OpAccessChain %20 %147 %171 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_4 %178 = OpLoad %49 
                                       f32_3 %179 = OpVectorShuffle %178 %178 3 3 3 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %144 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFAdd %180 %182 
                                       f32_4 %184 = OpLoad %49 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %49 %185 
                                       f32_4 %186 = OpLoad %169 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %20 %188 %148 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %187 %190 
                                                      OpStore %144 %191 
                              Uniform f32_4* %192 = OpAccessChain %20 %188 %153 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %144 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %144 %198 
                              Uniform f32_4* %199 = OpAccessChain %20 %188 %161 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %169 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %144 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %144 %205 
                              Uniform f32_4* %210 = OpAccessChain %20 %188 %171 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %169 
                                       f32_4 %213 = OpVectorShuffle %212 %212 3 3 3 3 
                                       f32_4 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %144 
                                       f32_4 %216 = OpFAdd %214 %215 
                               Output f32_4* %218 = OpAccessChain %209 %153 
                                                      OpStore %218 %216 
                                       f32_4 %221 = OpLoad %36 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
                              Uniform f32_4* %224 = OpAccessChain %20 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
                                       f32_2 %227 = OpFMul %222 %226 
                              Uniform f32_4* %228 = OpAccessChain %20 %223 
                                       f32_4 %229 = OpLoad %228 
                                       f32_2 %230 = OpVectorShuffle %229 %229 2 3 
                                       f32_2 %231 = OpFAdd %227 %230 
                                                      OpStore %220 %231 
                                       f32_3 %232 = OpLoad %34 
                              Uniform f32_4* %234 = OpAccessChain %20 %233 %153 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                         f32 %237 = OpDot %232 %236 
                                Private f32* %238 = OpAccessChain %144 %29 
                                                      OpStore %238 %237 
                                       f32_3 %239 = OpLoad %34 
                              Uniform f32_4* %240 = OpAccessChain %20 %233 %148 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                         f32 %243 = OpDot %239 %242 
                                Private f32* %244 = OpAccessChain %144 %42 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %34 
                              Uniform f32_4* %246 = OpAccessChain %20 %233 %161 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                         f32 %249 = OpDot %245 %248 
                                Private f32* %250 = OpAccessChain %144 %120 
                                                      OpStore %250 %249 
                                       f32_4 %251 = OpLoad %144 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_4 %253 = OpLoad %144 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                         f32 %255 = OpDot %252 %254 
                                Private f32* %256 = OpAccessChain %9 %29 
                                                      OpStore %256 %255 
                                Private f32* %257 = OpAccessChain %9 %29 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpExtInst %1 32 %258 
                                Private f32* %260 = OpAccessChain %9 %29 
                                                      OpStore %260 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 0 0 
                                       f32_4 %263 = OpLoad %144 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %9 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %9 %267 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                                      OpStore %269 %271 
                                       f32_4 %273 = OpLoad %49 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                                      OpStore %272 %274 
                                       f32_4 %275 = OpLoad %49 
                                       f32_4 %276 = OpVectorShuffle %275 %275 1 1 1 1 
                                       f32_4 %277 = OpFNegate %276 
                              Uniform f32_4* %278 = OpAccessChain %20 %148 
                                       f32_4 %279 = OpLoad %278 
                                       f32_4 %280 = OpFAdd %277 %279 
                                                      OpStore %144 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %281 1 1 1 1 
                                       f32_4 %283 = OpLoad %144 
                                       f32_4 %284 = OpFMul %282 %283 
                                                      OpStore %169 %284 
                                       f32_4 %285 = OpLoad %144 
                                       f32_4 %286 = OpLoad %144 
                                       f32_4 %287 = OpFMul %285 %286 
                                                      OpStore %144 %287 
                                       f32_4 %289 = OpLoad %49 
                                       f32_4 %290 = OpVectorShuffle %289 %289 0 0 0 0 
                                       f32_4 %291 = OpFNegate %290 
                              Uniform f32_4* %292 = OpAccessChain %20 %153 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpFAdd %291 %293 
                                                      OpStore %288 %294 
                                       f32_4 %295 = OpLoad %49 
                                       f32_4 %296 = OpVectorShuffle %295 %295 2 2 2 2 
                                       f32_4 %297 = OpFNegate %296 
                              Uniform f32_4* %298 = OpAccessChain %20 %161 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpFAdd %297 %299 
                                                      OpStore %49 %300 
                                       f32_4 %301 = OpLoad %288 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 0 0 0 
                                       f32_4 %304 = OpFMul %301 %303 
                                       f32_4 %305 = OpLoad %169 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %169 %306 
                                       f32_4 %307 = OpLoad %288 
                                       f32_4 %308 = OpLoad %288 
                                       f32_4 %309 = OpFMul %307 %308 
                                       f32_4 %310 = OpLoad %144 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %144 %311 
                                       f32_4 %312 = OpLoad %49 
                                       f32_4 %313 = OpLoad %49 
                                       f32_4 %314 = OpFMul %312 %313 
                                       f32_4 %315 = OpLoad %144 
                                       f32_4 %316 = OpFAdd %314 %315 
                                                      OpStore %144 %316 
                                       f32_4 %317 = OpLoad %49 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpVectorShuffle %318 %318 2 2 2 2 
                                       f32_4 %320 = OpFMul %317 %319 
                                       f32_4 %321 = OpLoad %169 
                                       f32_4 %322 = OpFAdd %320 %321 
                                                      OpStore %9 %322 
                                       f32_4 %323 = OpLoad %144 
                                       f32_4 %326 = OpExtInst %1 40 %323 %325 
                                                      OpStore %49 %326 
                                       f32_4 %327 = OpLoad %49 
                                       f32_4 %328 = OpExtInst %1 32 %327 
                                                      OpStore %144 %328 
                                       f32_4 %329 = OpLoad %49 
                              Uniform f32_4* %330 = OpAccessChain %20 %171 
                                       f32_4 %331 = OpLoad %330 
                                       f32_4 %332 = OpFMul %329 %331 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %49 %334 
                                       f32_4 %335 = OpLoad %49 
                                       f32_4 %336 = OpFDiv %333 %335 
                                                      OpStore %49 %336 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpLoad %144 
                                       f32_4 %339 = OpFMul %337 %338 
                                                      OpStore %9 %339 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %342 = OpExtInst %1 40 %340 %341 
                                                      OpStore %9 %342 
                                       f32_4 %343 = OpLoad %49 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpFMul %343 %344 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %9 
                                       f32_3 %347 = OpVectorShuffle %346 %346 1 1 1 
                              Uniform f32_4* %349 = OpAccessChain %20 %348 %148 
                                       f32_4 %350 = OpLoad %349 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_3 %352 = OpFMul %347 %351 
                                       f32_4 %353 = OpLoad %49 
                                       f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                      OpStore %49 %354 
                              Uniform f32_4* %355 = OpAccessChain %20 %348 %153 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 0 0 
                                       f32_3 %360 = OpFMul %357 %359 
                                       f32_4 %361 = OpLoad %49 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFAdd %360 %362 
                                       f32_4 %364 = OpLoad %49 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %49 %365 
                              Uniform f32_4* %366 = OpAccessChain %20 %348 %161 
                                       f32_4 %367 = OpLoad %366 
                                       f32_3 %368 = OpVectorShuffle %367 %367 0 1 2 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 2 2 2 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %49 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                              Uniform f32_4* %377 = OpAccessChain %20 %348 %171 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_4 %380 = OpLoad %9 
                                       f32_3 %381 = OpVectorShuffle %380 %380 3 3 3 
                                       f32_3 %382 = OpFMul %379 %381 
                                       f32_4 %383 = OpLoad %9 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_3 %385 = OpFAdd %382 %384 
                                       f32_4 %386 = OpLoad %9 
                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
                                                      OpStore %9 %387 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                                      OpStore %388 %390 
                                 Output f32* %392 = OpAccessChain %209 %153 %42 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFNegate %393 
                                 Output f32* %395 = OpAccessChain %209 %153 %42 
                                                      OpStore %395 %394 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %55 %205 %238 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 RelaxedPrecision 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 RelaxedPrecision 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %45 SpecId 45 
                                                      OpDecorate %55 Location 55 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %238 Location 238 
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
                                              %22 = OpTypeBool 
                                              %23 = OpTypePointer Private %22 
                                Private bool* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %19 %26 
                                              %28 = OpTypeStruct %19 %19 %19 %27 %7 %7 %19 %6 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 2 
                                          u32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %6 
                                          f32 %37 = OpConstant 3.67402E-40 
                                         bool %39 = OpConstantFalse 
                                         bool %45 = OpSpecConstantFalse 
                                          u32 %48 = OpConstant 1 
                                              %52 = OpTypePointer Private %19 
                               Private f32_4* %53 = OpVariable Private 
                                              %54 = OpTypePointer Input %7 
                                 Input f32_3* %55 = OpVariable Input 
                                          i32 %58 = OpConstant 3 
                                          i32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Uniform %19 
                                          i32 %67 = OpConstant 0 
                                              %98 = OpTypePointer Function %7 
                                         i32 %112 = OpConstant 5 
                                             %113 = OpTypePointer Uniform %7 
                                         i32 %122 = OpConstant 4 
                                             %128 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                Private f32* %136 = OpVariable Private 
                                         u32 %137 = OpConstant 2 
                                         f32 %140 = OpConstant 3.67402E-40 
                                             %147 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %148 = OpTypeSampledImage %147 
                                             %149 = OpTypePointer UniformConstant %148 
 UniformConstant read_only Texture3DSampled* %150 = OpVariable UniformConstant 
                              Private f32_4* %155 = OpVariable Private 
                                         u32 %161 = OpConstant 3 
                              Private f32_3* %163 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         i32 %176 = OpConstant 7 
                                         i32 %187 = OpConstant 6 
                                Private f32* %192 = OpVariable Private 
                                Input f32_3* %205 = OpVariable Input 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_3 %214 = OpConstantComposite %211 %212 %213 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %229 = OpConstant 8 
                                             %237 = OpTypePointer Output %19 
                               Output f32_4* %238 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %99 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                 Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdEqual %36 %37 
                                                      OpStore %24 %38 
                                                      OpSelectionMerge %41 None 
                                                      OpBranchConditional %39 %40 %41 
                                              %40 = OpLabel 
                                         bool %42 = OpLoad %24 
                                                      OpSelectionMerge %44 None 
                                                      OpBranchConditional %42 %43 %44 
                                              %43 = OpLabel 
                                                      OpBranch %44 
                                              %44 = OpLabel 
                                                      OpBranch %41 
                                              %41 = OpLabel 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %157 
                                              %46 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %30 %32 %48 
                                          f32 %50 = OpLoad %49 
                                         bool %51 = OpFOrdEqual %50 %37 
                                                      OpStore %24 %51 
                                        f32_3 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %30 %58 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %57 %63 
                                        f32_4 %65 = OpLoad %53 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %53 %66 
                               Uniform f32_4* %68 = OpAccessChain %30 %58 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpLoad %55 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 0 0 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %53 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %53 %78 
                               Uniform f32_4* %79 = OpAccessChain %30 %58 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %55 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                                        f32_4 %90 = OpLoad %53 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %30 %58 %58 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %91 %94 
                                        f32_4 %96 = OpLoad %53 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %53 %97 
                                        bool %100 = OpLoad %24 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %105 
                                             %101 = OpLabel 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %99 %104 
                                                      OpBranch %102 
                                             %105 = OpLabel 
                                       f32_3 %106 = OpLoad %55 
                                                      OpStore %99 %106 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                       f32_3 %107 = OpLoad %99 
                                       f32_4 %108 = OpLoad %53 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %53 %109 
                                       f32_4 %110 = OpLoad %53 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                              Uniform f32_3* %114 = OpAccessChain %30 %112 
                                       f32_3 %115 = OpLoad %114 
                                       f32_3 %116 = OpFNegate %115 
                                       f32_3 %117 = OpFAdd %111 %116 
                                       f32_4 %118 = OpLoad %53 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %53 %119 
                                       f32_4 %120 = OpLoad %53 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              Uniform f32_3* %123 = OpAccessChain %30 %122 
                                       f32_3 %124 = OpLoad %123 
                                       f32_3 %125 = OpFMul %121 %124 
                                       f32_4 %126 = OpLoad %53 
                                       f32_4 %127 = OpVectorShuffle %126 %125 0 4 5 6 
                                                      OpStore %53 %127 
                                Private f32* %130 = OpAccessChain %53 %48 
                                         f32 %131 = OpLoad %130 
                                         f32 %133 = OpFMul %131 %132 
                                         f32 %135 = OpFAdd %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %138 = OpAccessChain %30 %32 %137 
                                         f32 %139 = OpLoad %138 
                                         f32 %141 = OpFMul %139 %140 
                                         f32 %142 = OpFAdd %141 %134 
                                                      OpStore %136 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpLoad %136 
                                         f32 %145 = OpExtInst %1 40 %143 %144 
                                Private f32* %146 = OpAccessChain %53 %33 
                                                      OpStore %146 %145 
                  read_only Texture3DSampled %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %53 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 2 3 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %53 %154 
                                       f32_4 %156 = OpLoad %53 
                                                      OpStore %155 %156 
                                                      OpBranch %47 
                                             %157 = OpLabel 
                                Private f32* %158 = OpAccessChain %155 %33 
                                                      OpStore %158 %37 
                                Private f32* %159 = OpAccessChain %155 %48 
                                                      OpStore %159 %37 
                                Private f32* %160 = OpAccessChain %155 %137 
                                                      OpStore %160 %37 
                                Private f32* %162 = OpAccessChain %155 %161 
                                                      OpStore %162 %37 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                       f32_4 %164 = OpLoad %155 
                              Uniform f32_4* %165 = OpAccessChain %30 %59 
                                       f32_4 %166 = OpLoad %165 
                                         f32 %167 = OpDot %164 %166 
                                Private f32* %168 = OpAccessChain %163 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %163 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpExtInst %1 43 %170 %171 %37 
                                Private f32* %173 = OpAccessChain %163 %33 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %163 %33 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %30 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 8 %180 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                Uniform f32* %183 = OpAccessChain %30 %176 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFDiv %182 %184 
                                                      OpStore %129 %185 
                                       f32_3 %186 = OpLoad %9 
                              Uniform f32_4* %188 = OpAccessChain %30 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %163 %191 
                              Uniform f32_4* %193 = OpAccessChain %30 %67 
                                       f32_4 %194 = OpLoad %193 
                                       f32_2 %195 = OpVectorShuffle %194 %194 2 2 
                                       f32_2 %196 = OpFNegate %195 
                                         f32 %197 = OpLoad %129 
                                       f32_2 %198 = OpCompositeConstruct %197 %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %192 %199 
                                         f32 %200 = OpLoad %192 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %163 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %163 %203 
                                       f32_3 %204 = OpLoad %9 
                                       f32_3 %206 = OpLoad %205 
                                       f32_3 %207 = OpFMul %204 %206 
                                       f32_3 %208 = OpLoad %163 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %163 %209 
                                       f32_3 %210 = OpLoad %163 
                                         f32 %215 = OpDot %210 %214 
                                                      OpStore %192 %215 
                                         f32 %216 = OpLoad %192 
                                         f32 %217 = OpLoad %192 
                                         f32 %218 = OpFMul %216 %217 
                                                      OpStore %192 %218 
                                         f32 %220 = OpLoad %192 
                                       f32_3 %221 = OpCompositeConstruct %220 %220 %220 
                                         f32 %222 = OpLoad %192 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %163 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %224 %226 
                                                      OpStore %219 %227 
                                Uniform f32* %230 = OpAccessChain %30 %229 
                                         f32 %231 = OpLoad %230 
                                       f32_3 %232 = OpCompositeConstruct %231 %231 %231 
                                       f32_3 %233 = OpLoad %219 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %228 %236 
                                       f32_3 %239 = OpLoad %228 
                                       f32_4 %240 = OpLoad %238 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %238 %241 
                                 Output f32* %243 = OpAccessChain %238 %161 
                                                      OpStore %243 %37 
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat5.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat5.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat5.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat5.xy, 0.0);
    u_xlat5.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat5.xyz = vec3(_UseBuffer) * u_xlat5.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat5.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat2 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat5.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat0.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat1 * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat3;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
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
    u_xlat6 = u_xlat6 * _StepFactor;
    u_xlat6 = floor(u_xlat6);
    u_xlat6 = u_xlat6 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat6 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat6));
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat6) * vec3(u_xlat6) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 397
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %36 %60 %72 %91 %209 %220 %269 %272 %388 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 RelaxedPrecision 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpMemberDecorate %18 8 Offset 18 
                                                      OpMemberDecorate %18 9 Offset 18 
                                                      OpMemberDecorate %18 10 RelaxedPrecision 
                                                      OpMemberDecorate %18 10 Offset 18 
                                                      OpMemberDecorate %18 11 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %36 Location 36 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 DescriptorSet 53 
                                                      OpDecorate %53 Binding 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpMemberDecorate %207 0 BuiltIn 207 
                                                      OpMemberDecorate %207 1 BuiltIn 207 
                                                      OpMemberDecorate %207 2 BuiltIn 207 
                                                      OpDecorate %207 Block 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate %272 Location 272 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %388 Location 388 
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
                                              %17 = OpTypeVector %6 2 
                                              %18 = OpTypeStruct %7 %7 %7 %7 %12 %14 %15 %16 %6 %17 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 8 
                                              %23 = OpTypePointer Uniform %6 
                                          f32 %27 = OpConstant 3.67402E-40 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %7 
                                 Input f32_4* %36 = OpVariable Input 
                                          i32 %39 = OpConstant 9 
                                          u32 %42 = OpConstant 1 
                               Private f32_4* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypeSampledImage %50 
                                              %52 = OpTypePointer UniformConstant %51 
  UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
                                          f32 %57 = OpConstant 3.67402E-40 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %64 = OpConstant 10 
                                 Input f32_4* %72 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %83 = OpVariable UniformConstant 
                                              %90 = OpTypePointer Input %32 
                                 Input f32_3* %91 = OpVariable Input 
                                         u32 %120 = OpConstant 2 
                                         f32 %129 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
                                         i32 %147 = OpConstant 5 
                                         i32 %148 = OpConstant 1 
                                             %149 = OpTypePointer Uniform %7 
                                         i32 %153 = OpConstant 0 
                                         i32 %161 = OpConstant 2 
                              Private f32_4* %169 = OpVariable Private 
                                         i32 %171 = OpConstant 3 
                                         i32 %188 = OpConstant 7 
                                             %206 = OpTypeArray %6 %42 
                                             %207 = OpTypeStruct %7 %6 %206 
                                             %208 = OpTypePointer Output %207 
        Output struct {f32_4; f32; f32[1];}* %209 = OpVariable Output 
                                             %217 = OpTypePointer Output %7 
                                             %219 = OpTypePointer Output %17 
                               Output f32_2* %220 = OpVariable Output 
                                         i32 %223 = OpConstant 11 
                                         i32 %233 = OpConstant 6 
                                             %268 = OpTypePointer Output %32 
                               Output f32_3* %269 = OpVariable Output 
                               Output f32_3* %272 = OpVariable Output 
                              Private f32_4* %288 = OpVariable Private 
                                         f32 %324 = OpConstant 3.67402E-40 
                                       f32_4 %325 = OpConstantComposite %324 %324 %324 %324 
                                       f32_4 %333 = OpConstantComposite %129 %129 %129 %129 
                                       f32_4 %341 = OpConstantComposite %57 %57 %57 %57 
                                         i32 %348 = OpConstant 4 
                               Output f32_3* %388 = OpVariable Output 
                                             %391 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %24 = OpAccessChain %20 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFNegate %25 
                                          f32 %28 = OpFAdd %26 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                 Uniform f32* %40 = OpAccessChain %20 %39 %29 
                                          f32 %41 = OpLoad %40 
                                 Uniform f32* %43 = OpAccessChain %20 %39 %42 
                                          f32 %44 = OpLoad %43 
                                        f32_2 %45 = OpCompositeConstruct %41 %44 
                                        f32_2 %46 = OpFAdd %38 %45 
                                        f32_3 %47 = OpLoad %34 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %34 %48 
                   read_only Texture2DSampled %54 = OpLoad %53 
                                        f32_3 %55 = OpLoad %34 
                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                        f32_4 %58 = OpImageSampleExplicitLod %54 %56 Lod %7 
                                                      OpStore %49 %58 
                                        f32_4 %59 = OpLoad %49 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFNegate %61 
                                        f32_4 %63 = OpFAdd %59 %62 
                                                      OpStore %49 %63 
                                 Uniform f32* %65 = OpAccessChain %20 %64 
                                          f32 %66 = OpLoad %65 
                                        f32_4 %67 = OpCompositeConstruct %66 %66 %66 %66 
                                        f32_4 %68 = OpLoad %49 
                                        f32_4 %69 = OpFMul %67 %68 
                                        f32_4 %70 = OpLoad %60 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %49 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 Uniform f32* %75 = OpAccessChain %20 %39 %29 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %20 %39 %42 
                                          f32 %78 = OpLoad %77 
                                        f32_2 %79 = OpCompositeConstruct %76 %78 
                                        f32_2 %80 = OpFAdd %74 %79 
                                        f32_3 %81 = OpLoad %34 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %34 %82 
                   read_only Texture2DSampled %84 = OpLoad %83 
                                        f32_3 %85 = OpLoad %34 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpImageSampleExplicitLod %84 %86 Lod %7 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                                      OpStore %34 %88 
                                        f32_3 %89 = OpLoad %34 
                                        f32_3 %92 = OpLoad %91 
                                        f32_3 %93 = OpFNegate %92 
                                        f32_3 %94 = OpFAdd %89 %93 
                                                      OpStore %34 %94 
                                 Uniform f32* %95 = OpAccessChain %20 %64 
                                          f32 %96 = OpLoad %95 
                                        f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                        f32_3 %98 = OpLoad %34 
                                        f32_3 %99 = OpFMul %97 %98 
                                       f32_3 %100 = OpLoad %91 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %34 %101 
                                       f32_3 %102 = OpLoad %34 
                                Uniform f32* %103 = OpAccessChain %20 %22 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %20 %22 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %107 = OpAccessChain %20 %22 
                                         f32 %108 = OpLoad %107 
                                       f32_3 %109 = OpCompositeConstruct %104 %106 %108 
                                         f32 %110 = OpCompositeExtract %109 0 
                                         f32 %111 = OpCompositeExtract %109 1 
                                         f32 %112 = OpCompositeExtract %109 2 
                                       f32_3 %113 = OpCompositeConstruct %110 %111 %112 
                                       f32_3 %114 = OpFMul %102 %113 
                                       f32_4 %115 = OpLoad %49 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %49 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %49 %119 
                                Private f32* %121 = OpAccessChain %49 %120 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %9 %29 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFDiv %122 %124 
                                Private f32* %126 = OpAccessChain %9 %29 
                                                      OpStore %126 %125 
                                Private f32* %127 = OpAccessChain %9 %29 
                                         f32 %128 = OpLoad %127 
                                         f32 %130 = OpExtInst %1 43 %128 %57 %129 
                                Private f32* %131 = OpAccessChain %9 %29 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %29 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                         f32 %135 = OpFAdd %134 %129 
                                Private f32* %136 = OpAccessChain %9 %29 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                                       f32_4 %139 = OpLoad %49 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %138 %140 
                                       f32_4 %142 = OpLoad %49 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %49 %143 
                                       f32_4 %145 = OpLoad %49 
                                       f32_4 %146 = OpVectorShuffle %145 %145 1 1 1 1 
                              Uniform f32_4* %150 = OpAccessChain %20 %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                       f32_4 %152 = OpFMul %146 %151 
                                                      OpStore %144 %152 
                              Uniform f32_4* %154 = OpAccessChain %20 %147 %153 
                                       f32_4 %155 = OpLoad %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_4 %157 = OpVectorShuffle %156 %156 0 0 0 0 
                                       f32_4 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %144 
                                       f32_4 %160 = OpFAdd %158 %159 
                                                      OpStore %144 %160 
                              Uniform f32_4* %162 = OpAccessChain %20 %147 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpLoad %49 
                                       f32_4 %165 = OpVectorShuffle %164 %164 2 2 2 2 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %144 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %144 %168 
                                       f32_4 %170 = OpLoad %144 
                              Uniform f32_4* %172 = OpAccessChain %20 %147 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFAdd %170 %173 
                                                      OpStore %169 %174 
                              Uniform f32_4* %175 = OpAccessChain %20 %147 %171 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_4 %178 = OpLoad %49 
                                       f32_3 %179 = OpVectorShuffle %178 %178 3 3 3 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %144 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFAdd %180 %182 
                                       f32_4 %184 = OpLoad %49 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %49 %185 
                                       f32_4 %186 = OpLoad %169 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %20 %188 %148 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %187 %190 
                                                      OpStore %144 %191 
                              Uniform f32_4* %192 = OpAccessChain %20 %188 %153 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %144 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %144 %198 
                              Uniform f32_4* %199 = OpAccessChain %20 %188 %161 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %169 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %144 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %144 %205 
                              Uniform f32_4* %210 = OpAccessChain %20 %188 %171 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %169 
                                       f32_4 %213 = OpVectorShuffle %212 %212 3 3 3 3 
                                       f32_4 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %144 
                                       f32_4 %216 = OpFAdd %214 %215 
                               Output f32_4* %218 = OpAccessChain %209 %153 
                                                      OpStore %218 %216 
                                       f32_4 %221 = OpLoad %36 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
                              Uniform f32_4* %224 = OpAccessChain %20 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
                                       f32_2 %227 = OpFMul %222 %226 
                              Uniform f32_4* %228 = OpAccessChain %20 %223 
                                       f32_4 %229 = OpLoad %228 
                                       f32_2 %230 = OpVectorShuffle %229 %229 2 3 
                                       f32_2 %231 = OpFAdd %227 %230 
                                                      OpStore %220 %231 
                                       f32_3 %232 = OpLoad %34 
                              Uniform f32_4* %234 = OpAccessChain %20 %233 %153 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                         f32 %237 = OpDot %232 %236 
                                Private f32* %238 = OpAccessChain %144 %29 
                                                      OpStore %238 %237 
                                       f32_3 %239 = OpLoad %34 
                              Uniform f32_4* %240 = OpAccessChain %20 %233 %148 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                         f32 %243 = OpDot %239 %242 
                                Private f32* %244 = OpAccessChain %144 %42 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %34 
                              Uniform f32_4* %246 = OpAccessChain %20 %233 %161 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                         f32 %249 = OpDot %245 %248 
                                Private f32* %250 = OpAccessChain %144 %120 
                                                      OpStore %250 %249 
                                       f32_4 %251 = OpLoad %144 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_4 %253 = OpLoad %144 
                                       f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
                                         f32 %255 = OpDot %252 %254 
                                Private f32* %256 = OpAccessChain %9 %29 
                                                      OpStore %256 %255 
                                Private f32* %257 = OpAccessChain %9 %29 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpExtInst %1 32 %258 
                                Private f32* %260 = OpAccessChain %9 %29 
                                                      OpStore %260 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 0 0 
                                       f32_4 %263 = OpLoad %144 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %9 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %9 %267 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                                      OpStore %269 %271 
                                       f32_4 %273 = OpLoad %49 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                                      OpStore %272 %274 
                                       f32_4 %275 = OpLoad %49 
                                       f32_4 %276 = OpVectorShuffle %275 %275 1 1 1 1 
                                       f32_4 %277 = OpFNegate %276 
                              Uniform f32_4* %278 = OpAccessChain %20 %148 
                                       f32_4 %279 = OpLoad %278 
                                       f32_4 %280 = OpFAdd %277 %279 
                                                      OpStore %144 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %281 1 1 1 1 
                                       f32_4 %283 = OpLoad %144 
                                       f32_4 %284 = OpFMul %282 %283 
                                                      OpStore %169 %284 
                                       f32_4 %285 = OpLoad %144 
                                       f32_4 %286 = OpLoad %144 
                                       f32_4 %287 = OpFMul %285 %286 
                                                      OpStore %144 %287 
                                       f32_4 %289 = OpLoad %49 
                                       f32_4 %290 = OpVectorShuffle %289 %289 0 0 0 0 
                                       f32_4 %291 = OpFNegate %290 
                              Uniform f32_4* %292 = OpAccessChain %20 %153 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpFAdd %291 %293 
                                                      OpStore %288 %294 
                                       f32_4 %295 = OpLoad %49 
                                       f32_4 %296 = OpVectorShuffle %295 %295 2 2 2 2 
                                       f32_4 %297 = OpFNegate %296 
                              Uniform f32_4* %298 = OpAccessChain %20 %161 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpFAdd %297 %299 
                                                      OpStore %49 %300 
                                       f32_4 %301 = OpLoad %288 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 0 0 0 
                                       f32_4 %304 = OpFMul %301 %303 
                                       f32_4 %305 = OpLoad %169 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %169 %306 
                                       f32_4 %307 = OpLoad %288 
                                       f32_4 %308 = OpLoad %288 
                                       f32_4 %309 = OpFMul %307 %308 
                                       f32_4 %310 = OpLoad %144 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %144 %311 
                                       f32_4 %312 = OpLoad %49 
                                       f32_4 %313 = OpLoad %49 
                                       f32_4 %314 = OpFMul %312 %313 
                                       f32_4 %315 = OpLoad %144 
                                       f32_4 %316 = OpFAdd %314 %315 
                                                      OpStore %144 %316 
                                       f32_4 %317 = OpLoad %49 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpVectorShuffle %318 %318 2 2 2 2 
                                       f32_4 %320 = OpFMul %317 %319 
                                       f32_4 %321 = OpLoad %169 
                                       f32_4 %322 = OpFAdd %320 %321 
                                                      OpStore %9 %322 
                                       f32_4 %323 = OpLoad %144 
                                       f32_4 %326 = OpExtInst %1 40 %323 %325 
                                                      OpStore %49 %326 
                                       f32_4 %327 = OpLoad %49 
                                       f32_4 %328 = OpExtInst %1 32 %327 
                                                      OpStore %144 %328 
                                       f32_4 %329 = OpLoad %49 
                              Uniform f32_4* %330 = OpAccessChain %20 %171 
                                       f32_4 %331 = OpLoad %330 
                                       f32_4 %332 = OpFMul %329 %331 
                                       f32_4 %334 = OpFAdd %332 %333 
                                                      OpStore %49 %334 
                                       f32_4 %335 = OpLoad %49 
                                       f32_4 %336 = OpFDiv %333 %335 
                                                      OpStore %49 %336 
                                       f32_4 %337 = OpLoad %9 
                                       f32_4 %338 = OpLoad %144 
                                       f32_4 %339 = OpFMul %337 %338 
                                                      OpStore %9 %339 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %342 = OpExtInst %1 40 %340 %341 
                                                      OpStore %9 %342 
                                       f32_4 %343 = OpLoad %49 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpFMul %343 %344 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %9 
                                       f32_3 %347 = OpVectorShuffle %346 %346 1 1 1 
                              Uniform f32_4* %349 = OpAccessChain %20 %348 %148 
                                       f32_4 %350 = OpLoad %349 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_3 %352 = OpFMul %347 %351 
                                       f32_4 %353 = OpLoad %49 
                                       f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                      OpStore %49 %354 
                              Uniform f32_4* %355 = OpAccessChain %20 %348 %153 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 0 0 
                                       f32_3 %360 = OpFMul %357 %359 
                                       f32_4 %361 = OpLoad %49 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFAdd %360 %362 
                                       f32_4 %364 = OpLoad %49 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %49 %365 
                              Uniform f32_4* %366 = OpAccessChain %20 %348 %161 
                                       f32_4 %367 = OpLoad %366 
                                       f32_3 %368 = OpVectorShuffle %367 %367 0 1 2 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 2 2 2 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %49 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                              Uniform f32_4* %377 = OpAccessChain %20 %348 %171 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_4 %380 = OpLoad %9 
                                       f32_3 %381 = OpVectorShuffle %380 %380 3 3 3 
                                       f32_3 %382 = OpFMul %379 %381 
                                       f32_4 %383 = OpLoad %9 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_3 %385 = OpFAdd %382 %384 
                                       f32_4 %386 = OpLoad %9 
                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
                                                      OpStore %9 %387 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                                      OpStore %388 %390 
                                 Output f32* %392 = OpAccessChain %209 %153 %42 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFNegate %393 
                                 Output f32* %395 = OpAccessChain %209 %153 %42 
                                                      OpStore %395 %394 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %55 %205 %238 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 RelaxedPrecision 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 RelaxedPrecision 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %45 SpecId 45 
                                                      OpDecorate %55 Location 55 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 Location 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %238 Location 238 
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
                                              %22 = OpTypeBool 
                                              %23 = OpTypePointer Private %22 
                                Private bool* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %19 %26 
                                              %28 = OpTypeStruct %19 %19 %19 %27 %7 %7 %19 %6 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 2 
                                          u32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %6 
                                          f32 %37 = OpConstant 3.67402E-40 
                                         bool %39 = OpConstantFalse 
                                         bool %45 = OpSpecConstantFalse 
                                          u32 %48 = OpConstant 1 
                                              %52 = OpTypePointer Private %19 
                               Private f32_4* %53 = OpVariable Private 
                                              %54 = OpTypePointer Input %7 
                                 Input f32_3* %55 = OpVariable Input 
                                          i32 %58 = OpConstant 3 
                                          i32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Uniform %19 
                                          i32 %67 = OpConstant 0 
                                              %98 = OpTypePointer Function %7 
                                         i32 %112 = OpConstant 5 
                                             %113 = OpTypePointer Uniform %7 
                                         i32 %122 = OpConstant 4 
                                             %128 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                Private f32* %136 = OpVariable Private 
                                         u32 %137 = OpConstant 2 
                                         f32 %140 = OpConstant 3.67402E-40 
                                             %147 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %148 = OpTypeSampledImage %147 
                                             %149 = OpTypePointer UniformConstant %148 
 UniformConstant read_only Texture3DSampled* %150 = OpVariable UniformConstant 
                              Private f32_4* %155 = OpVariable Private 
                                         u32 %161 = OpConstant 3 
                              Private f32_3* %163 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         i32 %176 = OpConstant 7 
                                         i32 %187 = OpConstant 6 
                                Private f32* %192 = OpVariable Private 
                                Input f32_3* %205 = OpVariable Input 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         f32 %213 = OpConstant 3.67402E-40 
                                       f32_3 %214 = OpConstantComposite %211 %212 %213 
                              Private f32_3* %219 = OpVariable Private 
                              Private f32_3* %228 = OpVariable Private 
                                         i32 %229 = OpConstant 8 
                                             %237 = OpTypePointer Output %19 
                               Output f32_4* %238 = OpVariable Output 
                                             %242 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %99 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                 Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdEqual %36 %37 
                                                      OpStore %24 %38 
                                                      OpSelectionMerge %41 None 
                                                      OpBranchConditional %39 %40 %41 
                                              %40 = OpLabel 
                                         bool %42 = OpLoad %24 
                                                      OpSelectionMerge %44 None 
                                                      OpBranchConditional %42 %43 %44 
                                              %43 = OpLabel 
                                                      OpBranch %44 
                                              %44 = OpLabel 
                                                      OpBranch %41 
                                              %41 = OpLabel 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %157 
                                              %46 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %30 %32 %48 
                                          f32 %50 = OpLoad %49 
                                         bool %51 = OpFOrdEqual %50 %37 
                                                      OpStore %24 %51 
                                        f32_3 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %30 %58 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %57 %63 
                                        f32_4 %65 = OpLoad %53 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %53 %66 
                               Uniform f32_4* %68 = OpAccessChain %30 %58 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpLoad %55 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 0 0 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %53 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %53 %78 
                               Uniform f32_4* %79 = OpAccessChain %30 %58 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %55 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                                        f32_4 %90 = OpLoad %53 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %30 %58 %58 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %91 %94 
                                        f32_4 %96 = OpLoad %53 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %53 %97 
                                        bool %100 = OpLoad %24 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %105 
                                             %101 = OpLabel 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %99 %104 
                                                      OpBranch %102 
                                             %105 = OpLabel 
                                       f32_3 %106 = OpLoad %55 
                                                      OpStore %99 %106 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                       f32_3 %107 = OpLoad %99 
                                       f32_4 %108 = OpLoad %53 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %53 %109 
                                       f32_4 %110 = OpLoad %53 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                              Uniform f32_3* %114 = OpAccessChain %30 %112 
                                       f32_3 %115 = OpLoad %114 
                                       f32_3 %116 = OpFNegate %115 
                                       f32_3 %117 = OpFAdd %111 %116 
                                       f32_4 %118 = OpLoad %53 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %53 %119 
                                       f32_4 %120 = OpLoad %53 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              Uniform f32_3* %123 = OpAccessChain %30 %122 
                                       f32_3 %124 = OpLoad %123 
                                       f32_3 %125 = OpFMul %121 %124 
                                       f32_4 %126 = OpLoad %53 
                                       f32_4 %127 = OpVectorShuffle %126 %125 0 4 5 6 
                                                      OpStore %53 %127 
                                Private f32* %130 = OpAccessChain %53 %48 
                                         f32 %131 = OpLoad %130 
                                         f32 %133 = OpFMul %131 %132 
                                         f32 %135 = OpFAdd %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %138 = OpAccessChain %30 %32 %137 
                                         f32 %139 = OpLoad %138 
                                         f32 %141 = OpFMul %139 %140 
                                         f32 %142 = OpFAdd %141 %134 
                                                      OpStore %136 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpLoad %136 
                                         f32 %145 = OpExtInst %1 40 %143 %144 
                                Private f32* %146 = OpAccessChain %53 %33 
                                                      OpStore %146 %145 
                  read_only Texture3DSampled %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %53 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 2 3 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %53 %154 
                                       f32_4 %156 = OpLoad %53 
                                                      OpStore %155 %156 
                                                      OpBranch %47 
                                             %157 = OpLabel 
                                Private f32* %158 = OpAccessChain %155 %33 
                                                      OpStore %158 %37 
                                Private f32* %159 = OpAccessChain %155 %48 
                                                      OpStore %159 %37 
                                Private f32* %160 = OpAccessChain %155 %137 
                                                      OpStore %160 %37 
                                Private f32* %162 = OpAccessChain %155 %161 
                                                      OpStore %162 %37 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                       f32_4 %164 = OpLoad %155 
                              Uniform f32_4* %165 = OpAccessChain %30 %59 
                                       f32_4 %166 = OpLoad %165 
                                         f32 %167 = OpDot %164 %166 
                                Private f32* %168 = OpAccessChain %163 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %163 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpExtInst %1 43 %170 %171 %37 
                                Private f32* %173 = OpAccessChain %163 %33 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %163 %33 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %30 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 8 %180 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                Uniform f32* %183 = OpAccessChain %30 %176 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFDiv %182 %184 
                                                      OpStore %129 %185 
                                       f32_3 %186 = OpLoad %9 
                              Uniform f32_4* %188 = OpAccessChain %30 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %163 %191 
                              Uniform f32_4* %193 = OpAccessChain %30 %67 
                                       f32_4 %194 = OpLoad %193 
                                       f32_2 %195 = OpVectorShuffle %194 %194 2 2 
                                       f32_2 %196 = OpFNegate %195 
                                         f32 %197 = OpLoad %129 
                                       f32_2 %198 = OpCompositeConstruct %197 %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %192 %199 
                                         f32 %200 = OpLoad %192 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %163 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %163 %203 
                                       f32_3 %204 = OpLoad %9 
                                       f32_3 %206 = OpLoad %205 
                                       f32_3 %207 = OpFMul %204 %206 
                                       f32_3 %208 = OpLoad %163 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %163 %209 
                                       f32_3 %210 = OpLoad %163 
                                         f32 %215 = OpDot %210 %214 
                                                      OpStore %192 %215 
                                         f32 %216 = OpLoad %192 
                                         f32 %217 = OpLoad %192 
                                         f32 %218 = OpFMul %216 %217 
                                                      OpStore %192 %218 
                                         f32 %220 = OpLoad %192 
                                       f32_3 %221 = OpCompositeConstruct %220 %220 %220 
                                         f32 %222 = OpLoad %192 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %163 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_3 %227 = OpFAdd %224 %226 
                                                      OpStore %219 %227 
                                Uniform f32* %230 = OpAccessChain %30 %229 
                                         f32 %231 = OpLoad %230 
                                       f32_3 %232 = OpCompositeConstruct %231 %231 %231 
                                       f32_3 %233 = OpLoad %219 
                                       f32_3 %234 = OpFMul %232 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpFAdd %234 %235 
                                                      OpStore %228 %236 
                                       f32_3 %239 = OpLoad %228 
                                       f32_4 %240 = OpLoad %238 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %238 %241 
                                 Output f32* %243 = OpAccessChain %238 %161 
                                                      OpStore %243 %37 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat6.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat6.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat6.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat6.xy, 0.0);
    u_xlat6.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat6.xyz = vec3(_UseBuffer) * u_xlat6.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat6.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat2 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat2;
    gl_Position = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat0.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat0.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat4;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat2.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat2.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat9) + u_xlat1.x;
    u_xlat9 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat9;
    u_xlat9 = u_xlat9 * _LightShadowData.z + _LightShadowData.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat7.x, u_xlat4.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat7.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat9 = u_xlat9 + u_xlat10_2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = min(u_xlat9, u_xlat4.x);
    u_xlat9 = (u_xlatb1) ? u_xlat4.x : u_xlat9;
    u_xlat9 = u_xlat9 * _StepFactor;
    u_xlat9 = floor(u_xlat9);
    u_xlat9 = u_xlat9 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat9 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat9));
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 430
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %36 %60 %72 %91 %216 %221 %270 %273 %391 %412 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 RelaxedPrecision 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpMemberDecorate %18 8 Offset 18 
                                                      OpMemberDecorate %18 9 Offset 18 
                                                      OpMemberDecorate %18 10 Offset 18 
                                                      OpMemberDecorate %18 11 RelaxedPrecision 
                                                      OpMemberDecorate %18 11 Offset 18 
                                                      OpMemberDecorate %18 12 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %36 Location 36 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 DescriptorSet 53 
                                                      OpDecorate %53 Binding 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpMemberDecorate %214 0 BuiltIn 214 
                                                      OpMemberDecorate %214 1 BuiltIn 214 
                                                      OpMemberDecorate %214 2 BuiltIn 214 
                                                      OpDecorate %214 Block 
                                                      OpDecorate %221 Location 221 
                                                      OpDecorate %270 Location 270 
                                                      OpDecorate %273 Location 273 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %391 Location 391 
                                                      OpDecorate %412 Location 412 
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
                                              %17 = OpTypeVector %6 2 
                                              %18 = OpTypeStruct %7 %7 %7 %7 %7 %12 %14 %15 %16 %6 %17 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 9 
                                              %23 = OpTypePointer Uniform %6 
                                          f32 %27 = OpConstant 3.67402E-40 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %7 
                                 Input f32_4* %36 = OpVariable Input 
                                          i32 %39 = OpConstant 10 
                                          u32 %42 = OpConstant 1 
                               Private f32_4* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypeSampledImage %50 
                                              %52 = OpTypePointer UniformConstant %51 
  UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
                                          f32 %57 = OpConstant 3.67402E-40 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %64 = OpConstant 11 
                                 Input f32_4* %72 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %83 = OpVariable UniformConstant 
                                              %90 = OpTypePointer Input %32 
                                 Input f32_3* %91 = OpVariable Input 
                                         u32 %120 = OpConstant 2 
                                         f32 %129 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
                                         i32 %147 = OpConstant 6 
                                         i32 %148 = OpConstant 1 
                                             %149 = OpTypePointer Uniform %7 
                                         i32 %153 = OpConstant 0 
                                         i32 %161 = OpConstant 2 
                              Private f32_4* %169 = OpVariable Private 
                                         i32 %171 = OpConstant 3 
                                         i32 %188 = OpConstant 8 
                                             %213 = OpTypeArray %6 %42 
                                             %214 = OpTypeStruct %7 %6 %213 
                                             %215 = OpTypePointer Output %214 
        Output struct {f32_4; f32; f32[1];}* %216 = OpVariable Output 
                                             %218 = OpTypePointer Output %7 
                                             %220 = OpTypePointer Output %17 
                               Output f32_2* %221 = OpVariable Output 
                                         i32 %224 = OpConstant 12 
                                         i32 %234 = OpConstant 7 
                                             %269 = OpTypePointer Output %32 
                               Output f32_3* %270 = OpVariable Output 
                               Output f32_3* %273 = OpVariable Output 
                              Private f32_4* %282 = OpVariable Private 
                              Private f32_4* %290 = OpVariable Private 
                                         f32 %326 = OpConstant 3.67402E-40 
                                       f32_4 %327 = OpConstantComposite %326 %326 %326 %326 
                                         i32 %332 = OpConstant 4 
                                       f32_4 %336 = OpConstantComposite %129 %129 %129 %129 
                                       f32_4 %344 = OpConstantComposite %57 %57 %57 %57 
                                         i32 %351 = OpConstant 5 
                               Output f32_3* %391 = OpVariable Output 
                                         f32 %402 = OpConstant 3.67402E-40 
                                         u32 %404 = OpConstant 3 
                                       f32_2 %408 = OpConstantComposite %402 %402 
                               Output f32_4* %412 = OpVariable Output 
                                             %424 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %24 = OpAccessChain %20 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFNegate %25 
                                          f32 %28 = OpFAdd %26 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                 Uniform f32* %40 = OpAccessChain %20 %39 %29 
                                          f32 %41 = OpLoad %40 
                                 Uniform f32* %43 = OpAccessChain %20 %39 %42 
                                          f32 %44 = OpLoad %43 
                                        f32_2 %45 = OpCompositeConstruct %41 %44 
                                        f32_2 %46 = OpFAdd %38 %45 
                                        f32_3 %47 = OpLoad %34 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %34 %48 
                   read_only Texture2DSampled %54 = OpLoad %53 
                                        f32_3 %55 = OpLoad %34 
                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                        f32_4 %58 = OpImageSampleExplicitLod %54 %56 Lod %7 
                                                      OpStore %49 %58 
                                        f32_4 %59 = OpLoad %49 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFNegate %61 
                                        f32_4 %63 = OpFAdd %59 %62 
                                                      OpStore %49 %63 
                                 Uniform f32* %65 = OpAccessChain %20 %64 
                                          f32 %66 = OpLoad %65 
                                        f32_4 %67 = OpCompositeConstruct %66 %66 %66 %66 
                                        f32_4 %68 = OpLoad %49 
                                        f32_4 %69 = OpFMul %67 %68 
                                        f32_4 %70 = OpLoad %60 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %49 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 Uniform f32* %75 = OpAccessChain %20 %39 %29 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %20 %39 %42 
                                          f32 %78 = OpLoad %77 
                                        f32_2 %79 = OpCompositeConstruct %76 %78 
                                        f32_2 %80 = OpFAdd %74 %79 
                                        f32_3 %81 = OpLoad %34 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %34 %82 
                   read_only Texture2DSampled %84 = OpLoad %83 
                                        f32_3 %85 = OpLoad %34 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpImageSampleExplicitLod %84 %86 Lod %7 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                                      OpStore %34 %88 
                                        f32_3 %89 = OpLoad %34 
                                        f32_3 %92 = OpLoad %91 
                                        f32_3 %93 = OpFNegate %92 
                                        f32_3 %94 = OpFAdd %89 %93 
                                                      OpStore %34 %94 
                                 Uniform f32* %95 = OpAccessChain %20 %64 
                                          f32 %96 = OpLoad %95 
                                        f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                        f32_3 %98 = OpLoad %34 
                                        f32_3 %99 = OpFMul %97 %98 
                                       f32_3 %100 = OpLoad %91 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %34 %101 
                                       f32_3 %102 = OpLoad %34 
                                Uniform f32* %103 = OpAccessChain %20 %22 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %20 %22 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %107 = OpAccessChain %20 %22 
                                         f32 %108 = OpLoad %107 
                                       f32_3 %109 = OpCompositeConstruct %104 %106 %108 
                                         f32 %110 = OpCompositeExtract %109 0 
                                         f32 %111 = OpCompositeExtract %109 1 
                                         f32 %112 = OpCompositeExtract %109 2 
                                       f32_3 %113 = OpCompositeConstruct %110 %111 %112 
                                       f32_3 %114 = OpFMul %102 %113 
                                       f32_4 %115 = OpLoad %49 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %49 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %49 %119 
                                Private f32* %121 = OpAccessChain %49 %120 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %9 %29 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFDiv %122 %124 
                                Private f32* %126 = OpAccessChain %9 %29 
                                                      OpStore %126 %125 
                                Private f32* %127 = OpAccessChain %9 %29 
                                         f32 %128 = OpLoad %127 
                                         f32 %130 = OpExtInst %1 43 %128 %57 %129 
                                Private f32* %131 = OpAccessChain %9 %29 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %29 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                         f32 %135 = OpFAdd %134 %129 
                                Private f32* %136 = OpAccessChain %9 %29 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                                       f32_4 %139 = OpLoad %49 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %138 %140 
                                       f32_4 %142 = OpLoad %49 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %49 %143 
                                       f32_4 %145 = OpLoad %49 
                                       f32_4 %146 = OpVectorShuffle %145 %145 1 1 1 1 
                              Uniform f32_4* %150 = OpAccessChain %20 %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                       f32_4 %152 = OpFMul %146 %151 
                                                      OpStore %144 %152 
                              Uniform f32_4* %154 = OpAccessChain %20 %147 %153 
                                       f32_4 %155 = OpLoad %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_4 %157 = OpVectorShuffle %156 %156 0 0 0 0 
                                       f32_4 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %144 
                                       f32_4 %160 = OpFAdd %158 %159 
                                                      OpStore %144 %160 
                              Uniform f32_4* %162 = OpAccessChain %20 %147 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpLoad %49 
                                       f32_4 %165 = OpVectorShuffle %164 %164 2 2 2 2 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %144 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %144 %168 
                                       f32_4 %170 = OpLoad %144 
                              Uniform f32_4* %172 = OpAccessChain %20 %147 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFAdd %170 %173 
                                                      OpStore %169 %174 
                              Uniform f32_4* %175 = OpAccessChain %20 %147 %171 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_4 %178 = OpLoad %49 
                                       f32_3 %179 = OpVectorShuffle %178 %178 3 3 3 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %144 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFAdd %180 %182 
                                       f32_4 %184 = OpLoad %49 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %49 %185 
                                       f32_4 %186 = OpLoad %169 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %20 %188 %148 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %187 %190 
                                                      OpStore %144 %191 
                              Uniform f32_4* %192 = OpAccessChain %20 %188 %153 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %144 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %144 %198 
                              Uniform f32_4* %199 = OpAccessChain %20 %188 %161 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %169 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %144 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %144 %205 
                              Uniform f32_4* %206 = OpAccessChain %20 %188 %171 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpLoad %169 
                                       f32_4 %209 = OpVectorShuffle %208 %208 3 3 3 3 
                                       f32_4 %210 = OpFMul %207 %209 
                                       f32_4 %211 = OpLoad %144 
                                       f32_4 %212 = OpFAdd %210 %211 
                                                      OpStore %144 %212 
                                       f32_4 %217 = OpLoad %144 
                               Output f32_4* %219 = OpAccessChain %216 %153 
                                                      OpStore %219 %217 
                                       f32_4 %222 = OpLoad %36 
                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                              Uniform f32_4* %225 = OpAccessChain %20 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_2 %228 = OpFMul %223 %227 
                              Uniform f32_4* %229 = OpAccessChain %20 %224 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 2 3 
                                       f32_2 %232 = OpFAdd %228 %231 
                                                      OpStore %221 %232 
                                       f32_3 %233 = OpLoad %34 
                              Uniform f32_4* %235 = OpAccessChain %20 %234 %153 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                         f32 %238 = OpDot %233 %237 
                                Private f32* %239 = OpAccessChain %169 %29 
                                                      OpStore %239 %238 
                                       f32_3 %240 = OpLoad %34 
                              Uniform f32_4* %241 = OpAccessChain %20 %234 %148 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                         f32 %244 = OpDot %240 %243 
                                Private f32* %245 = OpAccessChain %169 %42 
                                                      OpStore %245 %244 
                                       f32_3 %246 = OpLoad %34 
                              Uniform f32_4* %247 = OpAccessChain %20 %234 %161 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                         f32 %250 = OpDot %246 %249 
                                Private f32* %251 = OpAccessChain %169 %120 
                                                      OpStore %251 %250 
                                       f32_4 %252 = OpLoad %169 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_4 %254 = OpLoad %169 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %9 %29 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %9 %29 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 32 %259 
                                Private f32* %261 = OpAccessChain %9 %29 
                                                      OpStore %261 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 0 0 
                                       f32_4 %264 = OpLoad %169 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %9 %268 
                                       f32_4 %271 = OpLoad %9 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                                      OpStore %270 %272 
                                       f32_4 %274 = OpLoad %49 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                                      OpStore %273 %275 
                                       f32_4 %276 = OpLoad %49 
                                       f32_4 %277 = OpVectorShuffle %276 %276 1 1 1 1 
                                       f32_4 %278 = OpFNegate %277 
                              Uniform f32_4* %279 = OpAccessChain %20 %161 
                                       f32_4 %280 = OpLoad %279 
                                       f32_4 %281 = OpFAdd %278 %280 
                                                      OpStore %169 %281 
                                       f32_4 %283 = OpLoad %9 
                                       f32_4 %284 = OpVectorShuffle %283 %283 1 1 1 1 
                                       f32_4 %285 = OpLoad %169 
                                       f32_4 %286 = OpFMul %284 %285 
                                                      OpStore %282 %286 
                                       f32_4 %287 = OpLoad %169 
                                       f32_4 %288 = OpLoad %169 
                                       f32_4 %289 = OpFMul %287 %288 
                                                      OpStore %169 %289 
                                       f32_4 %291 = OpLoad %49 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFNegate %292 
                              Uniform f32_4* %294 = OpAccessChain %20 %148 
                                       f32_4 %295 = OpLoad %294 
                                       f32_4 %296 = OpFAdd %293 %295 
                                                      OpStore %290 %296 
                                       f32_4 %297 = OpLoad %49 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFNegate %298 
                              Uniform f32_4* %300 = OpAccessChain %20 %171 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %299 %301 
                                                      OpStore %49 %302 
                                       f32_4 %303 = OpLoad %290 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpVectorShuffle %304 %304 0 0 0 0 
                                       f32_4 %306 = OpFMul %303 %305 
                                       f32_4 %307 = OpLoad %282 
                                       f32_4 %308 = OpFAdd %306 %307 
                                                      OpStore %282 %308 
                                       f32_4 %309 = OpLoad %290 
                                       f32_4 %310 = OpLoad %290 
                                       f32_4 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %169 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %169 %313 
                                       f32_4 %314 = OpLoad %49 
                                       f32_4 %315 = OpLoad %49 
                                       f32_4 %316 = OpFMul %314 %315 
                                       f32_4 %317 = OpLoad %169 
                                       f32_4 %318 = OpFAdd %316 %317 
                                                      OpStore %169 %318 
                                       f32_4 %319 = OpLoad %49 
                                       f32_4 %320 = OpLoad %9 
                                       f32_4 %321 = OpVectorShuffle %320 %320 2 2 2 2 
                                       f32_4 %322 = OpFMul %319 %321 
                                       f32_4 %323 = OpLoad %282 
                                       f32_4 %324 = OpFAdd %322 %323 
                                                      OpStore %9 %324 
                                       f32_4 %325 = OpLoad %169 
                                       f32_4 %328 = OpExtInst %1 40 %325 %327 
                                                      OpStore %49 %328 
                                       f32_4 %329 = OpLoad %49 
                                       f32_4 %330 = OpExtInst %1 32 %329 
                                                      OpStore %169 %330 
                                       f32_4 %331 = OpLoad %49 
                              Uniform f32_4* %333 = OpAccessChain %20 %332 
                                       f32_4 %334 = OpLoad %333 
                                       f32_4 %335 = OpFMul %331 %334 
                                       f32_4 %337 = OpFAdd %335 %336 
                                                      OpStore %49 %337 
                                       f32_4 %338 = OpLoad %49 
                                       f32_4 %339 = OpFDiv %336 %338 
                                                      OpStore %49 %339 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %341 = OpLoad %169 
                                       f32_4 %342 = OpFMul %340 %341 
                                                      OpStore %9 %342 
                                       f32_4 %343 = OpLoad %9 
                                       f32_4 %345 = OpExtInst %1 40 %343 %344 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %49 
                                       f32_4 %347 = OpLoad %9 
                                       f32_4 %348 = OpFMul %346 %347 
                                                      OpStore %9 %348 
                                       f32_4 %349 = OpLoad %9 
                                       f32_3 %350 = OpVectorShuffle %349 %349 1 1 1 
                              Uniform f32_4* %352 = OpAccessChain %20 %351 %148 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                                       f32_3 %355 = OpFMul %350 %354 
                                       f32_4 %356 = OpLoad %49 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 6 3 
                                                      OpStore %49 %357 
                              Uniform f32_4* %358 = OpAccessChain %20 %351 %153 
                                       f32_4 %359 = OpLoad %358 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_4 %361 = OpLoad %9 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 0 0 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %49 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_3 %366 = OpFAdd %363 %365 
                                       f32_4 %367 = OpLoad %49 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %49 %368 
                              Uniform f32_4* %369 = OpAccessChain %20 %351 %161 
                                       f32_4 %370 = OpLoad %369 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 2 2 2 
                                       f32_3 %374 = OpFMul %371 %373 
                                       f32_4 %375 = OpLoad %49 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpFAdd %374 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %9 %379 
                              Uniform f32_4* %380 = OpAccessChain %20 %351 %171 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_4 %383 = OpLoad %9 
                                       f32_3 %384 = OpVectorShuffle %383 %383 3 3 3 
                                       f32_3 %385 = OpFMul %382 %384 
                                       f32_4 %386 = OpLoad %9 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_3 %388 = OpFAdd %385 %387 
                                       f32_4 %389 = OpLoad %9 
                                       f32_4 %390 = OpVectorShuffle %389 %388 4 5 6 3 
                                                      OpStore %9 %390 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                                      OpStore %391 %393 
                                Private f32* %394 = OpAccessChain %144 %42 
                                         f32 %395 = OpLoad %394 
                                Uniform f32* %396 = OpAccessChain %20 %153 %29 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                Private f32* %399 = OpAccessChain %9 %29 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %9 %29 
                                         f32 %401 = OpLoad %400 
                                         f32 %403 = OpFMul %401 %402 
                                Private f32* %405 = OpAccessChain %9 %404 
                                                      OpStore %405 %403 
                                       f32_4 %406 = OpLoad %144 
                                       f32_2 %407 = OpVectorShuffle %406 %406 0 3 
                                       f32_2 %409 = OpFMul %407 %408 
                                       f32_4 %410 = OpLoad %9 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 3 
                                                      OpStore %9 %411 
                                       f32_4 %413 = OpLoad %144 
                                       f32_2 %414 = OpVectorShuffle %413 %413 2 3 
                                       f32_4 %415 = OpLoad %412 
                                       f32_4 %416 = OpVectorShuffle %415 %414 0 1 4 5 
                                                      OpStore %412 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 2 2 
                                       f32_4 %419 = OpLoad %9 
                                       f32_2 %420 = OpVectorShuffle %419 %419 0 3 
                                       f32_2 %421 = OpFAdd %418 %420 
                                       f32_4 %422 = OpLoad %412 
                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
                                                      OpStore %412 %423 
                                 Output f32* %425 = OpAccessChain %216 %153 %42 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFNegate %426 
                                 Output f32* %428 = OpAccessChain %216 %153 %42 
                                                      OpStore %428 %427 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 341
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %233 %301 %334 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 RelaxedPrecision 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 RelaxedPrecision 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 RelaxedPrecision 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpMemberDecorate %31 8 Offset 31 
                                                      OpMemberDecorate %31 9 Offset 31 
                                                      OpMemberDecorate %31 10 RelaxedPrecision 
                                                      OpMemberDecorate %31 10 Offset 31 
                                                      OpMemberDecorate %31 11 Offset 31 
                                                      OpMemberDecorate %31 12 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %119 SpecId 119 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 Location 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %334 Location 334 
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
                                              %23 = OpTypePointer Input %7 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %19 %28 
                                              %30 = OpTypeArray %19 %28 
                                              %31 = OpTypeStruct %7 %19 %19 %19 %19 %29 %19 %30 %7 %7 %19 %6 %6 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %19 
                               Private f32_4* %41 = OpVariable Private 
                                          i32 %42 = OpConstant 5 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Private %6 
                                          i32 %50 = OpConstant 1 
                                          u32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant 2 
                                 Private f32* %59 = OpVariable Private 
                                          i32 %65 = OpConstant 4 
                                              %66 = OpTypePointer Uniform %19 
                                          u32 %86 = OpConstant 3 
                                          i32 %95 = OpConstant 3 
                                         f32 %103 = OpConstant 3.67402E-40 
                                         f32 %104 = OpConstant 3.67402E-40 
                                             %106 = OpTypeBool 
                                             %107 = OpTypePointer Private %106 
                               Private bool* %108 = OpVariable Private 
                                         i32 %109 = OpConstant 6 
                                        bool %113 = OpConstantFalse 
                                        bool %119 = OpSpecConstantFalse 
                               Private bool* %122 = OpVariable Private 
                                         i32 %128 = OpConstant 7 
                              Private f32_3* %165 = OpVariable Private 
                                             %166 = OpTypePointer Function %7 
                                         i32 %177 = OpConstant 9 
                                         i32 %183 = OpConstant 8 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                             %232 = OpTypePointer Input %19 
                                Input f32_4* %233 = OpVariable Input 
                                Private f32* %241 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                Private f32* %248 = OpVariable Private 
                                             %259 = OpTypePointer Function %6 
                                         i32 %272 = OpConstant 11 
                                         i32 %283 = OpConstant 10 
                                Private f32* %288 = OpVariable Private 
                                Input f32_3* %301 = OpVariable Input 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                         f32 %309 = OpConstant 3.67402E-40 
                                       f32_3 %310 = OpConstantComposite %307 %308 %309 
                              Private f32_3* %315 = OpVariable Private 
                              Private f32_3* %324 = OpVariable Private 
                                         i32 %325 = OpConstant 12 
                                             %333 = OpTypePointer Output %19 
                               Output f32_4* %334 = OpVariable Output 
                                             %338 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %167 = OpVariable Function 
                               Function f32* %260 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpFNegate %25 
                               Uniform f32_3* %37 = OpAccessChain %33 %35 
                                        f32_3 %38 = OpLoad %37 
                                        f32_3 %39 = OpFAdd %26 %38 
                                                      OpStore %22 %39 
                                 Uniform f32* %45 = OpAccessChain %33 %42 %35 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %49 = OpAccessChain %41 %47 
                                                      OpStore %49 %46 
                                 Uniform f32* %51 = OpAccessChain %33 %42 %50 %43 
                                          f32 %52 = OpLoad %51 
                                 Private f32* %54 = OpAccessChain %41 %53 
                                                      OpStore %54 %52 
                                 Uniform f32* %56 = OpAccessChain %33 %42 %55 %43 
                                          f32 %57 = OpLoad %56 
                                 Private f32* %58 = OpAccessChain %41 %43 
                                                      OpStore %58 %57 
                                        f32_3 %60 = OpLoad %22 
                                        f32_4 %61 = OpLoad %41 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                          f32 %63 = OpDot %60 %62 
                                                      OpStore %59 %63 
                                        f32_3 %64 = OpLoad %24 
                               Uniform f32_4* %67 = OpAccessChain %33 %65 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFNegate %69 
                                        f32_3 %71 = OpFAdd %64 %70 
                                                      OpStore %22 %71 
                                        f32_3 %72 = OpLoad %22 
                                        f32_3 %73 = OpLoad %22 
                                          f32 %74 = OpDot %72 %73 
                                 Private f32* %75 = OpAccessChain %22 %47 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %22 %47 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 31 %77 
                                 Private f32* %79 = OpAccessChain %22 %47 
                                                      OpStore %79 %78 
                                          f32 %80 = OpLoad %59 
                                          f32 %81 = OpFNegate %80 
                                 Private f32* %82 = OpAccessChain %22 %47 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %81 %83 
                                 Private f32* %85 = OpAccessChain %22 %47 
                                                      OpStore %85 %84 
                                 Uniform f32* %87 = OpAccessChain %33 %65 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %22 %47 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %88 %90 
                                          f32 %92 = OpLoad %59 
                                          f32 %93 = OpFAdd %91 %92 
                                                      OpStore %59 %93 
                                          f32 %94 = OpLoad %59 
                                 Uniform f32* %96 = OpAccessChain %33 %95 %43 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %94 %97 
                                 Uniform f32* %99 = OpAccessChain %33 %95 %86 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                                      OpStore %59 %101 
                                         f32 %102 = OpLoad %59 
                                         f32 %105 = OpExtInst %1 43 %102 %103 %104 
                                                      OpStore %59 %105 
                                Uniform f32* %110 = OpAccessChain %33 %109 %47 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %104 
                                                      OpStore %108 %112 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %115 
                                             %114 = OpLabel 
                                        bool %116 = OpLoad %108 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %217 
                                             %120 = OpLabel 
                                Uniform f32* %123 = OpAccessChain %33 %109 %53 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdEqual %124 %104 
                                                      OpStore %122 %125 
                                       f32_3 %126 = OpLoad %24 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %33 %128 %50 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %41 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                                      OpStore %41 %134 
                              Uniform f32_4* %135 = OpAccessChain %33 %128 %35 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %24 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %41 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %41 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %41 %145 
                              Uniform f32_4* %146 = OpAccessChain %33 %128 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %24 
                                       f32_3 %150 = OpVectorShuffle %149 %149 2 2 2 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %41 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %41 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %41 %156 
                                       f32_4 %157 = OpLoad %41 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                              Uniform f32_4* %159 = OpAccessChain %33 %128 %95 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %158 %161 
                                       f32_4 %163 = OpLoad %41 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                      OpStore %41 %164 
                                        bool %168 = OpLoad %122 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %173 
                                             %169 = OpLabel 
                                       f32_4 %171 = OpLoad %41 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                                      OpStore %167 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                       f32_3 %174 = OpLoad %24 
                                                      OpStore %167 %174 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                       f32_3 %175 = OpLoad %167 
                                                      OpStore %165 %175 
                                       f32_3 %176 = OpLoad %165 
                              Uniform f32_3* %178 = OpAccessChain %33 %177 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFAdd %176 %180 
                                                      OpStore %165 %181 
                                       f32_3 %182 = OpLoad %165 
                              Uniform f32_3* %184 = OpAccessChain %33 %183 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %41 
                                       f32_4 %188 = OpVectorShuffle %187 %186 0 4 5 6 
                                                      OpStore %41 %188 
                                Private f32* %189 = OpAccessChain %41 %53 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %194 = OpFAdd %192 %193 
                                Private f32* %195 = OpAccessChain %165 %47 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %33 %109 %43 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %193 
                                                      OpStore %196 %201 
                                         f32 %202 = OpLoad %196 
                                Private f32* %203 = OpAccessChain %165 %47 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 40 %202 %204 
                                Private f32* %206 = OpAccessChain %41 %47 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %41 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %41 %214 
                                       f32_4 %216 = OpLoad %41 
                                                      OpStore %215 %216 
                                                      OpBranch %121 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %47 
                                                      OpStore %218 %104 
                                Private f32* %219 = OpAccessChain %215 %53 
                                                      OpStore %219 %104 
                                Private f32* %220 = OpAccessChain %215 %43 
                                                      OpStore %220 %104 
                                Private f32* %221 = OpAccessChain %215 %86 
                                                      OpStore %221 %104 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                       f32_4 %223 = OpLoad %215 
                              Uniform f32_4* %224 = OpAccessChain %33 %55 
                                       f32_4 %225 = OpLoad %224 
                                         f32 %226 = OpDot %223 %225 
                                Private f32* %227 = OpAccessChain %222 %47 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %222 %47 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpExtInst %1 43 %229 %103 %104 
                                Private f32* %231 = OpAccessChain %222 %47 
                                                      OpStore %231 %230 
                                       f32_4 %234 = OpLoad %233 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                       f32_4 %236 = OpLoad %233 
                                       f32_2 %237 = OpVectorShuffle %236 %236 3 3 
                                       f32_2 %238 = OpFDiv %235 %237 
                                       f32_3 %239 = OpLoad %165 
                                       f32_3 %240 = OpVectorShuffle %239 %238 3 4 2 
                                                      OpStore %165 %240 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_3 %244 = OpLoad %165 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 0 
                                                      OpStore %241 %247 
                                         f32 %249 = OpLoad %59 
                                         f32 %250 = OpLoad %241 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %248 %251 
                                         f32 %252 = OpLoad %248 
                                         f32 %253 = OpExtInst %1 43 %252 %103 %104 
                                                      OpStore %248 %253 
                                         f32 %254 = OpLoad %248 
                                Private f32* %255 = OpAccessChain %222 %47 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpExtInst %1 37 %254 %256 
                                Private f32* %258 = OpAccessChain %222 %47 
                                                      OpStore %258 %257 
                                        bool %261 = OpLoad %108 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %261 %262 %266 
                                             %262 = OpLabel 
                                Private f32* %264 = OpAccessChain %222 %47 
                                         f32 %265 = OpLoad %264 
                                                      OpStore %260 %265 
                                                      OpBranch %263 
                                             %266 = OpLabel 
                                         f32 %267 = OpLoad %248 
                                                      OpStore %260 %267 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %260 
                                Private f32* %269 = OpAccessChain %222 %47 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %222 %47 
                                         f32 %271 = OpLoad %270 
                                Uniform f32* %273 = OpAccessChain %33 %272 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %271 %274 
                                                      OpStore %59 %275 
                                         f32 %276 = OpLoad %59 
                                         f32 %277 = OpExtInst %1 8 %276 
                                                      OpStore %59 %277 
                                         f32 %278 = OpLoad %59 
                                Uniform f32* %279 = OpAccessChain %33 %272 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFDiv %278 %280 
                                                      OpStore %59 %281 
                                       f32_3 %282 = OpLoad %9 
                              Uniform f32_4* %284 = OpAccessChain %33 %283 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFMul %282 %286 
                                                      OpStore %222 %287 
                              Uniform f32_4* %289 = OpAccessChain %33 %50 
                                       f32_4 %290 = OpLoad %289 
                                       f32_2 %291 = OpVectorShuffle %290 %290 2 2 
                                       f32_2 %292 = OpFNegate %291 
                                         f32 %293 = OpLoad %59 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                         f32 %295 = OpDot %292 %294 
                                                      OpStore %288 %295 
                                         f32 %296 = OpLoad %288 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %222 
                                       f32_3 %299 = OpFMul %297 %298 
                                                      OpStore %222 %299 
                                       f32_3 %300 = OpLoad %9 
                                       f32_3 %302 = OpLoad %301 
                                       f32_3 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %222 
                                       f32_3 %305 = OpFAdd %303 %304 
                                                      OpStore %222 %305 
                                       f32_3 %306 = OpLoad %222 
                                         f32 %311 = OpDot %306 %310 
                                                      OpStore %288 %311 
                                         f32 %312 = OpLoad %288 
                                         f32 %313 = OpLoad %288 
                                         f32 %314 = OpFMul %312 %313 
                                                      OpStore %288 %314 
                                         f32 %316 = OpLoad %288 
                                       f32_3 %317 = OpCompositeConstruct %316 %316 %316 
                                         f32 %318 = OpLoad %288 
                                       f32_3 %319 = OpCompositeConstruct %318 %318 %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %222 
                                       f32_3 %322 = OpFNegate %321 
                                       f32_3 %323 = OpFAdd %320 %322 
                                                      OpStore %315 %323 
                                Uniform f32* %326 = OpAccessChain %33 %325 
                                         f32 %327 = OpLoad %326 
                                       f32_3 %328 = OpCompositeConstruct %327 %327 %327 
                                       f32_3 %329 = OpLoad %315 
                                       f32_3 %330 = OpFMul %328 %329 
                                       f32_3 %331 = OpLoad %222 
                                       f32_3 %332 = OpFAdd %330 %331 
                                                      OpStore %324 %332 
                                       f32_3 %335 = OpLoad %324 
                                       f32_4 %336 = OpLoad %334 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %334 %337 
                                 Output f32* %339 = OpAccessChain %334 %86 
                                                      OpStore %339 %104 
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
void main()
{
    u_xlat0.x = (-_Displacement) + 75.0;
    u_xlat6.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat6.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat6.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat6.xy, 0.0);
    u_xlat6.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat6.xyz = vec3(_UseBuffer) * u_xlat6.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat6.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0.x = u_xlat1.z / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat2 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat2;
    gl_Position = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat6.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat0.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat0.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat4;
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
    vs_TEXCOORD3.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat2.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat2.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat2.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat9) + u_xlat1.x;
    u_xlat9 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat9;
    u_xlat9 = u_xlat9 * _LightShadowData.z + _LightShadowData.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat7.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat7.x, u_xlat4.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat7.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat9 = u_xlat9 + u_xlat10_2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = min(u_xlat9, u_xlat4.x);
    u_xlat9 = (u_xlatb1) ? u_xlat4.x : u_xlat9;
    u_xlat9 = u_xlat9 * _StepFactor;
    u_xlat9 = floor(u_xlat9);
    u_xlat9 = u_xlat9 / _StepFactor;
    u_xlat1.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat9 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat9));
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 430
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %36 %60 %72 %91 %216 %221 %270 %273 %391 %412 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 RelaxedPrecision 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 RelaxedPrecision 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpMemberDecorate %18 7 Offset 18 
                                                      OpMemberDecorate %18 8 Offset 18 
                                                      OpMemberDecorate %18 9 Offset 18 
                                                      OpMemberDecorate %18 10 Offset 18 
                                                      OpMemberDecorate %18 11 RelaxedPrecision 
                                                      OpMemberDecorate %18 11 Offset 18 
                                                      OpMemberDecorate %18 12 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %36 Location 36 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %53 DescriptorSet 53 
                                                      OpDecorate %53 Binding 53 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpMemberDecorate %214 0 BuiltIn 214 
                                                      OpMemberDecorate %214 1 BuiltIn 214 
                                                      OpMemberDecorate %214 2 BuiltIn 214 
                                                      OpDecorate %214 Block 
                                                      OpDecorate %221 Location 221 
                                                      OpDecorate %270 Location 270 
                                                      OpDecorate %273 Location 273 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %391 Location 391 
                                                      OpDecorate %412 Location 412 
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
                                              %17 = OpTypeVector %6 2 
                                              %18 = OpTypeStruct %7 %7 %7 %7 %7 %12 %14 %15 %16 %6 %17 %6 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 9 
                                              %23 = OpTypePointer Uniform %6 
                                          f32 %27 = OpConstant 3.67402E-40 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %32 = OpTypeVector %6 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %35 = OpTypePointer Input %7 
                                 Input f32_4* %36 = OpVariable Input 
                                          i32 %39 = OpConstant 10 
                                          u32 %42 = OpConstant 1 
                               Private f32_4* %49 = OpVariable Private 
                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %51 = OpTypeSampledImage %50 
                                              %52 = OpTypePointer UniformConstant %51 
  UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
                                          f32 %57 = OpConstant 3.67402E-40 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %64 = OpConstant 11 
                                 Input f32_4* %72 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %83 = OpVariable UniformConstant 
                                              %90 = OpTypePointer Input %32 
                                 Input f32_3* %91 = OpVariable Input 
                                         u32 %120 = OpConstant 2 
                                         f32 %129 = OpConstant 3.67402E-40 
                              Private f32_4* %144 = OpVariable Private 
                                         i32 %147 = OpConstant 6 
                                         i32 %148 = OpConstant 1 
                                             %149 = OpTypePointer Uniform %7 
                                         i32 %153 = OpConstant 0 
                                         i32 %161 = OpConstant 2 
                              Private f32_4* %169 = OpVariable Private 
                                         i32 %171 = OpConstant 3 
                                         i32 %188 = OpConstant 8 
                                             %213 = OpTypeArray %6 %42 
                                             %214 = OpTypeStruct %7 %6 %213 
                                             %215 = OpTypePointer Output %214 
        Output struct {f32_4; f32; f32[1];}* %216 = OpVariable Output 
                                             %218 = OpTypePointer Output %7 
                                             %220 = OpTypePointer Output %17 
                               Output f32_2* %221 = OpVariable Output 
                                         i32 %224 = OpConstant 12 
                                         i32 %234 = OpConstant 7 
                                             %269 = OpTypePointer Output %32 
                               Output f32_3* %270 = OpVariable Output 
                               Output f32_3* %273 = OpVariable Output 
                              Private f32_4* %282 = OpVariable Private 
                              Private f32_4* %290 = OpVariable Private 
                                         f32 %326 = OpConstant 3.67402E-40 
                                       f32_4 %327 = OpConstantComposite %326 %326 %326 %326 
                                         i32 %332 = OpConstant 4 
                                       f32_4 %336 = OpConstantComposite %129 %129 %129 %129 
                                       f32_4 %344 = OpConstantComposite %57 %57 %57 %57 
                                         i32 %351 = OpConstant 5 
                               Output f32_3* %391 = OpVariable Output 
                                         f32 %402 = OpConstant 3.67402E-40 
                                         u32 %404 = OpConstant 3 
                                       f32_2 %408 = OpConstantComposite %402 %402 
                               Output f32_4* %412 = OpVariable Output 
                                             %424 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %24 = OpAccessChain %20 %22 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFNegate %25 
                                          f32 %28 = OpFAdd %26 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                                 Uniform f32* %40 = OpAccessChain %20 %39 %29 
                                          f32 %41 = OpLoad %40 
                                 Uniform f32* %43 = OpAccessChain %20 %39 %42 
                                          f32 %44 = OpLoad %43 
                                        f32_2 %45 = OpCompositeConstruct %41 %44 
                                        f32_2 %46 = OpFAdd %38 %45 
                                        f32_3 %47 = OpLoad %34 
                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                      OpStore %34 %48 
                   read_only Texture2DSampled %54 = OpLoad %53 
                                        f32_3 %55 = OpLoad %34 
                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                        f32_4 %58 = OpImageSampleExplicitLod %54 %56 Lod %7 
                                                      OpStore %49 %58 
                                        f32_4 %59 = OpLoad %49 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFNegate %61 
                                        f32_4 %63 = OpFAdd %59 %62 
                                                      OpStore %49 %63 
                                 Uniform f32* %65 = OpAccessChain %20 %64 
                                          f32 %66 = OpLoad %65 
                                        f32_4 %67 = OpCompositeConstruct %66 %66 %66 %66 
                                        f32_4 %68 = OpLoad %49 
                                        f32_4 %69 = OpFMul %67 %68 
                                        f32_4 %70 = OpLoad %60 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %49 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                 Uniform f32* %75 = OpAccessChain %20 %39 %29 
                                          f32 %76 = OpLoad %75 
                                 Uniform f32* %77 = OpAccessChain %20 %39 %42 
                                          f32 %78 = OpLoad %77 
                                        f32_2 %79 = OpCompositeConstruct %76 %78 
                                        f32_2 %80 = OpFAdd %74 %79 
                                        f32_3 %81 = OpLoad %34 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %34 %82 
                   read_only Texture2DSampled %84 = OpLoad %83 
                                        f32_3 %85 = OpLoad %34 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpImageSampleExplicitLod %84 %86 Lod %7 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                                      OpStore %34 %88 
                                        f32_3 %89 = OpLoad %34 
                                        f32_3 %92 = OpLoad %91 
                                        f32_3 %93 = OpFNegate %92 
                                        f32_3 %94 = OpFAdd %89 %93 
                                                      OpStore %34 %94 
                                 Uniform f32* %95 = OpAccessChain %20 %64 
                                          f32 %96 = OpLoad %95 
                                        f32_3 %97 = OpCompositeConstruct %96 %96 %96 
                                        f32_3 %98 = OpLoad %34 
                                        f32_3 %99 = OpFMul %97 %98 
                                       f32_3 %100 = OpLoad %91 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %34 %101 
                                       f32_3 %102 = OpLoad %34 
                                Uniform f32* %103 = OpAccessChain %20 %22 
                                         f32 %104 = OpLoad %103 
                                Uniform f32* %105 = OpAccessChain %20 %22 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %107 = OpAccessChain %20 %22 
                                         f32 %108 = OpLoad %107 
                                       f32_3 %109 = OpCompositeConstruct %104 %106 %108 
                                         f32 %110 = OpCompositeExtract %109 0 
                                         f32 %111 = OpCompositeExtract %109 1 
                                         f32 %112 = OpCompositeExtract %109 2 
                                       f32_3 %113 = OpCompositeConstruct %110 %111 %112 
                                       f32_3 %114 = OpFMul %102 %113 
                                       f32_4 %115 = OpLoad %49 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFAdd %114 %116 
                                       f32_4 %118 = OpLoad %49 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %49 %119 
                                Private f32* %121 = OpAccessChain %49 %120 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %9 %29 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFDiv %122 %124 
                                Private f32* %126 = OpAccessChain %9 %29 
                                                      OpStore %126 %125 
                                Private f32* %127 = OpAccessChain %9 %29 
                                         f32 %128 = OpLoad %127 
                                         f32 %130 = OpExtInst %1 43 %128 %57 %129 
                                Private f32* %131 = OpAccessChain %9 %29 
                                                      OpStore %131 %130 
                                Private f32* %132 = OpAccessChain %9 %29 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                         f32 %135 = OpFAdd %134 %129 
                                Private f32* %136 = OpAccessChain %9 %29 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 0 
                                       f32_4 %139 = OpLoad %49 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %138 %140 
                                       f32_4 %142 = OpLoad %49 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 2 3 
                                                      OpStore %49 %143 
                                       f32_4 %145 = OpLoad %49 
                                       f32_4 %146 = OpVectorShuffle %145 %145 1 1 1 1 
                              Uniform f32_4* %150 = OpAccessChain %20 %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                       f32_4 %152 = OpFMul %146 %151 
                                                      OpStore %144 %152 
                              Uniform f32_4* %154 = OpAccessChain %20 %147 %153 
                                       f32_4 %155 = OpLoad %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_4 %157 = OpVectorShuffle %156 %156 0 0 0 0 
                                       f32_4 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %144 
                                       f32_4 %160 = OpFAdd %158 %159 
                                                      OpStore %144 %160 
                              Uniform f32_4* %162 = OpAccessChain %20 %147 %161 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpLoad %49 
                                       f32_4 %165 = OpVectorShuffle %164 %164 2 2 2 2 
                                       f32_4 %166 = OpFMul %163 %165 
                                       f32_4 %167 = OpLoad %144 
                                       f32_4 %168 = OpFAdd %166 %167 
                                                      OpStore %144 %168 
                                       f32_4 %170 = OpLoad %144 
                              Uniform f32_4* %172 = OpAccessChain %20 %147 %171 
                                       f32_4 %173 = OpLoad %172 
                                       f32_4 %174 = OpFAdd %170 %173 
                                                      OpStore %169 %174 
                              Uniform f32_4* %175 = OpAccessChain %20 %147 %171 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_4 %178 = OpLoad %49 
                                       f32_3 %179 = OpVectorShuffle %178 %178 3 3 3 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %144 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFAdd %180 %182 
                                       f32_4 %184 = OpLoad %49 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %49 %185 
                                       f32_4 %186 = OpLoad %169 
                                       f32_4 %187 = OpVectorShuffle %186 %186 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %20 %188 %148 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %187 %190 
                                                      OpStore %144 %191 
                              Uniform f32_4* %192 = OpAccessChain %20 %188 %153 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %144 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %144 %198 
                              Uniform f32_4* %199 = OpAccessChain %20 %188 %161 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %169 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %144 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %144 %205 
                              Uniform f32_4* %206 = OpAccessChain %20 %188 %171 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpLoad %169 
                                       f32_4 %209 = OpVectorShuffle %208 %208 3 3 3 3 
                                       f32_4 %210 = OpFMul %207 %209 
                                       f32_4 %211 = OpLoad %144 
                                       f32_4 %212 = OpFAdd %210 %211 
                                                      OpStore %144 %212 
                                       f32_4 %217 = OpLoad %144 
                               Output f32_4* %219 = OpAccessChain %216 %153 
                                                      OpStore %219 %217 
                                       f32_4 %222 = OpLoad %36 
                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
                              Uniform f32_4* %225 = OpAccessChain %20 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_2 %228 = OpFMul %223 %227 
                              Uniform f32_4* %229 = OpAccessChain %20 %224 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 2 3 
                                       f32_2 %232 = OpFAdd %228 %231 
                                                      OpStore %221 %232 
                                       f32_3 %233 = OpLoad %34 
                              Uniform f32_4* %235 = OpAccessChain %20 %234 %153 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                         f32 %238 = OpDot %233 %237 
                                Private f32* %239 = OpAccessChain %169 %29 
                                                      OpStore %239 %238 
                                       f32_3 %240 = OpLoad %34 
                              Uniform f32_4* %241 = OpAccessChain %20 %234 %148 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                         f32 %244 = OpDot %240 %243 
                                Private f32* %245 = OpAccessChain %169 %42 
                                                      OpStore %245 %244 
                                       f32_3 %246 = OpLoad %34 
                              Uniform f32_4* %247 = OpAccessChain %20 %234 %161 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                         f32 %250 = OpDot %246 %249 
                                Private f32* %251 = OpAccessChain %169 %120 
                                                      OpStore %251 %250 
                                       f32_4 %252 = OpLoad %169 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_4 %254 = OpLoad %169 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                         f32 %256 = OpDot %253 %255 
                                Private f32* %257 = OpAccessChain %9 %29 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %9 %29 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 32 %259 
                                Private f32* %261 = OpAccessChain %9 %29 
                                                      OpStore %261 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 0 0 
                                       f32_4 %264 = OpLoad %169 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFMul %263 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %9 %268 
                                       f32_4 %271 = OpLoad %9 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                                      OpStore %270 %272 
                                       f32_4 %274 = OpLoad %49 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                                      OpStore %273 %275 
                                       f32_4 %276 = OpLoad %49 
                                       f32_4 %277 = OpVectorShuffle %276 %276 1 1 1 1 
                                       f32_4 %278 = OpFNegate %277 
                              Uniform f32_4* %279 = OpAccessChain %20 %161 
                                       f32_4 %280 = OpLoad %279 
                                       f32_4 %281 = OpFAdd %278 %280 
                                                      OpStore %169 %281 
                                       f32_4 %283 = OpLoad %9 
                                       f32_4 %284 = OpVectorShuffle %283 %283 1 1 1 1 
                                       f32_4 %285 = OpLoad %169 
                                       f32_4 %286 = OpFMul %284 %285 
                                                      OpStore %282 %286 
                                       f32_4 %287 = OpLoad %169 
                                       f32_4 %288 = OpLoad %169 
                                       f32_4 %289 = OpFMul %287 %288 
                                                      OpStore %169 %289 
                                       f32_4 %291 = OpLoad %49 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFNegate %292 
                              Uniform f32_4* %294 = OpAccessChain %20 %148 
                                       f32_4 %295 = OpLoad %294 
                                       f32_4 %296 = OpFAdd %293 %295 
                                                      OpStore %290 %296 
                                       f32_4 %297 = OpLoad %49 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFNegate %298 
                              Uniform f32_4* %300 = OpAccessChain %20 %171 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %299 %301 
                                                      OpStore %49 %302 
                                       f32_4 %303 = OpLoad %290 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpVectorShuffle %304 %304 0 0 0 0 
                                       f32_4 %306 = OpFMul %303 %305 
                                       f32_4 %307 = OpLoad %282 
                                       f32_4 %308 = OpFAdd %306 %307 
                                                      OpStore %282 %308 
                                       f32_4 %309 = OpLoad %290 
                                       f32_4 %310 = OpLoad %290 
                                       f32_4 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %169 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %169 %313 
                                       f32_4 %314 = OpLoad %49 
                                       f32_4 %315 = OpLoad %49 
                                       f32_4 %316 = OpFMul %314 %315 
                                       f32_4 %317 = OpLoad %169 
                                       f32_4 %318 = OpFAdd %316 %317 
                                                      OpStore %169 %318 
                                       f32_4 %319 = OpLoad %49 
                                       f32_4 %320 = OpLoad %9 
                                       f32_4 %321 = OpVectorShuffle %320 %320 2 2 2 2 
                                       f32_4 %322 = OpFMul %319 %321 
                                       f32_4 %323 = OpLoad %282 
                                       f32_4 %324 = OpFAdd %322 %323 
                                                      OpStore %9 %324 
                                       f32_4 %325 = OpLoad %169 
                                       f32_4 %328 = OpExtInst %1 40 %325 %327 
                                                      OpStore %49 %328 
                                       f32_4 %329 = OpLoad %49 
                                       f32_4 %330 = OpExtInst %1 32 %329 
                                                      OpStore %169 %330 
                                       f32_4 %331 = OpLoad %49 
                              Uniform f32_4* %333 = OpAccessChain %20 %332 
                                       f32_4 %334 = OpLoad %333 
                                       f32_4 %335 = OpFMul %331 %334 
                                       f32_4 %337 = OpFAdd %335 %336 
                                                      OpStore %49 %337 
                                       f32_4 %338 = OpLoad %49 
                                       f32_4 %339 = OpFDiv %336 %338 
                                                      OpStore %49 %339 
                                       f32_4 %340 = OpLoad %9 
                                       f32_4 %341 = OpLoad %169 
                                       f32_4 %342 = OpFMul %340 %341 
                                                      OpStore %9 %342 
                                       f32_4 %343 = OpLoad %9 
                                       f32_4 %345 = OpExtInst %1 40 %343 %344 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %49 
                                       f32_4 %347 = OpLoad %9 
                                       f32_4 %348 = OpFMul %346 %347 
                                                      OpStore %9 %348 
                                       f32_4 %349 = OpLoad %9 
                                       f32_3 %350 = OpVectorShuffle %349 %349 1 1 1 
                              Uniform f32_4* %352 = OpAccessChain %20 %351 %148 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                                       f32_3 %355 = OpFMul %350 %354 
                                       f32_4 %356 = OpLoad %49 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 6 3 
                                                      OpStore %49 %357 
                              Uniform f32_4* %358 = OpAccessChain %20 %351 %153 
                                       f32_4 %359 = OpLoad %358 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_4 %361 = OpLoad %9 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 0 0 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %49 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_3 %366 = OpFAdd %363 %365 
                                       f32_4 %367 = OpLoad %49 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %49 %368 
                              Uniform f32_4* %369 = OpAccessChain %20 %351 %161 
                                       f32_4 %370 = OpLoad %369 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 2 2 2 
                                       f32_3 %374 = OpFMul %371 %373 
                                       f32_4 %375 = OpLoad %49 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                                       f32_3 %377 = OpFAdd %374 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %9 %379 
                              Uniform f32_4* %380 = OpAccessChain %20 %351 %171 
                                       f32_4 %381 = OpLoad %380 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                       f32_4 %383 = OpLoad %9 
                                       f32_3 %384 = OpVectorShuffle %383 %383 3 3 3 
                                       f32_3 %385 = OpFMul %382 %384 
                                       f32_4 %386 = OpLoad %9 
                                       f32_3 %387 = OpVectorShuffle %386 %386 0 1 2 
                                       f32_3 %388 = OpFAdd %385 %387 
                                       f32_4 %389 = OpLoad %9 
                                       f32_4 %390 = OpVectorShuffle %389 %388 4 5 6 3 
                                                      OpStore %9 %390 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                                      OpStore %391 %393 
                                Private f32* %394 = OpAccessChain %144 %42 
                                         f32 %395 = OpLoad %394 
                                Uniform f32* %396 = OpAccessChain %20 %153 %29 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFMul %395 %397 
                                Private f32* %399 = OpAccessChain %9 %29 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %9 %29 
                                         f32 %401 = OpLoad %400 
                                         f32 %403 = OpFMul %401 %402 
                                Private f32* %405 = OpAccessChain %9 %404 
                                                      OpStore %405 %403 
                                       f32_4 %406 = OpLoad %144 
                                       f32_2 %407 = OpVectorShuffle %406 %406 0 3 
                                       f32_2 %409 = OpFMul %407 %408 
                                       f32_4 %410 = OpLoad %9 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 1 5 3 
                                                      OpStore %9 %411 
                                       f32_4 %413 = OpLoad %144 
                                       f32_2 %414 = OpVectorShuffle %413 %413 2 3 
                                       f32_4 %415 = OpLoad %412 
                                       f32_4 %416 = OpVectorShuffle %415 %414 0 1 4 5 
                                                      OpStore %412 %416 
                                       f32_4 %417 = OpLoad %9 
                                       f32_2 %418 = OpVectorShuffle %417 %417 2 2 
                                       f32_4 %419 = OpLoad %9 
                                       f32_2 %420 = OpVectorShuffle %419 %419 0 3 
                                       f32_2 %421 = OpFAdd %418 %420 
                                       f32_4 %422 = OpLoad %412 
                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 2 3 
                                                      OpStore %412 %423 
                                 Output f32* %425 = OpAccessChain %216 %153 %42 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFNegate %426 
                                 Output f32* %428 = OpAccessChain %216 %153 %42 
                                                      OpStore %428 %427 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 341
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %233 %301 %334 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 RelaxedPrecision 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 RelaxedPrecision 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 RelaxedPrecision 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpMemberDecorate %31 8 Offset 31 
                                                      OpMemberDecorate %31 9 Offset 31 
                                                      OpMemberDecorate %31 10 RelaxedPrecision 
                                                      OpMemberDecorate %31 10 Offset 31 
                                                      OpMemberDecorate %31 11 Offset 31 
                                                      OpMemberDecorate %31 12 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %119 SpecId 119 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 DescriptorSet 242 
                                                      OpDecorate %242 Binding 242 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 Location 301 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %334 Location 334 
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
                                              %23 = OpTypePointer Input %7 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %19 %28 
                                              %30 = OpTypeArray %19 %28 
                                              %31 = OpTypeStruct %7 %19 %19 %19 %19 %29 %19 %30 %7 %7 %19 %6 %6 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 0 
                                              %36 = OpTypePointer Uniform %7 
                                              %40 = OpTypePointer Private %19 
                               Private f32_4* %41 = OpVariable Private 
                                          i32 %42 = OpConstant 5 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Private %6 
                                          i32 %50 = OpConstant 1 
                                          u32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant 2 
                                 Private f32* %59 = OpVariable Private 
                                          i32 %65 = OpConstant 4 
                                              %66 = OpTypePointer Uniform %19 
                                          u32 %86 = OpConstant 3 
                                          i32 %95 = OpConstant 3 
                                         f32 %103 = OpConstant 3.67402E-40 
                                         f32 %104 = OpConstant 3.67402E-40 
                                             %106 = OpTypeBool 
                                             %107 = OpTypePointer Private %106 
                               Private bool* %108 = OpVariable Private 
                                         i32 %109 = OpConstant 6 
                                        bool %113 = OpConstantFalse 
                                        bool %119 = OpSpecConstantFalse 
                               Private bool* %122 = OpVariable Private 
                                         i32 %128 = OpConstant 7 
                              Private f32_3* %165 = OpVariable Private 
                                             %166 = OpTypePointer Function %7 
                                         i32 %177 = OpConstant 9 
                                         i32 %183 = OpConstant 8 
                                         f32 %191 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                             %232 = OpTypePointer Input %19 
                                Input f32_4* %233 = OpVariable Input 
                                Private f32* %241 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %242 = OpVariable UniformConstant 
                                Private f32* %248 = OpVariable Private 
                                             %259 = OpTypePointer Function %6 
                                         i32 %272 = OpConstant 11 
                                         i32 %283 = OpConstant 10 
                                Private f32* %288 = OpVariable Private 
                                Input f32_3* %301 = OpVariable Input 
                                         f32 %307 = OpConstant 3.67402E-40 
                                         f32 %308 = OpConstant 3.67402E-40 
                                         f32 %309 = OpConstant 3.67402E-40 
                                       f32_3 %310 = OpConstantComposite %307 %308 %309 
                              Private f32_3* %315 = OpVariable Private 
                              Private f32_3* %324 = OpVariable Private 
                                         i32 %325 = OpConstant 12 
                                             %333 = OpTypePointer Output %19 
                               Output f32_4* %334 = OpVariable Output 
                                             %338 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %167 = OpVariable Function 
                               Function f32* %260 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpFNegate %25 
                               Uniform f32_3* %37 = OpAccessChain %33 %35 
                                        f32_3 %38 = OpLoad %37 
                                        f32_3 %39 = OpFAdd %26 %38 
                                                      OpStore %22 %39 
                                 Uniform f32* %45 = OpAccessChain %33 %42 %35 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %49 = OpAccessChain %41 %47 
                                                      OpStore %49 %46 
                                 Uniform f32* %51 = OpAccessChain %33 %42 %50 %43 
                                          f32 %52 = OpLoad %51 
                                 Private f32* %54 = OpAccessChain %41 %53 
                                                      OpStore %54 %52 
                                 Uniform f32* %56 = OpAccessChain %33 %42 %55 %43 
                                          f32 %57 = OpLoad %56 
                                 Private f32* %58 = OpAccessChain %41 %43 
                                                      OpStore %58 %57 
                                        f32_3 %60 = OpLoad %22 
                                        f32_4 %61 = OpLoad %41 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                          f32 %63 = OpDot %60 %62 
                                                      OpStore %59 %63 
                                        f32_3 %64 = OpLoad %24 
                               Uniform f32_4* %67 = OpAccessChain %33 %65 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                        f32_3 %70 = OpFNegate %69 
                                        f32_3 %71 = OpFAdd %64 %70 
                                                      OpStore %22 %71 
                                        f32_3 %72 = OpLoad %22 
                                        f32_3 %73 = OpLoad %22 
                                          f32 %74 = OpDot %72 %73 
                                 Private f32* %75 = OpAccessChain %22 %47 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %22 %47 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpExtInst %1 31 %77 
                                 Private f32* %79 = OpAccessChain %22 %47 
                                                      OpStore %79 %78 
                                          f32 %80 = OpLoad %59 
                                          f32 %81 = OpFNegate %80 
                                 Private f32* %82 = OpAccessChain %22 %47 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFAdd %81 %83 
                                 Private f32* %85 = OpAccessChain %22 %47 
                                                      OpStore %85 %84 
                                 Uniform f32* %87 = OpAccessChain %33 %65 %86 
                                          f32 %88 = OpLoad %87 
                                 Private f32* %89 = OpAccessChain %22 %47 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %88 %90 
                                          f32 %92 = OpLoad %59 
                                          f32 %93 = OpFAdd %91 %92 
                                                      OpStore %59 %93 
                                          f32 %94 = OpLoad %59 
                                 Uniform f32* %96 = OpAccessChain %33 %95 %43 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFMul %94 %97 
                                 Uniform f32* %99 = OpAccessChain %33 %95 %86 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFAdd %98 %100 
                                                      OpStore %59 %101 
                                         f32 %102 = OpLoad %59 
                                         f32 %105 = OpExtInst %1 43 %102 %103 %104 
                                                      OpStore %59 %105 
                                Uniform f32* %110 = OpAccessChain %33 %109 %47 
                                         f32 %111 = OpLoad %110 
                                        bool %112 = OpFOrdEqual %111 %104 
                                                      OpStore %108 %112 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %115 
                                             %114 = OpLabel 
                                        bool %116 = OpLoad %108 
                                                      OpSelectionMerge %118 None 
                                                      OpBranchConditional %116 %117 %118 
                                             %117 = OpLabel 
                                                      OpBranch %118 
                                             %118 = OpLabel 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                                      OpSelectionMerge %121 None 
                                                      OpBranchConditional %119 %120 %217 
                                             %120 = OpLabel 
                                Uniform f32* %123 = OpAccessChain %33 %109 %53 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdEqual %124 %104 
                                                      OpStore %122 %125 
                                       f32_3 %126 = OpLoad %24 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %33 %128 %50 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %41 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
                                                      OpStore %41 %134 
                              Uniform f32_4* %135 = OpAccessChain %33 %128 %35 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpLoad %24 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
                                       f32_3 %140 = OpFMul %137 %139 
                                       f32_4 %141 = OpLoad %41 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFAdd %140 %142 
                                       f32_4 %144 = OpLoad %41 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %41 %145 
                              Uniform f32_4* %146 = OpAccessChain %33 %128 %55 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %24 
                                       f32_3 %150 = OpVectorShuffle %149 %149 2 2 2 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %41 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %41 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %41 %156 
                                       f32_4 %157 = OpLoad %41 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                              Uniform f32_4* %159 = OpAccessChain %33 %128 %95 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                       f32_3 %162 = OpFAdd %158 %161 
                                       f32_4 %163 = OpLoad %41 
                                       f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                      OpStore %41 %164 
                                        bool %168 = OpLoad %122 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %168 %169 %173 
                                             %169 = OpLabel 
                                       f32_4 %171 = OpLoad %41 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                                      OpStore %167 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                       f32_3 %174 = OpLoad %24 
                                                      OpStore %167 %174 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                       f32_3 %175 = OpLoad %167 
                                                      OpStore %165 %175 
                                       f32_3 %176 = OpLoad %165 
                              Uniform f32_3* %178 = OpAccessChain %33 %177 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFAdd %176 %180 
                                                      OpStore %165 %181 
                                       f32_3 %182 = OpLoad %165 
                              Uniform f32_3* %184 = OpAccessChain %33 %183 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %41 
                                       f32_4 %188 = OpVectorShuffle %187 %186 0 4 5 6 
                                                      OpStore %41 %188 
                                Private f32* %189 = OpAccessChain %41 %53 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %194 = OpFAdd %192 %193 
                                Private f32* %195 = OpAccessChain %165 %47 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %33 %109 %43 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpFMul %198 %199 
                                         f32 %201 = OpFAdd %200 %193 
                                                      OpStore %196 %201 
                                         f32 %202 = OpLoad %196 
                                Private f32* %203 = OpAccessChain %165 %47 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpExtInst %1 40 %202 %204 
                                Private f32* %206 = OpAccessChain %41 %47 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %41 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %41 %214 
                                       f32_4 %216 = OpLoad %41 
                                                      OpStore %215 %216 
                                                      OpBranch %121 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %47 
                                                      OpStore %218 %104 
                                Private f32* %219 = OpAccessChain %215 %53 
                                                      OpStore %219 %104 
                                Private f32* %220 = OpAccessChain %215 %43 
                                                      OpStore %220 %104 
                                Private f32* %221 = OpAccessChain %215 %86 
                                                      OpStore %221 %104 
                                                      OpBranch %121 
                                             %121 = OpLabel 
                                       f32_4 %223 = OpLoad %215 
                              Uniform f32_4* %224 = OpAccessChain %33 %55 
                                       f32_4 %225 = OpLoad %224 
                                         f32 %226 = OpDot %223 %225 
                                Private f32* %227 = OpAccessChain %222 %47 
                                                      OpStore %227 %226 
                                Private f32* %228 = OpAccessChain %222 %47 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpExtInst %1 43 %229 %103 %104 
                                Private f32* %231 = OpAccessChain %222 %47 
                                                      OpStore %231 %230 
                                       f32_4 %234 = OpLoad %233 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                       f32_4 %236 = OpLoad %233 
                                       f32_2 %237 = OpVectorShuffle %236 %236 3 3 
                                       f32_2 %238 = OpFDiv %235 %237 
                                       f32_3 %239 = OpLoad %165 
                                       f32_3 %240 = OpVectorShuffle %239 %238 3 4 2 
                                                      OpStore %165 %240 
                  read_only Texture2DSampled %243 = OpLoad %242 
                                       f32_3 %244 = OpLoad %165 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
                                         f32 %247 = OpCompositeExtract %246 0 
                                                      OpStore %241 %247 
                                         f32 %249 = OpLoad %59 
                                         f32 %250 = OpLoad %241 
                                         f32 %251 = OpFAdd %249 %250 
                                                      OpStore %248 %251 
                                         f32 %252 = OpLoad %248 
                                         f32 %253 = OpExtInst %1 43 %252 %103 %104 
                                                      OpStore %248 %253 
                                         f32 %254 = OpLoad %248 
                                Private f32* %255 = OpAccessChain %222 %47 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpExtInst %1 37 %254 %256 
                                Private f32* %258 = OpAccessChain %222 %47 
                                                      OpStore %258 %257 
                                        bool %261 = OpLoad %108 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %261 %262 %266 
                                             %262 = OpLabel 
                                Private f32* %264 = OpAccessChain %222 %47 
                                         f32 %265 = OpLoad %264 
                                                      OpStore %260 %265 
                                                      OpBranch %263 
                                             %266 = OpLabel 
                                         f32 %267 = OpLoad %248 
                                                      OpStore %260 %267 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %260 
                                Private f32* %269 = OpAccessChain %222 %47 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %222 %47 
                                         f32 %271 = OpLoad %270 
                                Uniform f32* %273 = OpAccessChain %33 %272 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %271 %274 
                                                      OpStore %59 %275 
                                         f32 %276 = OpLoad %59 
                                         f32 %277 = OpExtInst %1 8 %276 
                                                      OpStore %59 %277 
                                         f32 %278 = OpLoad %59 
                                Uniform f32* %279 = OpAccessChain %33 %272 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFDiv %278 %280 
                                                      OpStore %59 %281 
                                       f32_3 %282 = OpLoad %9 
                              Uniform f32_4* %284 = OpAccessChain %33 %283 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFMul %282 %286 
                                                      OpStore %222 %287 
                              Uniform f32_4* %289 = OpAccessChain %33 %50 
                                       f32_4 %290 = OpLoad %289 
                                       f32_2 %291 = OpVectorShuffle %290 %290 2 2 
                                       f32_2 %292 = OpFNegate %291 
                                         f32 %293 = OpLoad %59 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                         f32 %295 = OpDot %292 %294 
                                                      OpStore %288 %295 
                                         f32 %296 = OpLoad %288 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %222 
                                       f32_3 %299 = OpFMul %297 %298 
                                                      OpStore %222 %299 
                                       f32_3 %300 = OpLoad %9 
                                       f32_3 %302 = OpLoad %301 
                                       f32_3 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %222 
                                       f32_3 %305 = OpFAdd %303 %304 
                                                      OpStore %222 %305 
                                       f32_3 %306 = OpLoad %222 
                                         f32 %311 = OpDot %306 %310 
                                                      OpStore %288 %311 
                                         f32 %312 = OpLoad %288 
                                         f32 %313 = OpLoad %288 
                                         f32 %314 = OpFMul %312 %313 
                                                      OpStore %288 %314 
                                         f32 %316 = OpLoad %288 
                                       f32_3 %317 = OpCompositeConstruct %316 %316 %316 
                                         f32 %318 = OpLoad %288 
                                       f32_3 %319 = OpCompositeConstruct %318 %318 %318 
                                       f32_3 %320 = OpFMul %317 %319 
                                       f32_3 %321 = OpLoad %222 
                                       f32_3 %322 = OpFNegate %321 
                                       f32_3 %323 = OpFAdd %320 %322 
                                                      OpStore %315 %323 
                                Uniform f32* %326 = OpAccessChain %33 %325 
                                         f32 %327 = OpLoad %326 
                                       f32_3 %328 = OpCompositeConstruct %327 %327 %327 
                                       f32_3 %329 = OpLoad %315 
                                       f32_3 %330 = OpFMul %328 %329 
                                       f32_3 %331 = OpLoad %222 
                                       f32_3 %332 = OpFAdd %330 %331 
                                                      OpStore %324 %332 
                                       f32_3 %335 = OpLoad %324 
                                       f32_4 %336 = OpLoad %334 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %334 %337 
                                 Output f32* %339 = OpAccessChain %334 %86 
                                                      OpStore %339 %104 
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
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One One, One One
  ZTest Less
  ZWrite Off
  Offset 1, 1
  GpuProgramID 101111
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
float u_xlat5;
float u_xlat9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat0.z;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
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
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat3.xx);
    u_xlat3.x = u_xlat10 * u_xlat10_2.w;
    u_xlat3.x = u_xlat3.x * _StepFactor;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat3.x = u_xlat3.x / _StepFactor;
    u_xlat1.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat0.x = dot((-u_xlat0.xx), u_xlat3.xx);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                 Output f32* %252 = OpAccessChain %197 %138 %38 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %197 %138 %38 
                                                      OpStore %255 %254 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 310
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %54 %303 
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
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %104 SpecId 104 
                                                      OpDecorate %201 DescriptorSet 201 
                                                      OpDecorate %201 Binding 201 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %229 DescriptorSet 229 
                                                      OpDecorate %229 Binding 229 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %303 Location 303 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Private %6 
                                          u32 %41 = OpConstant 2 
                               Private f32_3* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Input %52 
                                 Input f32_2* %54 = OpVariable Input 
                               Private f32_3* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 7 
                                          i32 %62 = OpConstant 1 
                                          i32 %75 = OpConstant 2 
                                          i32 %85 = OpConstant 3 
                                              %90 = OpTypeBool 
                                              %91 = OpTypePointer Private %90 
                                Private bool* %92 = OpVariable Private 
                                              %93 = OpTypePointer Uniform %6 
                                          f32 %96 = OpConstant 3.67402E-40 
                                         bool %98 = OpConstantFalse 
                                        bool %104 = OpSpecConstantFalse 
                                         u32 %107 = OpConstant 1 
                                             %111 = OpTypePointer Private %14 
                              Private f32_4* %112 = OpVariable Private 
                                             %151 = OpTypePointer Function %7 
                                         i32 %165 = OpConstant 5 
                                             %166 = OpTypePointer Uniform %7 
                                         i32 %175 = OpConstant 4 
                                Private f32* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %186 = OpConstant 3.67402E-40 
                                Private f32* %188 = OpVariable Private 
                                         f32 %191 = OpConstant 3.67402E-40 
                                             %198 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %199 = OpTypeSampledImage %198 
                                             %200 = OpTypePointer UniformConstant %199 
 UniformConstant read_only Texture3DSampled* %201 = OpVariable UniformConstant 
                              Private f32_4* %206 = OpVariable Private 
                                         u32 %212 = OpConstant 3 
                              Private f32_3* %214 = OpVariable Private 
                                         f32 %222 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %229 = OpVariable UniformConstant 
                                         i32 %244 = OpConstant 8 
                                         i32 %260 = OpConstant 6 
                                Private f32* %265 = OpVariable Private 
                                         f32 %277 = OpConstant 3.67402E-40 
                                         f32 %278 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_3 %280 = OpConstantComposite %277 %278 %279 
                              Private f32_3* %285 = OpVariable Private 
                                         i32 %294 = OpConstant 9 
                                             %302 = OpTypePointer Output %14 
                               Output f32_4* %303 = OpVariable Output 
                                             %307 = OpTypePointer Output %6 
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
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpLoad %9 
                                          f32 %31 = OpDot %29 %30 
                                 Private f32* %34 = OpAccessChain %9 %32 
                                                      OpStore %34 %31 
                                 Private f32* %35 = OpAccessChain %9 %32 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpExtInst %1 32 %36 
                                 Private f32* %38 = OpAccessChain %9 %32 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %32 
                                          f32 %40 = OpLoad %39 
                                 Private f32* %42 = OpAccessChain %9 %41 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %40 %43 
                                 Private f32* %45 = OpAccessChain %9 %32 
                                                      OpStore %45 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_2 %55 = OpLoad %54 
                                        f32_4 %56 = OpImageSampleImplicitLod %51 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %46 %57 
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
                                 Uniform f32* %94 = OpAccessChain %21 %75 %32 
                                          f32 %95 = OpLoad %94 
                                         bool %97 = OpFOrdEqual %95 %96 
                                                      OpStore %92 %97 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %100 
                                              %99 = OpLabel 
                                        bool %101 = OpLoad %92 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %103 
                                             %102 = OpLabel 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                                      OpSelectionMerge %106 None 
                                                      OpBranchConditional %104 %105 %208 
                                             %105 = OpLabel 
                                Uniform f32* %108 = OpAccessChain %21 %75 %107 
                                         f32 %109 = OpLoad %108 
                                        bool %110 = OpFOrdEqual %109 %96 
                                                      OpStore %92 %110 
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
                                Private f32* %182 = OpAccessChain %112 %107 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %181 %187 
                                Uniform f32* %189 = OpAccessChain %21 %75 %41 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %193 = OpFAdd %192 %186 
                                                      OpStore %188 %193 
                                         f32 %194 = OpLoad %181 
                                         f32 %195 = OpLoad %188 
                                         f32 %196 = OpExtInst %1 40 %194 %195 
                                Private f32* %197 = OpAccessChain %112 %32 
                                                      OpStore %197 %196 
                  read_only Texture3DSampled %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %112 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
                                       f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                      OpStore %112 %205 
                                       f32_4 %207 = OpLoad %112 
                                                      OpStore %206 %207 
                                                      OpBranch %106 
                                             %208 = OpLabel 
                                Private f32* %209 = OpAccessChain %206 %32 
                                                      OpStore %209 %96 
                                Private f32* %210 = OpAccessChain %206 %107 
                                                      OpStore %210 %96 
                                Private f32* %211 = OpAccessChain %206 %41 
                                                      OpStore %211 %96 
                                Private f32* %213 = OpAccessChain %206 %212 
                                                      OpStore %213 %96 
                                                      OpBranch %106 
                                             %106 = OpLabel 
                                       f32_4 %215 = OpLoad %206 
                              Uniform f32_4* %216 = OpAccessChain %21 %62 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                Private f32* %219 = OpAccessChain %214 %32 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %214 %32 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpExtInst %1 43 %221 %222 %96 
                                Private f32* %224 = OpAccessChain %214 %32 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %58 
                                       f32_3 %226 = OpLoad %58 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %58 %32 
                                                      OpStore %228 %227 
                  read_only Texture2DSampled %230 = OpLoad %229 
                                       f32_3 %231 = OpLoad %58 
                                       f32_2 %232 = OpVectorShuffle %231 %231 0 0 
                                       f32_4 %233 = OpImageSampleImplicitLod %230 %232 
                                         f32 %234 = OpCompositeExtract %233 3 
                                Private f32* %235 = OpAccessChain %58 %32 
                                                      OpStore %235 %234 
                                Private f32* %236 = OpAccessChain %214 %32 
                                         f32 %237 = OpLoad %236 
                                Private f32* %238 = OpAccessChain %58 %32 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFMul %237 %239 
                                Private f32* %241 = OpAccessChain %58 %32 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %58 %32 
                                         f32 %243 = OpLoad %242 
                                Uniform f32* %245 = OpAccessChain %21 %244 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFMul %243 %246 
                                Private f32* %248 = OpAccessChain %58 %32 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %58 %32 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpExtInst %1 8 %250 
                                Private f32* %252 = OpAccessChain %58 %32 
                                                      OpStore %252 %251 
                                Private f32* %253 = OpAccessChain %58 %32 
                                         f32 %254 = OpLoad %253 
                                Uniform f32* %255 = OpAccessChain %21 %244 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFDiv %254 %256 
                                Private f32* %258 = OpAccessChain %58 %32 
                                                      OpStore %258 %257 
                                       f32_3 %259 = OpLoad %46 
                              Uniform f32_4* %261 = OpAccessChain %21 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFMul %259 %263 
                                                      OpStore %214 %264 
                                       f32_3 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 0 
                                       f32_2 %268 = OpFNegate %267 
                                       f32_3 %269 = OpLoad %58 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 0 
                                         f32 %271 = OpDot %268 %270 
                                                      OpStore %265 %271 
                                         f32 %272 = OpLoad %265 
                                       f32_3 %273 = OpCompositeConstruct %272 %272 %272 
                                       f32_3 %274 = OpLoad %214 
                                       f32_3 %275 = OpFMul %273 %274 
                                                      OpStore %214 %275 
                                       f32_3 %276 = OpLoad %214 
                                         f32 %281 = OpDot %276 %280 
                                                      OpStore %265 %281 
                                         f32 %282 = OpLoad %265 
                                         f32 %283 = OpLoad %265 
                                         f32 %284 = OpFMul %282 %283 
                                                      OpStore %265 %284 
                                         f32 %286 = OpLoad %265 
                                       f32_3 %287 = OpCompositeConstruct %286 %286 %286 
                                         f32 %288 = OpLoad %265 
                                       f32_3 %289 = OpCompositeConstruct %288 %288 %288 
                                       f32_3 %290 = OpFMul %287 %289 
                                       f32_3 %291 = OpLoad %214 
                                       f32_3 %292 = OpFNegate %291 
                                       f32_3 %293 = OpFAdd %290 %292 
                                                      OpStore %285 %293 
                                Uniform f32* %295 = OpAccessChain %21 %294 
                                         f32 %296 = OpLoad %295 
                                       f32_3 %297 = OpCompositeConstruct %296 %296 %296 
                                       f32_3 %298 = OpLoad %285 
                                       f32_3 %299 = OpFMul %297 %298 
                                       f32_3 %300 = OpLoad %214 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %9 %301 
                                       f32_3 %304 = OpLoad %9 
                                       f32_4 %305 = OpLoad %303 
                                       f32_4 %306 = OpVectorShuffle %305 %304 4 5 6 3 
                                                      OpStore %303 %306 
                                 Output f32* %308 = OpAccessChain %303 %212 
                                                      OpStore %308 %96 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
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
    u_xlat6 = u_xlat6 * _StepFactor;
    u_xlat6 = floor(u_xlat6);
    u_xlat6 = u_xlat6 / _StepFactor;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat6 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat6));
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1.xyz = vec3(u_xlat6) * vec3(u_xlat6) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                 Output f32* %252 = OpAccessChain %197 %138 %38 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %197 %138 %38 
                                                      OpStore %255 %254 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %55 %232 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 RelaxedPrecision 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 RelaxedPrecision 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpMemberDecorate %28 8 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %45 SpecId 45 
                                                      OpDecorate %55 Location 55 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
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
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %232 Location 232 
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
                                              %22 = OpTypeBool 
                                              %23 = OpTypePointer Private %22 
                                Private bool* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %19 %26 
                                              %28 = OpTypeStruct %19 %19 %19 %27 %7 %7 %19 %6 %6 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 2 
                                          u32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %6 
                                          f32 %37 = OpConstant 3.67402E-40 
                                         bool %39 = OpConstantFalse 
                                         bool %45 = OpSpecConstantFalse 
                                          u32 %48 = OpConstant 1 
                                              %52 = OpTypePointer Private %19 
                               Private f32_4* %53 = OpVariable Private 
                                              %54 = OpTypePointer Input %7 
                                 Input f32_3* %55 = OpVariable Input 
                                          i32 %58 = OpConstant 3 
                                          i32 %59 = OpConstant 1 
                                              %60 = OpTypePointer Uniform %19 
                                          i32 %67 = OpConstant 0 
                                              %98 = OpTypePointer Function %7 
                                         i32 %112 = OpConstant 5 
                                             %113 = OpTypePointer Uniform %7 
                                         i32 %122 = OpConstant 4 
                                             %128 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %134 = OpConstant 3.67402E-40 
                                Private f32* %136 = OpVariable Private 
                                         u32 %137 = OpConstant 2 
                                         f32 %140 = OpConstant 3.67402E-40 
                                             %147 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %148 = OpTypeSampledImage %147 
                                             %149 = OpTypePointer UniformConstant %148 
 UniformConstant read_only Texture3DSampled* %150 = OpVariable UniformConstant 
                              Private f32_4* %155 = OpVariable Private 
                                         u32 %161 = OpConstant 3 
                              Private f32_3* %163 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         i32 %176 = OpConstant 7 
                                         i32 %187 = OpConstant 6 
                                Private f32* %192 = OpVariable Private 
                                         f32 %205 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                         f32 %207 = OpConstant 3.67402E-40 
                                       f32_3 %208 = OpConstantComposite %205 %206 %207 
                              Private f32_3* %213 = OpVariable Private 
                              Private f32_3* %222 = OpVariable Private 
                                         i32 %223 = OpConstant 8 
                                             %231 = OpTypePointer Output %19 
                               Output f32_4* %232 = OpVariable Output 
                                             %236 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %99 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                 Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdEqual %36 %37 
                                                      OpStore %24 %38 
                                                      OpSelectionMerge %41 None 
                                                      OpBranchConditional %39 %40 %41 
                                              %40 = OpLabel 
                                         bool %42 = OpLoad %24 
                                                      OpSelectionMerge %44 None 
                                                      OpBranchConditional %42 %43 %44 
                                              %43 = OpLabel 
                                                      OpBranch %44 
                                              %44 = OpLabel 
                                                      OpBranch %41 
                                              %41 = OpLabel 
                                                      OpSelectionMerge %47 None 
                                                      OpBranchConditional %45 %46 %157 
                                              %46 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %30 %32 %48 
                                          f32 %50 = OpLoad %49 
                                         bool %51 = OpFOrdEqual %50 %37 
                                                      OpStore %24 %51 
                                        f32_3 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %30 %58 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %57 %63 
                                        f32_4 %65 = OpLoad %53 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %53 %66 
                               Uniform f32_4* %68 = OpAccessChain %30 %58 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                        f32_3 %71 = OpLoad %55 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 0 0 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %53 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %73 %75 
                                        f32_4 %77 = OpLoad %53 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %53 %78 
                               Uniform f32_4* %79 = OpAccessChain %30 %58 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %55 
                                        f32_3 %83 = OpVectorShuffle %82 %82 2 2 2 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %53 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %53 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %53 %89 
                                        f32_4 %90 = OpLoad %53 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %30 %58 %58 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %91 %94 
                                        f32_4 %96 = OpLoad %53 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %53 %97 
                                        bool %100 = OpLoad %24 
                                                      OpSelectionMerge %102 None 
                                                      OpBranchConditional %100 %101 %105 
                                             %101 = OpLabel 
                                       f32_4 %103 = OpLoad %53 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                                      OpStore %99 %104 
                                                      OpBranch %102 
                                             %105 = OpLabel 
                                       f32_3 %106 = OpLoad %55 
                                                      OpStore %99 %106 
                                                      OpBranch %102 
                                             %102 = OpLabel 
                                       f32_3 %107 = OpLoad %99 
                                       f32_4 %108 = OpLoad %53 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %53 %109 
                                       f32_4 %110 = OpLoad %53 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                              Uniform f32_3* %114 = OpAccessChain %30 %112 
                                       f32_3 %115 = OpLoad %114 
                                       f32_3 %116 = OpFNegate %115 
                                       f32_3 %117 = OpFAdd %111 %116 
                                       f32_4 %118 = OpLoad %53 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %53 %119 
                                       f32_4 %120 = OpLoad %53 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                              Uniform f32_3* %123 = OpAccessChain %30 %122 
                                       f32_3 %124 = OpLoad %123 
                                       f32_3 %125 = OpFMul %121 %124 
                                       f32_4 %126 = OpLoad %53 
                                       f32_4 %127 = OpVectorShuffle %126 %125 0 4 5 6 
                                                      OpStore %53 %127 
                                Private f32* %130 = OpAccessChain %53 %48 
                                         f32 %131 = OpLoad %130 
                                         f32 %133 = OpFMul %131 %132 
                                         f32 %135 = OpFAdd %133 %134 
                                                      OpStore %129 %135 
                                Uniform f32* %138 = OpAccessChain %30 %32 %137 
                                         f32 %139 = OpLoad %138 
                                         f32 %141 = OpFMul %139 %140 
                                         f32 %142 = OpFAdd %141 %134 
                                                      OpStore %136 %142 
                                         f32 %143 = OpLoad %129 
                                         f32 %144 = OpLoad %136 
                                         f32 %145 = OpExtInst %1 40 %143 %144 
                                Private f32* %146 = OpAccessChain %53 %33 
                                                      OpStore %146 %145 
                  read_only Texture3DSampled %151 = OpLoad %150 
                                       f32_4 %152 = OpLoad %53 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 2 3 
                                       f32_4 %154 = OpImageSampleImplicitLod %151 %153 
                                                      OpStore %53 %154 
                                       f32_4 %156 = OpLoad %53 
                                                      OpStore %155 %156 
                                                      OpBranch %47 
                                             %157 = OpLabel 
                                Private f32* %158 = OpAccessChain %155 %33 
                                                      OpStore %158 %37 
                                Private f32* %159 = OpAccessChain %155 %48 
                                                      OpStore %159 %37 
                                Private f32* %160 = OpAccessChain %155 %137 
                                                      OpStore %160 %37 
                                Private f32* %162 = OpAccessChain %155 %161 
                                                      OpStore %162 %37 
                                                      OpBranch %47 
                                              %47 = OpLabel 
                                       f32_4 %164 = OpLoad %155 
                              Uniform f32_4* %165 = OpAccessChain %30 %59 
                                       f32_4 %166 = OpLoad %165 
                                         f32 %167 = OpDot %164 %166 
                                Private f32* %168 = OpAccessChain %163 %33 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %163 %33 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpExtInst %1 43 %170 %171 %37 
                                Private f32* %173 = OpAccessChain %163 %33 
                                                      OpStore %173 %172 
                                Private f32* %174 = OpAccessChain %163 %33 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %30 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                                      OpStore %129 %179 
                                         f32 %180 = OpLoad %129 
                                         f32 %181 = OpExtInst %1 8 %180 
                                                      OpStore %129 %181 
                                         f32 %182 = OpLoad %129 
                                Uniform f32* %183 = OpAccessChain %30 %176 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFDiv %182 %184 
                                                      OpStore %129 %185 
                                       f32_3 %186 = OpLoad %9 
                              Uniform f32_4* %188 = OpAccessChain %30 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %163 %191 
                              Uniform f32_4* %193 = OpAccessChain %30 %67 
                                       f32_4 %194 = OpLoad %193 
                                       f32_2 %195 = OpVectorShuffle %194 %194 2 2 
                                       f32_2 %196 = OpFNegate %195 
                                         f32 %197 = OpLoad %129 
                                       f32_2 %198 = OpCompositeConstruct %197 %197 
                                         f32 %199 = OpDot %196 %198 
                                                      OpStore %192 %199 
                                         f32 %200 = OpLoad %192 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %163 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %163 %203 
                                       f32_3 %204 = OpLoad %163 
                                         f32 %209 = OpDot %204 %208 
                                                      OpStore %192 %209 
                                         f32 %210 = OpLoad %192 
                                         f32 %211 = OpLoad %192 
                                         f32 %212 = OpFMul %210 %211 
                                                      OpStore %192 %212 
                                         f32 %214 = OpLoad %192 
                                       f32_3 %215 = OpCompositeConstruct %214 %214 %214 
                                         f32 %216 = OpLoad %192 
                                       f32_3 %217 = OpCompositeConstruct %216 %216 %216 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %163 
                                       f32_3 %220 = OpFNegate %219 
                                       f32_3 %221 = OpFAdd %218 %220 
                                                      OpStore %213 %221 
                                Uniform f32* %224 = OpAccessChain %30 %223 
                                         f32 %225 = OpLoad %224 
                                       f32_3 %226 = OpCompositeConstruct %225 %225 %225 
                                       f32_3 %227 = OpLoad %213 
                                       f32_3 %228 = OpFMul %226 %227 
                                       f32_3 %229 = OpLoad %163 
                                       f32_3 %230 = OpFAdd %228 %229 
                                                      OpStore %222 %230 
                                       f32_3 %233 = OpLoad %222 
                                       f32_4 %234 = OpLoad %232 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                      OpStore %232 %235 
                                 Output f32* %237 = OpAccessChain %232 %161 
                                                      OpStore %237 %37 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat0.z;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb4 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb4){
        u_xlatb4 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat8 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat8, u_xlat4.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat4.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlatb8 = 0.0<u_xlat2.z;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat3.xy);
    u_xlat8 = u_xlat8 * u_xlat10_3.w;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat12));
    u_xlat8 = u_xlat8 * u_xlat10_2.w;
    u_xlat4.x = u_xlat4.x * u_xlat8;
    u_xlat4.x = u_xlat4.x * _StepFactor;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = u_xlat4.x / _StepFactor;
    u_xlat1.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat0.x = dot((-u_xlat0.xx), u_xlat4.xx);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.xyz = vec3(u_xlat12) * vec3(u_xlat12) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                 Output f32* %252 = OpAccessChain %197 %138 %38 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %197 %138 %38 
                                                      OpStore %255 %254 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 333
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %54 %326 
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
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %101 SpecId 101 
                                                      OpDecorate %190 DescriptorSet 190 
                                                      OpDecorate %190 Binding 190 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %249 DescriptorSet 249 
                                                      OpDecorate %249 Binding 249 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %326 Location 326 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Private %6 
                                          u32 %41 = OpConstant 2 
                               Private f32_3* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Input %52 
                                 Input f32_2* %54 = OpVariable Input 
                                              %58 = OpTypePointer Private %14 
                               Private f32_4* %59 = OpVariable Private 
                                          i32 %62 = OpConstant 7 
                                          i32 %63 = OpConstant 1 
                                          i32 %74 = OpConstant 2 
                                          i32 %83 = OpConstant 3 
                                              %87 = OpTypeBool 
                                              %88 = OpTypePointer Private %87 
                                Private bool* %89 = OpVariable Private 
                                              %90 = OpTypePointer Uniform %6 
                                          f32 %93 = OpConstant 3.67402E-40 
                                         bool %95 = OpConstantFalse 
                                        bool %101 = OpSpecConstantFalse 
                                         u32 %104 = OpConstant 1 
                              Private f32_3* %108 = OpVariable Private 
                              Private f32_4* %136 = OpVariable Private 
                                             %137 = OpTypePointer Function %7 
                                         i32 %150 = OpConstant 5 
                                             %151 = OpTypePointer Uniform %7 
                                         i32 %160 = OpConstant 4 
                                         f32 %168 = OpConstant 3.67402E-40 
                                         f32 %170 = OpConstant 3.67402E-40 
                                             %173 = OpTypePointer Private %52 
                              Private f32_2* %174 = OpVariable Private 
                                         f32 %177 = OpConstant 3.67402E-40 
                                             %187 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %188 = OpTypeSampledImage %187 
                                             %189 = OpTypePointer UniformConstant %188 
 UniformConstant read_only Texture3DSampled* %190 = OpVariable UniformConstant 
                              Private f32_4* %195 = OpVariable Private 
                                         u32 %201 = OpConstant 3 
                              Private f32_3* %203 = OpVariable Private 
                                         f32 %211 = OpConstant 3.67402E-40 
                               Private bool* %214 = OpVariable Private 
                                Private f32* %218 = OpVariable Private 
                                             %219 = OpTypePointer Function %6 
                                       f32_2 %232 = OpConstantComposite %177 %177 
                                Private f32* %234 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %235 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %249 = OpVariable UniformConstant 
                                         i32 %267 = OpConstant 8 
                                         i32 %283 = OpConstant 6 
                                Private f32* %288 = OpVariable Private 
                                         f32 %300 = OpConstant 3.67402E-40 
                                         f32 %301 = OpConstant 3.67402E-40 
                                         f32 %302 = OpConstant 3.67402E-40 
                                       f32_3 %303 = OpConstantComposite %300 %301 %302 
                              Private f32_3* %308 = OpVariable Private 
                                         i32 %317 = OpConstant 9 
                                             %325 = OpTypePointer Output %14 
                               Output f32_4* %326 = OpVariable Output 
                                             %330 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %138 = OpVariable Function 
                               Function f32* %220 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpLoad %9 
                                          f32 %31 = OpDot %29 %30 
                                 Private f32* %34 = OpAccessChain %9 %32 
                                                      OpStore %34 %31 
                                 Private f32* %35 = OpAccessChain %9 %32 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpExtInst %1 32 %36 
                                 Private f32* %38 = OpAccessChain %9 %32 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %32 
                                          f32 %40 = OpLoad %39 
                                 Private f32* %42 = OpAccessChain %9 %41 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %40 %43 
                                 Private f32* %45 = OpAccessChain %9 %32 
                                                      OpStore %45 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_2 %55 = OpLoad %54 
                                        f32_4 %56 = OpImageSampleImplicitLod %51 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %46 %57 
                                        f32_3 %60 = OpLoad %11 
                                        f32_4 %61 = OpVectorShuffle %60 %60 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %62 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %61 %65 
                                                      OpStore %59 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %62 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpLoad %11 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %59 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %59 %73 
                               Uniform f32_4* %75 = OpAccessChain %21 %62 %74 
                                        f32_4 %76 = OpLoad %75 
                                        f32_3 %77 = OpLoad %11 
                                        f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %59 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %59 %81 
                                        f32_4 %82 = OpLoad %59 
                               Uniform f32_4* %84 = OpAccessChain %21 %62 %83 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFAdd %82 %85 
                                                      OpStore %59 %86 
                                 Uniform f32* %91 = OpAccessChain %21 %74 %32 
                                          f32 %92 = OpLoad %91 
                                         bool %94 = OpFOrdEqual %92 %93 
                                                      OpStore %89 %94 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %97 
                                              %96 = OpLabel 
                                         bool %98 = OpLoad %89 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %100 
                                              %99 = OpLabel 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %197 
                                             %102 = OpLabel 
                                Uniform f32* %105 = OpAccessChain %21 %74 %104 
                                         f32 %106 = OpLoad %105 
                                        bool %107 = OpFOrdEqual %106 %93 
                                                      OpStore %89 %107 
                                       f32_3 %109 = OpLoad %11 
                                       f32_3 %110 = OpVectorShuffle %109 %109 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %21 %83 %63 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %110 %113 
                                                      OpStore %108 %114 
                              Uniform f32_4* %115 = OpAccessChain %21 %83 %23 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpLoad %11 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_3 %121 = OpLoad %108 
                                       f32_3 %122 = OpFAdd %120 %121 
                                                      OpStore %108 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %83 %74 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpLoad %11 
                                       f32_3 %127 = OpVectorShuffle %126 %126 2 2 2 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %108 
                                       f32_3 %130 = OpFAdd %128 %129 
                                                      OpStore %108 %130 
                                       f32_3 %131 = OpLoad %108 
                              Uniform f32_4* %132 = OpAccessChain %21 %83 %83 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFAdd %131 %134 
                                                      OpStore %108 %135 
                                        bool %139 = OpLoad %89 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %143 
                                             %140 = OpLabel 
                                       f32_3 %142 = OpLoad %108 
                                                      OpStore %138 %142 
                                                      OpBranch %141 
                                             %143 = OpLabel 
                                       f32_3 %144 = OpLoad %11 
                                                      OpStore %138 %144 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                       f32_3 %145 = OpLoad %138 
                                       f32_4 %146 = OpLoad %136 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %136 %147 
                                       f32_4 %148 = OpLoad %136 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                              Uniform f32_3* %152 = OpAccessChain %21 %150 
                                       f32_3 %153 = OpLoad %152 
                                       f32_3 %154 = OpFNegate %153 
                                       f32_3 %155 = OpFAdd %149 %154 
                                       f32_4 %156 = OpLoad %136 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 6 3 
                                                      OpStore %136 %157 
                                       f32_4 %158 = OpLoad %136 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                              Uniform f32_3* %161 = OpAccessChain %21 %160 
                                       f32_3 %162 = OpLoad %161 
                                       f32_3 %163 = OpFMul %159 %162 
                                       f32_4 %164 = OpLoad %136 
                                       f32_4 %165 = OpVectorShuffle %164 %163 0 4 5 6 
                                                      OpStore %136 %165 
                                Private f32* %166 = OpAccessChain %136 %104 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %171 = OpFAdd %169 %170 
                                Private f32* %172 = OpAccessChain %108 %32 
                                                      OpStore %172 %171 
                                Uniform f32* %175 = OpAccessChain %21 %74 %41 
                                         f32 %176 = OpLoad %175 
                                         f32 %178 = OpFMul %176 %177 
                                         f32 %179 = OpFAdd %178 %170 
                                Private f32* %180 = OpAccessChain %174 %32 
                                                      OpStore %180 %179 
                                Private f32* %181 = OpAccessChain %108 %32 
                                         f32 %182 = OpLoad %181 
                                Private f32* %183 = OpAccessChain %174 %32 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpExtInst %1 40 %182 %184 
                                Private f32* %186 = OpAccessChain %136 %32 
                                                      OpStore %186 %185 
                  read_only Texture3DSampled %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %136 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 2 3 
                                       f32_4 %194 = OpImageSampleImplicitLod %191 %193 
                                                      OpStore %136 %194 
                                       f32_4 %196 = OpLoad %136 
                                                      OpStore %195 %196 
                                                      OpBranch %103 
                                             %197 = OpLabel 
                                Private f32* %198 = OpAccessChain %195 %32 
                                                      OpStore %198 %93 
                                Private f32* %199 = OpAccessChain %195 %104 
                                                      OpStore %199 %93 
                                Private f32* %200 = OpAccessChain %195 %41 
                                                      OpStore %200 %93 
                                Private f32* %202 = OpAccessChain %195 %201 
                                                      OpStore %202 %93 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                       f32_4 %204 = OpLoad %195 
                              Uniform f32_4* %205 = OpAccessChain %21 %63 
                                       f32_4 %206 = OpLoad %205 
                                         f32 %207 = OpDot %204 %206 
                                Private f32* %208 = OpAccessChain %203 %32 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %203 %32 
                                         f32 %210 = OpLoad %209 
                                         f32 %212 = OpExtInst %1 43 %210 %211 %93 
                                Private f32* %213 = OpAccessChain %203 %32 
                                                      OpStore %213 %212 
                                Private f32* %215 = OpAccessChain %59 %41 
                                         f32 %216 = OpLoad %215 
                                        bool %217 = OpFOrdLessThan %211 %216 
                                                      OpStore %214 %217 
                                        bool %221 = OpLoad %214 
                                                      OpSelectionMerge %223 None 
                                                      OpBranchConditional %221 %222 %224 
                                             %222 = OpLabel 
                                                      OpStore %220 %93 
                                                      OpBranch %223 
                                             %224 = OpLabel 
                                                      OpStore %220 %211 
                                                      OpBranch %223 
                                             %223 = OpLabel 
                                         f32 %225 = OpLoad %220 
                                                      OpStore %218 %225 
                                       f32_4 %226 = OpLoad %59 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_4 %228 = OpLoad %59 
                                       f32_2 %229 = OpVectorShuffle %228 %228 3 3 
                                       f32_2 %230 = OpFDiv %227 %229 
                                                      OpStore %174 %230 
                                       f32_2 %231 = OpLoad %174 
                                       f32_2 %233 = OpFAdd %231 %232 
                                                      OpStore %174 %233 
                  read_only Texture2DSampled %236 = OpLoad %235 
                                       f32_2 %237 = OpLoad %174 
                                       f32_4 %238 = OpImageSampleImplicitLod %236 %237 
                                         f32 %239 = OpCompositeExtract %238 3 
                                                      OpStore %234 %239 
                                         f32 %240 = OpLoad %234 
                                         f32 %241 = OpLoad %218 
                                         f32 %242 = OpFMul %240 %241 
                                                      OpStore %218 %242 
                                       f32_4 %243 = OpLoad %59 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_4 %245 = OpLoad %59 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                         f32 %247 = OpDot %244 %246 
                                Private f32* %248 = OpAccessChain %59 %32 
                                                      OpStore %248 %247 
                  read_only Texture2DSampled %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %59 
                                       f32_2 %252 = OpVectorShuffle %251 %251 0 0 
                                       f32_4 %253 = OpImageSampleImplicitLod %250 %252 
                                         f32 %254 = OpCompositeExtract %253 3 
                                Private f32* %255 = OpAccessChain %59 %32 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %59 %32 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpLoad %218 
                                         f32 %259 = OpFMul %257 %258 
                                                      OpStore %218 %259 
                                Private f32* %260 = OpAccessChain %203 %32 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpLoad %218 
                                         f32 %263 = OpFMul %261 %262 
                                Private f32* %264 = OpAccessChain %203 %32 
                                                      OpStore %264 %263 
                                Private f32* %265 = OpAccessChain %203 %32 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %268 = OpAccessChain %21 %267 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFMul %266 %269 
                                Private f32* %271 = OpAccessChain %59 %32 
                                                      OpStore %271 %270 
                                Private f32* %272 = OpAccessChain %59 %32 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 8 %273 
                                Private f32* %275 = OpAccessChain %59 %32 
                                                      OpStore %275 %274 
                                Private f32* %276 = OpAccessChain %59 %32 
                                         f32 %277 = OpLoad %276 
                                Uniform f32* %278 = OpAccessChain %21 %267 
                                         f32 %279 = OpLoad %278 
                                         f32 %280 = OpFDiv %277 %279 
                                Private f32* %281 = OpAccessChain %59 %32 
                                                      OpStore %281 %280 
                                       f32_3 %282 = OpLoad %46 
                              Uniform f32_4* %284 = OpAccessChain %21 %283 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpFMul %282 %286 
                                                      OpStore %203 %287 
                                       f32_3 %289 = OpLoad %9 
                                       f32_2 %290 = OpVectorShuffle %289 %289 0 0 
                                       f32_2 %291 = OpFNegate %290 
                                       f32_4 %292 = OpLoad %59 
                                       f32_2 %293 = OpVectorShuffle %292 %292 0 0 
                                         f32 %294 = OpDot %291 %293 
                                                      OpStore %288 %294 
                                         f32 %295 = OpLoad %288 
                                       f32_3 %296 = OpCompositeConstruct %295 %295 %295 
                                       f32_3 %297 = OpLoad %203 
                                       f32_3 %298 = OpFMul %296 %297 
                                                      OpStore %203 %298 
                                       f32_3 %299 = OpLoad %203 
                                         f32 %304 = OpDot %299 %303 
                                                      OpStore %288 %304 
                                         f32 %305 = OpLoad %288 
                                         f32 %306 = OpLoad %288 
                                         f32 %307 = OpFMul %305 %306 
                                                      OpStore %288 %307 
                                         f32 %309 = OpLoad %288 
                                       f32_3 %310 = OpCompositeConstruct %309 %309 %309 
                                         f32 %311 = OpLoad %288 
                                       f32_3 %312 = OpCompositeConstruct %311 %311 %311 
                                       f32_3 %313 = OpFMul %310 %312 
                                       f32_3 %314 = OpLoad %203 
                                       f32_3 %315 = OpFNegate %314 
                                       f32_3 %316 = OpFAdd %313 %315 
                                                      OpStore %308 %316 
                                Uniform f32* %318 = OpAccessChain %21 %317 
                                         f32 %319 = OpLoad %318 
                                       f32_3 %320 = OpCompositeConstruct %319 %319 %319 
                                       f32_3 %321 = OpLoad %308 
                                       f32_3 %322 = OpFMul %320 %321 
                                       f32_3 %323 = OpLoad %203 
                                       f32_3 %324 = OpFAdd %322 %323 
                                                      OpStore %9 %324 
                                       f32_3 %327 = OpLoad %9 
                                       f32_4 %328 = OpLoad %326 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %326 %329 
                                 Output f32* %331 = OpAccessChain %326 %201 
                                                      OpStore %331 %93 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat16_4;
float u_xlat6;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat0.z;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
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
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_3 = texture(_LightTexture0, u_xlat4.xyz);
    u_xlat16_4 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat4.x = u_xlat13 * u_xlat16_4;
    u_xlat4.x = u_xlat4.x * _StepFactor;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = u_xlat4.x / _StepFactor;
    u_xlat1.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat0.x = dot((-u_xlat0.xx), u_xlat4.xx);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.xyz = vec3(u_xlat12) * vec3(u_xlat12) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                 Output f32* %252 = OpAccessChain %197 %138 %38 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %197 %138 %38 
                                                      OpStore %255 %254 
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
                                                      OpEntryPoint Fragment %4 "main" %11 %54 %315 
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
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %104 SpecId 104 
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
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %315 Location 315 
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
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Private %6 
                                          u32 %41 = OpConstant 2 
                               Private f32_3* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Input %52 
                                 Input f32_2* %54 = OpVariable Input 
                               Private f32_3* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 7 
                                          i32 %62 = OpConstant 1 
                                          i32 %75 = OpConstant 2 
                                          i32 %85 = OpConstant 3 
                                              %90 = OpTypeBool 
                                              %91 = OpTypePointer Private %90 
                                Private bool* %92 = OpVariable Private 
                                              %93 = OpTypePointer Uniform %6 
                                          f32 %96 = OpConstant 3.67402E-40 
                                         bool %98 = OpConstantFalse 
                                        bool %104 = OpSpecConstantFalse 
                                         u32 %107 = OpConstant 1 
                                             %111 = OpTypePointer Private %14 
                              Private f32_4* %112 = OpVariable Private 
                                             %151 = OpTypePointer Function %7 
                                         i32 %165 = OpConstant 5 
                                             %166 = OpTypePointer Uniform %7 
                                         i32 %175 = OpConstant 4 
                                Private f32* %181 = OpVariable Private 
                                         f32 %184 = OpConstant 3.67402E-40 
                                         f32 %186 = OpConstant 3.67402E-40 
                                Private f32* %188 = OpVariable Private 
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
                                         i32 %256 = OpConstant 8 
                                         i32 %272 = OpConstant 6 
                                Private f32* %277 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                                         f32 %290 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                       f32_3 %292 = OpConstantComposite %289 %290 %291 
                              Private f32_3* %297 = OpVariable Private 
                                         i32 %306 = OpConstant 9 
                                             %314 = OpTypePointer Output %14 
                               Output f32_4* %315 = OpVariable Output 
                                             %319 = OpTypePointer Output %6 
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
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpLoad %9 
                                          f32 %31 = OpDot %29 %30 
                                 Private f32* %34 = OpAccessChain %9 %32 
                                                      OpStore %34 %31 
                                 Private f32* %35 = OpAccessChain %9 %32 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpExtInst %1 32 %36 
                                 Private f32* %38 = OpAccessChain %9 %32 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %32 
                                          f32 %40 = OpLoad %39 
                                 Private f32* %42 = OpAccessChain %9 %41 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %40 %43 
                                 Private f32* %45 = OpAccessChain %9 %32 
                                                      OpStore %45 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_2 %55 = OpLoad %54 
                                        f32_4 %56 = OpImageSampleImplicitLod %51 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %46 %57 
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
                                 Uniform f32* %94 = OpAccessChain %21 %75 %32 
                                          f32 %95 = OpLoad %94 
                                         bool %97 = OpFOrdEqual %95 %96 
                                                      OpStore %92 %97 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %100 
                                              %99 = OpLabel 
                                        bool %101 = OpLoad %92 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %103 
                                             %102 = OpLabel 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                                      OpSelectionMerge %106 None 
                                                      OpBranchConditional %104 %105 %208 
                                             %105 = OpLabel 
                                Uniform f32* %108 = OpAccessChain %21 %75 %107 
                                         f32 %109 = OpLoad %108 
                                        bool %110 = OpFOrdEqual %109 %96 
                                                      OpStore %92 %110 
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
                                Private f32* %182 = OpAccessChain %112 %107 
                                         f32 %183 = OpLoad %182 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %181 %187 
                                Uniform f32* %189 = OpAccessChain %21 %75 %41 
                                         f32 %190 = OpLoad %189 
                                         f32 %192 = OpFMul %190 %191 
                                         f32 %193 = OpFAdd %192 %186 
                                                      OpStore %188 %193 
                                         f32 %194 = OpLoad %181 
                                         f32 %195 = OpLoad %188 
                                         f32 %196 = OpExtInst %1 40 %194 %195 
                                Private f32* %197 = OpAccessChain %112 %32 
                                                      OpStore %197 %196 
                  read_only Texture3DSampled %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %112 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
                                       f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                      OpStore %112 %205 
                                       f32_4 %207 = OpLoad %112 
                                                      OpStore %206 %207 
                                                      OpBranch %106 
                                             %208 = OpLabel 
                                Private f32* %209 = OpAccessChain %206 %32 
                                                      OpStore %209 %96 
                                Private f32* %210 = OpAccessChain %206 %107 
                                                      OpStore %210 %96 
                                Private f32* %211 = OpAccessChain %206 %41 
                                                      OpStore %211 %96 
                                Private f32* %213 = OpAccessChain %206 %212 
                                                      OpStore %213 %96 
                                                      OpBranch %106 
                                             %106 = OpLabel 
                                       f32_4 %215 = OpLoad %206 
                              Uniform f32_4* %216 = OpAccessChain %21 %62 
                                       f32_4 %217 = OpLoad %216 
                                         f32 %218 = OpDot %215 %217 
                                Private f32* %219 = OpAccessChain %214 %32 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %214 %32 
                                         f32 %221 = OpLoad %220 
                                         f32 %223 = OpExtInst %1 43 %221 %222 %96 
                                Private f32* %224 = OpAccessChain %214 %32 
                                                      OpStore %224 %223 
                                       f32_3 %225 = OpLoad %58 
                                       f32_3 %226 = OpLoad %58 
                                         f32 %227 = OpDot %225 %226 
                                                      OpStore %181 %227 
                  read_only Texture2DSampled %229 = OpLoad %228 
                                         f32 %230 = OpLoad %181 
                                       f32_2 %231 = OpCompositeConstruct %230 %230 
                                       f32_4 %232 = OpImageSampleImplicitLod %229 %231 
                                         f32 %233 = OpCompositeExtract %232 3 
                                                      OpStore %181 %233 
                read_only TextureCubeSampled %238 = OpLoad %237 
                                       f32_3 %239 = OpLoad %58 
                                       f32_4 %240 = OpImageSampleImplicitLod %238 %239 
                                         f32 %241 = OpCompositeExtract %240 3 
                                Private f32* %242 = OpAccessChain %58 %32 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %58 %32 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpLoad %181 
                                         f32 %246 = OpFMul %244 %245 
                                Private f32* %247 = OpAccessChain %58 %32 
                                                      OpStore %247 %246 
                                Private f32* %248 = OpAccessChain %214 %32 
                                         f32 %249 = OpLoad %248 
                                Private f32* %250 = OpAccessChain %58 %32 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpFMul %249 %251 
                                Private f32* %253 = OpAccessChain %58 %32 
                                                      OpStore %253 %252 
                                Private f32* %254 = OpAccessChain %58 %32 
                                         f32 %255 = OpLoad %254 
                                Uniform f32* %257 = OpAccessChain %21 %256 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %255 %258 
                                Private f32* %260 = OpAccessChain %58 %32 
                                                      OpStore %260 %259 
                                Private f32* %261 = OpAccessChain %58 %32 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpExtInst %1 8 %262 
                                Private f32* %264 = OpAccessChain %58 %32 
                                                      OpStore %264 %263 
                                Private f32* %265 = OpAccessChain %58 %32 
                                         f32 %266 = OpLoad %265 
                                Uniform f32* %267 = OpAccessChain %21 %256 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFDiv %266 %268 
                                Private f32* %270 = OpAccessChain %58 %32 
                                                      OpStore %270 %269 
                                       f32_3 %271 = OpLoad %46 
                              Uniform f32_4* %273 = OpAccessChain %21 %272 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpFMul %271 %275 
                                                      OpStore %214 %276 
                                       f32_3 %278 = OpLoad %9 
                                       f32_2 %279 = OpVectorShuffle %278 %278 0 0 
                                       f32_2 %280 = OpFNegate %279 
                                       f32_3 %281 = OpLoad %58 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 0 
                                         f32 %283 = OpDot %280 %282 
                                                      OpStore %277 %283 
                                         f32 %284 = OpLoad %277 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                       f32_3 %286 = OpLoad %214 
                                       f32_3 %287 = OpFMul %285 %286 
                                                      OpStore %214 %287 
                                       f32_3 %288 = OpLoad %214 
                                         f32 %293 = OpDot %288 %292 
                                                      OpStore %277 %293 
                                         f32 %294 = OpLoad %277 
                                         f32 %295 = OpLoad %277 
                                         f32 %296 = OpFMul %294 %295 
                                                      OpStore %277 %296 
                                         f32 %298 = OpLoad %277 
                                       f32_3 %299 = OpCompositeConstruct %298 %298 %298 
                                         f32 %300 = OpLoad %277 
                                       f32_3 %301 = OpCompositeConstruct %300 %300 %300 
                                       f32_3 %302 = OpFMul %299 %301 
                                       f32_3 %303 = OpLoad %214 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %302 %304 
                                                      OpStore %297 %305 
                                Uniform f32* %307 = OpAccessChain %21 %306 
                                         f32 %308 = OpLoad %307 
                                       f32_3 %309 = OpCompositeConstruct %308 %308 %308 
                                       f32_3 %310 = OpLoad %297 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_3 %312 = OpLoad %214 
                                       f32_3 %313 = OpFAdd %311 %312 
                                                      OpStore %9 %313 
                                       f32_3 %316 = OpLoad %9 
                                       f32_4 %317 = OpLoad %315 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore %315 %318 
                                 Output f32* %320 = OpAccessChain %315 %212 
                                                      OpStore %320 %96 
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
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform 	vec4 _MainTex_ST;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
float u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = (-_Displacement) + 75.0;
    u_xlat4.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat4.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat4.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_NormalBuffer, u_xlat4.xy, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + (-in_NORMAL0.xyz);
    u_xlat4.xyz = vec3(_UseBuffer) * u_xlat4.xyz + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat0 = u_xlat1.z / u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat1.xy = vec2(u_xlat0) * u_xlat1.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat2.xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat4.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
uniform 	float _StepFactor;
uniform 	float _DesatPhase;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
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
    u_xlat9 = u_xlat9 * _StepFactor;
    u_xlat9 = floor(u_xlat9);
    u_xlat9 = u_xlat9 / _StepFactor;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
    u_xlat9 = dot((-_WorldSpaceLightPos0.zz), vec2(u_xlat9));
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * vec3(u_xlat9) + (-u_xlat0.xyz);
    SV_Target0.xyz = vec3(vec3(_DesatPhase, _DesatPhase, _DesatPhase)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %31 %57 %69 %88 %165 %197 %208 %245 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 RelaxedPrecision 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %31 Location 31 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %165 Location 165 
                                                      OpMemberDecorate %195 0 BuiltIn 195 
                                                      OpMemberDecorate %195 1 BuiltIn 195 
                                                      OpMemberDecorate %195 2 BuiltIn 195 
                                                      OpDecorate %195 Block 
                                                      OpDecorate %208 Location 208 
                                                      OpDecorate %245 Location 245 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 4 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %9 %11 
                                              %13 = OpTypeArray %9 %11 
                                              %14 = OpTypeArray %9 %11 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %12 %13 %14 %6 %15 %6 %9 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 3 
                                              %21 = OpTypePointer Uniform %6 
                                          f32 %25 = OpConstant 3.67402E-40 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Private %27 
                               Private f32_3* %29 = OpVariable Private 
                                              %30 = OpTypePointer Input %9 
                                 Input f32_4* %31 = OpVariable Input 
                                          i32 %34 = OpConstant 4 
                                          u32 %35 = OpConstant 0 
                                          u32 %38 = OpConstant 1 
                                              %45 = OpTypePointer Private %9 
                               Private f32_4* %46 = OpVariable Private 
                                              %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %48 = OpTypeSampledImage %47 
                                              %49 = OpTypePointer UniformConstant %48 
  UniformConstant read_only Texture2DSampled* %50 = OpVariable UniformConstant 
                                          f32 %54 = OpConstant 3.67402E-40 
                                 Input f32_4* %57 = OpVariable Input 
                                          i32 %61 = OpConstant 5 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                              %87 = OpTypePointer Input %27 
                                 Input f32_3* %88 = OpVariable Input 
                                         u32 %117 = OpConstant 2 
                                         f32 %123 = OpConstant 3.67402E-40 
                              Private f32_4* %135 = OpVariable Private 
                                         i32 %138 = OpConstant 0 
                                         i32 %139 = OpConstant 1 
                                             %140 = OpTypePointer Uniform %9 
                                         i32 %151 = OpConstant 2 
                              Private f32_4* %159 = OpVariable Private 
                                             %164 = OpTypePointer Output %27 
                               Output f32_3* %165 = OpVariable Output 
                                             %194 = OpTypeArray %6 %38 
                                             %195 = OpTypeStruct %9 %6 %194 
                                             %196 = OpTypePointer Output %195 
        Output struct {f32_4; f32; f32[1];}* %197 = OpVariable Output 
                                             %205 = OpTypePointer Output %9 
                                             %207 = OpTypePointer Output %15 
                               Output f32_2* %208 = OpVariable Output 
                                         i32 %211 = OpConstant 6 
                               Output f32_3* %245 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                          f32 %24 = OpFNegate %23 
                                          f32 %26 = OpFAdd %24 %25 
                                                      OpStore %8 %26 
                                        f32_4 %32 = OpLoad %31 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                 Uniform f32* %36 = OpAccessChain %18 %34 %35 
                                          f32 %37 = OpLoad %36 
                                 Uniform f32* %39 = OpAccessChain %18 %34 %38 
                                          f32 %40 = OpLoad %39 
                                        f32_2 %41 = OpCompositeConstruct %37 %40 
                                        f32_2 %42 = OpFAdd %33 %41 
                                        f32_3 %43 = OpLoad %29 
                                        f32_3 %44 = OpVectorShuffle %43 %42 3 4 2 
                                                      OpStore %29 %44 
                   read_only Texture2DSampled %51 = OpLoad %50 
                                        f32_3 %52 = OpLoad %29 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_4 %55 = OpImageSampleExplicitLod %51 %53 Lod %9 
                                                      OpStore %46 %55 
                                        f32_4 %56 = OpLoad %46 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFNegate %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %46 %60 
                                 Uniform f32* %62 = OpAccessChain %18 %61 
                                          f32 %63 = OpLoad %62 
                                        f32_4 %64 = OpCompositeConstruct %63 %63 %63 %63 
                                        f32_4 %65 = OpLoad %46 
                                        f32_4 %66 = OpFMul %64 %65 
                                        f32_4 %67 = OpLoad %57 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %46 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %18 %34 %35 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %18 %34 %38 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_3 %78 = OpLoad %29 
                                        f32_3 %79 = OpVectorShuffle %78 %77 3 4 2 
                                                      OpStore %29 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_3 %82 = OpLoad %29 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                                      OpStore %29 %85 
                                        f32_3 %86 = OpLoad %29 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %86 %90 
                                                      OpStore %29 %91 
                                 Uniform f32* %92 = OpAccessChain %18 %61 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %93 %93 %93 
                                        f32_3 %95 = OpLoad %29 
                                        f32_3 %96 = OpFMul %94 %95 
                                        f32_3 %97 = OpLoad %88 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %29 %98 
                                        f32_3 %99 = OpLoad %29 
                                Uniform f32* %100 = OpAccessChain %18 %20 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %18 %20 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %18 %20 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %99 %110 
                                       f32_4 %112 = OpLoad %46 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %46 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %46 %116 
                                Private f32* %118 = OpAccessChain %46 %117 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpLoad %8 
                                         f32 %121 = OpFDiv %119 %120 
                                                      OpStore %8 %121 
                                         f32 %122 = OpLoad %8 
                                         f32 %124 = OpExtInst %1 43 %122 %54 %123 
                                                      OpStore %8 %124 
                                         f32 %125 = OpLoad %8 
                                         f32 %126 = OpFNegate %125 
                                         f32 %127 = OpFAdd %126 %123 
                                                      OpStore %8 %127 
                                         f32 %128 = OpLoad %8 
                                       f32_2 %129 = OpCompositeConstruct %128 %128 
                                       f32_4 %130 = OpLoad %46 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %46 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 2 3 
                                                      OpStore %46 %134 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %18 %138 %139 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %137 %142 
                                                      OpStore %135 %143 
                              Uniform f32_4* %144 = OpAccessChain %18 %138 %138 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %135 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %135 %150 
                              Uniform f32_4* %152 = OpAccessChain %18 %138 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %154 = OpLoad %46 
                                       f32_4 %155 = OpVectorShuffle %154 %154 2 2 2 2 
                                       f32_4 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %135 
                                       f32_4 %158 = OpFAdd %156 %157 
                                                      OpStore %135 %158 
                                       f32_4 %160 = OpLoad %135 
                              Uniform f32_4* %161 = OpAccessChain %18 %138 %20 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %159 %163 
                              Uniform f32_4* %166 = OpAccessChain %18 %138 %20 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_4 %169 = OpLoad %46 
                                       f32_3 %170 = OpVectorShuffle %169 %169 3 3 3 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %135 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                                      OpStore %165 %174 
                                       f32_4 %175 = OpLoad %159 
                                       f32_4 %176 = OpVectorShuffle %175 %175 1 1 1 1 
                              Uniform f32_4* %177 = OpAccessChain %18 %151 %139 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFMul %176 %178 
                                                      OpStore %46 %179 
                              Uniform f32_4* %180 = OpAccessChain %18 %151 %138 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpLoad %159 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
                                       f32_4 %184 = OpFMul %181 %183 
                                       f32_4 %185 = OpLoad %46 
                                       f32_4 %186 = OpFAdd %184 %185 
                                                      OpStore %46 %186 
                              Uniform f32_4* %187 = OpAccessChain %18 %151 %151 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %159 
                                       f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                                       f32_4 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %46 
                                       f32_4 %193 = OpFAdd %191 %192 
                                                      OpStore %46 %193 
                              Uniform f32_4* %198 = OpAccessChain %18 %151 %20 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %159 
                                       f32_4 %201 = OpVectorShuffle %200 %200 3 3 3 3 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %46 
                                       f32_4 %204 = OpFAdd %202 %203 
                               Output f32_4* %206 = OpAccessChain %197 %138 
                                                      OpStore %206 %204 
                                       f32_4 %209 = OpLoad %31 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                              Uniform f32_4* %212 = OpAccessChain %18 %211 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFMul %210 %214 
                              Uniform f32_4* %216 = OpAccessChain %18 %211 
                                       f32_4 %217 = OpLoad %216 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                                       f32_2 %219 = OpFAdd %215 %218 
                                                      OpStore %208 %219 
                                       f32_3 %220 = OpLoad %29 
                              Uniform f32_4* %221 = OpAccessChain %18 %139 %138 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %220 %223 
                                Private f32* %225 = OpAccessChain %46 %35 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %29 
                              Uniform f32_4* %227 = OpAccessChain %18 %139 %139 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpDot %226 %229 
                                Private f32* %231 = OpAccessChain %46 %38 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %29 
                              Uniform f32_4* %233 = OpAccessChain %18 %139 %151 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                         f32 %236 = OpDot %232 %235 
                                Private f32* %237 = OpAccessChain %46 %117 
                                                      OpStore %237 %236 
                                       f32_4 %238 = OpLoad %46 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_4 %240 = OpLoad %46 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                         f32 %242 = OpDot %239 %241 
                                                      OpStore %8 %242 
                                         f32 %243 = OpLoad %8 
                                         f32 %244 = OpExtInst %1 32 %243 
                                                      OpStore %8 %244 
                                         f32 %246 = OpLoad %8 
                                       f32_3 %247 = OpCompositeConstruct %246 %246 %246 
                                       f32_4 %248 = OpLoad %46 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %245 %250 
                                 Output f32* %252 = OpAccessChain %197 %138 %38 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %197 %138 %38 
                                                      OpStore %255 %254 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 278
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %25 %271 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %25 Location 25 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %32 0 RelaxedPrecision 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 RelaxedPrecision 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 RelaxedPrecision 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpMemberDecorate %32 8 Offset 32 
                                                      OpMemberDecorate %32 9 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %82 SpecId 82 
                                                      OpDecorate %181 DescriptorSet 181 
                                                      OpDecorate %181 Binding 181 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
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
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %271 Location 271 
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
                                              %22 = OpTypePointer Private %15 
                               Private f32_2* %23 = OpVariable Private 
                                              %24 = OpTypePointer Input %7 
                                 Input f32_3* %25 = OpVariable Input 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %19 %29 
                                              %31 = OpTypeArray %19 %29 
                                              %32 = OpTypeStruct %19 %19 %19 %30 %7 %7 %19 %31 %6 %6 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 7 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %19 
                                          i32 %43 = OpConstant 0 
                                          i32 %52 = OpConstant 2 
                                          i32 %62 = OpConstant 3 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Uniform %6 
                                          f32 %74 = OpConstant 3.67402E-40 
                                         bool %76 = OpConstantFalse 
                                         bool %82 = OpSpecConstantFalse 
                                          u32 %85 = OpConstant 1 
                                              %89 = OpTypePointer Private %19 
                               Private f32_4* %90 = OpVariable Private 
                                             %129 = OpTypePointer Function %7 
                                         i32 %143 = OpConstant 5 
                                             %144 = OpTypePointer Uniform %7 
                                         i32 %153 = OpConstant 4 
                                             %159 = OpTypePointer Private %6 
                                Private f32* %160 = OpVariable Private 
                                         f32 %163 = OpConstant 3.67402E-40 
                                         f32 %165 = OpConstant 3.67402E-40 
                                Private f32* %167 = OpVariable Private 
                                         u32 %168 = OpConstant 2 
                                         f32 %171 = OpConstant 3.67402E-40 
                                             %178 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %179 = OpTypeSampledImage %178 
                                             %180 = OpTypePointer UniformConstant %179 
 UniformConstant read_only Texture3DSampled* %181 = OpVariable UniformConstant 
                              Private f32_4* %186 = OpVariable Private 
                                         u32 %192 = OpConstant 3 
                              Private f32_3* %194 = OpVariable Private 
                                         f32 %202 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %205 = OpVariable UniformConstant 
                                         i32 %215 = OpConstant 8 
                                         i32 %226 = OpConstant 6 
                                Private f32* %231 = OpVariable Private 
                                         f32 %244 = OpConstant 3.67402E-40 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %246 = OpConstant 3.67402E-40 
                                       f32_3 %247 = OpConstantComposite %244 %245 %246 
                              Private f32_3* %252 = OpVariable Private 
                              Private f32_3* %261 = OpVariable Private 
                                         i32 %262 = OpConstant 9 
                                             %270 = OpTypePointer Output %19 
                               Output f32_4* %271 = OpVariable Output 
                                             %275 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %130 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                               Uniform f32_4* %39 = OpAccessChain %34 %36 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %27 %41 
                                                      OpStore %23 %42 
                               Uniform f32_4* %44 = OpAccessChain %34 %36 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_3 %47 = OpLoad %25 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 0 
                                        f32_2 %49 = OpFMul %46 %48 
                                        f32_2 %50 = OpLoad %23 
                                        f32_2 %51 = OpFAdd %49 %50 
                                                      OpStore %23 %51 
                               Uniform f32_4* %53 = OpAccessChain %34 %36 %52 
                                        f32_4 %54 = OpLoad %53 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                        f32_3 %56 = OpLoad %25 
                                        f32_2 %57 = OpVectorShuffle %56 %56 2 2 
                                        f32_2 %58 = OpFMul %55 %57 
                                        f32_2 %59 = OpLoad %23 
                                        f32_2 %60 = OpFAdd %58 %59 
                                                      OpStore %23 %60 
                                        f32_2 %61 = OpLoad %23 
                               Uniform f32_4* %63 = OpAccessChain %34 %36 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpFAdd %61 %65 
                                                      OpStore %23 %66 
                                 Uniform f32* %72 = OpAccessChain %34 %52 %70 
                                          f32 %73 = OpLoad %72 
                                         bool %75 = OpFOrdEqual %73 %74 
                                                      OpStore %69 %75 
                                                      OpSelectionMerge %78 None 
                                                      OpBranchConditional %76 %77 %78 
                                              %77 = OpLabel 
                                         bool %79 = OpLoad %69 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpBranch %81 
                                              %81 = OpLabel 
                                                      OpBranch %78 
                                              %78 = OpLabel 
                                                      OpSelectionMerge %84 None 
                                                      OpBranchConditional %82 %83 %188 
                                              %83 = OpLabel 
                                 Uniform f32* %86 = OpAccessChain %34 %52 %85 
                                          f32 %87 = OpLoad %86 
                                         bool %88 = OpFOrdEqual %87 %74 
                                                      OpStore %69 %88 
                                        f32_3 %91 = OpLoad %25 
                                        f32_3 %92 = OpVectorShuffle %91 %91 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %34 %62 %37 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %90 
                                        f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                                      OpStore %90 %98 
                               Uniform f32_4* %99 = OpAccessChain %34 %62 %43 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpLoad %25 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 0 0 
                                       f32_3 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %90 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %90 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %90 %109 
                              Uniform f32_4* %110 = OpAccessChain %34 %62 %52 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpLoad %25 
                                       f32_3 %114 = OpVectorShuffle %113 %113 2 2 2 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %90 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %90 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %90 %120 
                                       f32_4 %121 = OpLoad %90 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_4* %123 = OpAccessChain %34 %62 %62 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFAdd %122 %125 
                                       f32_4 %127 = OpLoad %90 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %90 %128 
                                        bool %131 = OpLoad %69 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %136 
                                             %132 = OpLabel 
                                       f32_4 %134 = OpLoad %90 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                                      OpStore %130 %135 
                                                      OpBranch %133 
                                             %136 = OpLabel 
                                       f32_3 %137 = OpLoad %25 
                                                      OpStore %130 %137 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                       f32_3 %138 = OpLoad %130 
                                       f32_4 %139 = OpLoad %90 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %90 %140 
                                       f32_4 %141 = OpLoad %90 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              Uniform f32_3* %145 = OpAccessChain %34 %143 
                                       f32_3 %146 = OpLoad %145 
                                       f32_3 %147 = OpFNegate %146 
                                       f32_3 %148 = OpFAdd %142 %147 
                                       f32_4 %149 = OpLoad %90 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %90 %150 
                                       f32_4 %151 = OpLoad %90 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_3* %154 = OpAccessChain %34 %153 
                                       f32_3 %155 = OpLoad %154 
                                       f32_3 %156 = OpFMul %152 %155 
                                       f32_4 %157 = OpLoad %90 
                                       f32_4 %158 = OpVectorShuffle %157 %156 0 4 5 6 
                                                      OpStore %90 %158 
                                Private f32* %161 = OpAccessChain %90 %85 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                         f32 %166 = OpFAdd %164 %165 
                                                      OpStore %160 %166 
                                Uniform f32* %169 = OpAccessChain %34 %52 %168 
                                         f32 %170 = OpLoad %169 
                                         f32 %172 = OpFMul %170 %171 
                                         f32 %173 = OpFAdd %172 %165 
                                                      OpStore %167 %173 
                                         f32 %174 = OpLoad %160 
                                         f32 %175 = OpLoad %167 
                                         f32 %176 = OpExtInst %1 40 %174 %175 
                                Private f32* %177 = OpAccessChain %90 %70 
                                                      OpStore %177 %176 
                  read_only Texture3DSampled %182 = OpLoad %181 
                                       f32_4 %183 = OpLoad %90 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 2 3 
                                       f32_4 %185 = OpImageSampleImplicitLod %182 %184 
                                                      OpStore %90 %185 
                                       f32_4 %187 = OpLoad %90 
                                                      OpStore %186 %187 
                                                      OpBranch %84 
                                             %188 = OpLabel 
                                Private f32* %189 = OpAccessChain %186 %70 
                                                      OpStore %189 %74 
                                Private f32* %190 = OpAccessChain %186 %85 
                                                      OpStore %190 %74 
                                Private f32* %191 = OpAccessChain %186 %168 
                                                      OpStore %191 %74 
                                Private f32* %193 = OpAccessChain %186 %192 
                                                      OpStore %193 %74 
                                                      OpBranch %84 
                                              %84 = OpLabel 
                                       f32_4 %195 = OpLoad %186 
                              Uniform f32_4* %196 = OpAccessChain %34 %37 
                                       f32_4 %197 = OpLoad %196 
                                         f32 %198 = OpDot %195 %197 
                                Private f32* %199 = OpAccessChain %194 %70 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %194 %70 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpExtInst %1 43 %201 %202 %74 
                                Private f32* %204 = OpAccessChain %194 %70 
                                                      OpStore %204 %203 
                  read_only Texture2DSampled %206 = OpLoad %205 
                                       f32_2 %207 = OpLoad %23 
                                       f32_4 %208 = OpImageSampleImplicitLod %206 %207 
                                         f32 %209 = OpCompositeExtract %208 3 
                                                      OpStore %160 %209 
                                Private f32* %210 = OpAccessChain %194 %70 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpLoad %160 
                                         f32 %213 = OpFMul %211 %212 
                                                      OpStore %160 %213 
                                         f32 %214 = OpLoad %160 
                                Uniform f32* %216 = OpAccessChain %34 %215 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %214 %217 
                                                      OpStore %160 %218 
                                         f32 %219 = OpLoad %160 
                                         f32 %220 = OpExtInst %1 8 %219 
                                                      OpStore %160 %220 
                                         f32 %221 = OpLoad %160 
                                Uniform f32* %222 = OpAccessChain %34 %215 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFDiv %221 %223 
                                                      OpStore %160 %224 
                                       f32_3 %225 = OpLoad %9 
                              Uniform f32_4* %227 = OpAccessChain %34 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %225 %229 
                                                      OpStore %194 %230 
                              Uniform f32_4* %232 = OpAccessChain %34 %43 
                                       f32_4 %233 = OpLoad %232 
                                       f32_2 %234 = OpVectorShuffle %233 %233 2 2 
                                       f32_2 %235 = OpFNegate %234 
                                         f32 %236 = OpLoad %160 
                                       f32_2 %237 = OpCompositeConstruct %236 %236 
                                         f32 %238 = OpDot %235 %237 
                                                      OpStore %231 %238 
                                         f32 %239 = OpLoad %231 
                                       f32_3 %240 = OpCompositeConstruct %239 %239 %239 
                                       f32_3 %241 = OpLoad %194 
                                       f32_3 %242 = OpFMul %240 %241 
                                                      OpStore %194 %242 
                                       f32_3 %243 = OpLoad %194 
                                         f32 %248 = OpDot %243 %247 
                                                      OpStore %231 %248 
                                         f32 %249 = OpLoad %231 
                                         f32 %250 = OpLoad %231 
                                         f32 %251 = OpFMul %249 %250 
                                                      OpStore %231 %251 
                                         f32 %253 = OpLoad %231 
                                       f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                                         f32 %255 = OpLoad %231 
                                       f32_3 %256 = OpCompositeConstruct %255 %255 %255 
                                       f32_3 %257 = OpFMul %254 %256 
                                       f32_3 %258 = OpLoad %194 
                                       f32_3 %259 = OpFNegate %258 
                                       f32_3 %260 = OpFAdd %257 %259 
                                                      OpStore %252 %260 
                                Uniform f32* %263 = OpAccessChain %34 %262 
                                         f32 %264 = OpLoad %263 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_3 %266 = OpLoad %252 
                                       f32_3 %267 = OpFMul %265 %266 
                                       f32_3 %268 = OpLoad %194 
                                       f32_3 %269 = OpFAdd %267 %268 
                                                      OpStore %261 %269 
                                       f32_3 %272 = OpLoad %261 
                                       f32_4 %273 = OpLoad %271 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %271 %274 
                                 Output f32* %276 = OpAccessChain %271 %192 
                                                      OpStore %276 %74 
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
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  Offset 1, 1
  GpuProgramID 172835
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat0 = textureLod(_NormalBuffer, u_xlat0.xy, 0.0);
    u_xlat0.xyz = u_xlat0.xyz + (-in_NORMAL0.xyz);
    u_xlat0.xyz = vec3(_UseBuffer) * u_xlat0.xyz + in_NORMAL0.xyz;
    u_xlat1.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat1 = textureLod(_PositionBuffer, u_xlat1.xy, 0.0);
    u_xlat1 = u_xlat1 + (-in_POSITION0);
    u_xlat1 = vec4(_UseBuffer) * u_xlat1 + in_POSITION0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat1.xyz;
    u_xlat6 = (-_Displacement) + 75.0;
    u_xlat6 = u_xlat0.z / u_xlat6;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat1.www + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + (-_LightPositionRange.xyz);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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

uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 257
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %51 %69 %86 %188 %241 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %51 Location 51 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %86 Location 86 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %188 Location 188 
                                                      OpMemberDecorate %239 0 BuiltIn 239 
                                                      OpMemberDecorate %239 1 BuiltIn 239 
                                                      OpMemberDecorate %239 2 BuiltIn 239 
                                                      OpDecorate %239 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %6 %12 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32; f32_2; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %6 
                                          u32 %28 = OpConstant 1 
                                              %35 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %36 = OpTypeSampledImage %35 
                                              %37 = OpTypePointer UniformConstant %36 
  UniformConstant read_only Texture2DSampled* %38 = OpVariable UniformConstant 
                                          f32 %42 = OpConstant 3.67402E-40 
                                              %44 = OpTypeVector %6 3 
                                              %50 = OpTypePointer Input %44 
                                 Input f32_3* %51 = OpVariable Input 
                                          i32 %57 = OpConstant 5 
                               Private f32_4* %68 = OpVariable Private 
                                 Input f32_4* %69 = OpVariable Input 
  UniformConstant read_only Texture2DSampled* %80 = OpVariable UniformConstant 
                                 Input f32_4* %86 = OpVariable Input 
                                          i32 %99 = OpConstant 3 
                                             %117 = OpTypePointer Private %6 
                                Private f32* %118 = OpVariable Private 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         u32 %124 = OpConstant 2 
                                         f32 %130 = OpConstant 3.67402E-40 
                                         i32 %144 = OpConstant 1 
                                             %145 = OpTypePointer Uniform %7 
                                         i32 %152 = OpConstant 0 
                                         i32 %164 = OpConstant 2 
                                             %187 = OpTypePointer Output %44 
                               Output f32_3* %188 = OpVariable Output 
                                             %238 = OpTypeArray %6 %28 
                                             %239 = OpTypeStruct %7 %6 %238 
                                             %240 = OpTypePointer Output %239 
        Output struct {f32_4; f32; f32[1];}* %241 = OpVariable Output 
                                             %249 = OpTypePointer Output %7 
                                             %251 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %26 = OpAccessChain %21 %23 %24 
                                          f32 %27 = OpLoad %26 
                                 Uniform f32* %29 = OpAccessChain %21 %23 %28 
                                          f32 %30 = OpLoad %29 
                                        f32_2 %31 = OpCompositeConstruct %27 %30 
                                        f32_2 %32 = OpFAdd %14 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
                                                      OpStore %9 %34 
                   read_only Texture2DSampled %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_4 %43 = OpImageSampleExplicitLod %39 %41 Lod %7 
                                        f32_3 %45 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_4 %46 = OpLoad %9 
                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 6 3 
                                                      OpStore %9 %47 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %52 = OpLoad %51 
                                        f32_3 %53 = OpFNegate %52 
                                        f32_3 %54 = OpFAdd %49 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %9 %56 
                                 Uniform f32* %58 = OpAccessChain %21 %57 
                                          f32 %59 = OpLoad %58 
                                        f32_3 %60 = OpCompositeConstruct %59 %59 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFMul %60 %62 
                                        f32_3 %64 = OpLoad %51 
                                        f32_3 %65 = OpFAdd %63 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %9 %67 
                                        f32_4 %70 = OpLoad %69 
                                        f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                 Uniform f32* %72 = OpAccessChain %21 %23 %24 
                                          f32 %73 = OpLoad %72 
                                 Uniform f32* %74 = OpAccessChain %21 %23 %28 
                                          f32 %75 = OpLoad %74 
                                        f32_2 %76 = OpCompositeConstruct %73 %75 
                                        f32_2 %77 = OpFAdd %71 %76 
                                        f32_4 %78 = OpLoad %68 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 2 3 
                                                      OpStore %68 %79 
                   read_only Texture2DSampled %81 = OpLoad %80 
                                        f32_4 %82 = OpLoad %68 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_4 %84 = OpImageSampleExplicitLod %81 %83 Lod %7 
                                                      OpStore %68 %84 
                                        f32_4 %85 = OpLoad %68 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFNegate %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %68 %89 
                                 Uniform f32* %90 = OpAccessChain %21 %57 
                                          f32 %91 = OpLoad %90 
                                        f32_4 %92 = OpCompositeConstruct %91 %91 %91 %91 
                                        f32_4 %93 = OpLoad %68 
                                        f32_4 %94 = OpFMul %92 %93 
                                        f32_4 %95 = OpLoad %86 
                                        f32_4 %96 = OpFAdd %94 %95 
                                                      OpStore %68 %96 
                                        f32_4 %97 = OpLoad %9 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                Uniform f32* %100 = OpAccessChain %21 %99 
                                         f32 %101 = OpLoad %100 
                                Uniform f32* %102 = OpAccessChain %21 %99 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %21 %99 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %101 %103 %105 
                                         f32 %107 = OpCompositeExtract %106 0 
                                         f32 %108 = OpCompositeExtract %106 1 
                                         f32 %109 = OpCompositeExtract %106 2 
                                       f32_3 %110 = OpCompositeConstruct %107 %108 %109 
                                       f32_3 %111 = OpFMul %98 %110 
                                       f32_4 %112 = OpLoad %68 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %9 %116 
                                Uniform f32* %119 = OpAccessChain %21 %99 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                         f32 %123 = OpFAdd %121 %122 
                                                      OpStore %118 %123 
                                Private f32* %125 = OpAccessChain %9 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpLoad %118 
                                         f32 %128 = OpFDiv %126 %127 
                                                      OpStore %118 %128 
                                         f32 %129 = OpLoad %118 
                                         f32 %131 = OpExtInst %1 43 %129 %42 %130 
                                                      OpStore %118 %131 
                                         f32 %132 = OpLoad %118 
                                         f32 %133 = OpFNegate %132 
                                         f32 %134 = OpFAdd %133 %130 
                                                      OpStore %118 %134 
                                         f32 %135 = OpLoad %118 
                                       f32_2 %136 = OpCompositeConstruct %135 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %21 %144 %144 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %143 %148 
                                       f32_4 %150 = OpLoad %68 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %68 %151 
                              Uniform f32_4* %153 = OpAccessChain %21 %144 %152 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 0 0 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %68 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %68 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %68 %163 
                              Uniform f32_4* %165 = OpAccessChain %21 %144 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 2 2 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %68 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFAdd %170 %172 
                                       f32_4 %174 = OpLoad %68 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %68 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %144 %99 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_4 %179 = OpLoad %68 
                                       f32_3 %180 = OpVectorShuffle %179 %179 3 3 3 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %68 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFAdd %181 %183 
                                       f32_4 %185 = OpLoad %68 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                      OpStore %68 %186 
                                       f32_4 %189 = OpLoad %68 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %21 %152 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                       f32_3 %194 = OpFNegate %193 
                                       f32_3 %195 = OpFAdd %190 %194 
                                                      OpStore %188 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_4 %197 = OpVectorShuffle %196 %196 1 1 1 1 
                              Uniform f32_4* %198 = OpAccessChain %21 %144 %144 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpFMul %197 %199 
                                                      OpStore %68 %200 
                              Uniform f32_4* %201 = OpAccessChain %21 %144 %152 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpVectorShuffle %203 %203 0 0 0 0 
                                       f32_4 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %68 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %68 %207 
                              Uniform f32_4* %208 = OpAccessChain %21 %144 %164 
                                       f32_4 %209 = OpLoad %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %210 2 2 2 2 
                                       f32_4 %212 = OpFMul %209 %211 
                                       f32_4 %213 = OpLoad %68 
                                       f32_4 %214 = OpFAdd %212 %213 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                              Uniform f32_4* %216 = OpAccessChain %21 %144 %99 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %215 %217 
                                                      OpStore %9 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_4 %220 = OpVectorShuffle %219 %219 1 1 1 1 
                              Uniform f32_4* %221 = OpAccessChain %21 %164 %144 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpFMul %220 %222 
                                                      OpStore %68 %223 
                              Uniform f32_4* %224 = OpAccessChain %21 %164 %152 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %9 
                                       f32_4 %227 = OpVectorShuffle %226 %226 0 0 0 0 
                                       f32_4 %228 = OpFMul %225 %227 
                                       f32_4 %229 = OpLoad %68 
                                       f32_4 %230 = OpFAdd %228 %229 
                                                      OpStore %68 %230 
                              Uniform f32_4* %231 = OpAccessChain %21 %164 %164 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %9 
                                       f32_4 %234 = OpVectorShuffle %233 %233 2 2 2 2 
                                       f32_4 %235 = OpFMul %232 %234 
                                       f32_4 %236 = OpLoad %68 
                                       f32_4 %237 = OpFAdd %235 %236 
                                                      OpStore %68 %237 
                              Uniform f32_4* %242 = OpAccessChain %21 %164 %99 
                                       f32_4 %243 = OpLoad %242 
                                       f32_4 %244 = OpLoad %9 
                                       f32_4 %245 = OpVectorShuffle %244 %244 3 3 3 3 
                                       f32_4 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %68 
                                       f32_4 %248 = OpFAdd %246 %247 
                               Output f32_4* %250 = OpAccessChain %241 %152 
                                                      OpStore %250 %248 
                                 Output f32* %252 = OpAccessChain %241 %152 %28 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFNegate %253 
                                 Output f32* %255 = OpAccessChain %241 %152 %28 
                                                      OpStore %255 %254 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 48
; Schema: 0
                                        OpCapability Shader 
                                 %1 = OpExtInstImport "GLSL.std.450" 
                                        OpMemoryModel Logical GLSL450 
                                        OpEntryPoint Fragment %4 "main" %12 %45 
                                        OpExecutionMode %4 OriginUpperLeft 
                                        OpDecorate %12 Location 12 
                                        OpMemberDecorate %26 0 Offset 26 
                                        OpMemberDecorate %26 1 Offset 26 
                                        OpDecorate %26 Block 
                                        OpDecorate %28 DescriptorSet 28 
                                        OpDecorate %28 Binding 28 
                                        OpDecorate %45 RelaxedPrecision 
                                        OpDecorate %45 Location 45 
                                 %2 = OpTypeVoid 
                                 %3 = OpTypeFunction %2 
                                 %6 = OpTypeFloat 32 
                                 %7 = OpTypeVector %6 4 
                                 %8 = OpTypePointer Private %7 
                  Private f32_4* %9 = OpVariable Private 
                                %10 = OpTypeVector %6 3 
                                %11 = OpTypePointer Input %10 
                   Input f32_3* %12 = OpVariable Input 
                                %16 = OpTypeInt 32 0 
                            u32 %17 = OpConstant 0 
                                %18 = OpTypePointer Private %6 
                                %26 = OpTypeStruct %7 %7 
                                %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4;}* %28 = OpVariable Uniform 
                                %29 = OpTypeInt 32 1 
                            i32 %30 = OpConstant 1 
                                %31 = OpTypePointer Uniform %6 
                            i32 %38 = OpConstant 0 
                                %39 = OpTypePointer Uniform %7 
                                %44 = OpTypePointer Output %7 
                  Output f32_4* %45 = OpVariable Output 
                            void %4 = OpFunction None %3 
                                 %5 = OpLabel 
                          f32_3 %13 = OpLoad %12 
                          f32_3 %14 = OpLoad %12 
                            f32 %15 = OpDot %13 %14 
                   Private f32* %19 = OpAccessChain %9 %17 
                                        OpStore %19 %15 
                   Private f32* %20 = OpAccessChain %9 %17 
                            f32 %21 = OpLoad %20 
                            f32 %22 = OpExtInst %1 31 %21 
                   Private f32* %23 = OpAccessChain %9 %17 
                                        OpStore %23 %22 
                   Private f32* %24 = OpAccessChain %9 %17 
                            f32 %25 = OpLoad %24 
                   Uniform f32* %32 = OpAccessChain %28 %30 %17 
                            f32 %33 = OpLoad %32 
                            f32 %34 = OpFAdd %25 %33 
                   Private f32* %35 = OpAccessChain %9 %17 
                                        OpStore %35 %34 
                          f32_4 %36 = OpLoad %9 
                          f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                 Uniform f32_4* %40 = OpAccessChain %28 %38 
                          f32_4 %41 = OpLoad %40 
                          f32_4 %42 = OpVectorShuffle %41 %41 3 3 3 3 
                          f32_4 %43 = OpFMul %37 %42 
                                        OpStore %9 %43 
                          f32_4 %46 = OpLoad %9 
                                        OpStore %45 %46 
                                        OpReturn
                                        OpFunctionEnd
"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Displacement;
uniform 	vec2 _BufferOffset;
uniform 	float _UseBuffer;
uniform  sampler2D _PositionBuffer;
uniform  sampler2D _NormalBuffer;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat8;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = in_TEXCOORD1.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat0 = textureLod(_NormalBuffer, u_xlat0.xy, 0.0);
    u_xlat0.xyz = u_xlat0.xyz + (-in_NORMAL0.xyz);
    u_xlat0.xyz = vec3(_UseBuffer) * u_xlat0.xyz + in_NORMAL0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2.xy = in_TEXCOORD0.xy + vec2(_BufferOffset.x, _BufferOffset.y);
    u_xlat2 = textureLod(_PositionBuffer, u_xlat2.xy, 0.0);
    u_xlat2 = u_xlat2 + (-in_POSITION0);
    u_xlat2 = vec4(_UseBuffer) * u_xlat2 + in_POSITION0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Displacement, _Displacement, _Displacement)) + u_xlat2.xyz;
    u_xlat12 = (-_Displacement) + 75.0;
    u_xlat12 = u_xlat0.z / u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * u_xlat2.wwww + u_xlat0;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat13 = (-u_xlat13) * u_xlat13 + 1.0;
    u_xlat13 = sqrt(u_xlat13);
    u_xlat13 = u_xlat13 * unity_LightShadowBias.z;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + u_xlat0.xyz;
    u_xlatb13 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat8 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat8);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat8) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat8;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %114 %131 %342 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 RelaxedPrecision 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %39 DescriptorSet 39 
                                                      OpDecorate %39 Binding 39 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %114 Location 114 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %125 DescriptorSet 125 
                                                      OpDecorate %125 Binding 125 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %131 Location 131 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpMemberDecorate %340 0 BuiltIn 340 
                                                      OpMemberDecorate %340 1 BuiltIn 340 
                                                      OpMemberDecorate %340 2 BuiltIn 340 
                                                      OpDecorate %340 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %7 %7 %17 %18 %19 %6 %12 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32_2; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 6 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Uniform %6 
                                          u32 %29 = OpConstant 1 
                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %37 = OpTypeSampledImage %36 
                                              %38 = OpTypePointer UniformConstant %37 
  UniformConstant read_only Texture2DSampled* %39 = OpVariable UniformConstant 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Input %45 
                                 Input f32_3* %52 = OpVariable Input 
                                          i32 %58 = OpConstant 7 
                               Private f32_4* %69 = OpVariable Private 
                                          i32 %72 = OpConstant 3 
                                          i32 %73 = OpConstant 0 
                                              %74 = OpTypePointer Uniform %7 
                                              %79 = OpTypePointer Private %6 
                                          i32 %83 = OpConstant 1 
                                          i32 %91 = OpConstant 2 
                                          u32 %96 = OpConstant 2 
                                 Private f32* %98 = OpVariable Private 
                              Private f32_4* %113 = OpVariable Private 
                                Input f32_4* %114 = OpVariable Input 
 UniformConstant read_only Texture2DSampled* %125 = OpVariable UniformConstant 
                                Input f32_4* %131 = OpVariable Input 
                                         i32 %144 = OpConstant 5 
                                         f32 %165 = OpConstant 3.67402E-40 
                                         f32 %172 = OpConstant 3.67402E-40 
                              Private f32_4* %184 = OpVariable Private 
                                Private f32* %224 = OpVariable Private 
                                             %266 = OpTypeBool 
                                             %267 = OpTypePointer Private %266 
                               Private bool* %268 = OpVariable Private 
                                             %272 = OpTypePointer Function %45 
                                         i32 %287 = OpConstant 4 
                                         u32 %314 = OpConstant 3 
                                         f32 %325 = OpConstant 3.67402E-40 
                                Private f32* %328 = OpVariable Private 
                                             %339 = OpTypeArray %6 %29 
                                             %340 = OpTypeStruct %7 %6 %339 
                                             %341 = OpTypePointer Output %340 
        Output struct {f32_4; f32; f32[1];}* %342 = OpVariable Output 
                                             %345 = OpTypePointer Output %7 
                                             %362 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %273 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                 Uniform f32* %27 = OpAccessChain %22 %24 %25 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %22 %24 %29 
                                          f32 %31 = OpLoad %30 
                                        f32_2 %32 = OpCompositeConstruct %28 %31 
                                        f32_2 %33 = OpFAdd %14 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %9 %35 
                   read_only Texture2DSampled %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                        f32_4 %44 = OpImageSampleExplicitLod %40 %42 Lod %7 
                                        f32_3 %46 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_4 %48 = OpVectorShuffle %47 %46 4 5 6 3 
                                                      OpStore %9 %48 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %53 = OpLoad %52 
                                        f32_3 %54 = OpFNegate %53 
                                        f32_3 %55 = OpFAdd %50 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 6 3 
                                                      OpStore %9 %57 
                                 Uniform f32* %59 = OpAccessChain %22 %58 
                                          f32 %60 = OpLoad %59 
                                        f32_3 %61 = OpCompositeConstruct %60 %60 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFMul %61 %63 
                                        f32_3 %65 = OpLoad %52 
                                        f32_3 %66 = OpFAdd %64 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                      OpStore %9 %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                               Uniform f32_4* %75 = OpAccessChain %22 %72 %73 
                                        f32_4 %76 = OpLoad %75 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                          f32 %78 = OpDot %71 %77 
                                 Private f32* %80 = OpAccessChain %69 %25 
                                                      OpStore %80 %78 
                                        f32_4 %81 = OpLoad %9 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                               Uniform f32_4* %84 = OpAccessChain %22 %72 %83 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                          f32 %87 = OpDot %82 %86 
                                 Private f32* %88 = OpAccessChain %69 %29 
                                                      OpStore %88 %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %22 %72 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                          f32 %95 = OpDot %90 %94 
                                 Private f32* %97 = OpAccessChain %69 %96 
                                                      OpStore %97 %95 
                                        f32_4 %99 = OpLoad %69 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_4 %101 = OpLoad %69 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                                         f32 %103 = OpDot %100 %102 
                                                      OpStore %98 %103 
                                         f32 %104 = OpLoad %98 
                                         f32 %105 = OpExtInst %1 32 %104 
                                                      OpStore %98 %105 
                                         f32 %106 = OpLoad %98 
                                       f32_3 %107 = OpCompositeConstruct %106 %106 %106 
                                       f32_4 %108 = OpLoad %69 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %69 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %69 %112 
                                       f32_4 %115 = OpLoad %114 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                Uniform f32* %117 = OpAccessChain %22 %24 %25 
                                         f32 %118 = OpLoad %117 
                                Uniform f32* %119 = OpAccessChain %22 %24 %29 
                                         f32 %120 = OpLoad %119 
                                       f32_2 %121 = OpCompositeConstruct %118 %120 
                                       f32_2 %122 = OpFAdd %116 %121 
                                       f32_4 %123 = OpLoad %113 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 2 3 
                                                      OpStore %113 %124 
                  read_only Texture2DSampled %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %113 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                                       f32_4 %129 = OpImageSampleExplicitLod %126 %128 Lod %7 
                                                      OpStore %113 %129 
                                       f32_4 %130 = OpLoad %113 
                                       f32_4 %132 = OpLoad %131 
                                       f32_4 %133 = OpFNegate %132 
                                       f32_4 %134 = OpFAdd %130 %133 
                                                      OpStore %113 %134 
                                Uniform f32* %135 = OpAccessChain %22 %58 
                                         f32 %136 = OpLoad %135 
                                       f32_4 %137 = OpCompositeConstruct %136 %136 %136 %136 
                                       f32_4 %138 = OpLoad %113 
                                       f32_4 %139 = OpFMul %137 %138 
                                       f32_4 %140 = OpLoad %131 
                                       f32_4 %141 = OpFAdd %139 %140 
                                                      OpStore %113 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                Uniform f32* %145 = OpAccessChain %22 %144 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %22 %144 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %22 %144 
                                         f32 %150 = OpLoad %149 
                                       f32_3 %151 = OpCompositeConstruct %146 %148 %150 
                                         f32 %152 = OpCompositeExtract %151 0 
                                         f32 %153 = OpCompositeExtract %151 1 
                                         f32 %154 = OpCompositeExtract %151 2 
                                       f32_3 %155 = OpCompositeConstruct %152 %153 %154 
                                       f32_3 %156 = OpFMul %143 %155 
                                       f32_4 %157 = OpLoad %113 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFAdd %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                                      OpStore %9 %161 
                                Uniform f32* %162 = OpAccessChain %22 %144 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFNegate %163 
                                         f32 %166 = OpFAdd %164 %165 
                                                      OpStore %98 %166 
                                Private f32* %167 = OpAccessChain %9 %96 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpLoad %98 
                                         f32 %170 = OpFDiv %168 %169 
                                                      OpStore %98 %170 
                                         f32 %171 = OpLoad %98 
                                         f32 %173 = OpExtInst %1 43 %171 %43 %172 
                                                      OpStore %98 %173 
                                         f32 %174 = OpLoad %98 
                                         f32 %175 = OpFNegate %174 
                                         f32 %176 = OpFAdd %175 %172 
                                                      OpStore %98 %176 
                                         f32 %177 = OpLoad %98 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
                                                      OpStore %9 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 1 1 1 1 
                              Uniform f32_4* %187 = OpAccessChain %22 %91 %83 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFMul %186 %188 
                                                      OpStore %184 %189 
                              Uniform f32_4* %190 = OpAccessChain %22 %91 %73 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %184 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %184 %196 
                              Uniform f32_4* %197 = OpAccessChain %22 %91 %91 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %9 
                                       f32_4 %200 = OpVectorShuffle %199 %199 2 2 2 2 
                                       f32_4 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %184 
                                       f32_4 %203 = OpFAdd %201 %202 
                                                      OpStore %9 %203 
                              Uniform f32_4* %204 = OpAccessChain %22 %91 %72 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpLoad %113 
                                       f32_4 %207 = OpVectorShuffle %206 %206 3 3 3 3 
                                       f32_4 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %9 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFNegate %212 
                              Uniform f32_4* %214 = OpAccessChain %22 %73 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 3 3 3 
                                       f32_3 %217 = OpFMul %213 %216 
                              Uniform f32_4* %218 = OpAccessChain %22 %73 
                                       f32_4 %219 = OpLoad %218 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                       f32_3 %221 = OpFAdd %217 %220 
                                       f32_4 %222 = OpLoad %113 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %113 %223 
                                       f32_4 %225 = OpLoad %113 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_4 %227 = OpLoad %113 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                         f32 %229 = OpDot %226 %228 
                                                      OpStore %224 %229 
                                         f32 %230 = OpLoad %224 
                                         f32 %231 = OpExtInst %1 32 %230 
                                                      OpStore %224 %231 
                                         f32 %232 = OpLoad %224 
                                       f32_3 %233 = OpCompositeConstruct %232 %232 %232 
                                       f32_4 %234 = OpLoad %113 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %113 
                                       f32_4 %238 = OpVectorShuffle %237 %236 4 5 6 3 
                                                      OpStore %113 %238 
                                       f32_4 %239 = OpLoad %69 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_4 %241 = OpLoad %113 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                         f32 %243 = OpDot %240 %242 
                                                      OpStore %224 %243 
                                         f32 %244 = OpLoad %224 
                                         f32 %245 = OpFNegate %244 
                                         f32 %246 = OpLoad %224 
                                         f32 %247 = OpFMul %245 %246 
                                         f32 %248 = OpFAdd %247 %172 
                                                      OpStore %224 %248 
                                         f32 %249 = OpLoad %224 
                                         f32 %250 = OpExtInst %1 31 %249 
                                                      OpStore %224 %250 
                                         f32 %251 = OpLoad %224 
                                Uniform f32* %252 = OpAccessChain %22 %83 %96 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %251 %253 
                                                      OpStore %224 %254 
                                       f32_4 %255 = OpLoad %69 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                       f32_3 %257 = OpFNegate %256 
                                         f32 %258 = OpLoad %224 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpFMul %257 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFAdd %260 %262 
                                       f32_4 %264 = OpLoad %69 
                                       f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
                                                      OpStore %69 %265 
                                Uniform f32* %269 = OpAccessChain %22 %83 %96 
                                         f32 %270 = OpLoad %269 
                                        bool %271 = OpFOrdNotEqual %270 %43 
                                                      OpStore %268 %271 
                                        bool %274 = OpLoad %268 
                                                      OpSelectionMerge %276 None 
                                                      OpBranchConditional %274 %275 %279 
                                             %275 = OpLabel 
                                       f32_4 %277 = OpLoad %69 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                                      OpStore %273 %278 
                                                      OpBranch %276 
                                             %279 = OpLabel 
                                       f32_4 %280 = OpLoad %9 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                                      OpStore %273 %281 
                                                      OpBranch %276 
                                             %276 = OpLabel 
                                       f32_3 %282 = OpLoad %273 
                                       f32_4 %283 = OpLoad %9 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %9 %284 
                                       f32_4 %285 = OpLoad %9 
                                       f32_4 %286 = OpVectorShuffle %285 %285 1 1 1 1 
                              Uniform f32_4* %288 = OpAccessChain %22 %287 %83 
                                       f32_4 %289 = OpLoad %288 
                                       f32_4 %290 = OpFMul %286 %289 
                                                      OpStore %69 %290 
                              Uniform f32_4* %291 = OpAccessChain %22 %287 %73 
                                       f32_4 %292 = OpLoad %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %295 = OpFMul %292 %294 
                                       f32_4 %296 = OpLoad %69 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %69 %297 
                              Uniform f32_4* %298 = OpAccessChain %22 %287 %91 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpLoad %9 
                                       f32_4 %301 = OpVectorShuffle %300 %300 2 2 2 2 
                                       f32_4 %302 = OpFMul %299 %301 
                                       f32_4 %303 = OpLoad %69 
                                       f32_4 %304 = OpFAdd %302 %303 
                                                      OpStore %69 %304 
                              Uniform f32_4* %305 = OpAccessChain %22 %287 %72 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpLoad %9 
                                       f32_4 %308 = OpVectorShuffle %307 %307 3 3 3 3 
                                       f32_4 %309 = OpFMul %306 %308 
                                       f32_4 %310 = OpLoad %69 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %9 %311 
                                Uniform f32* %312 = OpAccessChain %22 %83 %25 
                                         f32 %313 = OpLoad %312 
                                Private f32* %315 = OpAccessChain %9 %314 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFDiv %313 %316 
                                Private f32* %318 = OpAccessChain %69 %25 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %69 %25 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpExtInst %1 37 %320 %43 
                                Private f32* %322 = OpAccessChain %69 %25 
                                                      OpStore %322 %321 
                                Private f32* %323 = OpAccessChain %69 %25 
                                         f32 %324 = OpLoad %323 
                                         f32 %326 = OpExtInst %1 40 %324 %325 
                                Private f32* %327 = OpAccessChain %69 %25 
                                                      OpStore %327 %326 
                                Private f32* %329 = OpAccessChain %9 %96 
                                         f32 %330 = OpLoad %329 
                                Private f32* %331 = OpAccessChain %69 %25 
                                         f32 %332 = OpLoad %331 
                                         f32 %333 = OpFAdd %330 %332 
                                                      OpStore %328 %333 
                                Private f32* %334 = OpAccessChain %9 %314 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpLoad %328 
                                         f32 %337 = OpExtInst %1 37 %335 %336 
                                Private f32* %338 = OpAccessChain %69 %25 
                                                      OpStore %338 %337 
                                       f32_4 %343 = OpLoad %9 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 3 
                               Output f32_4* %346 = OpAccessChain %342 %73 
                                       f32_4 %347 = OpLoad %346 
                                       f32_4 %348 = OpVectorShuffle %347 %344 4 5 2 6 
                                                      OpStore %346 %348 
                                         f32 %349 = OpLoad %328 
                                         f32 %350 = OpFNegate %349 
                                Private f32* %351 = OpAccessChain %69 %25 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpFAdd %350 %352 
                                Private f32* %354 = OpAccessChain %9 %25 
                                                      OpStore %354 %353 
                                Uniform f32* %355 = OpAccessChain %22 %83 %29 
                                         f32 %356 = OpLoad %355 
                                Private f32* %357 = OpAccessChain %9 %25 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFMul %356 %358 
                                         f32 %360 = OpLoad %328 
                                         f32 %361 = OpFAdd %359 %360 
                                 Output f32* %363 = OpAccessChain %342 %73 %96 
                                                      OpStore %363 %361 
                                 Output f32* %364 = OpAccessChain %342 %73 %29 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFNegate %365 
                                 Output f32* %367 = OpAccessChain %342 %73 %29 
                                                      OpStore %367 %366 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.67402E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
}
}
}
Fallback "Diffuse"
}