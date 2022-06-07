all:
	rm -rf  *~ */*~ apps/k3_controller/src/*.beam test/*.beam erl_cra*;
	rm -rf  apps/k3_controller/src/*.*~ cluster* logs *.pod_dir rebar.lock;
	rm -rf _build test_ebin ebin *_info_specs;
	mkdir ebin;		
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
	rm -rf _build test_ebin logs log;
	echo Done
eunit:
	rm -rf  *~ */*~ apps/k3_controller/src/*.beam test/*.beam test_ebin erl_cra*;
	rm -rf _build logs log *.pod_dir *_info_specs;
	rm -rf rebar.lock;
	rm -rf ebin;
	mkdir  application_info_specs;
	cp ../../specifications/application_info_specs/*.spec application_info_specs;
	mkdir  host_info_specs;
	cp ../../specifications/host_info_specs/*.host host_info_specs;
	mkdir deployment_info_specs;
	cp ../../specifications/deployment_info_specs/*.depl deployment_info_specs;
	mkdir test_ebin;
	mkdir ebin;
	rebar3 compile;
	cp _build/default/lib/*/ebin/* ebin;
	erlc -o test_ebin test/*.erl;
	erl -pa ebin -pa test_ebin -sname k3_controller -run basic_eunit start -setcookie cookie_test 
