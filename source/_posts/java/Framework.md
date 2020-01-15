---
title: 使用Spring boot集成Freemarker生成word文档
date: 2018年3月27日11:04:17
tags: [Java]
categories: [Java]
toc: true
---
   ##### FreeMarker介绍
   FreeMarker 是一款 模板引擎： 即一种基于模板和要改变的数据， 并用来生成输出文本(HTML网页，电子邮件，配置文件，源代码等)的通用工具。 它不是面向最终用户的，而是一个Java类库，是一款程序员可以嵌入他们所开发产品的组件。模板编写为FreeMarker Template Language (FTL)。
   ##### 1、Spring boot 引入依赖
            	<dependency>
            		<groupId>org.springframework.boot</groupId>
            		<artifactId>spring-boot-starter-freemarker</artifactId>
            	</dependency>
   ##### 2、模板准备    
        1、将word模板文档另存为xml文件；（这种方式最简单）
        2、将xml文件使用编辑器打开（如idea），并将其中要作为输入的部分使用 ${} 占位符填充
        3、将xml文件另存为ftl文件，要注意另存为后出现的类容错位。
   ##### 3、代码准备
              //模板文件所在的文件夹
              private static final String templateFolder = "F:/project/idea/tempplate-demo/src/main/resources/static/";
              static {
                    Configuration  configuration = new Configuration();
                   configuration.setDefaultEncoding("utf-8");
                  try {
                      configuration.setDirectoryForTemplateLoading(new File(templateFolder));
                  } catch (IOException e) {
                      e.printStackTrace();
                  }
              }     
              
              
              生成并存入response
               /**
                   * 
                   * @param request
                   * @param response
                   * @param map   数据集
                   * @param title 标题
                   * @param ftlFile  模板文件
                   * @param fileName  生成文件名称
                   * @throws IOException
                   */
               public static void exportMillCertificateWord(HttpServletRequest request, HttpServletResponse response, Map map, String title, String ftlFile,String fileName) throws IOException {
                      Template freemarkerTemplate = configuration.getTemplate(ftlFile);
                      File file = null;
                      InputStream fin = null;
                      ServletOutputStream out = null;
                      try {
                          //生成word
                          file = new File("test.doc");
                          // 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
                          Writer w = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
                          t.process(dataMap, w);
                          w.close();
                                                 
                          fin = new FileInputStream(file);
                          response.setCharacterEncoding("UTF-8");
                          response.setContentType("application/msword");
                          // 设置浏览器以下载的方式处理该文件名
              
                          response.setHeader("Content-Disposition", "attachment;filename="
                                  .concat(String.valueOf(URLEncoder.encode(fileName, "UTF-8"))));
              
                          out = response.getOutputStream();
                          byte[] buffer = new byte[512];  // 缓冲区
                          int bytesToRead = -1;
                          // 通过循环将读入的Word文件的内容输出到浏览器中
                          while ((bytesToRead = fin.read(buffer)) != -1) {
                              out.write(buffer, 0, bytesToRead);
                          }
                      }catch (Exception ex) {
                                   ex.printStackTrace();
                                   throw new RuntimeException(ex);
                               }
                  }
        