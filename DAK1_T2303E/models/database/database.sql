
	create database Insurance;
	use Insurance;

	CREATE TABLE company(
	id int auto_increment,
	company_name nvarchar(100) not null,
	logo char(100) not null,
	images char(100) not null,
	about_company text not null,
	constraint id primary key (id)
	);

	CREATE TABLE product(
		id int auto_increment,
		name nvarchar(100) not null,
		content text,
		company_id int,
		slug char(100),
		image_source char(100),
		note text,
		constraint id primary key (id),
		foreign key (company_id) references company(id)
	);

	CREATE TABLE product_detail(
		id int auto_increment,
		detail text,
		scope text,
		non_scope text,
		the_insured text,
		responsibility text,
		duration text,
		product_id int,
		constraint id primary key (id),
		foreign key (product_id) references product(id)
	);

	CREATE TABLE contacts (
		id int auto_increment,
		name nvarchar(100) not null,
		phoneNumber char(50) not null,
		email char(200) not null,
		address text not null,
		message text,
		from_slug char(200) not null,
		created_at timestamp NOT NULL DEFAULT current_timestamp(),
		constraint id primary key (id)
	);

	INSERT INTO company (company_name, logo, images, about_company) VALUES
	(
		'Hanwha',
		'images/company/ava_hanwha.jpg',
		'images/company/hanwha.png',
		'Hanwha Life Vietnam has officially introduced products to customers since April 1, 2009. Hanwha Life Vietnam currently has more than 500 employees and more than 37,000 financial advisors operating at over 160 customer service locations across the country. By 2022, the company has nearly 1,000,000 customers who trust and entrust the responsibility of protecting themselves and their families.'
	),
	(
		'Manulife',
		'images/company/ava_manulife.jpg',
		'images/company/manulife.jpg',
		'Manulife Insurance, proud in the list of leading non-life insurance companies in Vietnam, is one of the foreign insurers present in Vietnam as early as 2003. Liberty Insurance Vietnam continues Connecting, promoting and bringing global standard insurance products and services to improve the quality of life and better protection for Vietnamese people.'
	),
	(
		'Liberty',
		'images/company/ava_liberty.png',
		'images/company/liberty.jpg',
		'Liberty Vietnam Insurance, proud in the list of leading non-life insurance companies in Vietnam, is one of the foreign insurers present in Vietnam as early as 2003. Liberty Insurance Vietnam continues Connecting, promoting and bringing global standard insurance products and services to improve the quality of life and better protection for Vietnamese people.'
	),
	(
		'PVI',
		'images/company/ava_pvi.jpg',
		'images/company/pvi.jpg',
		'Formerly known as Vietnam Oil and Gas Insurance Company (PVI Insurance), established in 1996, in 2006, PVI was one of the first enterprises in Vietnam to be equitized to become Baoviet Joint Stock Corporation. Vietnam Oil and Gas Insurance and listed on the stock exchange in 2007 with stock code PVI. In August 2011, PVI continued to carry out restructuring under the model of parent company - subsidiary. In which, the parent company PVI Holdings performs the following functions: capital management, investment, strategy - planning, personnel organization, brand and information technology; member units perform business functions in many core areas'
	);

	INSERT INTO product (name, content, company_id, slug, image_source, note) VALUES
	(
		N'Car TNDS Insurance',
		N'Compulsory CIT insurance for car owners. Participating in Insurance will ensure the victim benefits when the car owner accidentally causes damage while driving',
		2,
		'bao-hiem-o-to-tnds',
		'images/product/car',
		'upload/car/quytac-tnds.pdf'
	),
	(
		N'Car Accident Insurance',
		N'Not all car owners are lucky enough to get out of an accident without being injured. We help pay for all possible injuries to you when something goes wrong',
		2,
		'bao-hiem-o-to-tncn',
		'images/product/car',
		'upload/car/quytac-tainan.pdf'
	),
	(
		N'Car Material Insurance',
		N'Paying for car damage repairs outright can leave a big hole in your pocket. We make it possible for you to deal with such damages, even though they can be huge',
		3,
		'bao-hiem-o-to-thvc',
		'images/product/car',
		'upload/car/quytac-vatchat.pdf'
	),
	(
		N'Car Merchan Insurance',
		N'It is hard to predict the extra costs an incident can bring to your cargo when they are impacted by road bumps, but you can be smart and plan ahead protect them',
		2,
		'bao-hiem-o-to-hhvc',
		'images/product/car',
		'upload/car/quytac-hanghoa.pdf'
	),
  (
		N'Motorbike TNDS Insurance',
		N'Compulsory CIT insurance for car owners. Participating in Insurance will ensure the victim benefits when the car owner accidentally causes damage while driving',
		3,
		'bao-hiem-xe-may-tnds',
		'images/product/moto',
		'upload/moto/quytac-tnds.pdf'
	),
	(
		N'Motorbike Voluntary Insurance',
		N'Motorbike Voluntary TNDS insurance for car owners, in addition to Compulsory Insurance, helps you pay for accidental damage that you are said to be at fault',
		2,
		'bao-hiem-xe-may-tnds',
		'images/product/moto',
		'upload/moto/quytac-tnds.pdf'
	),
	(
		N'Motorbike Accident Insurance',
		N'Not all car owners are lucky enough to get out of an accident without being injured. We help pay for all possible injuries to you when something goes wrong',
		2,
		'bao-hiem-xe-may-tncn',
		'images/product/moto',
		'upload/moto/quytac-tainan.pdf'
	),
	(
		N'Motorbike Material Insurance',
		N'Paying for car damage repairs outright can leave a big hole in your pocket. We make it possible for you to deal with such damages, even though they can be huge',
		3,
		'bao-hiem-xe-may-bhvc',
		'images/product/moto',
		'upload/moto/quytac-vatchat.pdf'
	),
	(
		N'Truck TNDS Insurance',
		N'Compulsory CIT insurance for car owners. Participating in Insurance will ensure the victim benefits when the car owner accidentally causes damage while driving',
		3,
		'bao-hiem-xe-dk-tnds',
		'images/product/tractor_truck',
		'upload/moto/quytac-tnds.pdf'
	),
  (
		N'Truck Voluntary Insurance',
		N'Tractor Truck Voluntary TNDS insurance for car owners, in addition to Compulsory Insurance, helps you pay for accidental damage that you are said to be at fault',
		2,
		'bao-hiem-xe-may-tnds',
		'images/product/moto',
		'upload/moto/quytac-tnds.pdf'
	),
	(
		N'Truck Accident Insurance',
		N'Not all car owners are lucky enough to get out of an accident without being injured. We help pay for all possible injuries to you when something goes wrong',
		3,
		'bao-hiem-xe-dk-tncn',
		'images/product/tractor_truck',
		'upload/moto/quytac-tainan.pdf'
	),
	(
		N'Truck Merchan Insurance',
		N'It is hard to predict the extra costs an incident can bring to your cargo when they are impacted by road bumps, but you can be smart and plan ahead protect them',
		2,
		'bao-hiem-xe-dk-hhvc',
		'images/product/tractor_truck',
		'upload/moto/quytac-hanghoa.pdf'
	);

	INSERT INTO product_detail( detail, scope, non_scope, the_insured, responsibility, duration, product_id ) VALUES
	(
		'Bảo hiểm ô tô bắt buộc hay trách nhiệm dân sự là loại bảo hiểm bao gồm trách nhiệm dân sự liên quan đến việc bồi thường thiệt hại về thương tích hoặc bệnh tật cho bên thứ ba hoặc thiệt hại về tài sản của bên thứ ba, do người được bảo hiểm gây ra.',
		'Chủ xe cơ giới tham gia giao thông trên lãnh thổ nước Cộng hòa xã hội chủ nghĩa Việt Nam. Chủ xe cơ giới (tổ chức, cá nhân) là chủ sở hữu xe cơ giới hoặc được chủ sở hữu xe cơ giới giao chiếm hữu, sử dụng hợp pháp, điều khiển xe cơ giới.',
		'Thiệt hại về thân thể, tính mạng và tài sản đối với bên thứ ba do xe cơ giới gây ra. Thiệt hại về thân thể và tính mạng của hành khách theo hợp đồng vận chuyển hành khách do xe cơ giới.',
		'Người bị thiệt cố ý gây thiệt hại. Người lái xe gây tai nạn cố ý bỏ chạy. Giấy phép lái xe không hợp lệ. Gây ra hậu quả gián tiếp thừ thiệt hại. Thiệt hại từ tài sản bị mất cắp hoặc cướp sau tai nạn. Các hoạt động bất khả kháng như động đất, khủng bố. Các loại tài sản đặc biệt như: vàng, bạc, đá quý, tiền, các loại giấy tờ có giá trị như tiền, đồ cổ...',
		'Đối với thiệt hại về người: 150.000.000 đồng/1 người/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe ô tô gây ra) : 100.000.000 đồng/1 vụ tai nạn.',
		'Thời điểm bắt đầu có hiệu lực của Giấy chứng nhận bảo hiểm được ghi cụ thể trên Giấy chứng nhận bảo hiểm nhưng không được trước thời điểm chủ xe cơ giới đóng đủ phí bảo hiểm. Thời hạn bảo hiểm thông thường là 1 năm. Trong một số trường hợp cụ thể, thời hạn bảo hiểm có thể dưới 1 năm.',
		1
	),
	(
		'Bảo hiểm tai nạn chủ xe và người ngồi trên xe ô tô là loại bảo hiểm tự nguyện dành cho lái xe, phụ xe và những người ngồi trên xe trong quá trình tham gia giao thông, khi lên xuống xe trong quá trình tham gia giao thông không may bị tai nạn.',
		'Thiệt hại thân thể đối với người được bảo hiểm do tai nạn khi đang ở trên xe, lên xuống xe trong quá trình xe đang tham gia giao thông.',
		'Lái xe, phụ xe và những người khác được chở trên xe cơ giới.',
		'Người được bảo hiểm có hành động cố ý tự gây tai nạn. Tham gia đánh nhau trừ khi xác nhận đó là hành động tự vệ. Sử dụng và bị ảnh hưởng của rượu, bia vượt nồng độ theo quy định của pháp luật. Sử dụng ma túy và chất kích thích tương tự khác, bị cảm đột ngột. Trúng gió, bệnh tật, bị ngộ độc thức ăn, đồ uống và sử dụng thuốc không theo chỉ dẫn của cơ quan y tế.',
		'Bị chết do tai nạn thuộc phạm vi bảo hiểm: trả toàn bộ số tiền bảo hiểm ghi trong giấy chứng nhận bảo hiểm. Bị thương tật vĩnh viễn do tai nạn thuộc phạm vi bảo hiểm: trả tiền bảo hiểm theo tỷ lệ % số tiền bảo hiểm nêu trong bảng tỷ lệ trả tiền bảo hiểm thương tật QĐ số 1564/2004-BM/BMCN ngày 12/11/2004. Bị thương tật tạm thời do tai nạn thuộc phạm vi bảo hiểm: trả tiền bảo hiểm theo tỷ lệ % của thương tật tạm thời theo quy định, tối đa không quá 180 ngày / vụ tại nạn.',
		'Thời điểm bắt đầu có hiệu lực của Giấy chứng nhận bảo hiểm được ghi cụ thể trên Giấy chứng nhận bảo hiểm nhưng không được trước thời điểm chủ xe cơ giới đóng đủ phí bảo hiểm. Thời hạn bảo hiểm thông thường là 1 năm. Trong một số trường hợp cụ thể, thời hạn bảo hiểm có thể dưới 1 năm.',
		2
	),
	(
		'Bảo hiểm thiệt hại vật chất xe ô tô, chi trả cho những hư hại về vật chất xe do nguyên nhân đâm, va, lật đổ, bị vật thể khác rơi vào, thiệt hại động cơ do thủy kích... Bảo hiểm vật chất xe ô tô là gói bảo hiểm tự nguyện nhưng lại rất cần thiết. Khi tham gia sử dụng bảo hiểm vật chất xe ô tô, bên bảo hiểm sẽ bù đắp những khoản chi phí khắc phục thiệt hại giúp bạn chủ động hơn về tài chính và yên tâm trong việc sử dụng xe.',
		'Áp dụng cho xe ô tô, xe máy chuyên dùng bao gồm: xe ô tô, máy kéo, xe rơ mooc hoặc Sơ-mi Rơ-mooc, được kéo bởi xe ô tô, máy kéo. Xe máy thi công. Xe máy nông nghiệp, lâm nghiệp và các loại xe đặc chủng khác có tham gia giao thông đường bộ.',
		'Chủ xe. Người được thụ hưởng quyền lợi bảo hiểm.',
		'Chủ xe hoặc người được thụ hưởng quyền lợi bảo hiểm cố ý gây thiệt hại cho xe. Người điều khiển xe trong tình trạng có nồng độ cồn trong máu hoặc khí thở, sử dụng các chất kích thích bị cấm theo quy định của pháp luật. Tai nạn xảy ra ngoài lãnh thổ Việt Nam. Chủ xe không có đầy đủ giấy tờ như: giấy phép lái xe, Giấy chứng nhận kiểm định an toàn kỹ thuật và bảo vệ môi trường phương tiện cơ giới đường bộ,…',
		'Tuỳ theo trường hợp cụ thể, có thể bồi thường chi phí sửa chữa, thay mới bộ phận & bồi thường tổn thất toàn bộ thực tế hoặc ước tính',
		'Thời hạn bảo hiểm thông thường là 1 năm. Trong một số trường hợp cụ thể, thời hạn bảo hiểm có thể dưới 1 năm',
		3
	),
	(
		'Bảo hiểm trách nhiệm dân sự của chủ xe đối với hàng hoá vận chuyển trên xe.',
		'Bảo hiểm cho phần trách nhiệm dân sự của chủ xe cơ giới đối với tổn thất, mất mát hàng hóa được vận chuyển trên xe theo hợp đồng vận chuyển giữa chủ xe và chủ hàng. Thanh toán cho chủ xe các chi phí cần thiết và hợp lý nhằm ngăn ngừa, giảm nhẹ tổn thất cho hàng hóa và bảo quản, xếp dỡ, lưu kho, lưu bãi.',
		'Trách nhiệm dân sự của Chủ xe đối với thiệt hại về hàng hóa được vận chuyển trên xe.',
		'Lái xe, chủ xe, chủ hàng không trông coi, bảo quản hàng hoá. Xe Ô tô không thích hợp với loại hàng chuyên chở. Mất cắp: trừ trường hợp mất hàng hoá cùng với mất toàn bộ xe do: xe bị trộm cắp, bị cướp, bị cưỡng đoạt. Bắt giữ của cơ quan chức năng nhà nước. Hàng hoá hư hỏng tự nhiên, hư hỏng do không đủ phẩm chất, do bao bì đóng gói, chất xếp hàng không đúng theo yêu cầu kỹ thuật. Hàng hoá bị xô lệch va đập trong quá trình vận chuyển mà không phải do xe đâm va, lật đổ. Giao hàng chậm trễ, giao hàng không đúng người nhận, giao thiếu, sai thể loại, sai quy cách, sai mã ký hiệu.',
		'Theo yêu cầu của chủ xe nhưng tối đa không vượt quá 40.000.000đ/tấn. Số tấn hàng hoá được bảo hiểm (theo yêu cầu của chủ xe): tối đa là trọng tải cho phép của xe.',
		'Thời hạn bảo hiểm là 1 năm',
		4
	),
	(
		'Bảo hiểm trách nhiệm dân sự bắt buộc xe máy loại bảo hiểm bắt buộc chủ xe máy, xe mô tô phải có khi tham gia giao thông theo quy định của Nhà nước. Khi có tai nạn xảy ra, bảo hiểm TNDS sẽ bồi thường thiệt hại cho người bị tai nạn do lỗi của chủ xe cơ giới (chứ không phải bồi thường cho chủ xe).',
		'Bảo hiểm cho phần trách nhiệm dân sự của chủ xe cơ giới đối với tổn thất, mất mát hàng hóa được vận chuyển trên xe theo hợp đồng vận chuyển giữa chủ xe và chủ hàng. Thanh toán cho chủ xe các chi phí cần thiết và hợp lý nhằm ngăn ngừa, giảm nhẹ tổn thất cho hàng hóa và bảo quản, xếp dỡ, lưu kho, lưu bãi. Chủ xe cơ giới (tổ chức, cá nhân) là chủ sở hữu xe cơ giới hoặc được chủ sở hữu xe cơ giới giao chiếm hữu, sử dụng hợp pháp, điều khiển xe cơ giới.',
		'Chủ xe cơ giới (tổ chức, cá nhân) là chủ sở hữu xe cơ giới hoặc được chủ sở hữu xe cơ giới giao chiếm hữu, sử dụng hợp pháp, điều khiển xe cơ giới.',
		'Lái xe không có giấy phép lái xe: nếu bạn không có giấy phép lái xe hợp lệ, bạn sẽ không được bảo hiểm khi gặp tai nạn xảy ra sự cố. Sử dụng xe máy để vượt đèn đỏ hoặc vi phạm luật giao thông: nếu bạn vi phạm luật giao thông bằng cách vượt đèn đỏ, đi ngược chiều, không đội mũ bảo hiểm hoặc vi phạm các quy tắc khác, bạn có thể mất quyền được bảo hiểm. Lái xe trong tình trạng say rượu, sử dụng chất kích thích hoặc các chất quá liều: Việc lái xe trong tình trạng say rượu hoặc bị ảnh hưởng bởi các chất kích thích có thể làm mất quyền được bảo hiểm.',
		'Đối với thiệt hại về người: 150.000.000 đồng/1 người/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe gắn máy gây ra) : 50.000.000 đồng/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe ô tô gây ra) : 100.000.000 đồng/1 vụ tai nạn.',
		'Thời điểm bắt đầu có hiệu lực của Giấy chứng nhận bảo hiểm được ghi cụ thể trên Giấy chứng nhận bảo hiểm nhưng không được trước thời điểm chủ xe cơ giới đóng đủ phí bảo hiểm. Thời hạn bảo hiểm thông thường là 1 năm. Trong một số trường hợp cụ thể, thời hạn bảo hiểm có thể dưới 1 năm.',
		5
	),
		(
		'Bảo hiểm trách nhiệm dân sự tự nguyện xe máy loại bảo hiểm bắt buộc chủ xe máy, xe mô tô phải có khi tham gia giao thông theo quy định của Nhà nước. Khi có tai nạn xảy ra, bảo hiểm TNDS sẽ bồi thường thiệt hại cho người bị tai nạn do lỗi của chủ xe cơ giới (chứ không phải bồi thường cho chủ xe).',
		'Bảo hiểm cho phần trách nhiệm dân sự của chủ xe cơ giới đối với tổn thất, mất mát hàng hóa được vận chuyển trên xe theo hợp đồng vận chuyển giữa chủ xe và chủ hàng. Thanh toán cho chủ xe các chi phí cần thiết và hợp lý nhằm ngăn ngừa, giảm nhẹ tổn thất cho hàng hóa và bảo quản, xếp dỡ, lưu kho, lưu bãi. Chủ xe cơ giới (tổ chức, cá nhân) là chủ sở hữu xe cơ giới hoặc được chủ sở hữu xe cơ giới giao chiếm hữu, sử dụng hợp pháp, điều khiển xe cơ giới.',
		'Chủ xe cơ giới (tổ chức, cá nhân) là chủ sở hữu xe cơ giới hoặc được chủ sở hữu xe cơ giới giao chiếm hữu, sử dụng hợp pháp, điều khiển xe cơ giới.',
		'Lái xe không có giấy phép lái xe: nếu bạn không có giấy phép lái xe hợp lệ, bạn sẽ không được bảo hiểm khi gặp tai nạn xảy ra sự cố. Sử dụng xe máy để vượt đèn đỏ hoặc vi phạm luật giao thông: nếu bạn vi phạm luật giao thông bằng cách vượt đèn đỏ, đi ngược chiều, không đội mũ bảo hiểm hoặc vi phạm các quy tắc khác, bạn có thể mất quyền được bảo hiểm. Lái xe trong tình trạng say rượu, sử dụng chất kích thích hoặc các chất quá liều: Việc lái xe trong tình trạng say rượu hoặc bị ảnh hưởng bởi các chất kích thích có thể làm mất quyền được bảo hiểm.',
		'Đối với thiệt hại về người: 150.000.000 đồng/1 người/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe gắn máy gây ra) : 50.000.000 đồng/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe ô tô gây ra) : 100.000.000 đồng/1 vụ tai nạn.',
		'Thời điểm bắt đầu có hiệu lực của Giấy chứng nhận bảo hiểm được ghi cụ thể trên Giấy chứng nhận bảo hiểm nhưng không được trước thời điểm chủ xe cơ giới đóng đủ phí bảo hiểm. Thời hạn bảo hiểm thông thường là 1 năm. Trong một số trường hợp cụ thể, thời hạn bảo hiểm có thể dưới 1 năm.',
		6
	),
	(
		'Bảo hiểm tai nạn người ngồi trên xe',
		'Thiệt hại thân thể đối với người được bảo hiểm do tai nạn trong khi: xe đang hoạt động, đang lên xuống xe, qua cầu, qua đò, qua phà.',
		'Ngồi trên xe không đúng số lượng ghế ngồi quy định: nếu số lượng người ngồi trên xe vượt quá số lượng ghế ngồi quy định, các người này sẽ không được bảo hiểm tai nạn. Ngồi trên xe không đúng vị trí an toàn: nếu người ngồi trên xe không tuân thủ quy định về vị trí an toàn, ví dụ như ngồi trên cần số, ngồi trên cửa sổ, ngồi trên bệ đỗ, thì họ cũng không được bảo hiểm tai nạn. Ngồi trên xe không đúng cách: nếu người ngồi trên xe không tuân thủ quy định về cách ngồi an toàn ví dụ như không thắt dây an toàn, không ngồi thẳng, không giữ khoảng cách.',
		'Lái xe và những người khác được chở trên xe mô tô',
		'Bị chết do tai nạn thuộc phạm vi bảo hiểm: trả toàn bộ số tiền bảo hiểm ghi trong giấy chứng nhận bảo hiểm. Bị thương tật vĩnh viễn do tai nạn thuộc phạm vi bảo hiểm: trả tiền bảo hiểm theo tỷ lệ % số tiền bảo hiểm theo QĐ số 1564/2004-BM/BMCN ngày 12/11/2004. Bị thương tật tạm thời do tai nạn thuộc phạm vi bảo hiểm: tiền bảo hiểm theo tỷ lệ % của thương tật tạm thời theo quy định, tối đa không quá 180 ngày / vụ tại nạn.',
		'Thời hạn bảo hiểm là 1 năm',
		7
	),
	(
		'Đối với các gia đình Việt Nam, xe máy là một tài sản thông dụng, luôn đồng hành cùng các gia đình trên mọi nẻo đường. Nhưng có thể trong các trường hợp xe máy của bạn bị cháy nổ hay mất cắp thì gói sản phẩm bảo hiểm vật chất xe mô tô - xe gắn máy sẽ bù đắp những khoản chi phí khắc phục thiệt hại này, hỗ trợ bạn về tài chính và yên tâm trong việc sử dụng xe máy của mình.',
		'Cháy, nổ: bảo hiểm chi trả số tiền bồi thường theo giá trị thị trường của xe tại thời điểm xảy ra tổn thất nhưng không vượt quá 100% số tiền bảo hiểm. Mất cắp tại các điểm trông giữ xe theo quy định: bảo hiểm chi trả số tiền bồi thường theo giá trị thị trường của xe tại thời điểm xảy ra tổn thất nhưng không vượt quá 100% số tiền bảo hiểm. Mất cắp tại nhà, nơi cư trú. Bị cướp: bảo hiểm sẽ chi trả số tiền bồi thường theo giá trị thị trường của xe tại thời điểm xảy ra tổn thất nhưng không vượt quá 80% số tiền bảo hiểm.',
		'Tổn thất có chi phí sửa chữa ≤ 70% giá trị thực tế của xe. Hành động cố ý gây thiệt hại của chủ xe/lái xe. Xe máy tổn thất ngoài lãnh thổ Việt Nam. Cháy, nổ do lỗi của nhà sản xuất hoặc do người sử dụng tự ý thay đổi/lập	thêm linh kiện không theo thiết kế ban đầu của nhà sản xuất. Xe bị mất do lừa đảo, lợi dụng tín nhiệm chiếm đoạt tài sản, lợi dụng lòng tin của bất kỳ người nào. Tổn thất do chủ xe/lái xe sử dụng xe máy được bảo hiểm để đua. Tổn thất có nguyên nhân trực tiếp từ vi phạm pháp luật, vi phạm giao thông.',
		'Xe mô tô - xe gắn máy có đăng ký hợp lệ theo quy định của pháp luật hoặc chưa làm thủ tục đăng ký theo quy định nhưng có hợp đồng/hóa đơn mua bán. Xe mô tô - xe gắn máy tại thời điểm tham gia bảo hiểm có giá trị không thấp hơn 10 triệu đồng, thời gian sử dụng không quá 06 năm',
		'Do xe mô tô hai bánh; xe mô tô ba bánh; xe gắn máy (kể cả xe máy điện) và các loại xe có kết cấu tương tự theo quy định của Luật Giao thông đường bộ gây ra là năm mươi (50) triệu đồng trong một vụ tai nạn. Do xe ô tô; máy kéo; rơ moóc hoặc sơ mi rơ moóc được kéo bởi xe ô tô, máy kéo; xe máy chuyên dùng theo quy định của Luật Giao thông đường bộ gây ra là một trăm (100) triệu đồng trong một vụ tai nạn.',
		'Thời hạn bảo hiểm tối thiểu là 1 năm và tối đa là 3 năm.',
		8
	),
	(
		'Bảo hiểm TNDS bắt buộc xe đầu kéo dùng để đền cho bên thứ ba, chưa bao gồm bảo hiểm cho lái/phụ xe và người ngồi trên xe, nên để đảm bảo quyền lợi của lái phụ xe, bạn nên mua thêm bảo hiểm tự nguyện cho lái phụ xe.',
		'Thiệt hại ngoài hợp đồng về thân thể, tính mạng và TS đối với bên thứ ba. Thiệt hại về thân thể và tính mạng của hành khách theo hợp đồng vận chuyển hành khách.',
		'Hành động cố ý gây thiệt hại của chủ xe, lái xe hoặc của người bị thiệt hại. Lái xe không có Giấy phép lái xe hợp lệ hoặc Giấy phép lái xe không phù hợp đối với loại xe cơ giới bắt buộc phải có Giấy phép lái xe. Thiệt hại gây ra hậu quả gián tiếp như: giảm giá trị thương mại, thiệt hại gắn liền với việc sử dụng và khai thác tài sản bị thiệt hại. Thiệt hại đối với tài sản bị mất cắp hoặc bị cướp trong tai nạn. Lái xe gây tai nạn cố ý bỏ chạy không thực hiện trách nhiệm dân sự của chủ xe, lái xe cơ giới',
		'Chủ xe cơ giới sử dụng xe cơ giới trên lãnh thổ Việt Nam.',
		'Người: 100tr đồng/ người/ vụ. Tài sản: 100tr đồng/ vụ',
		'Thời hạn bảo hiểm tối thiểu là 01 năm và thời hạn tối đa tương ứng với thời hạn kiểm định an toàn kỹ thuật và bảo vệ môi trường định kỳ có thời hạn trên 01 năm.',
		9
	),
	(
		'Bảo hiểm trách nhiệm dân sự của chủ xe đối với hàng hoá vận chuyển trên xe.',
		'Bảo hiểm cho phần trách nhiệm dân sự của chủ xe cơ giới đối với tổn thất, mất mát hàng hóa được vận chuyển trên xe theo hợp đồng vận chuyển giữa chủ xe và chủ hàng. Thanh toán cho chủ xe các chi phí cần thiết và hợp lý nhằm: ngăn ngừa, giảm nhẹ tổn thất cho hàng hóa, bảo quản, xếp dỡ, lưu kho, lưu bãi.',
		'Lái xe, chủ xe, chủ hàng không trông coi, bảo quản hàng hoá. Xe Ô tô không thích hợp với loại hàng chuyên chở. Mất cắp (trừ trường hợp mất hàng hoá cùng với mất toàn bộ xe do: xe bị trộm cắp, bị cướp, bị cưỡng đoạt). Bắt giữ của cơ quan chức năng nhà nước. Hàng hoá hư hỏng tự nhiên, hư hỏng do không đủ phẩm chất, do bao bì đóng gói, chất xếp hàng không đúng theo yêu cầu kỹ thuật. Hàng hoá bị xô lệch va đập trong quá trình vận chuyển mà không phải do xe đâm va, lật đổ. Giao hàng chậm trễ, giao hàng không đúng người nhận, giao thiếu, sai thể loại, sai quy cách, sai mã ký hiệu.',
		'Chủ xe cơ giới.',
		'Từ 10trđ/ tấn đến 50 trđ/ tấn: 0,55%. Từ trên 50trđ/ tấn đến 150 trđ/ tấn: 1,00%. Từ trên 150trđ/ tấn đến 400 trđ/ tấn: 2,00%',
		'Thời hạn bảo hiểm tối thiểu là 01 năm và thời hạn tối đa tương ứng với thời hạn kiểm định an toàn kỹ thuật và bảo vệ môi trường định kỳ có thời hạn trên 01 năm.',
		10
	),
	(
		'Bảo hiểm tai nạn người ngồi trên xe bảo hiểm cho lái, phụ xe và những người khác được chở trên xe bị thiệt hại về thân thể do tai nạn khi đang trên xe, lên xuống xe trong quá trình xe đang tham gia giao thông.',
		'Tai nạn đối với người được chở trên xe: Thiệt hại thân thể do tai nạn khi đang ở trên xe, lên xuống xe trong quá trình xe đang tham gia giao thông. Tai nạn đối với lái, phụ xe: Thiệt hại về thân thể do tai nạn liên quan trực tiếp đến việc sử dụng chiếc xe đó.',
		'Người được bảo hiểm có hành động cố ý tự gây tai nạn. Tham gia đánh nhau trừ khi xác nhận đó là hành động tự vệ. Sử dụng và bị ảnh hưởng của rượu, bia vượt nồng độ theo quy định của pháp luật. Sử dụng ma túy và chất kích thích tương tự khác, bị cảm đột ngột. Trúng gió, bệnh tật, bị ngộ độc thức ăn, đồ uống và sử dụng thuốc không theo chỉ dẫn của cơ quan y tế.',
		'Lái xe, phụ xe. Những người ngồi trên xe',
		'Đối với thiệt hại về người: 150.000.000 đồng/1 người/1 vụ tai nạn. Đối với thiệt hại về tài sản (do xe ô tô gây ra) : 100.000.000 đồng/1 vụ tai nạn.',
		'Thời hạn bảo hiểm tối thiểu là 01 năm và thời hạn tối đa tương ứng với thời hạn kiểm định an toàn kỹ thuật và bảo vệ môi trường định kỳ có thời hạn trên 01 năm.',
		11
	),
	(
		'Đối với bảo hiểm trách nhiệm dân sự của chủ xe dành cho hàng hóa vận chuyển trên xe container & xe đầu kéo dựa theo Bộ Luật Dân Sự mà nước ta đã ban hành, bên bảo hiểm sẽ hỗ trợ ngăn ngừa, giảm nhẹ tổn thất cho hàng hóa. Đồng thời còn bảo quản, xếp dỡ, lưu kho hàng hóa trong quá trình vận chuyển bởi hậu quả của tai nạn. Việc giám định tổn thất sẽ thuộc trách nhiệm của bên bảo hiểm. Trong mọi trường hợp, tổng số tiền bồi thường (bao gồm cả chi phí giám định) không vượt quá số tiền mà 2 bên đã thỏa thuận trên “Giấy chứng nhận bảo hiểm”.',
		'Xe bị đâm,lật đổ, va, chìm, rơi, cháy nổ hoặc hỏa hoạn. Bão, sụt lở, lũ lụt, sét đánh, mưa đá, động đất hoặc sóng thần.',
		'Người được bảo hiểm có hành động cố ý tự gây tai nạn. Tham gia đánh nhau trừ khi xác nhận đó là hành động tự vệ. Sử dụng và bị ảnh hưởng của rượu, bia vượt nồng độ theo quy định của pháp luật. Sử dụng ma túy và chất kích thích tương tự khác, bị cảm đột ngột. Trúng gió, bệnh tật, bị ngộ độc thức ăn, đồ uống và sử dụng thuốc không theo chỉ dẫn của cơ quan y tế.',
		'Lái xe, phụ xe. Những người ngồi trên xe',
		'Xe container, xe đầu kéo dưới 3 tấn đóng phí bảo hiểm 853.000 vnđ/năm; thuế VAT 85.000 vnđ. Tổng chi phí 938.300 vnđ/năm. Xe container, xe đầu kéo từ 3 – 8 tấn đóng phí bảo hiểm 1.660.000 vnđ/năm; thuế VAT 166.000 vnđ. Tổng chi phí 1.826.000 vnđ/năm. Xe container, xe đầu kéo trên 15 tấn đóng phí bảo hiểm 3.200.000 vnđ/năm; thuế VAT 320.000 vnđ. Tổng chi phí 3.520.000 vnđ/năm. Xe container, xe đầu kéo dưới 3 tấn đóng phí bảo hiểm 853.000 vnđ/năm; thuế VAT 85.000 vnđ. Tổng chi phí 938.300 vnđ/năm.',
		'Thời hạn bảo hiểm tối thiểu là 01 năm và thời hạn tối đa tương ứng với thời hạn kiểm định an toàn kỹ thuật và bảo vệ môi trường định kỳ có thời hạn trên 01 năm.',
		12
	);
