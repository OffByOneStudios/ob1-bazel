#define SK_GL

#include "include/core/SkSurface.h"
#include "include/core/SkData.h"
#include "include/gpu/GrTypes.h"
#include "include/gpu/GrDirectContext.h"
#include "include/gpu/gl/GrGLInterface.h"

#include <GLFW/glfw3.h>

#define MSAA_LEVEL 1
#define WIDTH 640
#define HEIGHT 480


int initglfw()
{
    GLFWwindow* window;

    if (!glfwInit()) {
        
        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	//(uncomment to enable correct color spaces) glfwWindowHint(GLFW_SRGB_CAPABLE, GL_TRUE);
	glfwWindowHint(GLFW_STENCIL_BITS, 0);
	//glfwWindowHint(GLFW_ALPHA_BITS, 0);
	glfwWindowHint(GLFW_DEPTH_BITS, 0);

    window = glfwCreateWindow(WIDTH, HEIGHT, "Hello World", NULL, NULL);

    glfwMakeContextCurrent(window);
    if (!window)
    {
        glfwTerminate();
        SkDebugf("Failed to Create Test Window\n");
        return -1;
    
    }
    return 0;
}

int main(int argc, char** argv)
{	
    
    if(!initglfw())
    {
        SkDebugf("Testing GPU Integration \n");
        sk_sp<GrDirectContext> context = GrDirectContext::MakeGL();
        SkImageInfo info = SkImageInfo::MakeN32Premul(WIDTH, HEIGHT);
        SkSurfaceProps props;

        sk_sp<SkSurface> gpuSurface(
                SkSurface::MakeRenderTarget(context.get(), SkBudgeted::kNo, info, MSAA_LEVEL, nullptr));

        if (!gpuSurface) {
            SkDebugf("SkSurface::MakeRenderTarget returned null\n");
            return -1;
        }

        return 0;
    }
    else
    {
        SkDebugf("Failed to Init GLFW. Falling back to Software Renderer");
        sk_sp<SkSurface> rasterSurface =
            SkSurface::MakeRasterN32Premul(WIDTH, HEIGHT);
        SkCanvas* rasterCanvas = rasterSurface->getCanvas();

        if(rasterCanvas == nullptr)
        {
            SkDebugf("Failed to Create Software Renderer");
            return -1;
        }

    }

    


	//sk_sp<SkSurface> gpuSurface(SkSurface::MakeRenderTarget(context, SkBudgeted::kNo, info));
    
    return 0;
}