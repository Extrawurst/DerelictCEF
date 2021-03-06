/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.cef.functions;

private {
    import core.stdc.stddef,
           core.stdc.time;
    import derelict.cef.types;
}

extern( C ) @nogc nothrow {
    // cef_string_list.h
    alias da_cef_string_list_alloc = cef_string_list_t function();
    alias da_cef_string_list_size = int function( cef_string_list_t );
    alias da_cef_string_list_value = int function( cef_string_list_t,int,cef_string_t* );
    alias da_cef_string_list_append = void function( cef_string_list_t,const( cef_string_t )* );
    alias da_cef_string_list_clear = void function( cef_string_list_t );
    alias da_cef_string_list_free = void function( cef_string_list_t );
    alias da_cef_string_list_copy = cef_string_list_t function( cef_string_list_t );

    // cef_string_map.h
    alias da_cef_string_map_alloc = cef_string_map_t function();
    alias da_cef_string_map_size = int function( cef_string_map_t );
    alias da_cef_string_map_find = int function( cef_string_map_t,const( cef_string_t )*,cef_string_t* );
    alias da_cef_string_map_key = int function( cef_string_map_t,int,cef_string_t* );
    alias da_cef_string_map_value = int function( cef_string_map_t,int,cef_string_t* );
    alias da_cef_string_map_append = int function( cef_string_map_t,const( cef_string_t )*,const( cef_string_t )* );
    alias da_cef_string_map_clear = void function( cef_string_map_t );
    alias da_cef_string_map_free = void function( cef_string_map_t );

    // cef_string_multimap.h
    alias da_cef_string_multimap_alloc = cef_string_multimap_t function();
    alias da_cef_string_multimap_size = int function( cef_string_multimap_t );
    alias da_cef_string_multimap_find_count = int function( cef_string_multimap_t,const( cef_string_t )* );
    alias da_cef_string_multimap_enumerate = int function( cef_string_multimap_t,const( cef_string_t )*,int,cef_string_t* );
    alias da_cef_string_multimap_key = int function( cef_string_multimap_t,int,cef_string_t* );
    alias da_cef_string_multimap_value = int function( cef_string_multimap_t,int,cef_string_t* );
    alias da_cef_string_multimap_append = int function( cef_string_multimap_t,const( cef_string_t )*,const( cef_string_t )* );
    alias da_cef_string_multimap_clear = void function( cef_string_multimap_t );
    alias da_cef_string_multimap_free = void function( cef_string_multimap_t );

    // cef_string_types.h
    alias da_cef_string_wide_set = int function( const( wchar_t )*,size_t,cef_string_wide_t*,int );
    alias da_cef_string_utf8_set = int function( const( char )*,size_t,cef_string_utf8_t*,int );
    alias da_cef_string_utf16_set = int function( const( wchar )*,size_t,cef_string_utf16_t*,int );
    alias da_cef_string_wide_clear = void function( cef_string_wide_t* );
    alias da_cef_string_utf8_clear = void function( cef_string_utf8_t* );
    alias da_cef_string_utf16_clear = void function( cef_string_utf16_t* );
    alias da_cef_string_wide_cmp = void function( const( cef_string_wide_t )*,const( cef_string_wide_t )* );
    alias da_cef_string_utf8_cmp = void function( const( cef_string_utf8_t )*,const( cef_string_utf8_t )* );
    alias da_cef_string_utf16_cmp = void function( const( cef_string_utf16_t )*,const( cef_string_utf16_t )* );
    alias da_cef_string_wide_to_utf8 = void function( const( wchar_t )*,size_t,cef_string_utf8_t* );
    alias da_cef_string_utf8_to_wide = void function( const( char )*,size_t,cef_string_wide_t* );
    alias da_cef_string_wide_to_utf16 = void function( const( wchar_t )*,size_t,cef_string_utf16_t* );
    alias da_cef_string_utf16_to_wide = void function( const( wchar )*,size_t,cef_string_wide_t* );
    alias da_cef_string_utf8_to_utf16 = void function( const( char )*,size_t,cef_string_utf16_t* );
    alias da_cef_string_utf16_to_utf8 = void function( const( wchar )*,size_t,cef_string_utf8_t* );
    alias da_cef_string_ascii_to_wide = void function( const( char )*,size_t,cef_string_wide_t* );
    alias da_cef_string_ascii_to_utf16 = void function( const( char )*,size_t,cef_string_utf16_t* );
    alias da_cef_string_userfree_wide_alloc = cef_string_userfree_wide_t function();
    alias da_cef_string_userfree_utf8_alloc = cef_string_userfree_utf8_t function();
    alias da_cef_string_userfree_utf16_alloc = cef_string_userfree_utf16_t function();
    alias da_cef_string_userfree_wide_free = void function( cef_string_userfree_wide_t );
    alias da_cef_string_userfree_utf8_free = void function( cef_string_userfree_utf8_t );
    alias da_cef_string_userfree_utf16_free = void function( cef_string_userfree_utf16_t );

    int cef_string_wide_copy(wchar_t* src, size_t srclen, cef_string_wide_t* output ) {
        return cef_string_wide_set( src, srclen, output, 1 );
    }

    int cef_string_utf8_copy(char* src, size_t srclen, cef_string_utf8_t* output ) {
        return cef_string_utf8_set( src, srclen, output, 1 );
    }

    int cef_string_utf16_copy(wchar* src, size_t srclen, cef_string_utf16_t* output ) {
        return cef_string_utf16_set( src, srclen, output, 1 );
    }

    static if( CEF_STRING_TYPE_WIDE ) {
        alias cef_string_set = cef_string_wide_set;
        alias cef_string_copy = cef_string_wide_copy;
        alias cef_string_clear = cef_string_wide_clear;
        alias cef_string_userfree_alloc = cef_string_userfree_wide_alloc;
        alias cef_string_userfree_free = cef_string_userfree_wide_free;
        alias cef_string_from_ascii = cef_string_ascii_to_wide;
        alias cef_string_to_utf8 = cef_string_wide_to_utf8;
        alias cef_string_from_utf8 = cef_string_utf8_to_wide;
        alias cef_string_to_utf16 = cef_string_wide_to_utf16;
        alias cef_string_from_utf16 = cef_string_utf16_to_wide;
        alias cef_string_to_wide = cef_string_wide_copy;
        alias cef_string_from_wide = cef_string_wide_copy;
    } else static if( CEF_STRING_TYPE_UTF8 ) {
        alias cef_string_set = cef_string_utf8_set;
        alias cef_string_copy = cef_string_utf8_copy;
        alias cef_string_clear = cef_string_utf8_clear;
        alias cef_string_userfree_alloc = cef_string_userfree_utf8_alloc;
        alias cef_string_userfree_free = cef_string_userfree_utf8_free;
        alias cef_string_from_ascii = cef_string_utf8_copy;
        alias cef_string_to_utf8 = cef_string_utf8_copy;
        alias cef_string_from_utf8 = cef_string_utf8_copy;
        alias cef_string_to_utf16 = cef_string_utf8_to_utf16;
        alias cef_string_from_utf16 = cef_string_utf16_to_utf8;
        alias cef_string_to_wide = cef_string_utf8_to_wide;
        alias cef_string_from_wide = cef_string_wide_to_utf8;
    } else {
        alias cef_string_set = cef_string_utf16_set;
        alias cef_string_copy = cef_string_utf16_copy;
        alias cef_string_clear = cef_string_utf16_clear;
        alias cef_string_userfree_alloc = cef_string_userfree_utf16_alloc;
        alias cef_string_userfree_free = cef_string_userfree_utf16_free;
        alias cef_string_from_ascii = cef_string_ascii_to_utf16;
        alias cef_string_to_utf8 = cef_string_utf16_to_utf8;
        alias cef_string_from_utf8 = cef_string_utf8_to_utf16;
        alias cef_string_to_utf16 = cef_string_utf16_copy;
        alias cef_string_from_utf16 = cef_string_utf16_copy;
        alias cef_string_to_wide = cef_string_utf16_to_wide;
        alias cef_string_from_wide = cef_string_wide_to_utf16;
    }

    // cef_time.h
    alias da_cef_time_to_timet = int function( const( cef_time_t )*,time_t* );
    alias da_cef_time_from_timet = int function( time_t,cef_time_t* );
    alias da_cef_time_to_doublet = int function( const( cef_time_t )*,double* );
    alias da_cef_time_from_doublet = int function( double,cef_time_t* );
    alias da_cef_time_now = int function( cef_time_t* );
    alias da_cef_time_delta = int function( const( cef_time_t )*,const( cef_time_t )*,long* );

    // cef_app_capi.h
    alias da_cef_execute_process = int function( const( cef_main_args_t )*,cef_app_t*,void* );
    alias da_cef_initialize = int function( const( cef_main_args_t )*,cef_settings_t*,cef_app_t*,void* );
    alias da_cef_shutdown = void function();
    alias da_cef_do_message_loop_work = void function();
    alias da_cef_run_message_loop = void function();
    alias da_cef_set_osmodal_loop = void function( int );

    // cef_browser_capi.h
    alias da_cef_browser_host_create_browser = int function( const( cef_window_info_t)*,cef_client_t*,const( cef_string_t )*,const( cef_browser_settings_t )*,cef_request_context_t* );
    alias da_cef_browser_host_create_browser_sync = cef_browser_t* function( const( cef_window_info_t )*,cef_client_t*,const( cef_string_t )*,const( cef_browser_settings_t )*,cef_request_context_t* );

    // cef_command_line_capi.h
    alias da_cef_command_line_create = cef_command_line_t* function();
    alias da_cef_command_line_get_global = cef_command_line_t* function();

    // cef_cookie_capi.h
    alias da_cef_cookie_manager_get_global_manager = cef_cookie_manager_t* function();
    alias da_cef_cookie_manager_create_manager = cef_cookie_manager_t* function( const( cef_string_t )*,int );

    // cef_geolocation_capi.h
    alias da_cef_get_geolocation = int function( cef_get_geolocation_callback_t* );

    // cef_origin_whitelist_capi.h
    alias da_cef_add_cross_origin_whitelist_entry = int function( const( cef_string_t )*,const( cef_string_t )*,const( cef_string_t )*, int );
    alias da_cef_remove_cross_origin_whitelist_entry = int function( const( cef_string_t )*,const( cef_string_t )*,const( cef_string_t )*,int );
    alias da_cef_clear_cross_origin_whitelist = int function();

    // cef_path_util_capi.h
    alias da_cef_get_path = int function( cef_path_key_t,cef_string_t* );

    // cef_process_message_capi.h
    alias da_cef_process_message_create = cef_process_message_t* function( const( cef_string_t )* );

    // cef_process_util_capi.h
    alias da_cef_launch_process = int function( cef_command_line_t* );

    // cef_request_capi.h
    alias da_cef_request_create = cef_request_t* function();
    alias da_cef_post_data_create = cef_post_data_t* function();
    alias da_cef_post_data_element_create = cef_post_data_element_t* function();

    // cef_request_context_capi.h
    alias da_cef_request_context_get_global_context = cef_request_context_t* function();
    alias da_cef_request_context_create_context = cef_request_context_t* function( cef_request_context_handler_t* );

    // cef_response_capi.h
    alias da_cef_response_create = cef_response_t* function();

    // cef_scheme_capi.h
    alias da_cef_register_scheme_handler_factory = int function( const( cef_string_t )*,const( cef_string_t )*,cef_scheme_handler_factory_t* );
    alias da_cef_clear_scheme_handler_factories = int function();

    // cef_stream_capi.h
    alias da_cef_stream_reader_create_for_file = cef_stream_reader_t* function( const( cef_string_t )* );
    alias da_cef_stream_reader_create_for_data = cef_stream_reader_t* function( void*,size_t );
    alias da_cef_stream_reader_create_for_handler = cef_stream_reader_t* function( cef_read_handler_t* );
    alias da_cef_stream_writer_create_for_file = cef_stream_writer_t* function( const( cef_string_t )* );
    alias da_cef_stream_writer_create_for_handler = cef_stream_writer_t* function( cef_write_handler_t* );

    // cef_task_capi.h
    alias da_cef_task_runner_get_for_current_thread = cef_task_runner_t* function();
    alias da_cef_task_runner_get_for_thread = cef_task_runner_t* function( cef_thread_id_t );
    alias da_cef_currently_on = int function( cef_thread_id_t );
    alias da_cef_post_task = int function( cef_thread_id_t,cef_task_t* );
    alias da_cef_post_delayed_task = int function( cef_thread_id_t,cef_task_t*,int64 );

    // cef_trace_capi.h
    alias da_cef_begin_tracing = int function( const( cef_string_t )* );
    alias da_cef_end_tracing_async = int function( const( cef_string_t )*,cef_end_tracing_callback_t* );
    alias da_cef_now_from_system_trace_time = int64 function();

    // cef_url_capi.h
    alias da_cef_parse_url = int function( const( cef_string_t )*,cef_urlparts_t* );
    alias da_cef_create_url = int function( const( cef_urlparts_t )*,cef_string_t* );

    // cef_urlrequest_capi.h
    alias da_cef_urlrequest_create = cef_urlrequest_t* function( cef_request_t*,cef_urlrequest_client_t* );

    // cef_v8_capi.h
    alias da_cef_v8context_get_current_context = cef_v8context_t* function();
    alias da_cef_v8context_get_entered_context = cef_v8context_t* function();
    alias da_cef_v8context_in_context = int function();
    alias da_cef_v8value_create_undefined = cef_v8value_t* function();
    alias da_cef_v8value_create_null = cef_v8value_t* function();
    alias da_cef_v8value_create_bool = cef_v8value_t* function( int );
    alias da_cef_v8value_create_int = cef_v8value_t* function( int32 );
    alias da_cef_v8value_create_uint = cef_v8value_t* function( uint32 );
    alias da_cef_v8value_create_double = cef_v8value_t* function( double );
    alias da_cef_v8value_create_date = cef_v8value_t* function( const( cef_time_t )* );
    alias da_cef_v8value_create_string = cef_v8value_t* function( const( cef_string_t )* );
    alias da_cef_v8value_create_object = cef_v8value_t* function( cef_v8accessor_t* );
    alias da_cef_v8value_create_array = cef_v8value_t* function( int );
    alias da_cef_v8value_create_function = cef_v8value_t* function( const( cef_string_t )*,cef_v8handler_t* );
    alias da_cef_v8stack_trace_get_current = cef_v8stack_trace_t* function( int );
    alias da_cef_register_extension = int function( const( cef_string_t )*,const( cef_string_t )*,cef_v8handler_t*);

    // cef_values_capi.h
    alias da_cef_binary_value_create = cef_binary_value_t* function( const( void )*,size_t );
    alias da_cef_dictionary_value_create = cef_dictionary_value_t* function();
    alias da_cef_list_value_create = cef_list_value_t* function();

    // cef_web_plugin_capi.h
    alias da_cef_visit_web_plugin_info = void function( cef_web_plugin_info_visitor_t* );
    alias da_cef_refresh_web_plugins = void function();
    alias da_cef_add_web_plugin_path = void function( const( cef_string_t )* );
    alias da_cef_add_web_plugin_directory = void function( const( cef_string_t )* );
    alias da_cef_remove_web_plugin_path = void function( const( cef_string_t )* );
    alias da_cef_unregister_internal_web_plugin = void function( const( cef_string_t )* );
    alias da_cef_force_web_plugin_shutdown = void function( const( cef_string_t )* );
    alias da_cef_register_web_plugin_crash = void function( const( cef_string_t )* );
    alias da_cef_is_web_plugin_unstable = void function( const( cef_string_t )*,cef_web_plugin_unstable_callback_t* );

    // cef_xml_reader_capi.h
    alias da_cef_xml_reader_create = cef_xml_reader_t* function( cef_stream_reader_t*,cef_xml_encoding_type_t,const( cef_string_t )* );

    // cef_zip_reader_capi.h
    alias da_cef_zip_reader_create = cef_zip_reader_t* function( cef_stream_reader_t* );
}

