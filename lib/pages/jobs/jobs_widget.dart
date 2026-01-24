import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'jobs_model.dart';
export 'jobs_model.dart';

class JobsWidget extends StatefulWidget {
  const JobsWidget({
    super.key,
    this.name,
    this.haveTheyVoted,
  });

  final String? name;
  final bool? haveTheyVoted;

  static String routeName = 'jobs';
  static String routePath = '/jobs';

  @override
  State<JobsWidget> createState() => _JobsWidgetState();
}

class _JobsWidgetState extends State<JobsWidget> {
  late JobsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobsModel());

    // Load available industries and regions from businesses
    _loadFilterOptions();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _loadFilterOptions() async {
    // Query all businesses to get unique industries and regions
    final businesses = await BusinessTable().queryRows(
      queryFn: (q) => q,
    );

    if (businesses != null && businesses.isNotEmpty) {
      // Store businesses map for filtering
      _model.businessesMap = {
        for (var b in businesses) if (b.id != null) b.id!: b
      };

      // Extract unique industries
      final industries = businesses
          .map((b) => b.industry)
          .where((i) => i != null && i.isNotEmpty)
          .cast<String>()
          .toSet()
          .toList()
        ..sort();

      // Extract unique regions
      final regions = businesses
          .map((b) => b.region)
          .where((r) => r != null && r.isNotEmpty)
          .cast<String>()
          .toSet()
          .toList()
        ..sort();

      safeSetState(() {
        _model.availableIndustries = industries;
        _model.availableRegions = regions;
      });
    }
  }

  List<JobsRow> _filterJobs(List<JobsRow> jobs) {
    if (_model.industryFilter == null && _model.regionFilter == null) {
      return jobs;
    }

    return jobs.where((job) {
      if (job.businessId == null) return false;

      final business = _model.businessesMap[job.businessId];
      if (business == null) return false;

      // Check industry filter
      if (_model.industryFilter != null && _model.industryFilter != 'All') {
        if (business.industry != _model.industryFilter) return false;
      }

      // Check region filter
      if (_model.regionFilter != null && _model.regionFilter != 'All') {
        if (business.region != _model.regionFilter) return false;
      }

      return true;
    }).toList();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'jobs',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            toolbarHeight: 60.0,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile image on left (40x40)
                StreamBuilder<List<UsersRow>>(
                  stream: FFAppState().getUserProfile(
                    requestFn: () =>
                        _model.containerSupabaseStream ??= SupaFlow
                            .client
                            .from("users")
                            .stream(primaryKey: ['id'])
                            .eqOrNull(
                              'id',
                              currentUserUid,
                            )
                            .map((list) => list
                                .map((item) => UsersRow(item))
                                .toList()),
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    List<UsersRow> containerUsersRowList = snapshot.data!;
                    final containerUsersRow = containerUsersRowList.isNotEmpty
                        ? containerUsersRowList.first
                        : null;

                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(ProfileWidget.routeName);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 100),
                            fadeOutDuration: Duration(milliseconds: 100),
                            imageUrl: containerUsersRow?.profilePhoto ?? '',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Page title in center
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Jobs',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.sourceSans3(),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Search icon on right
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 28.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(SearchJobWidget.routeName);
                  },
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Explanation Card
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/pexels-goumbik-652355.jpg',
                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                      height: 90.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Job Board',
                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                            font: GoogleFonts.sourceSans3(),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Browse job opportunities posted by Christian businesses in your community.',
                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                              font: GoogleFonts.sourceSans3(),
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Filters - Industry and Region
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Industry Filter
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.industryFilterController ??= FormFieldController<String>(null),
                            options: ['All', ..._model.availableIndustries],
                            onChanged: (val) async {
                              safeSetState(() => _model.industryFilter = val);
                              if (val == 'All') {
                                _model.industryFilterController?.reset();
                                safeSetState(() => _model.industryFilter = null);
                              }
                            },
                            width: 140.0,
                            height: 36.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.sourceSans3(),
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                            hintText: 'Industry',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).primaryText,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        // Region Filter
                        FlutterFlowDropDown<String>(
                          controller: _model.regionFilterController ??= FormFieldController<String>(null),
                          options: ['All', ..._model.availableRegions],
                          onChanged: (val) async {
                            safeSetState(() => _model.regionFilter = val);
                            if (val == 'All') {
                              _model.regionFilterController?.reset();
                              safeSetState(() => _model.regionFilter = null);
                            }
                          },
                          width: 140.0,
                          height: 36.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.sourceSans3(),
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Region',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).primaryText,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                      children: [
                        // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                        //
                        // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: StreamBuilder<List<JobsRow>>(
                            stream: FFAppState().getJobs(
                              requestFn: () => _model.listViewSupabaseStream ??=
                                  SupaFlow.client
                                      .from("jobs")
                                      .stream(primaryKey: ['id']).map((list) =>
                                          list
                                              .map((item) => JobsRow(item))
                                              .toList()),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF7E1416),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<JobsRow> listViewJobsRowList =
                                  snapshot.data!;

                              // Apply filters
                              final filteredJobs = _filterJobs(listViewJobsRowList);

                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                                onRefresh: () async {},
                                child: ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    44.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: filteredJobs.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 8.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewJobsRow =
                                        filteredJobs[listViewIndex];
                                    return Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 1.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        JobDetailsWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'jobId':
                                                              serializeParam(
                                                            listViewJobsRow.id,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder<
                                                            List<BusinessRow>>(
                                                          future: BusinessTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'id',
                                                              listViewJobsRow
                                                                  .businessId,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFF7E1416),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<BusinessRow>
                                                                containerBusinessRowList =
                                                                snapshot.data!;

                                                            final containerBusinessRow =
                                                                containerBusinessRowList
                                                                        .isNotEmpty
                                                                    ? containerBusinessRowList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              width: 70.0,
                                                              height: 70.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        containerBusinessRow
                                                                            ?.photo ?? '',
                                                                    width: 70.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.7,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    placeholder: (context, url) => Container(
                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                      child: Icon(
                                                                        Icons.business,
                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                        size: 30.0,
                                                                      ),
                                                                    ),
                                                                    errorWidget: (context, url, error) => Container(
                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                      child: Icon(
                                                                        Icons.business,
                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                        size: 30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        30.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewJobsRow
                                                                            .jobName,
                                                                        'Software Engineer',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.sourceSans3(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Posted: ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.sourceSans3(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "d/M/y",
                                                                            listViewJobsRow.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                50,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.sourceSans3(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewJobsRow
                                                                            .location,
                                                                        'Location',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            50,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.sourceSans3(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewJobsRow
                                                                            .details,
                                                                        'Job description',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            50,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.sourceSans3(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
