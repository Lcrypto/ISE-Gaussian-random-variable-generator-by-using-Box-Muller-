<<<<<<< 06f93c07eb6db127e1822abe99b171b9e456bead
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:10 07/13/2016 
// Design Name: 
// Module Name:    multiplier16bits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier16buts ( 
					input				clk,
					input				reset,
					input	[15:0]	a_in16bit,	//����16λ�з�����
					input	[15:0]	b_in16bit,	
					output[31:0]	y_out32bit 	//���32λ�з�����
=======
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:10 07/13/2016 
// Design Name: 
// Module Name:    multiplier16bits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier16buts ( 
					input				clk,
					input				reset,
					input	[15:0]	a_in16bit,	//����16λ�з�����
					input	[15:0]	b_in16bit,	
					output[31:0]	y_out32bit 	//���32λ�з�����
>>>>>>> daily update
								);           		//16λ�з������˷��������32λ�з�����



  reg	[31:0]   y_out32bit;         		//���������������Բ�����ʽ����
  reg	[15:0]   x1,x2,x3,x4;   			//x1,x2��������������;x3,x4����������������ԭ��
  reg         	x5;            			//�������������ķ���λ
  reg	[29:0]   x6;            			//30λ�Ĵ��������15λ��Ч��λ��˽��
  reg	[31:0]   x7;            			//�������������ݵ�ԭ��
 
<<<<<<< 06f93c07eb6db127e1822abe99b171b9e456bead
 always@ (negedge clk )
=======
 always@ (posedge clk )
>>>>>>> daily update
	 begin
		if( reset )              //��λʹ�ܣ��Ĵ�������
			begin
			x1<=16'b0;
			x2<=16'b0;
			x3<=16'b0;
			x4<=16'b0;
			x5<=1'b0;
			x6<=30'b0;
			x7<=32'b0;
			y_out32bit<=32'b0;
			end
		else
			 begin
			 x1<=a_in16bit;             //����Ĵ�����ֵ
			 x2<=b_in16bit;
			 x3<=(x1[15]==0)?x1:{x1[15],~x1[14:0]+1'b1};     //�ж����λ�Ƿ�Ϊ1�����ж������Ƿ���������Ǹ�����ȡ����1������������򲻱䣬Ŀ�����������ԭ�롣
			 x4<=(x2[15]==0)?x2:{x2[15],~x2[14:0]+1'b1};     //ͬ��
			 x5<=x3[15]^x4[15];                              //������������λ����򣬵õ�������ķ���λ
			 x6<=x3[14:0]*x4[14:0];                          //����15λ��Ч�������
			 x7<={x5,x6,1'b0};                               //�õ��������ԭ�룬��1λ����λ��30λ��Ч����λ��1λ�޹�λ0��ɣ�����32λ���
			 y_out32bit<=(x7[31]==0)?x7:{x7[31],~x7[30:0]+1'b1};  //�ж���������Ƿ���������˽����ɲ�����ʽ���
			 end
	 end
endmodule