__gshared {
    da_cef_string_list_alloc cef_string_list_alloc;
    da_cef_string_list_size cef_string_list_size;
    da_cef_string_list_value cef_string_list_value;
    da_cef_string_list_append cef_string_list_append;
    da_cef_string_list_clear cef_string_list_clear;
    da_cef_string_list_free cef_string_list_free;
    da_cef_string_list_copy cef_string_list_copy;
    da_cef_string_map_alloc cef_string_map_alloc;
    da_cef_string_map_size cef_string_map_size;
    da_cef_string_map_find cef_string_map_find;
    da_cef_string_map_key cef_string_map_key;
    da_cef_string_map_value cef_string_map_value;
    da_cef_string_map_append cef_string_map_append;
    da_cef_string_map_clear cef_string_map_clear;
    da_cef_string_map_free cef_string_map_free;
    da_cef_string_multimap_alloc cef_string_multimap_alloc;
    da_cef_string_multimap_size cef_string_multimap_size;
    da_cef_string_multimap_find_count cef_string_multimap_find_count;
    da_cef_string_multimap_enumerate cef_string_multimap_enumerate;
    da_cef_string_multimap_key cef_string_multimap_key;
    da_cef_string_multimap_value cef_string_multimap_value;
    da_cef_string_multimap_append cef_string_multimap_append;
    da_cef_string_multimap_clear cef_string_multimap_clear;
    da_cef_string_multimap_free cef_string_multimap_free;
    da_cef_string_wide_set cef_string_wide_set;
    da_cef_string_utf8_set cef_string_utf8_set;
    da_cef_string_utf16_set cef_string_utf16_set;
    da_cef_string_wide_clear cef_string_wide_clear;
    da_cef_string_utf8_clear cef_string_utf8_clear;
    da_cef_string_utf16_clear cef_string_utf16_clear;
    da_cef_string_wide_cmp cef_string_wide_cmp;
    da_cef_string_utf8_cmp cef_string_utf8_cmp;
    da_cef_string_utf16_cmp cef_string_utf16_cmp;
    da_cef_string_wide_to_utf8 cef_string_wide_to_utf8;
    da_cef_string_utf8_to_wide cef_string_utf8_to_wide;
    da_cef_string_wide_to_utf16 cef_string_wide_to_utf16;
    da_cef_string_utf16_to_wide cef_string_utf16_to_wide;
    da_cef_string_utf8_to_utf16 cef_string_utf8_to_utf16;
    da_cef_string_utf16_to_utf8 cef_string_utf16_to_utf8;
    da_cef_string_ascii_to_wide cef_string_ascii_to_wide;
    da_cef_string_ascii_to_utf16 cef_string_ascii_to_utf16;
    da_cef_string_userfree_wide_alloc cef_string_userfree_wide_alloc;
    da_cef_string_userfree_utf8_alloc cef_string_userfree_utf8_alloc;
    da_cef_string_userfree_utf16_alloc cef_string_userfree_utf16_alloc;
    da_cef_string_userfree_wide_free cef_string_userfree_wide_free;
    da_cef_string_userfree_utf8_free cef_string_userfree_utf8_free;
    da_cef_string_userfree_utf16_free cef_string_userfree_utf16_free;
    da_cef_time_to_timet cef_time_to_timet;
    da_cef_time_from_timet cef_time_from_timet;
    da_cef_time_to_doublet cef_time_to_doublet;
    da_cef_time_from_doublet cef_time_from_doublet;
    da_cef_time_now cef_time_now;
    da_cef_time_delta cef_time_delta;
    da_cef_execute_process cef_execute_process;
    da_cef_initialize cef_initialize;
    da_cef_shutdown cef_shutdown;
    da_cef_do_message_loop_work cef_do_message_loop_work;
    da_cef_run_message_loop cef_run_message_loop;
    da_cef_set_osmodal_loop cef_set_osmodal_loop;
    da_cef_browser_host_create_browser cef_browser_host_create_browser;
    da_cef_browser_host_create_browser_sync cef_browser_host_create_browser_sync;
    da_cef_command_line_create cef_command_line_create;
    da_cef_command_line_get_global cef_command_line_get_global;
    da_cef_cookie_manager_get_global_manager cef_cookie_manager_get_global_manager;
    da_cef_cookie_manager_create_manager cef_cookie_manager_create_manager;
    da_cef_get_geolocation cef_get_geolocation;
    da_cef_add_cross_origin_whitelist_entry cef_add_cross_origin_whitelist_entry;
    da_cef_remove_cross_origin_whitelist_entry cef_remove_cross_origin_whitelist_entry;
    da_cef_clear_cross_origin_whitelist cef_clear_cross_origin_whitelist;
    da_cef_get_path cef_get_path;
    da_cef_process_message_create cef_process_message_create;
    da_cef_launch_process cef_launch_process;
    da_cef_request_create cef_request_create;
    da_cef_post_data_create cef_post_data_create;
    da_cef_post_data_element_create cef_post_data_element_create;
    da_cef_request_context_get_global_context cef_request_context_get_global_context;
    da_cef_request_context_create_context cef_request_context_create_context;
    da_cef_response_create cef_response_create;
    da_cef_register_scheme_handler_factory cef_register_scheme_handler_factory;
    da_cef_clear_scheme_handler_factories cef_clear_scheme_handler_factories;
    da_cef_stream_reader_create_for_file cef_stream_reader_create_for_file;
    da_cef_stream_reader_create_for_data cef_stream_reader_create_for_data;
    da_cef_stream_reader_create_for_handler cef_stream_reader_create_for_handler;
    da_cef_stream_writer_create_for_file cef_stream_writer_create_for_file;
    da_cef_stream_writer_create_for_handler cef_stream_writer_create_for_handler;
    da_cef_task_runner_get_for_current_thread cef_task_runner_get_for_current_thread;
    da_cef_task_runner_get_for_thread cef_task_runner_get_for_thread;
    da_cef_currently_on cef_currently_on;
    da_cef_post_task cef_post_task;
    da_cef_post_delayed_task cef_post_delayed_task;
    da_cef_begin_tracing cef_begin_tracing;
    da_cef_end_tracing_async cef_end_tracing_async;
    da_cef_now_from_system_trace_time cef_now_from_system_trace_time;
    da_cef_parse_url cef_parse_url;
    da_cef_create_url cef_create_url;
    da_cef_urlrequest_create cef_urlrequest_create;
    da_cef_v8context_get_current_context cef_v8context_get_current_context;
    da_cef_v8context_get_entered_context cef_v8context_get_entered_context;
    da_cef_v8context_in_context cef_v8context_in_context;
    da_cef_v8value_create_undefined cef_v8value_create_undefined;
    da_cef_v8value_create_null cef_v8value_create_null;
    da_cef_v8value_create_bool cef_v8value_create_bool;
    da_cef_v8value_create_int cef_v8value_create_int;
    da_cef_v8value_create_uint cef_v8value_create_uint;
    da_cef_v8value_create_double cef_v8value_create_double;
    da_cef_v8value_create_date cef_v8value_create_date;
    da_cef_v8value_create_string cef_v8value_create_string;
    da_cef_v8value_create_object cef_v8value_create_object;
    da_cef_v8value_create_array cef_v8value_create_array;
    da_cef_v8value_create_function cef_v8value_create_function;
    da_cef_v8stack_trace_get_current cef_v8stack_trace_get_current;
    da_cef_register_extension cef_register_extension;
    da_cef_binary_value_create cef_binary_value_create;
    da_cef_dictionary_value_create cef_dictionary_value_create;
    da_cef_list_value_create cef_list_value_create;
    da_cef_visit_web_plugin_info cef_visit_web_plugin_info;
    da_cef_refresh_web_plugins cef_refresh_web_plugins;
    da_cef_add_web_plugin_path cef_add_web_plugin_path;
    da_cef_add_web_plugin_directory cef_add_web_plugin_directory;
    da_cef_remove_web_plugin_path cef_remove_web_plugin_path;
    da_cef_unregister_internal_web_plugin cef_unregister_internal_web_plugin;
    da_cef_force_web_plugin_shutdown cef_force_web_plugin_shutdown;
    da_cef_register_web_plugin_crash cef_register_web_plugin_crash;
    da_cef_is_web_plugin_unstable cef_is_web_plugin_unstable;
    da_cef_xml_reader_create cef_xml_reader_create;
    da_cef_zip_reader_create cef_zip_reader_create;
}